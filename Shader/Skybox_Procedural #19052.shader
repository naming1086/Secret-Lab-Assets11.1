//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Skybox/Procedural" {
Properties {
[KeywordEnum(None, Simple, High Quality)] _SunDisk ("Sun", Float) = 2
_SunSize ("Sun Size", Range(0, 1)) = 0.04
_SunSizeConvergence ("Sun Size Convergence", Range(1, 10)) = 5
_AtmosphereThickness ("Atmosphere Thickness", Range(0, 5)) = 1
_SkyTint ("Sky Tint", Color) = (0.5,0.5,0.5,1)
_GroundColor ("Ground", Color) = (0.369,0.349,0.341,1)
_Exposure ("Exposure", Range(0, 8)) = 1.3
}
SubShader {
 Tags { "PreviewType" = "Skybox" "QUEUE" = "Background" "RenderType" = "Background" }
 Pass {
  Tags { "PreviewType" = "Skybox" "QUEUE" = "Background" "RenderType" = "Background" }
  ZWrite Off
  Cull Off
  GpuProgramID 42598
Program "vp" {
SubProgram "d3d11 " {
Local Keywords { "_SUNDISK_NONE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "_SUNDISK_NONE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Exposure;
uniform 	vec3 _GroundColor;
uniform 	vec3 _SkyTint;
uniform 	float _AtmosphereThickness;
in  vec4 in_POSITION0;
out float vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
vec3 u_xlat9;
float u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
float u_xlat23;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = log2(vec4(_SkyTint.x, _SkyTint.y, _SkyTint.z, _AtmosphereThickness));
    u_xlat1 = u_xlat1 * vec4(0.454545468, 0.454545468, 0.454545468, 2.5);
    u_xlat1 = exp2(u_xlat1);
    u_xlat1.xyz = (-u_xlat1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.300000012, 0.300000042, 0.300000012) + vec3(0.5, 0.419999987, 0.324999988);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = vec3(1.0, 1.0, 1.0) / u_xlat1.xyz;
    u_xlat2.xy = u_xlat1.ww * vec2(0.049999997, 0.0314159282);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlatb0 = u_xlat3.y>=0.0;
    if(u_xlatb0){
        u_xlat0.x = u_xlat3.y * u_xlat3.y + 0.0506249666;
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat0.x = (-u_xlat0.y) * u_xlat21 + u_xlat0.x;
        u_xlat7 = (-u_xlat3.y) * 1.0 + 1.0;
        u_xlat14 = u_xlat7 * 5.25 + -6.80000019;
        u_xlat14 = u_xlat7 * u_xlat14 + 3.82999992;
        u_xlat14 = u_xlat7 * u_xlat14 + 0.458999991;
        u_xlat7 = u_xlat7 * u_xlat14 + -0.00286999997;
        u_xlat7 = u_xlat7 * 1.44269502;
        u_xlat0.y = exp2(u_xlat7);
        u_xlat0.xyz = u_xlat0.xyx * vec3(0.5, 0.246031836, 20.0);
        u_xlat4.xyz = u_xlat0.xxx * u_xlat3.xyz;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0, 1.00010002, 0.0);
        u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat21 = sqrt(u_xlat21);
        u_xlat22 = (-u_xlat21) + 1.0;
        u_xlat22 = u_xlat22 * 230.831207;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = dot(_WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat16.x = u_xlat16.x / u_xlat21;
        u_xlat23 = dot(u_xlat3.xyz, u_xlat4.xyz);
        u_xlat21 = u_xlat23 / u_xlat21;
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = u_xlat16.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat16.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat16.x * u_xlat23 + 0.458999991;
        u_xlat16.x = u_xlat16.x * u_xlat23 + -0.00286999997;
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat21 = (-u_xlat21) + 1.0;
        u_xlat23 = u_xlat21 * 5.25 + -6.80000019;
        u_xlat23 = u_xlat21 * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat21 * u_xlat23 + 0.458999991;
        u_xlat21 = u_xlat21 * u_xlat23 + -0.00286999997;
        u_xlat21 = u_xlat21 * 1.44269502;
        u_xlat21 = exp2(u_xlat21);
        u_xlat21 = u_xlat21 * 0.25;
        u_xlat21 = u_xlat16.x * 0.25 + (-u_xlat21);
        u_xlat21 = u_xlat22 * u_xlat21 + u_xlat0.y;
        u_xlat21 = max(u_xlat21, 0.0);
        u_xlat21 = min(u_xlat21, 50.0);
        u_xlat5.xyz = u_xlat1.xyz * u_xlat2.yyy + vec3(0.0125663709, 0.0125663709, 0.0125663709);
        u_xlat6.xyz = (-vec3(u_xlat21)) * u_xlat5.xyz;
        u_xlat6.xyz = u_xlat6.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat6.xyz = exp2(u_xlat6.xyz);
        u_xlat21 = u_xlat0.z * u_xlat22;
        u_xlat4.xyz = u_xlat3.xyz * u_xlat0.xxx + u_xlat4.xyz;
        u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat22 = (-u_xlat0.x) + 1.0;
        u_xlat22 = u_xlat22 * 230.831207;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = dot(_WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat16.x = u_xlat16.x / u_xlat0.x;
        u_xlat23 = dot(u_xlat3.xyz, u_xlat4.xyz);
        u_xlat0.x = u_xlat23 / u_xlat0.x;
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = u_xlat16.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat16.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat16.x * u_xlat23 + 0.458999991;
        u_xlat16.x = u_xlat16.x * u_xlat23 + -0.00286999997;
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat23 = u_xlat0.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat0.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat0.x * u_xlat23 + 0.458999991;
        u_xlat0.x = u_xlat0.x * u_xlat23 + -0.00286999997;
        u_xlat0.x = u_xlat0.x * 1.44269502;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * 0.25;
        u_xlat0.x = u_xlat16.x * 0.25 + (-u_xlat0.x);
        u_xlat0.x = u_xlat22 * u_xlat0.x + u_xlat0.y;
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat0.x = min(u_xlat0.x, 50.0);
        u_xlat4.xyz = u_xlat5.xyz * (-u_xlat0.xxx);
        u_xlat4.xyz = u_xlat4.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat4.xyz = exp2(u_xlat4.xyz);
        u_xlat0.x = u_xlat0.z * u_xlat22;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat6.xyz * vec3(u_xlat21) + u_xlat0.xyz;
        u_xlat4.xyz = u_xlat1.xyz * u_xlat2.xxx;
        u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat0.xyz * vec3(0.0199999996, 0.0199999996, 0.0199999996);
    } else {
        u_xlat21 = min(u_xlat3.y, -0.00100000005);
        u_xlat21 = -9.99999975e-05 / u_xlat21;
        u_xlat5.xyz = vec3(u_xlat21) * u_xlat3.xyz + vec3(0.0, 1.00010002, 0.0);
        u_xlat22 = dot((-u_xlat3.xyz), u_xlat5.xyz);
        u_xlat16.x = dot(_WorldSpaceLightPos0.xyz, u_xlat5.xyz);
        u_xlat22 = (-u_xlat22) + 1.0;
        u_xlat23 = u_xlat22 * 5.25 + -6.80000019;
        u_xlat23 = u_xlat22 * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat22 * u_xlat23 + 0.458999991;
        u_xlat22 = u_xlat22 * u_xlat23 + -0.00286999997;
        u_xlat22 = u_xlat22 * 1.44269502;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = u_xlat16.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat16.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat16.x * u_xlat23 + 0.458999991;
        u_xlat16.x = u_xlat16.x * u_xlat23 + -0.00286999997;
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat5.xy = vec2(u_xlat22) * vec2(0.25, 0.249900013);
        u_xlat22 = u_xlat16.x * 0.25 + u_xlat5.x;
        u_xlat16.xy = vec2(u_xlat21) * vec2(0.5, 20.0);
        u_xlat5.xzw = u_xlat16.xxx * u_xlat3.xyz;
        u_xlat5.xzw = u_xlat5.xzw * vec3(0.5, 0.5, 0.5) + vec3(0.0, 1.00010002, 0.0);
        u_xlat21 = dot(u_xlat5.xzw, u_xlat5.xzw);
        u_xlat21 = sqrt(u_xlat21);
        u_xlat21 = (-u_xlat21) + 1.0;
        u_xlat21 = u_xlat21 * 230.831207;
        u_xlat21 = exp2(u_xlat21);
        u_xlat22 = u_xlat21 * u_xlat22 + (-u_xlat5.y);
        u_xlat22 = max(u_xlat22, 0.0);
        u_xlat22 = min(u_xlat22, 50.0);
        u_xlat5.xyz = u_xlat1.xyz * u_xlat2.yyy + vec3(0.0125663709, 0.0125663709, 0.0125663709);
        u_xlat5.xyz = (-vec3(u_xlat22)) * u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat0.xyz = exp2(u_xlat5.xyz);
        u_xlat21 = u_xlat16.y * u_xlat21;
        u_xlat9.xyz = vec3(u_xlat21) * u_xlat0.xyz;
        u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx + vec3(0.0199999996, 0.0199999996, 0.0199999996);
        u_xlat4.xyz = u_xlat1.xyz * u_xlat9.xyz;
    }
    vs_TEXCOORD0 = u_xlat3.y * -50.0;
    u_xlat0.xyz = vec3(_GroundColor.x, _GroundColor.y, _GroundColor.z) * u_xlat0.xyz + u_xlat4.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz * vec3(_Exposure);
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, (-u_xlat3.xyz));
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.75 + 0.75;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(_Exposure);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

in  float vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec3 u_xlat1;
void main()
{
    u_xlat0 = vs_TEXCOORD0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat1.xyz = vs_TEXCOORD1.xyz + (-vs_TEXCOORD2.xyz);
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Local Keywords { "_SUNDISK_NONE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 822
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %757 %778 %810 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 757 
                                                      OpDecorate vs_TEXCOORD1 Location 778 
                                                      OpDecorate vs_TEXCOORD2 Location 810 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeVector %6 3 
                                              %19 = OpTypeStruct %7 %16 %17 %6 %18 %18 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32; f32_3; f32_3; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                          i32 %84 = OpConstant 5 
                                          u32 %85 = OpConstant 0 
                                              %86 = OpTypePointer Uniform %6 
                                          u32 %91 = OpConstant 2 
                                          i32 %94 = OpConstant 6 
                                         f32 %100 = OpConstant 3.674022E-40 
                                         f32 %101 = OpConstant 3.674022E-40 
                                       f32_4 %102 = OpConstantComposite %100 %100 %100 %101 
                                         f32 %109 = OpConstant 3.674022E-40 
                                       f32_3 %110 = OpConstantComposite %109 %109 %109 
                                         f32 %116 = OpConstant 3.674022E-40 
                                         f32 %117 = OpConstant 3.674022E-40 
                                       f32_3 %118 = OpConstantComposite %116 %117 %116 
                                         f32 %120 = OpConstant 3.674022E-40 
                                         f32 %121 = OpConstant 3.674022E-40 
                                         f32 %122 = OpConstant 3.674022E-40 
                                       f32_3 %123 = OpConstantComposite %120 %121 %122 
                                             %146 = OpTypeVector %6 2 
                                         f32 %149 = OpConstant 3.674022E-40 
                                         f32 %150 = OpConstant 3.674022E-40 
                                       f32_2 %151 = OpConstantComposite %149 %150 
                                             %155 = OpTypePointer Private %6 
                                Private f32* %156 = OpVariable Private 
                                             %164 = OpTypePointer Private %18 
                              Private f32_3* %165 = OpVariable Private 
                                             %171 = OpTypeBool 
                                             %172 = OpTypePointer Private %171 
                               Private bool* %173 = OpVariable Private 
                                         f32 %176 = OpConstant 3.674022E-40 
                                         f32 %186 = OpConstant 3.674022E-40 
                                Private f32* %202 = OpVariable Private 
                                Private f32* %208 = OpVariable Private 
                                         f32 %210 = OpConstant 3.674022E-40 
                                         f32 %212 = OpConstant 3.674022E-40 
                                         f32 %217 = OpConstant 3.674022E-40 
                                         f32 %222 = OpConstant 3.674022E-40 
                                         f32 %227 = OpConstant 3.674022E-40 
                                         f32 %230 = OpConstant 3.674022E-40 
                                         f32 %237 = OpConstant 3.674022E-40 
                                         f32 %238 = OpConstant 3.674022E-40 
                                       f32_3 %239 = OpConstantComposite %120 %237 %238 
                              Private f32_3* %243 = OpVariable Private 
                                       f32_3 %249 = OpConstantComposite %120 %120 %120 
                                         f32 %251 = OpConstant 3.674022E-40 
                                       f32_3 %252 = OpConstantComposite %176 %251 %176 
                                Private f32* %259 = OpVariable Private 
                                         f32 %264 = OpConstant 3.674022E-40 
                                             %268 = OpTypePointer Private %146 
                              Private f32_2* %269 = OpVariable Private 
                                Private f32* %281 = OpVariable Private 
                                         f32 %344 = OpConstant 3.674022E-40 
                                         f32 %361 = OpConstant 3.674022E-40 
                              Private f32_4* %363 = OpVariable Private 
                                         f32 %369 = OpConstant 3.674022E-40 
                                       f32_3 %370 = OpConstantComposite %369 %369 %369 
                              Private f32_3* %374 = OpVariable Private 
                                       f32_3 %382 = OpConstantComposite %230 %230 %230 
                                         f32 %567 = OpConstant 3.674022E-40 
                                       f32_3 %568 = OpConstantComposite %567 %567 %567 
                                         f32 %575 = OpConstant 3.674022E-40 
                                         f32 %577 = OpConstant 3.674022E-40 
                                         f32 %656 = OpConstant 3.674022E-40 
                                       f32_2 %657 = OpConstantComposite %344 %656 
                                       f32_2 %669 = OpConstantComposite %120 %238 
                              Private f32_3* %738 = OpVariable Private 
                                             %756 = OpTypePointer Output %6 
                         Output f32* vs_TEXCOORD0 = OpVariable Output 
                                         f32 %760 = OpConstant 3.674022E-40 
                                         i32 %762 = OpConstant 4 
                                             %777 = OpTypePointer Output %18 
                       Output f32_3* vs_TEXCOORD1 = OpVariable Output 
                                         f32 %800 = OpConstant 3.674022E-40 
                       Output f32_3* vs_TEXCOORD2 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                                        f32_4 %51 = OpLoad %44 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %21 %36 %23 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %21 %36 %28 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %36 %36 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %21 %36 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %44 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %28 
                                                      OpStore %83 %81 
                                 Uniform f32* %87 = OpAccessChain %21 %84 %85 
                                          f32 %88 = OpLoad %87 
                                 Uniform f32* %89 = OpAccessChain %21 %84 %70 
                                          f32 %90 = OpLoad %89 
                                 Uniform f32* %92 = OpAccessChain %21 %84 %91 
                                          f32 %93 = OpLoad %92 
                                 Uniform f32* %95 = OpAccessChain %21 %94 
                                          f32 %96 = OpLoad %95 
                                        f32_4 %97 = OpCompositeConstruct %88 %90 %93 %96 
                                        f32_4 %98 = OpExtInst %1 30 %97 
                                                      OpStore %44 %98 
                                        f32_4 %99 = OpLoad %44 
                                       f32_4 %103 = OpFMul %99 %102 
                                                      OpStore %44 %103 
                                       f32_4 %104 = OpLoad %44 
                                       f32_4 %105 = OpExtInst %1 29 %104 
                                                      OpStore %44 %105 
                                       f32_4 %106 = OpLoad %44 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                       f32_3 %108 = OpFNegate %107 
                                       f32_3 %111 = OpFAdd %108 %110 
                                       f32_4 %112 = OpLoad %44 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %44 %113 
                                       f32_4 %114 = OpLoad %44 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %119 = OpFMul %115 %118 
                                       f32_3 %124 = OpFAdd %119 %123 
                                       f32_4 %125 = OpLoad %44 
                                       f32_4 %126 = OpVectorShuffle %125 %124 4 5 6 3 
                                                      OpStore %44 %126 
                                       f32_4 %127 = OpLoad %44 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                       f32_4 %129 = OpLoad %44 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32_3 %131 = OpFMul %128 %130 
                                       f32_4 %132 = OpLoad %44 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
                                                      OpStore %44 %133 
                                       f32_4 %134 = OpLoad %44 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                       f32_4 %136 = OpLoad %44 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_3 %138 = OpFMul %135 %137 
                                       f32_4 %139 = OpLoad %44 
                                       f32_4 %140 = OpVectorShuffle %139 %138 4 5 6 3 
                                                      OpStore %44 %140 
                                       f32_4 %141 = OpLoad %44 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFDiv %110 %142 
                                       f32_4 %144 = OpLoad %44 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 6 3 
                                                      OpStore %44 %145 
                                       f32_4 %147 = OpLoad %44 
                                       f32_2 %148 = OpVectorShuffle %147 %147 3 3 
                                       f32_2 %152 = OpFMul %148 %151 
                                       f32_4 %153 = OpLoad %50 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 2 3 
                                                      OpStore %50 %154 
                                       f32_4 %157 = OpLoad %9 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                       f32_4 %159 = OpLoad %9 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                         f32 %161 = OpDot %158 %160 
                                                      OpStore %156 %161 
                                         f32 %162 = OpLoad %156 
                                         f32 %163 = OpExtInst %1 32 %162 
                                                      OpStore %156 %163 
                                         f32 %166 = OpLoad %156 
                                       f32_3 %167 = OpCompositeConstruct %166 %166 %166 
                                       f32_4 %168 = OpLoad %9 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_3 %170 = OpFMul %167 %169 
                                                      OpStore %165 %170 
                                Private f32* %174 = OpAccessChain %165 %70 
                                         f32 %175 = OpLoad %174 
                                        bool %177 = OpFOrdGreaterThanEqual %175 %176 
                                                      OpStore %173 %177 
                                        bool %178 = OpLoad %173 
                                                      OpSelectionMerge %180 None 
                                                      OpBranchConditional %178 %179 %572 
                                             %179 = OpLabel 
                                Private f32* %181 = OpAccessChain %165 %70 
                                         f32 %182 = OpLoad %181 
                                Private f32* %183 = OpAccessChain %165 %70 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFMul %182 %184 
                                         f32 %187 = OpFAdd %185 %186 
                                Private f32* %188 = OpAccessChain %9 %85 
                                                      OpStore %188 %187 
                                Private f32* %189 = OpAccessChain %9 %85 
                                         f32 %190 = OpLoad %189 
                                         f32 %191 = OpExtInst %1 31 %190 
                                Private f32* %192 = OpAccessChain %9 %85 
                                                      OpStore %192 %191 
                                Private f32* %193 = OpAccessChain %9 %70 
                                         f32 %194 = OpLoad %193 
                                         f32 %195 = OpFNegate %194 
                                         f32 %196 = OpLoad %156 
                                         f32 %197 = OpFMul %195 %196 
                                Private f32* %198 = OpAccessChain %9 %85 
                                         f32 %199 = OpLoad %198 
                                         f32 %200 = OpFAdd %197 %199 
                                Private f32* %201 = OpAccessChain %9 %85 
                                                      OpStore %201 %200 
                                Private f32* %203 = OpAccessChain %165 %70 
                                         f32 %204 = OpLoad %203 
                                         f32 %205 = OpFNegate %204 
                                         f32 %206 = OpFMul %205 %109 
                                         f32 %207 = OpFAdd %206 %109 
                                                      OpStore %202 %207 
                                         f32 %209 = OpLoad %202 
                                         f32 %211 = OpFMul %209 %210 
                                         f32 %213 = OpFAdd %211 %212 
                                                      OpStore %208 %213 
                                         f32 %214 = OpLoad %202 
                                         f32 %215 = OpLoad %208 
                                         f32 %216 = OpFMul %214 %215 
                                         f32 %218 = OpFAdd %216 %217 
                                                      OpStore %208 %218 
                                         f32 %219 = OpLoad %202 
                                         f32 %220 = OpLoad %208 
                                         f32 %221 = OpFMul %219 %220 
                                         f32 %223 = OpFAdd %221 %222 
                                                      OpStore %208 %223 
                                         f32 %224 = OpLoad %202 
                                         f32 %225 = OpLoad %208 
                                         f32 %226 = OpFMul %224 %225 
                                         f32 %228 = OpFAdd %226 %227 
                                                      OpStore %202 %228 
                                         f32 %229 = OpLoad %202 
                                         f32 %231 = OpFMul %229 %230 
                                                      OpStore %202 %231 
                                         f32 %232 = OpLoad %202 
                                         f32 %233 = OpExtInst %1 29 %232 
                                Private f32* %234 = OpAccessChain %9 %70 
                                                      OpStore %234 %233 
                                       f32_4 %235 = OpLoad %9 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 0 
                                       f32_3 %240 = OpFMul %236 %239 
                                       f32_4 %241 = OpLoad %9 
                                       f32_4 %242 = OpVectorShuffle %241 %240 4 5 6 3 
                                                      OpStore %9 %242 
                                       f32_4 %244 = OpLoad %9 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
                                       f32_3 %246 = OpLoad %165 
                                       f32_3 %247 = OpFMul %245 %246 
                                                      OpStore %243 %247 
                                       f32_3 %248 = OpLoad %243 
                                       f32_3 %250 = OpFMul %248 %249 
                                       f32_3 %253 = OpFAdd %250 %252 
                                                      OpStore %243 %253 
                                       f32_3 %254 = OpLoad %243 
                                       f32_3 %255 = OpLoad %243 
                                         f32 %256 = OpDot %254 %255 
                                                      OpStore %156 %256 
                                         f32 %257 = OpLoad %156 
                                         f32 %258 = OpExtInst %1 31 %257 
                                                      OpStore %156 %258 
                                         f32 %260 = OpLoad %156 
                                         f32 %261 = OpFNegate %260 
                                         f32 %262 = OpFAdd %261 %109 
                                                      OpStore %259 %262 
                                         f32 %263 = OpLoad %259 
                                         f32 %265 = OpFMul %263 %264 
                                                      OpStore %259 %265 
                                         f32 %266 = OpLoad %259 
                                         f32 %267 = OpExtInst %1 29 %266 
                                                      OpStore %259 %267 
                              Uniform f32_4* %270 = OpAccessChain %21 %28 
                                       f32_4 %271 = OpLoad %270 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                       f32_3 %273 = OpLoad %243 
                                         f32 %274 = OpDot %272 %273 
                                Private f32* %275 = OpAccessChain %269 %85 
                                                      OpStore %275 %274 
                                Private f32* %276 = OpAccessChain %269 %85 
                                         f32 %277 = OpLoad %276 
                                         f32 %278 = OpLoad %156 
                                         f32 %279 = OpFDiv %277 %278 
                                Private f32* %280 = OpAccessChain %269 %85 
                                                      OpStore %280 %279 
                                       f32_3 %282 = OpLoad %165 
                                       f32_3 %283 = OpLoad %243 
                                         f32 %284 = OpDot %282 %283 
                                                      OpStore %281 %284 
                                         f32 %285 = OpLoad %281 
                                         f32 %286 = OpLoad %156 
                                         f32 %287 = OpFDiv %285 %286 
                                                      OpStore %156 %287 
                                Private f32* %288 = OpAccessChain %269 %85 
                                         f32 %289 = OpLoad %288 
                                         f32 %290 = OpFNegate %289 
                                         f32 %291 = OpFAdd %290 %109 
                                Private f32* %292 = OpAccessChain %269 %85 
                                                      OpStore %292 %291 
                                Private f32* %293 = OpAccessChain %269 %85 
                                         f32 %294 = OpLoad %293 
                                         f32 %295 = OpFMul %294 %210 
                                         f32 %296 = OpFAdd %295 %212 
                                                      OpStore %281 %296 
                                Private f32* %297 = OpAccessChain %269 %85 
                                         f32 %298 = OpLoad %297 
                                         f32 %299 = OpLoad %281 
                                         f32 %300 = OpFMul %298 %299 
                                         f32 %301 = OpFAdd %300 %217 
                                                      OpStore %281 %301 
                                Private f32* %302 = OpAccessChain %269 %85 
                                         f32 %303 = OpLoad %302 
                                         f32 %304 = OpLoad %281 
                                         f32 %305 = OpFMul %303 %304 
                                         f32 %306 = OpFAdd %305 %222 
                                                      OpStore %281 %306 
                                Private f32* %307 = OpAccessChain %269 %85 
                                         f32 %308 = OpLoad %307 
                                         f32 %309 = OpLoad %281 
                                         f32 %310 = OpFMul %308 %309 
                                         f32 %311 = OpFAdd %310 %227 
                                Private f32* %312 = OpAccessChain %269 %85 
                                                      OpStore %312 %311 
                                Private f32* %313 = OpAccessChain %269 %85 
                                         f32 %314 = OpLoad %313 
                                         f32 %315 = OpFMul %314 %230 
                                Private f32* %316 = OpAccessChain %269 %85 
                                                      OpStore %316 %315 
                                Private f32* %317 = OpAccessChain %269 %85 
                                         f32 %318 = OpLoad %317 
                                         f32 %319 = OpExtInst %1 29 %318 
                                Private f32* %320 = OpAccessChain %269 %85 
                                                      OpStore %320 %319 
                                         f32 %321 = OpLoad %156 
                                         f32 %322 = OpFNegate %321 
                                         f32 %323 = OpFAdd %322 %109 
                                                      OpStore %156 %323 
                                         f32 %324 = OpLoad %156 
                                         f32 %325 = OpFMul %324 %210 
                                         f32 %326 = OpFAdd %325 %212 
                                                      OpStore %281 %326 
                                         f32 %327 = OpLoad %156 
                                         f32 %328 = OpLoad %281 
                                         f32 %329 = OpFMul %327 %328 
                                         f32 %330 = OpFAdd %329 %217 
                                                      OpStore %281 %330 
                                         f32 %331 = OpLoad %156 
                                         f32 %332 = OpLoad %281 
                                         f32 %333 = OpFMul %331 %332 
                                         f32 %334 = OpFAdd %333 %222 
                                                      OpStore %281 %334 
                                         f32 %335 = OpLoad %156 
                                         f32 %336 = OpLoad %281 
                                         f32 %337 = OpFMul %335 %336 
                                         f32 %338 = OpFAdd %337 %227 
                                                      OpStore %156 %338 
                                         f32 %339 = OpLoad %156 
                                         f32 %340 = OpFMul %339 %230 
                                                      OpStore %156 %340 
                                         f32 %341 = OpLoad %156 
                                         f32 %342 = OpExtInst %1 29 %341 
                                                      OpStore %156 %342 
                                         f32 %343 = OpLoad %156 
                                         f32 %345 = OpFMul %343 %344 
                                                      OpStore %156 %345 
                                Private f32* %346 = OpAccessChain %269 %85 
                                         f32 %347 = OpLoad %346 
                                         f32 %348 = OpFMul %347 %344 
                                         f32 %349 = OpLoad %156 
                                         f32 %350 = OpFNegate %349 
                                         f32 %351 = OpFAdd %348 %350 
                                                      OpStore %156 %351 
                                         f32 %352 = OpLoad %259 
                                         f32 %353 = OpLoad %156 
                                         f32 %354 = OpFMul %352 %353 
                                Private f32* %355 = OpAccessChain %9 %70 
                                         f32 %356 = OpLoad %355 
                                         f32 %357 = OpFAdd %354 %356 
                                                      OpStore %156 %357 
                                         f32 %358 = OpLoad %156 
                                         f32 %359 = OpExtInst %1 40 %358 %176 
                                                      OpStore %156 %359 
                                         f32 %360 = OpLoad %156 
                                         f32 %362 = OpExtInst %1 37 %360 %361 
                                                      OpStore %156 %362 
                                       f32_4 %364 = OpLoad %44 
                                       f32_3 %365 = OpVectorShuffle %364 %364 0 1 2 
                                       f32_4 %366 = OpLoad %50 
                                       f32_3 %367 = OpVectorShuffle %366 %366 1 1 1 
                                       f32_3 %368 = OpFMul %365 %367 
                                       f32_3 %371 = OpFAdd %368 %370 
                                       f32_4 %372 = OpLoad %363 
                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
                                                      OpStore %363 %373 
                                         f32 %375 = OpLoad %156 
                                       f32_3 %376 = OpCompositeConstruct %375 %375 %375 
                                       f32_3 %377 = OpFNegate %376 
                                       f32_4 %378 = OpLoad %363 
                                       f32_3 %379 = OpVectorShuffle %378 %378 0 1 2 
                                       f32_3 %380 = OpFMul %377 %379 
                                                      OpStore %374 %380 
                                       f32_3 %381 = OpLoad %374 
                                       f32_3 %383 = OpFMul %381 %382 
                                                      OpStore %374 %383 
                                       f32_3 %384 = OpLoad %374 
                                       f32_3 %385 = OpExtInst %1 29 %384 
                                                      OpStore %374 %385 
                                Private f32* %386 = OpAccessChain %9 %91 
                                         f32 %387 = OpLoad %386 
                                         f32 %388 = OpLoad %259 
                                         f32 %389 = OpFMul %387 %388 
                                                      OpStore %156 %389 
                                       f32_3 %390 = OpLoad %165 
                                       f32_4 %391 = OpLoad %9 
                                       f32_3 %392 = OpVectorShuffle %391 %391 0 0 0 
                                       f32_3 %393 = OpFMul %390 %392 
                                       f32_3 %394 = OpLoad %243 
                                       f32_3 %395 = OpFAdd %393 %394 
                                                      OpStore %243 %395 
                                       f32_3 %396 = OpLoad %243 
                                       f32_3 %397 = OpLoad %243 
                                         f32 %398 = OpDot %396 %397 
                                Private f32* %399 = OpAccessChain %9 %85 
                                                      OpStore %399 %398 
                                Private f32* %400 = OpAccessChain %9 %85 
                                         f32 %401 = OpLoad %400 
                                         f32 %402 = OpExtInst %1 31 %401 
                                Private f32* %403 = OpAccessChain %9 %85 
                                                      OpStore %403 %402 
                                Private f32* %404 = OpAccessChain %9 %85 
                                         f32 %405 = OpLoad %404 
                                         f32 %406 = OpFNegate %405 
                                         f32 %407 = OpFAdd %406 %109 
                                                      OpStore %259 %407 
                                         f32 %408 = OpLoad %259 
                                         f32 %409 = OpFMul %408 %264 
                                                      OpStore %259 %409 
                                         f32 %410 = OpLoad %259 
                                         f32 %411 = OpExtInst %1 29 %410 
                                                      OpStore %259 %411 
                              Uniform f32_4* %412 = OpAccessChain %21 %28 
                                       f32_4 %413 = OpLoad %412 
                                       f32_3 %414 = OpVectorShuffle %413 %413 0 1 2 
                                       f32_3 %415 = OpLoad %243 
                                         f32 %416 = OpDot %414 %415 
                                Private f32* %417 = OpAccessChain %269 %85 
                                                      OpStore %417 %416 
                                Private f32* %418 = OpAccessChain %269 %85 
                                         f32 %419 = OpLoad %418 
                                Private f32* %420 = OpAccessChain %9 %85 
                                         f32 %421 = OpLoad %420 
                                         f32 %422 = OpFDiv %419 %421 
                                Private f32* %423 = OpAccessChain %269 %85 
                                                      OpStore %423 %422 
                                       f32_3 %424 = OpLoad %165 
                                       f32_3 %425 = OpLoad %243 
                                         f32 %426 = OpDot %424 %425 
                                                      OpStore %281 %426 
                                         f32 %427 = OpLoad %281 
                                Private f32* %428 = OpAccessChain %9 %85 
                                         f32 %429 = OpLoad %428 
                                         f32 %430 = OpFDiv %427 %429 
                                Private f32* %431 = OpAccessChain %9 %85 
                                                      OpStore %431 %430 
                                Private f32* %432 = OpAccessChain %269 %85 
                                         f32 %433 = OpLoad %432 
                                         f32 %434 = OpFNegate %433 
                                         f32 %435 = OpFAdd %434 %109 
                                Private f32* %436 = OpAccessChain %269 %85 
                                                      OpStore %436 %435 
                                Private f32* %437 = OpAccessChain %269 %85 
                                         f32 %438 = OpLoad %437 
                                         f32 %439 = OpFMul %438 %210 
                                         f32 %440 = OpFAdd %439 %212 
                                                      OpStore %281 %440 
                                Private f32* %441 = OpAccessChain %269 %85 
                                         f32 %442 = OpLoad %441 
                                         f32 %443 = OpLoad %281 
                                         f32 %444 = OpFMul %442 %443 
                                         f32 %445 = OpFAdd %444 %217 
                                                      OpStore %281 %445 
                                Private f32* %446 = OpAccessChain %269 %85 
                                         f32 %447 = OpLoad %446 
                                         f32 %448 = OpLoad %281 
                                         f32 %449 = OpFMul %447 %448 
                                         f32 %450 = OpFAdd %449 %222 
                                                      OpStore %281 %450 
                                Private f32* %451 = OpAccessChain %269 %85 
                                         f32 %452 = OpLoad %451 
                                         f32 %453 = OpLoad %281 
                                         f32 %454 = OpFMul %452 %453 
                                         f32 %455 = OpFAdd %454 %227 
                                Private f32* %456 = OpAccessChain %269 %85 
                                                      OpStore %456 %455 
                                Private f32* %457 = OpAccessChain %269 %85 
                                         f32 %458 = OpLoad %457 
                                         f32 %459 = OpFMul %458 %230 
                                Private f32* %460 = OpAccessChain %269 %85 
                                                      OpStore %460 %459 
                                Private f32* %461 = OpAccessChain %269 %85 
                                         f32 %462 = OpLoad %461 
                                         f32 %463 = OpExtInst %1 29 %462 
                                Private f32* %464 = OpAccessChain %269 %85 
                                                      OpStore %464 %463 
                                Private f32* %465 = OpAccessChain %9 %85 
                                         f32 %466 = OpLoad %465 
                                         f32 %467 = OpFNegate %466 
                                         f32 %468 = OpFAdd %467 %109 
                                Private f32* %469 = OpAccessChain %9 %85 
                                                      OpStore %469 %468 
                                Private f32* %470 = OpAccessChain %9 %85 
                                         f32 %471 = OpLoad %470 
                                         f32 %472 = OpFMul %471 %210 
                                         f32 %473 = OpFAdd %472 %212 
                                                      OpStore %281 %473 
                                Private f32* %474 = OpAccessChain %9 %85 
                                         f32 %475 = OpLoad %474 
                                         f32 %476 = OpLoad %281 
                                         f32 %477 = OpFMul %475 %476 
                                         f32 %478 = OpFAdd %477 %217 
                                                      OpStore %281 %478 
                                Private f32* %479 = OpAccessChain %9 %85 
                                         f32 %480 = OpLoad %479 
                                         f32 %481 = OpLoad %281 
                                         f32 %482 = OpFMul %480 %481 
                                         f32 %483 = OpFAdd %482 %222 
                                                      OpStore %281 %483 
                                Private f32* %484 = OpAccessChain %9 %85 
                                         f32 %485 = OpLoad %484 
                                         f32 %486 = OpLoad %281 
                                         f32 %487 = OpFMul %485 %486 
                                         f32 %488 = OpFAdd %487 %227 
                                Private f32* %489 = OpAccessChain %9 %85 
                                                      OpStore %489 %488 
                                Private f32* %490 = OpAccessChain %9 %85 
                                         f32 %491 = OpLoad %490 
                                         f32 %492 = OpFMul %491 %230 
                                Private f32* %493 = OpAccessChain %9 %85 
                                                      OpStore %493 %492 
                                Private f32* %494 = OpAccessChain %9 %85 
                                         f32 %495 = OpLoad %494 
                                         f32 %496 = OpExtInst %1 29 %495 
                                Private f32* %497 = OpAccessChain %9 %85 
                                                      OpStore %497 %496 
                                Private f32* %498 = OpAccessChain %9 %85 
                                         f32 %499 = OpLoad %498 
                                         f32 %500 = OpFMul %499 %344 
                                Private f32* %501 = OpAccessChain %9 %85 
                                                      OpStore %501 %500 
                                Private f32* %502 = OpAccessChain %269 %85 
                                         f32 %503 = OpLoad %502 
                                         f32 %504 = OpFMul %503 %344 
                                Private f32* %505 = OpAccessChain %9 %85 
                                         f32 %506 = OpLoad %505 
                                         f32 %507 = OpFNegate %506 
                                         f32 %508 = OpFAdd %504 %507 
                                Private f32* %509 = OpAccessChain %9 %85 
                                                      OpStore %509 %508 
                                         f32 %510 = OpLoad %259 
                                Private f32* %511 = OpAccessChain %9 %85 
                                         f32 %512 = OpLoad %511 
                                         f32 %513 = OpFMul %510 %512 
                                Private f32* %514 = OpAccessChain %9 %70 
                                         f32 %515 = OpLoad %514 
                                         f32 %516 = OpFAdd %513 %515 
                                Private f32* %517 = OpAccessChain %9 %85 
                                                      OpStore %517 %516 
                                Private f32* %518 = OpAccessChain %9 %85 
                                         f32 %519 = OpLoad %518 
                                         f32 %520 = OpExtInst %1 40 %519 %176 
                                Private f32* %521 = OpAccessChain %9 %85 
                                                      OpStore %521 %520 
                                Private f32* %522 = OpAccessChain %9 %85 
                                         f32 %523 = OpLoad %522 
                                         f32 %524 = OpExtInst %1 37 %523 %361 
                                Private f32* %525 = OpAccessChain %9 %85 
                                                      OpStore %525 %524 
                                       f32_4 %526 = OpLoad %363 
                                       f32_3 %527 = OpVectorShuffle %526 %526 0 1 2 
                                       f32_4 %528 = OpLoad %9 
                                       f32_3 %529 = OpVectorShuffle %528 %528 0 0 0 
                                       f32_3 %530 = OpFNegate %529 
                                       f32_3 %531 = OpFMul %527 %530 
                                                      OpStore %243 %531 
                                       f32_3 %532 = OpLoad %243 
                                       f32_3 %533 = OpFMul %532 %382 
                                                      OpStore %243 %533 
                                       f32_3 %534 = OpLoad %243 
                                       f32_3 %535 = OpExtInst %1 29 %534 
                                                      OpStore %243 %535 
                                Private f32* %536 = OpAccessChain %9 %91 
                                         f32 %537 = OpLoad %536 
                                         f32 %538 = OpLoad %259 
                                         f32 %539 = OpFMul %537 %538 
                                Private f32* %540 = OpAccessChain %9 %85 
                                                      OpStore %540 %539 
                                       f32_4 %541 = OpLoad %9 
                                       f32_3 %542 = OpVectorShuffle %541 %541 0 0 0 
                                       f32_3 %543 = OpLoad %243 
                                       f32_3 %544 = OpFMul %542 %543 
                                       f32_4 %545 = OpLoad %9 
                                       f32_4 %546 = OpVectorShuffle %545 %544 4 5 6 3 
                                                      OpStore %9 %546 
                                       f32_3 %547 = OpLoad %374 
                                         f32 %548 = OpLoad %156 
                                       f32_3 %549 = OpCompositeConstruct %548 %548 %548 
                                       f32_3 %550 = OpFMul %547 %549 
                                       f32_4 %551 = OpLoad %9 
                                       f32_3 %552 = OpVectorShuffle %551 %551 0 1 2 
                                       f32_3 %553 = OpFAdd %550 %552 
                                       f32_4 %554 = OpLoad %9 
                                       f32_4 %555 = OpVectorShuffle %554 %553 4 5 6 3 
                                                      OpStore %9 %555 
                                       f32_4 %556 = OpLoad %44 
                                       f32_3 %557 = OpVectorShuffle %556 %556 0 1 2 
                                       f32_4 %558 = OpLoad %50 
                                       f32_3 %559 = OpVectorShuffle %558 %558 0 0 0 
                                       f32_3 %560 = OpFMul %557 %559 
                                                      OpStore %243 %560 
                                       f32_4 %561 = OpLoad %9 
                                       f32_3 %562 = OpVectorShuffle %561 %561 0 1 2 
                                       f32_3 %563 = OpLoad %243 
                                       f32_3 %564 = OpFMul %562 %563 
                                                      OpStore %243 %564 
                                       f32_4 %565 = OpLoad %9 
                                       f32_3 %566 = OpVectorShuffle %565 %565 0 1 2 
                                       f32_3 %569 = OpFMul %566 %568 
                                       f32_4 %570 = OpLoad %9 
                                       f32_4 %571 = OpVectorShuffle %570 %569 4 5 6 3 
                                                      OpStore %9 %571 
                                                      OpBranch %180 
                                             %572 = OpLabel 
                                Private f32* %573 = OpAccessChain %165 %70 
                                         f32 %574 = OpLoad %573 
                                         f32 %576 = OpExtInst %1 37 %574 %575 
                                                      OpStore %156 %576 
                                         f32 %578 = OpLoad %156 
                                         f32 %579 = OpFDiv %577 %578 
                                                      OpStore %156 %579 
                                         f32 %580 = OpLoad %156 
                                       f32_3 %581 = OpCompositeConstruct %580 %580 %580 
                                       f32_3 %582 = OpLoad %165 
                                       f32_3 %583 = OpFMul %581 %582 
                                       f32_3 %584 = OpFAdd %583 %252 
                                       f32_4 %585 = OpLoad %363 
                                       f32_4 %586 = OpVectorShuffle %585 %584 4 5 6 3 
                                                      OpStore %363 %586 
                                       f32_3 %587 = OpLoad %165 
                                       f32_3 %588 = OpFNegate %587 
                                       f32_4 %589 = OpLoad %363 
                                       f32_3 %590 = OpVectorShuffle %589 %589 0 1 2 
                                         f32 %591 = OpDot %588 %590 
                                                      OpStore %259 %591 
                              Uniform f32_4* %592 = OpAccessChain %21 %28 
                                       f32_4 %593 = OpLoad %592 
                                       f32_3 %594 = OpVectorShuffle %593 %593 0 1 2 
                                       f32_4 %595 = OpLoad %363 
                                       f32_3 %596 = OpVectorShuffle %595 %595 0 1 2 
                                         f32 %597 = OpDot %594 %596 
                                Private f32* %598 = OpAccessChain %269 %85 
                                                      OpStore %598 %597 
                                         f32 %599 = OpLoad %259 
                                         f32 %600 = OpFNegate %599 
                                         f32 %601 = OpFAdd %600 %109 
                                                      OpStore %259 %601 
                                         f32 %602 = OpLoad %259 
                                         f32 %603 = OpFMul %602 %210 
                                         f32 %604 = OpFAdd %603 %212 
                                                      OpStore %281 %604 
                                         f32 %605 = OpLoad %259 
                                         f32 %606 = OpLoad %281 
                                         f32 %607 = OpFMul %605 %606 
                                         f32 %608 = OpFAdd %607 %217 
                                                      OpStore %281 %608 
                                         f32 %609 = OpLoad %259 
                                         f32 %610 = OpLoad %281 
                                         f32 %611 = OpFMul %609 %610 
                                         f32 %612 = OpFAdd %611 %222 
                                                      OpStore %281 %612 
                                         f32 %613 = OpLoad %259 
                                         f32 %614 = OpLoad %281 
                                         f32 %615 = OpFMul %613 %614 
                                         f32 %616 = OpFAdd %615 %227 
                                                      OpStore %259 %616 
                                         f32 %617 = OpLoad %259 
                                         f32 %618 = OpFMul %617 %230 
                                                      OpStore %259 %618 
                                         f32 %619 = OpLoad %259 
                                         f32 %620 = OpExtInst %1 29 %619 
                                                      OpStore %259 %620 
                                Private f32* %621 = OpAccessChain %269 %85 
                                         f32 %622 = OpLoad %621 
                                         f32 %623 = OpFNegate %622 
                                         f32 %624 = OpFAdd %623 %109 
                                Private f32* %625 = OpAccessChain %269 %85 
                                                      OpStore %625 %624 
                                Private f32* %626 = OpAccessChain %269 %85 
                                         f32 %627 = OpLoad %626 
                                         f32 %628 = OpFMul %627 %210 
                                         f32 %629 = OpFAdd %628 %212 
                                                      OpStore %281 %629 
                                Private f32* %630 = OpAccessChain %269 %85 
                                         f32 %631 = OpLoad %630 
                                         f32 %632 = OpLoad %281 
                                         f32 %633 = OpFMul %631 %632 
                                         f32 %634 = OpFAdd %633 %217 
                                                      OpStore %281 %634 
                                Private f32* %635 = OpAccessChain %269 %85 
                                         f32 %636 = OpLoad %635 
                                         f32 %637 = OpLoad %281 
                                         f32 %638 = OpFMul %636 %637 
                                         f32 %639 = OpFAdd %638 %222 
                                                      OpStore %281 %639 
                                Private f32* %640 = OpAccessChain %269 %85 
                                         f32 %641 = OpLoad %640 
                                         f32 %642 = OpLoad %281 
                                         f32 %643 = OpFMul %641 %642 
                                         f32 %644 = OpFAdd %643 %227 
                                Private f32* %645 = OpAccessChain %269 %85 
                                                      OpStore %645 %644 
                                Private f32* %646 = OpAccessChain %269 %85 
                                         f32 %647 = OpLoad %646 
                                         f32 %648 = OpFMul %647 %230 
                                Private f32* %649 = OpAccessChain %269 %85 
                                                      OpStore %649 %648 
                                Private f32* %650 = OpAccessChain %269 %85 
                                         f32 %651 = OpLoad %650 
                                         f32 %652 = OpExtInst %1 29 %651 
                                Private f32* %653 = OpAccessChain %269 %85 
                                                      OpStore %653 %652 
                                         f32 %654 = OpLoad %259 
                                       f32_2 %655 = OpCompositeConstruct %654 %654 
                                       f32_2 %658 = OpFMul %655 %657 
                                       f32_4 %659 = OpLoad %363 
                                       f32_4 %660 = OpVectorShuffle %659 %658 4 5 2 3 
                                                      OpStore %363 %660 
                                Private f32* %661 = OpAccessChain %269 %85 
                                         f32 %662 = OpLoad %661 
                                         f32 %663 = OpFMul %662 %344 
                                Private f32* %664 = OpAccessChain %363 %85 
                                         f32 %665 = OpLoad %664 
                                         f32 %666 = OpFAdd %663 %665 
                                                      OpStore %259 %666 
                                         f32 %667 = OpLoad %156 
                                       f32_2 %668 = OpCompositeConstruct %667 %667 
                                       f32_2 %670 = OpFMul %668 %669 
                                                      OpStore %269 %670 
                                       f32_2 %671 = OpLoad %269 
                                       f32_3 %672 = OpVectorShuffle %671 %671 0 0 0 
                                       f32_3 %673 = OpLoad %165 
                                       f32_3 %674 = OpFMul %672 %673 
                                       f32_4 %675 = OpLoad %363 
                                       f32_4 %676 = OpVectorShuffle %675 %674 4 1 5 6 
                                                      OpStore %363 %676 
                                       f32_4 %677 = OpLoad %363 
                                       f32_3 %678 = OpVectorShuffle %677 %677 0 2 3 
                                       f32_3 %679 = OpFMul %678 %249 
                                       f32_3 %680 = OpFAdd %679 %252 
                                       f32_4 %681 = OpLoad %363 
                                       f32_4 %682 = OpVectorShuffle %681 %680 4 1 5 6 
                                                      OpStore %363 %682 
                                       f32_4 %683 = OpLoad %363 
                                       f32_3 %684 = OpVectorShuffle %683 %683 0 2 3 
                                       f32_4 %685 = OpLoad %363 
                                       f32_3 %686 = OpVectorShuffle %685 %685 0 2 3 
                                         f32 %687 = OpDot %684 %686 
                                                      OpStore %156 %687 
                                         f32 %688 = OpLoad %156 
                                         f32 %689 = OpExtInst %1 31 %688 
                                                      OpStore %156 %689 
                                         f32 %690 = OpLoad %156 
                                         f32 %691 = OpFNegate %690 
                                         f32 %692 = OpFAdd %691 %109 
                                                      OpStore %156 %692 
                                         f32 %693 = OpLoad %156 
                                         f32 %694 = OpFMul %693 %264 
                                                      OpStore %156 %694 
                                         f32 %695 = OpLoad %156 
                                         f32 %696 = OpExtInst %1 29 %695 
                                                      OpStore %156 %696 
                                         f32 %697 = OpLoad %156 
                                         f32 %698 = OpLoad %259 
                                         f32 %699 = OpFMul %697 %698 
                                Private f32* %700 = OpAccessChain %363 %70 
                                         f32 %701 = OpLoad %700 
                                         f32 %702 = OpFNegate %701 
                                         f32 %703 = OpFAdd %699 %702 
                                                      OpStore %259 %703 
                                         f32 %704 = OpLoad %259 
                                         f32 %705 = OpExtInst %1 40 %704 %176 
                                                      OpStore %259 %705 
                                         f32 %706 = OpLoad %259 
                                         f32 %707 = OpExtInst %1 37 %706 %361 
                                                      OpStore %259 %707 
                                       f32_4 %708 = OpLoad %44 
                                       f32_3 %709 = OpVectorShuffle %708 %708 0 1 2 
                                       f32_4 %710 = OpLoad %50 
                                       f32_3 %711 = OpVectorShuffle %710 %710 1 1 1 
                                       f32_3 %712 = OpFMul %709 %711 
                                       f32_3 %713 = OpFAdd %712 %370 
                                       f32_4 %714 = OpLoad %363 
                                       f32_4 %715 = OpVectorShuffle %714 %713 4 5 6 3 
                                                      OpStore %363 %715 
                                         f32 %716 = OpLoad %259 
                                       f32_3 %717 = OpCompositeConstruct %716 %716 %716 
                                       f32_3 %718 = OpFNegate %717 
                                       f32_4 %719 = OpLoad %363 
                                       f32_3 %720 = OpVectorShuffle %719 %719 0 1 2 
                                       f32_3 %721 = OpFMul %718 %720 
                                       f32_4 %722 = OpLoad %363 
                                       f32_4 %723 = OpVectorShuffle %722 %721 4 5 6 3 
                                                      OpStore %363 %723 
                                       f32_4 %724 = OpLoad %363 
                                       f32_3 %725 = OpVectorShuffle %724 %724 0 1 2 
                                       f32_3 %726 = OpFMul %725 %382 
                                       f32_4 %727 = OpLoad %363 
                                       f32_4 %728 = OpVectorShuffle %727 %726 4 5 6 3 
                                                      OpStore %363 %728 
                                       f32_4 %729 = OpLoad %363 
                                       f32_3 %730 = OpVectorShuffle %729 %729 0 1 2 
                                       f32_3 %731 = OpExtInst %1 29 %730 
                                       f32_4 %732 = OpLoad %9 
                                       f32_4 %733 = OpVectorShuffle %732 %731 4 5 6 3 
                                                      OpStore %9 %733 
                                Private f32* %734 = OpAccessChain %269 %70 
                                         f32 %735 = OpLoad %734 
                                         f32 %736 = OpLoad %156 
                                         f32 %737 = OpFMul %735 %736 
                                                      OpStore %156 %737 
                                         f32 %739 = OpLoad %156 
                                       f32_3 %740 = OpCompositeConstruct %739 %739 %739 
                                       f32_4 %741 = OpLoad %9 
                                       f32_3 %742 = OpVectorShuffle %741 %741 0 1 2 
                                       f32_3 %743 = OpFMul %740 %742 
                                                      OpStore %738 %743 
                                       f32_4 %744 = OpLoad %44 
                                       f32_3 %745 = OpVectorShuffle %744 %744 0 1 2 
                                       f32_4 %746 = OpLoad %50 
                                       f32_3 %747 = OpVectorShuffle %746 %746 0 0 0 
                                       f32_3 %748 = OpFMul %745 %747 
                                       f32_3 %749 = OpFAdd %748 %568 
                                       f32_4 %750 = OpLoad %44 
                                       f32_4 %751 = OpVectorShuffle %750 %749 4 5 6 3 
                                                      OpStore %44 %751 
                                       f32_4 %752 = OpLoad %44 
                                       f32_3 %753 = OpVectorShuffle %752 %752 0 1 2 
                                       f32_3 %754 = OpLoad %738 
                                       f32_3 %755 = OpFMul %753 %754 
                                                      OpStore %243 %755 
                                                      OpBranch %180 
                                             %180 = OpLabel 
                                Private f32* %758 = OpAccessChain %165 %70 
                                         f32 %759 = OpLoad %758 
                                         f32 %761 = OpFMul %759 %760 
                                                      OpStore vs_TEXCOORD0 %761 
                                Uniform f32* %763 = OpAccessChain %21 %762 %85 
                                         f32 %764 = OpLoad %763 
                                Uniform f32* %765 = OpAccessChain %21 %762 %70 
                                         f32 %766 = OpLoad %765 
                                Uniform f32* %767 = OpAccessChain %21 %762 %91 
                                         f32 %768 = OpLoad %767 
                                       f32_3 %769 = OpCompositeConstruct %764 %766 %768 
                                       f32_4 %770 = OpLoad %9 
                                       f32_3 %771 = OpVectorShuffle %770 %770 0 1 2 
                                       f32_3 %772 = OpFMul %769 %771 
                                       f32_3 %773 = OpLoad %243 
                                       f32_3 %774 = OpFAdd %772 %773 
                                       f32_4 %775 = OpLoad %9 
                                       f32_4 %776 = OpVectorShuffle %775 %774 4 5 6 3 
                                                      OpStore %9 %776 
                                       f32_4 %779 = OpLoad %9 
                                       f32_3 %780 = OpVectorShuffle %779 %779 0 1 2 
                                Uniform f32* %781 = OpAccessChain %21 %46 
                                         f32 %782 = OpLoad %781 
                                       f32_3 %783 = OpCompositeConstruct %782 %782 %782 
                                       f32_3 %784 = OpFMul %780 %783 
                                                      OpStore vs_TEXCOORD1 %784 
                              Uniform f32_4* %785 = OpAccessChain %21 %28 
                                       f32_4 %786 = OpLoad %785 
                                       f32_3 %787 = OpVectorShuffle %786 %786 0 1 2 
                                       f32_3 %788 = OpLoad %165 
                                       f32_3 %789 = OpFNegate %788 
                                         f32 %790 = OpDot %787 %789 
                                Private f32* %791 = OpAccessChain %9 %85 
                                                      OpStore %791 %790 
                                Private f32* %792 = OpAccessChain %9 %85 
                                         f32 %793 = OpLoad %792 
                                Private f32* %794 = OpAccessChain %9 %85 
                                         f32 %795 = OpLoad %794 
                                         f32 %796 = OpFMul %793 %795 
                                Private f32* %797 = OpAccessChain %9 %85 
                                                      OpStore %797 %796 
                                Private f32* %798 = OpAccessChain %9 %85 
                                         f32 %799 = OpLoad %798 
                                         f32 %801 = OpFMul %799 %800 
                                         f32 %802 = OpFAdd %801 %800 
                                Private f32* %803 = OpAccessChain %9 %85 
                                                      OpStore %803 %802 
                                       f32_4 %804 = OpLoad %9 
                                       f32_3 %805 = OpVectorShuffle %804 %804 0 0 0 
                                       f32_3 %806 = OpLoad %243 
                                       f32_3 %807 = OpFMul %805 %806 
                                       f32_4 %808 = OpLoad %9 
                                       f32_4 %809 = OpVectorShuffle %808 %807 4 5 6 3 
                                                      OpStore %9 %809 
                                       f32_4 %811 = OpLoad %9 
                                       f32_3 %812 = OpVectorShuffle %811 %811 0 1 2 
                                Uniform f32* %813 = OpAccessChain %21 %46 
                                         f32 %814 = OpLoad %813 
                                       f32_3 %815 = OpCompositeConstruct %814 %814 %814 
                                       f32_3 %816 = OpFMul %812 %815 
                                                      OpStore vs_TEXCOORD2 %816 
                                 Output f32* %817 = OpAccessChain %74 %28 %70 
                                         f32 %818 = OpLoad %817 
                                         f32 %819 = OpFNegate %818 
                                 Output f32* %820 = OpAccessChain %74 %28 %70 
                                                      OpStore %820 %819 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 42
; Schema: 0
                              OpCapability Shader 
                       %1 = OpExtInstImport "GLSL.std.450" 
                              OpMemoryModel Logical GLSL450 
                              OpEntryPoint Fragment %4 "main" %10 %20 %22 %28 
                              OpExecutionMode %4 OriginUpperLeft 
                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                              OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                              OpDecorate vs_TEXCOORD0 Location 10 
                              OpDecorate vs_TEXCOORD1 Location 20 
                              OpDecorate vs_TEXCOORD2 Location 22 
                              OpDecorate %28 Location 28 
                       %2 = OpTypeVoid 
                       %3 = OpTypeFunction %2 
                       %6 = OpTypeFloat 32 
                       %7 = OpTypePointer Private %6 
          Private f32* %8 = OpVariable Private 
                       %9 = OpTypePointer Input %6 
  Input f32* vs_TEXCOORD0 = OpVariable Input 
                  f32 %13 = OpConstant 3.674022E-40 
                  f32 %14 = OpConstant 3.674022E-40 
                      %16 = OpTypeVector %6 3 
                      %17 = OpTypePointer Private %16 
       Private f32_3* %18 = OpVariable Private 
                      %19 = OpTypePointer Input %16 
Input f32_3* vs_TEXCOORD1 = OpVariable Input 
Input f32_3* vs_TEXCOORD2 = OpVariable Input 
                      %26 = OpTypeVector %6 4 
                      %27 = OpTypePointer Output %26 
        Output f32_4* %28 = OpVariable Output 
                      %37 = OpTypeInt 32 0 
                  u32 %38 = OpConstant 3 
                      %39 = OpTypePointer Output %6 
                  void %4 = OpFunction None %3 
                       %5 = OpLabel 
                  f32 %11 = OpLoad vs_TEXCOORD0 
                              OpStore %8 %11 
                  f32 %12 = OpLoad %8 
                  f32 %15 = OpExtInst %1 43 %12 %13 %14 
                              OpStore %8 %15 
                f32_3 %21 = OpLoad vs_TEXCOORD1 
                f32_3 %23 = OpLoad vs_TEXCOORD2 
                f32_3 %24 = OpFNegate %23 
                f32_3 %25 = OpFAdd %21 %24 
                              OpStore %18 %25 
                  f32 %29 = OpLoad %8 
                f32_3 %30 = OpCompositeConstruct %29 %29 %29 
                f32_3 %31 = OpLoad %18 
                f32_3 %32 = OpFMul %30 %31 
                f32_3 %33 = OpLoad vs_TEXCOORD2 
                f32_3 %34 = OpFAdd %32 %33 
                f32_4 %35 = OpLoad %28 
                f32_4 %36 = OpVectorShuffle %35 %34 4 5 6 3 
                              OpStore %28 %36 
          Output f32* %40 = OpAccessChain %28 %38 
                              OpStore %40 %14 
                              OpReturn
                              OpFunctionEnd
"
}
SubProgram "d3d11 " {
Local Keywords { "_SUNDISK_SIMPLE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "_SUNDISK_SIMPLE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _LightColor0;
uniform 	float _Exposure;
uniform 	vec3 _GroundColor;
uniform 	vec3 _SkyTint;
uniform 	float _AtmosphereThickness;
in  vec4 in_POSITION0;
out vec3 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
vec3 u_xlat9;
float u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
float u_xlat23;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = log2(vec4(_SkyTint.x, _SkyTint.y, _SkyTint.z, _AtmosphereThickness));
    u_xlat1 = u_xlat1 * vec4(0.454545468, 0.454545468, 0.454545468, 2.5);
    u_xlat1 = exp2(u_xlat1);
    u_xlat1.xyz = (-u_xlat1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.300000012, 0.300000042, 0.300000012) + vec3(0.5, 0.419999987, 0.324999988);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = vec3(1.0, 1.0, 1.0) / u_xlat1.xyz;
    u_xlat2.xy = u_xlat1.ww * vec2(0.049999997, 0.0314159282);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlatb0 = u_xlat3.y>=0.0;
    if(u_xlatb0){
        u_xlat0.x = u_xlat3.y * u_xlat3.y + 0.0506249666;
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat0.x = (-u_xlat0.y) * u_xlat21 + u_xlat0.x;
        u_xlat7 = (-u_xlat3.y) * 1.0 + 1.0;
        u_xlat14 = u_xlat7 * 5.25 + -6.80000019;
        u_xlat14 = u_xlat7 * u_xlat14 + 3.82999992;
        u_xlat14 = u_xlat7 * u_xlat14 + 0.458999991;
        u_xlat7 = u_xlat7 * u_xlat14 + -0.00286999997;
        u_xlat7 = u_xlat7 * 1.44269502;
        u_xlat0.y = exp2(u_xlat7);
        u_xlat0.xyz = u_xlat0.xyx * vec3(0.5, 0.246031836, 20.0);
        u_xlat4.xyz = u_xlat0.xxx * u_xlat3.xyz;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0, 1.00010002, 0.0);
        u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat21 = sqrt(u_xlat21);
        u_xlat22 = (-u_xlat21) + 1.0;
        u_xlat22 = u_xlat22 * 230.831207;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = dot(_WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat16.x = u_xlat16.x / u_xlat21;
        u_xlat23 = dot(u_xlat3.xyz, u_xlat4.xyz);
        u_xlat21 = u_xlat23 / u_xlat21;
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = u_xlat16.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat16.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat16.x * u_xlat23 + 0.458999991;
        u_xlat16.x = u_xlat16.x * u_xlat23 + -0.00286999997;
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat21 = (-u_xlat21) + 1.0;
        u_xlat23 = u_xlat21 * 5.25 + -6.80000019;
        u_xlat23 = u_xlat21 * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat21 * u_xlat23 + 0.458999991;
        u_xlat21 = u_xlat21 * u_xlat23 + -0.00286999997;
        u_xlat21 = u_xlat21 * 1.44269502;
        u_xlat21 = exp2(u_xlat21);
        u_xlat21 = u_xlat21 * 0.25;
        u_xlat21 = u_xlat16.x * 0.25 + (-u_xlat21);
        u_xlat21 = u_xlat22 * u_xlat21 + u_xlat0.y;
        u_xlat21 = max(u_xlat21, 0.0);
        u_xlat21 = min(u_xlat21, 50.0);
        u_xlat5.xyz = u_xlat1.xyz * u_xlat2.yyy + vec3(0.0125663709, 0.0125663709, 0.0125663709);
        u_xlat6.xyz = (-vec3(u_xlat21)) * u_xlat5.xyz;
        u_xlat6.xyz = u_xlat6.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat6.xyz = exp2(u_xlat6.xyz);
        u_xlat21 = u_xlat0.z * u_xlat22;
        u_xlat4.xyz = u_xlat3.xyz * u_xlat0.xxx + u_xlat4.xyz;
        u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat22 = (-u_xlat0.x) + 1.0;
        u_xlat22 = u_xlat22 * 230.831207;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = dot(_WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat16.x = u_xlat16.x / u_xlat0.x;
        u_xlat23 = dot(u_xlat3.xyz, u_xlat4.xyz);
        u_xlat0.x = u_xlat23 / u_xlat0.x;
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = u_xlat16.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat16.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat16.x * u_xlat23 + 0.458999991;
        u_xlat16.x = u_xlat16.x * u_xlat23 + -0.00286999997;
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat23 = u_xlat0.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat0.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat0.x * u_xlat23 + 0.458999991;
        u_xlat0.x = u_xlat0.x * u_xlat23 + -0.00286999997;
        u_xlat0.x = u_xlat0.x * 1.44269502;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * 0.25;
        u_xlat0.x = u_xlat16.x * 0.25 + (-u_xlat0.x);
        u_xlat0.x = u_xlat22 * u_xlat0.x + u_xlat0.y;
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat0.x = min(u_xlat0.x, 50.0);
        u_xlat4.xyz = u_xlat5.xyz * (-u_xlat0.xxx);
        u_xlat4.xyz = u_xlat4.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat4.xyz = exp2(u_xlat4.xyz);
        u_xlat0.x = u_xlat0.z * u_xlat22;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat6.xyz * vec3(u_xlat21) + u_xlat0.xyz;
        u_xlat4.xyz = u_xlat1.xyz * u_xlat2.xxx;
        u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat0.xyz * vec3(0.0199999996, 0.0199999996, 0.0199999996);
    } else {
        u_xlat21 = min(u_xlat3.y, -0.00100000005);
        u_xlat21 = -9.99999975e-05 / u_xlat21;
        u_xlat5.xyz = vec3(u_xlat21) * u_xlat3.xyz + vec3(0.0, 1.00010002, 0.0);
        u_xlat22 = dot((-u_xlat3.xyz), u_xlat5.xyz);
        u_xlat16.x = dot(_WorldSpaceLightPos0.xyz, u_xlat5.xyz);
        u_xlat22 = (-u_xlat22) + 1.0;
        u_xlat23 = u_xlat22 * 5.25 + -6.80000019;
        u_xlat23 = u_xlat22 * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat22 * u_xlat23 + 0.458999991;
        u_xlat22 = u_xlat22 * u_xlat23 + -0.00286999997;
        u_xlat22 = u_xlat22 * 1.44269502;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = u_xlat16.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat16.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat16.x * u_xlat23 + 0.458999991;
        u_xlat16.x = u_xlat16.x * u_xlat23 + -0.00286999997;
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat5.xy = vec2(u_xlat22) * vec2(0.25, 0.249900013);
        u_xlat22 = u_xlat16.x * 0.25 + u_xlat5.x;
        u_xlat16.xy = vec2(u_xlat21) * vec2(0.5, 20.0);
        u_xlat5.xzw = u_xlat16.xxx * u_xlat3.xyz;
        u_xlat5.xzw = u_xlat5.xzw * vec3(0.5, 0.5, 0.5) + vec3(0.0, 1.00010002, 0.0);
        u_xlat21 = dot(u_xlat5.xzw, u_xlat5.xzw);
        u_xlat21 = sqrt(u_xlat21);
        u_xlat21 = (-u_xlat21) + 1.0;
        u_xlat21 = u_xlat21 * 230.831207;
        u_xlat21 = exp2(u_xlat21);
        u_xlat22 = u_xlat21 * u_xlat22 + (-u_xlat5.y);
        u_xlat22 = max(u_xlat22, 0.0);
        u_xlat22 = min(u_xlat22, 50.0);
        u_xlat5.xyz = u_xlat1.xyz * u_xlat2.yyy + vec3(0.0125663709, 0.0125663709, 0.0125663709);
        u_xlat5.xyz = (-vec3(u_xlat22)) * u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat0.xyz = exp2(u_xlat5.xyz);
        u_xlat21 = u_xlat16.y * u_xlat21;
        u_xlat9.xyz = vec3(u_xlat21) * u_xlat0.xyz;
        u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx + vec3(0.0199999996, 0.0199999996, 0.0199999996);
        u_xlat4.xyz = u_xlat1.xyz * u_xlat9.xyz;
    }
    u_xlat1.xyz = vec3(_GroundColor.x, _GroundColor.y, _GroundColor.z) * u_xlat0.xyz + u_xlat4.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz * vec3(_Exposure);
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, (-u_xlat3.xyz));
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * 0.75 + 0.75;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz * vec3(_Exposure);
    u_xlat21 = dot(_LightColor0.xyz, _LightColor0.xyz);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = max(u_xlat21, 0.25);
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * vec3(8000.0, 8000.0, 8000.0);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(27.0, 27.0, 27.0);
    vs_TEXCOORD3.xyz = u_xlat0.xyz / vec3(u_xlat21);
    vs_TEXCOORD0.xyz = (-u_xlat3.xyz);
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	float _SunSize;
in  vec3 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD0.xyz + _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat2.x = float(1.0) / _SunSize;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat2.x) * u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat2.x = vs_TEXCOORD0.y * 50.0;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.xyz = vs_TEXCOORD1.xyz + (-vs_TEXCOORD2.xyz);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlatb0 = vs_TEXCOORD0.y<0.0;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Local Keywords { "_SUNDISK_SIMPLE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 864
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %773 %800 %849 %855 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate vs_TEXCOORD1 Location 773 
                                                      OpDecorate vs_TEXCOORD2 Location 800 
                                                      OpDecorate vs_TEXCOORD3 Location 849 
                                                      OpDecorate vs_TEXCOORD0 Location 855 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeVector %6 3 
                                              %19 = OpTypeStruct %7 %16 %17 %7 %6 %18 %18 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32; f32_3; f32_3; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                          i32 %84 = OpConstant 6 
                                          u32 %85 = OpConstant 0 
                                              %86 = OpTypePointer Uniform %6 
                                          u32 %91 = OpConstant 2 
                                          i32 %94 = OpConstant 7 
                                         f32 %100 = OpConstant 3.674022E-40 
                                         f32 %101 = OpConstant 3.674022E-40 
                                       f32_4 %102 = OpConstantComposite %100 %100 %100 %101 
                                         f32 %109 = OpConstant 3.674022E-40 
                                       f32_3 %110 = OpConstantComposite %109 %109 %109 
                                         f32 %116 = OpConstant 3.674022E-40 
                                         f32 %117 = OpConstant 3.674022E-40 
                                       f32_3 %118 = OpConstantComposite %116 %117 %116 
                                         f32 %120 = OpConstant 3.674022E-40 
                                         f32 %121 = OpConstant 3.674022E-40 
                                         f32 %122 = OpConstant 3.674022E-40 
                                       f32_3 %123 = OpConstantComposite %120 %121 %122 
                                             %146 = OpTypeVector %6 2 
                                         f32 %149 = OpConstant 3.674022E-40 
                                         f32 %150 = OpConstant 3.674022E-40 
                                       f32_2 %151 = OpConstantComposite %149 %150 
                                             %155 = OpTypePointer Private %6 
                                Private f32* %156 = OpVariable Private 
                                             %164 = OpTypePointer Private %18 
                              Private f32_3* %165 = OpVariable Private 
                                             %171 = OpTypeBool 
                                             %172 = OpTypePointer Private %171 
                               Private bool* %173 = OpVariable Private 
                                         f32 %176 = OpConstant 3.674022E-40 
                                         f32 %186 = OpConstant 3.674022E-40 
                                Private f32* %202 = OpVariable Private 
                                Private f32* %209 = OpVariable Private 
                                         f32 %211 = OpConstant 3.674022E-40 
                                         f32 %213 = OpConstant 3.674022E-40 
                                         f32 %218 = OpConstant 3.674022E-40 
                                         f32 %223 = OpConstant 3.674022E-40 
                                         f32 %228 = OpConstant 3.674022E-40 
                                         f32 %231 = OpConstant 3.674022E-40 
                                         f32 %238 = OpConstant 3.674022E-40 
                                         f32 %239 = OpConstant 3.674022E-40 
                                       f32_3 %240 = OpConstantComposite %120 %238 %239 
                              Private f32_3* %244 = OpVariable Private 
                                       f32_3 %250 = OpConstantComposite %120 %120 %120 
                                         f32 %252 = OpConstant 3.674022E-40 
                                       f32_3 %253 = OpConstantComposite %176 %252 %176 
                                Private f32* %260 = OpVariable Private 
                                         f32 %265 = OpConstant 3.674022E-40 
                                             %269 = OpTypePointer Private %146 
                              Private f32_2* %270 = OpVariable Private 
                                Private f32* %282 = OpVariable Private 
                                         f32 %345 = OpConstant 3.674022E-40 
                                         f32 %362 = OpConstant 3.674022E-40 
                              Private f32_4* %364 = OpVariable Private 
                                         f32 %370 = OpConstant 3.674022E-40 
                                       f32_3 %371 = OpConstantComposite %370 %370 %370 
                              Private f32_3* %375 = OpVariable Private 
                                       f32_3 %383 = OpConstantComposite %231 %231 %231 
                                         f32 %568 = OpConstant 3.674022E-40 
                                       f32_3 %569 = OpConstantComposite %568 %568 %568 
                                         f32 %576 = OpConstant 3.674022E-40 
                                         f32 %578 = OpConstant 3.674022E-40 
                                         f32 %657 = OpConstant 3.674022E-40 
                                       f32_2 %658 = OpConstantComposite %345 %657 
                                       f32_2 %670 = OpConstantComposite %120 %239 
                              Private f32_3* %739 = OpVariable Private 
                                         i32 %757 = OpConstant 5 
                                             %772 = OpTypePointer Output %18 
                       Output f32_3* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %776 = OpConstant 4 
                                         f32 %791 = OpConstant 3.674022E-40 
                       Output f32_3* vs_TEXCOORD2 = OpVariable Output 
                                         f32 %822 = OpConstant 3.674022E-40 
                                       f32_3 %823 = OpConstantComposite %822 %822 %822 
                                         f32 %844 = OpConstant 3.674022E-40 
                                       f32_3 %845 = OpConstantComposite %844 %844 %844 
                       Output f32_3* vs_TEXCOORD3 = OpVariable Output 
                       Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                             %858 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                                        f32_4 %51 = OpLoad %44 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %21 %36 %23 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %21 %36 %28 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %36 %36 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %21 %36 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %44 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %28 
                                                      OpStore %83 %81 
                                 Uniform f32* %87 = OpAccessChain %21 %84 %85 
                                          f32 %88 = OpLoad %87 
                                 Uniform f32* %89 = OpAccessChain %21 %84 %70 
                                          f32 %90 = OpLoad %89 
                                 Uniform f32* %92 = OpAccessChain %21 %84 %91 
                                          f32 %93 = OpLoad %92 
                                 Uniform f32* %95 = OpAccessChain %21 %94 
                                          f32 %96 = OpLoad %95 
                                        f32_4 %97 = OpCompositeConstruct %88 %90 %93 %96 
                                        f32_4 %98 = OpExtInst %1 30 %97 
                                                      OpStore %44 %98 
                                        f32_4 %99 = OpLoad %44 
                                       f32_4 %103 = OpFMul %99 %102 
                                                      OpStore %44 %103 
                                       f32_4 %104 = OpLoad %44 
                                       f32_4 %105 = OpExtInst %1 29 %104 
                                                      OpStore %44 %105 
                                       f32_4 %106 = OpLoad %44 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                       f32_3 %108 = OpFNegate %107 
                                       f32_3 %111 = OpFAdd %108 %110 
                                       f32_4 %112 = OpLoad %44 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %44 %113 
                                       f32_4 %114 = OpLoad %44 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %119 = OpFMul %115 %118 
                                       f32_3 %124 = OpFAdd %119 %123 
                                       f32_4 %125 = OpLoad %44 
                                       f32_4 %126 = OpVectorShuffle %125 %124 4 5 6 3 
                                                      OpStore %44 %126 
                                       f32_4 %127 = OpLoad %44 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                       f32_4 %129 = OpLoad %44 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32_3 %131 = OpFMul %128 %130 
                                       f32_4 %132 = OpLoad %44 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
                                                      OpStore %44 %133 
                                       f32_4 %134 = OpLoad %44 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                       f32_4 %136 = OpLoad %44 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_3 %138 = OpFMul %135 %137 
                                       f32_4 %139 = OpLoad %44 
                                       f32_4 %140 = OpVectorShuffle %139 %138 4 5 6 3 
                                                      OpStore %44 %140 
                                       f32_4 %141 = OpLoad %44 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFDiv %110 %142 
                                       f32_4 %144 = OpLoad %44 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 6 3 
                                                      OpStore %44 %145 
                                       f32_4 %147 = OpLoad %44 
                                       f32_2 %148 = OpVectorShuffle %147 %147 3 3 
                                       f32_2 %152 = OpFMul %148 %151 
                                       f32_4 %153 = OpLoad %50 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 2 3 
                                                      OpStore %50 %154 
                                       f32_4 %157 = OpLoad %9 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                       f32_4 %159 = OpLoad %9 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                         f32 %161 = OpDot %158 %160 
                                                      OpStore %156 %161 
                                         f32 %162 = OpLoad %156 
                                         f32 %163 = OpExtInst %1 32 %162 
                                                      OpStore %156 %163 
                                         f32 %166 = OpLoad %156 
                                       f32_3 %167 = OpCompositeConstruct %166 %166 %166 
                                       f32_4 %168 = OpLoad %9 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_3 %170 = OpFMul %167 %169 
                                                      OpStore %165 %170 
                                Private f32* %174 = OpAccessChain %165 %70 
                                         f32 %175 = OpLoad %174 
                                        bool %177 = OpFOrdGreaterThanEqual %175 %176 
                                                      OpStore %173 %177 
                                        bool %178 = OpLoad %173 
                                                      OpSelectionMerge %180 None 
                                                      OpBranchConditional %178 %179 %573 
                                             %179 = OpLabel 
                                Private f32* %181 = OpAccessChain %165 %70 
                                         f32 %182 = OpLoad %181 
                                Private f32* %183 = OpAccessChain %165 %70 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFMul %182 %184 
                                         f32 %187 = OpFAdd %185 %186 
                                Private f32* %188 = OpAccessChain %9 %85 
                                                      OpStore %188 %187 
                                Private f32* %189 = OpAccessChain %9 %85 
                                         f32 %190 = OpLoad %189 
                                         f32 %191 = OpExtInst %1 31 %190 
                                Private f32* %192 = OpAccessChain %9 %85 
                                                      OpStore %192 %191 
                                Private f32* %193 = OpAccessChain %9 %70 
                                         f32 %194 = OpLoad %193 
                                         f32 %195 = OpFNegate %194 
                                         f32 %196 = OpLoad %156 
                                         f32 %197 = OpFMul %195 %196 
                                Private f32* %198 = OpAccessChain %9 %85 
                                         f32 %199 = OpLoad %198 
                                         f32 %200 = OpFAdd %197 %199 
                                Private f32* %201 = OpAccessChain %9 %85 
                                                      OpStore %201 %200 
                                Private f32* %203 = OpAccessChain %9 %70 
                                         f32 %204 = OpLoad %203 
                                         f32 %205 = OpFNegate %204 
                                         f32 %206 = OpLoad %156 
                                         f32 %207 = OpFMul %205 %206 
                                         f32 %208 = OpFAdd %207 %109 
                                                      OpStore %202 %208 
                                         f32 %210 = OpLoad %202 
                                         f32 %212 = OpFMul %210 %211 
                                         f32 %214 = OpFAdd %212 %213 
                                                      OpStore %209 %214 
                                         f32 %215 = OpLoad %202 
                                         f32 %216 = OpLoad %209 
                                         f32 %217 = OpFMul %215 %216 
                                         f32 %219 = OpFAdd %217 %218 
                                                      OpStore %209 %219 
                                         f32 %220 = OpLoad %202 
                                         f32 %221 = OpLoad %209 
                                         f32 %222 = OpFMul %220 %221 
                                         f32 %224 = OpFAdd %222 %223 
                                                      OpStore %209 %224 
                                         f32 %225 = OpLoad %202 
                                         f32 %226 = OpLoad %209 
                                         f32 %227 = OpFMul %225 %226 
                                         f32 %229 = OpFAdd %227 %228 
                                                      OpStore %202 %229 
                                         f32 %230 = OpLoad %202 
                                         f32 %232 = OpFMul %230 %231 
                                                      OpStore %202 %232 
                                         f32 %233 = OpLoad %202 
                                         f32 %234 = OpExtInst %1 29 %233 
                                Private f32* %235 = OpAccessChain %9 %70 
                                                      OpStore %235 %234 
                                       f32_4 %236 = OpLoad %9 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 0 
                                       f32_3 %241 = OpFMul %237 %240 
                                       f32_4 %242 = OpLoad %9 
                                       f32_4 %243 = OpVectorShuffle %242 %241 4 5 6 3 
                                                      OpStore %9 %243 
                                       f32_4 %245 = OpLoad %9 
                                       f32_3 %246 = OpVectorShuffle %245 %245 0 0 0 
                                       f32_3 %247 = OpLoad %165 
                                       f32_3 %248 = OpFMul %246 %247 
                                                      OpStore %244 %248 
                                       f32_3 %249 = OpLoad %244 
                                       f32_3 %251 = OpFMul %249 %250 
                                       f32_3 %254 = OpFAdd %251 %253 
                                                      OpStore %244 %254 
                                       f32_3 %255 = OpLoad %244 
                                       f32_3 %256 = OpLoad %244 
                                         f32 %257 = OpDot %255 %256 
                                                      OpStore %156 %257 
                                         f32 %258 = OpLoad %156 
                                         f32 %259 = OpExtInst %1 31 %258 
                                                      OpStore %156 %259 
                                         f32 %261 = OpLoad %156 
                                         f32 %262 = OpFNegate %261 
                                         f32 %263 = OpFAdd %262 %109 
                                                      OpStore %260 %263 
                                         f32 %264 = OpLoad %260 
                                         f32 %266 = OpFMul %264 %265 
                                                      OpStore %260 %266 
                                         f32 %267 = OpLoad %260 
                                         f32 %268 = OpExtInst %1 29 %267 
                                                      OpStore %260 %268 
                              Uniform f32_4* %271 = OpAccessChain %21 %28 
                                       f32_4 %272 = OpLoad %271 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                                       f32_3 %274 = OpLoad %244 
                                         f32 %275 = OpDot %273 %274 
                                Private f32* %276 = OpAccessChain %270 %85 
                                                      OpStore %276 %275 
                                Private f32* %277 = OpAccessChain %270 %85 
                                         f32 %278 = OpLoad %277 
                                         f32 %279 = OpLoad %156 
                                         f32 %280 = OpFDiv %278 %279 
                                Private f32* %281 = OpAccessChain %270 %85 
                                                      OpStore %281 %280 
                                       f32_3 %283 = OpLoad %165 
                                       f32_3 %284 = OpLoad %244 
                                         f32 %285 = OpDot %283 %284 
                                                      OpStore %282 %285 
                                         f32 %286 = OpLoad %282 
                                         f32 %287 = OpLoad %156 
                                         f32 %288 = OpFDiv %286 %287 
                                                      OpStore %156 %288 
                                Private f32* %289 = OpAccessChain %270 %85 
                                         f32 %290 = OpLoad %289 
                                         f32 %291 = OpFNegate %290 
                                         f32 %292 = OpFAdd %291 %109 
                                Private f32* %293 = OpAccessChain %270 %85 
                                                      OpStore %293 %292 
                                Private f32* %294 = OpAccessChain %270 %85 
                                         f32 %295 = OpLoad %294 
                                         f32 %296 = OpFMul %295 %211 
                                         f32 %297 = OpFAdd %296 %213 
                                                      OpStore %282 %297 
                                Private f32* %298 = OpAccessChain %270 %85 
                                         f32 %299 = OpLoad %298 
                                         f32 %300 = OpLoad %282 
                                         f32 %301 = OpFMul %299 %300 
                                         f32 %302 = OpFAdd %301 %218 
                                                      OpStore %282 %302 
                                Private f32* %303 = OpAccessChain %270 %85 
                                         f32 %304 = OpLoad %303 
                                         f32 %305 = OpLoad %282 
                                         f32 %306 = OpFMul %304 %305 
                                         f32 %307 = OpFAdd %306 %223 
                                                      OpStore %282 %307 
                                Private f32* %308 = OpAccessChain %270 %85 
                                         f32 %309 = OpLoad %308 
                                         f32 %310 = OpLoad %282 
                                         f32 %311 = OpFMul %309 %310 
                                         f32 %312 = OpFAdd %311 %228 
                                Private f32* %313 = OpAccessChain %270 %85 
                                                      OpStore %313 %312 
                                Private f32* %314 = OpAccessChain %270 %85 
                                         f32 %315 = OpLoad %314 
                                         f32 %316 = OpFMul %315 %231 
                                Private f32* %317 = OpAccessChain %270 %85 
                                                      OpStore %317 %316 
                                Private f32* %318 = OpAccessChain %270 %85 
                                         f32 %319 = OpLoad %318 
                                         f32 %320 = OpExtInst %1 29 %319 
                                Private f32* %321 = OpAccessChain %270 %85 
                                                      OpStore %321 %320 
                                         f32 %322 = OpLoad %156 
                                         f32 %323 = OpFNegate %322 
                                         f32 %324 = OpFAdd %323 %109 
                                                      OpStore %156 %324 
                                         f32 %325 = OpLoad %156 
                                         f32 %326 = OpFMul %325 %211 
                                         f32 %327 = OpFAdd %326 %213 
                                                      OpStore %282 %327 
                                         f32 %328 = OpLoad %156 
                                         f32 %329 = OpLoad %282 
                                         f32 %330 = OpFMul %328 %329 
                                         f32 %331 = OpFAdd %330 %218 
                                                      OpStore %282 %331 
                                         f32 %332 = OpLoad %156 
                                         f32 %333 = OpLoad %282 
                                         f32 %334 = OpFMul %332 %333 
                                         f32 %335 = OpFAdd %334 %223 
                                                      OpStore %282 %335 
                                         f32 %336 = OpLoad %156 
                                         f32 %337 = OpLoad %282 
                                         f32 %338 = OpFMul %336 %337 
                                         f32 %339 = OpFAdd %338 %228 
                                                      OpStore %156 %339 
                                         f32 %340 = OpLoad %156 
                                         f32 %341 = OpFMul %340 %231 
                                                      OpStore %156 %341 
                                         f32 %342 = OpLoad %156 
                                         f32 %343 = OpExtInst %1 29 %342 
                                                      OpStore %156 %343 
                                         f32 %344 = OpLoad %156 
                                         f32 %346 = OpFMul %344 %345 
                                                      OpStore %156 %346 
                                Private f32* %347 = OpAccessChain %270 %85 
                                         f32 %348 = OpLoad %347 
                                         f32 %349 = OpFMul %348 %345 
                                         f32 %350 = OpLoad %156 
                                         f32 %351 = OpFNegate %350 
                                         f32 %352 = OpFAdd %349 %351 
                                                      OpStore %156 %352 
                                         f32 %353 = OpLoad %260 
                                         f32 %354 = OpLoad %156 
                                         f32 %355 = OpFMul %353 %354 
                                Private f32* %356 = OpAccessChain %9 %70 
                                         f32 %357 = OpLoad %356 
                                         f32 %358 = OpFAdd %355 %357 
                                                      OpStore %156 %358 
                                         f32 %359 = OpLoad %156 
                                         f32 %360 = OpExtInst %1 40 %359 %176 
                                                      OpStore %156 %360 
                                         f32 %361 = OpLoad %156 
                                         f32 %363 = OpExtInst %1 37 %361 %362 
                                                      OpStore %156 %363 
                                       f32_4 %365 = OpLoad %44 
                                       f32_3 %366 = OpVectorShuffle %365 %365 0 1 2 
                                       f32_4 %367 = OpLoad %50 
                                       f32_3 %368 = OpVectorShuffle %367 %367 1 1 1 
                                       f32_3 %369 = OpFMul %366 %368 
                                       f32_3 %372 = OpFAdd %369 %371 
                                       f32_4 %373 = OpLoad %364 
                                       f32_4 %374 = OpVectorShuffle %373 %372 4 5 6 3 
                                                      OpStore %364 %374 
                                         f32 %376 = OpLoad %156 
                                       f32_3 %377 = OpCompositeConstruct %376 %376 %376 
                                       f32_3 %378 = OpFNegate %377 
                                       f32_4 %379 = OpLoad %364 
                                       f32_3 %380 = OpVectorShuffle %379 %379 0 1 2 
                                       f32_3 %381 = OpFMul %378 %380 
                                                      OpStore %375 %381 
                                       f32_3 %382 = OpLoad %375 
                                       f32_3 %384 = OpFMul %382 %383 
                                                      OpStore %375 %384 
                                       f32_3 %385 = OpLoad %375 
                                       f32_3 %386 = OpExtInst %1 29 %385 
                                                      OpStore %375 %386 
                                Private f32* %387 = OpAccessChain %9 %91 
                                         f32 %388 = OpLoad %387 
                                         f32 %389 = OpLoad %260 
                                         f32 %390 = OpFMul %388 %389 
                                                      OpStore %156 %390 
                                       f32_3 %391 = OpLoad %165 
                                       f32_4 %392 = OpLoad %9 
                                       f32_3 %393 = OpVectorShuffle %392 %392 0 0 0 
                                       f32_3 %394 = OpFMul %391 %393 
                                       f32_3 %395 = OpLoad %244 
                                       f32_3 %396 = OpFAdd %394 %395 
                                                      OpStore %244 %396 
                                       f32_3 %397 = OpLoad %244 
                                       f32_3 %398 = OpLoad %244 
                                         f32 %399 = OpDot %397 %398 
                                Private f32* %400 = OpAccessChain %9 %85 
                                                      OpStore %400 %399 
                                Private f32* %401 = OpAccessChain %9 %85 
                                         f32 %402 = OpLoad %401 
                                         f32 %403 = OpExtInst %1 31 %402 
                                Private f32* %404 = OpAccessChain %9 %85 
                                                      OpStore %404 %403 
                                Private f32* %405 = OpAccessChain %9 %85 
                                         f32 %406 = OpLoad %405 
                                         f32 %407 = OpFNegate %406 
                                         f32 %408 = OpFAdd %407 %109 
                                                      OpStore %260 %408 
                                         f32 %409 = OpLoad %260 
                                         f32 %410 = OpFMul %409 %265 
                                                      OpStore %260 %410 
                                         f32 %411 = OpLoad %260 
                                         f32 %412 = OpExtInst %1 29 %411 
                                                      OpStore %260 %412 
                              Uniform f32_4* %413 = OpAccessChain %21 %28 
                                       f32_4 %414 = OpLoad %413 
                                       f32_3 %415 = OpVectorShuffle %414 %414 0 1 2 
                                       f32_3 %416 = OpLoad %244 
                                         f32 %417 = OpDot %415 %416 
                                Private f32* %418 = OpAccessChain %270 %85 
                                                      OpStore %418 %417 
                                Private f32* %419 = OpAccessChain %270 %85 
                                         f32 %420 = OpLoad %419 
                                Private f32* %421 = OpAccessChain %9 %85 
                                         f32 %422 = OpLoad %421 
                                         f32 %423 = OpFDiv %420 %422 
                                Private f32* %424 = OpAccessChain %270 %85 
                                                      OpStore %424 %423 
                                       f32_3 %425 = OpLoad %165 
                                       f32_3 %426 = OpLoad %244 
                                         f32 %427 = OpDot %425 %426 
                                                      OpStore %282 %427 
                                         f32 %428 = OpLoad %282 
                                Private f32* %429 = OpAccessChain %9 %85 
                                         f32 %430 = OpLoad %429 
                                         f32 %431 = OpFDiv %428 %430 
                                Private f32* %432 = OpAccessChain %9 %85 
                                                      OpStore %432 %431 
                                Private f32* %433 = OpAccessChain %270 %85 
                                         f32 %434 = OpLoad %433 
                                         f32 %435 = OpFNegate %434 
                                         f32 %436 = OpFAdd %435 %109 
                                Private f32* %437 = OpAccessChain %270 %85 
                                                      OpStore %437 %436 
                                Private f32* %438 = OpAccessChain %270 %85 
                                         f32 %439 = OpLoad %438 
                                         f32 %440 = OpFMul %439 %211 
                                         f32 %441 = OpFAdd %440 %213 
                                                      OpStore %282 %441 
                                Private f32* %442 = OpAccessChain %270 %85 
                                         f32 %443 = OpLoad %442 
                                         f32 %444 = OpLoad %282 
                                         f32 %445 = OpFMul %443 %444 
                                         f32 %446 = OpFAdd %445 %218 
                                                      OpStore %282 %446 
                                Private f32* %447 = OpAccessChain %270 %85 
                                         f32 %448 = OpLoad %447 
                                         f32 %449 = OpLoad %282 
                                         f32 %450 = OpFMul %448 %449 
                                         f32 %451 = OpFAdd %450 %223 
                                                      OpStore %282 %451 
                                Private f32* %452 = OpAccessChain %270 %85 
                                         f32 %453 = OpLoad %452 
                                         f32 %454 = OpLoad %282 
                                         f32 %455 = OpFMul %453 %454 
                                         f32 %456 = OpFAdd %455 %228 
                                Private f32* %457 = OpAccessChain %270 %85 
                                                      OpStore %457 %456 
                                Private f32* %458 = OpAccessChain %270 %85 
                                         f32 %459 = OpLoad %458 
                                         f32 %460 = OpFMul %459 %231 
                                Private f32* %461 = OpAccessChain %270 %85 
                                                      OpStore %461 %460 
                                Private f32* %462 = OpAccessChain %270 %85 
                                         f32 %463 = OpLoad %462 
                                         f32 %464 = OpExtInst %1 29 %463 
                                Private f32* %465 = OpAccessChain %270 %85 
                                                      OpStore %465 %464 
                                Private f32* %466 = OpAccessChain %9 %85 
                                         f32 %467 = OpLoad %466 
                                         f32 %468 = OpFNegate %467 
                                         f32 %469 = OpFAdd %468 %109 
                                Private f32* %470 = OpAccessChain %9 %85 
                                                      OpStore %470 %469 
                                Private f32* %471 = OpAccessChain %9 %85 
                                         f32 %472 = OpLoad %471 
                                         f32 %473 = OpFMul %472 %211 
                                         f32 %474 = OpFAdd %473 %213 
                                                      OpStore %282 %474 
                                Private f32* %475 = OpAccessChain %9 %85 
                                         f32 %476 = OpLoad %475 
                                         f32 %477 = OpLoad %282 
                                         f32 %478 = OpFMul %476 %477 
                                         f32 %479 = OpFAdd %478 %218 
                                                      OpStore %282 %479 
                                Private f32* %480 = OpAccessChain %9 %85 
                                         f32 %481 = OpLoad %480 
                                         f32 %482 = OpLoad %282 
                                         f32 %483 = OpFMul %481 %482 
                                         f32 %484 = OpFAdd %483 %223 
                                                      OpStore %282 %484 
                                Private f32* %485 = OpAccessChain %9 %85 
                                         f32 %486 = OpLoad %485 
                                         f32 %487 = OpLoad %282 
                                         f32 %488 = OpFMul %486 %487 
                                         f32 %489 = OpFAdd %488 %228 
                                Private f32* %490 = OpAccessChain %9 %85 
                                                      OpStore %490 %489 
                                Private f32* %491 = OpAccessChain %9 %85 
                                         f32 %492 = OpLoad %491 
                                         f32 %493 = OpFMul %492 %231 
                                Private f32* %494 = OpAccessChain %9 %85 
                                                      OpStore %494 %493 
                                Private f32* %495 = OpAccessChain %9 %85 
                                         f32 %496 = OpLoad %495 
                                         f32 %497 = OpExtInst %1 29 %496 
                                Private f32* %498 = OpAccessChain %9 %85 
                                                      OpStore %498 %497 
                                Private f32* %499 = OpAccessChain %9 %85 
                                         f32 %500 = OpLoad %499 
                                         f32 %501 = OpFMul %500 %345 
                                Private f32* %502 = OpAccessChain %9 %85 
                                                      OpStore %502 %501 
                                Private f32* %503 = OpAccessChain %270 %85 
                                         f32 %504 = OpLoad %503 
                                         f32 %505 = OpFMul %504 %345 
                                Private f32* %506 = OpAccessChain %9 %85 
                                         f32 %507 = OpLoad %506 
                                         f32 %508 = OpFNegate %507 
                                         f32 %509 = OpFAdd %505 %508 
                                Private f32* %510 = OpAccessChain %9 %85 
                                                      OpStore %510 %509 
                                         f32 %511 = OpLoad %260 
                                Private f32* %512 = OpAccessChain %9 %85 
                                         f32 %513 = OpLoad %512 
                                         f32 %514 = OpFMul %511 %513 
                                Private f32* %515 = OpAccessChain %9 %70 
                                         f32 %516 = OpLoad %515 
                                         f32 %517 = OpFAdd %514 %516 
                                Private f32* %518 = OpAccessChain %9 %85 
                                                      OpStore %518 %517 
                                Private f32* %519 = OpAccessChain %9 %85 
                                         f32 %520 = OpLoad %519 
                                         f32 %521 = OpExtInst %1 40 %520 %176 
                                Private f32* %522 = OpAccessChain %9 %85 
                                                      OpStore %522 %521 
                                Private f32* %523 = OpAccessChain %9 %85 
                                         f32 %524 = OpLoad %523 
                                         f32 %525 = OpExtInst %1 37 %524 %362 
                                Private f32* %526 = OpAccessChain %9 %85 
                                                      OpStore %526 %525 
                                       f32_4 %527 = OpLoad %364 
                                       f32_3 %528 = OpVectorShuffle %527 %527 0 1 2 
                                       f32_4 %529 = OpLoad %9 
                                       f32_3 %530 = OpVectorShuffle %529 %529 0 0 0 
                                       f32_3 %531 = OpFNegate %530 
                                       f32_3 %532 = OpFMul %528 %531 
                                                      OpStore %244 %532 
                                       f32_3 %533 = OpLoad %244 
                                       f32_3 %534 = OpFMul %533 %383 
                                                      OpStore %244 %534 
                                       f32_3 %535 = OpLoad %244 
                                       f32_3 %536 = OpExtInst %1 29 %535 
                                                      OpStore %244 %536 
                                Private f32* %537 = OpAccessChain %9 %91 
                                         f32 %538 = OpLoad %537 
                                         f32 %539 = OpLoad %260 
                                         f32 %540 = OpFMul %538 %539 
                                Private f32* %541 = OpAccessChain %9 %85 
                                                      OpStore %541 %540 
                                       f32_4 %542 = OpLoad %9 
                                       f32_3 %543 = OpVectorShuffle %542 %542 0 0 0 
                                       f32_3 %544 = OpLoad %244 
                                       f32_3 %545 = OpFMul %543 %544 
                                       f32_4 %546 = OpLoad %9 
                                       f32_4 %547 = OpVectorShuffle %546 %545 4 5 6 3 
                                                      OpStore %9 %547 
                                       f32_3 %548 = OpLoad %375 
                                         f32 %549 = OpLoad %156 
                                       f32_3 %550 = OpCompositeConstruct %549 %549 %549 
                                       f32_3 %551 = OpFMul %548 %550 
                                       f32_4 %552 = OpLoad %9 
                                       f32_3 %553 = OpVectorShuffle %552 %552 0 1 2 
                                       f32_3 %554 = OpFAdd %551 %553 
                                       f32_4 %555 = OpLoad %9 
                                       f32_4 %556 = OpVectorShuffle %555 %554 4 5 6 3 
                                                      OpStore %9 %556 
                                       f32_4 %557 = OpLoad %44 
                                       f32_3 %558 = OpVectorShuffle %557 %557 0 1 2 
                                       f32_4 %559 = OpLoad %50 
                                       f32_3 %560 = OpVectorShuffle %559 %559 0 0 0 
                                       f32_3 %561 = OpFMul %558 %560 
                                                      OpStore %244 %561 
                                       f32_4 %562 = OpLoad %9 
                                       f32_3 %563 = OpVectorShuffle %562 %562 0 1 2 
                                       f32_3 %564 = OpLoad %244 
                                       f32_3 %565 = OpFMul %563 %564 
                                                      OpStore %244 %565 
                                       f32_4 %566 = OpLoad %9 
                                       f32_3 %567 = OpVectorShuffle %566 %566 0 1 2 
                                       f32_3 %570 = OpFMul %567 %569 
                                       f32_4 %571 = OpLoad %9 
                                       f32_4 %572 = OpVectorShuffle %571 %570 4 5 6 3 
                                                      OpStore %9 %572 
                                                      OpBranch %180 
                                             %573 = OpLabel 
                                Private f32* %574 = OpAccessChain %165 %70 
                                         f32 %575 = OpLoad %574 
                                         f32 %577 = OpExtInst %1 37 %575 %576 
                                                      OpStore %156 %577 
                                         f32 %579 = OpLoad %156 
                                         f32 %580 = OpFDiv %578 %579 
                                                      OpStore %156 %580 
                                         f32 %581 = OpLoad %156 
                                       f32_3 %582 = OpCompositeConstruct %581 %581 %581 
                                       f32_3 %583 = OpLoad %165 
                                       f32_3 %584 = OpFMul %582 %583 
                                       f32_3 %585 = OpFAdd %584 %253 
                                       f32_4 %586 = OpLoad %364 
                                       f32_4 %587 = OpVectorShuffle %586 %585 4 5 6 3 
                                                      OpStore %364 %587 
                                       f32_3 %588 = OpLoad %165 
                                       f32_3 %589 = OpFNegate %588 
                                       f32_4 %590 = OpLoad %364 
                                       f32_3 %591 = OpVectorShuffle %590 %590 0 1 2 
                                         f32 %592 = OpDot %589 %591 
                                                      OpStore %260 %592 
                              Uniform f32_4* %593 = OpAccessChain %21 %28 
                                       f32_4 %594 = OpLoad %593 
                                       f32_3 %595 = OpVectorShuffle %594 %594 0 1 2 
                                       f32_4 %596 = OpLoad %364 
                                       f32_3 %597 = OpVectorShuffle %596 %596 0 1 2 
                                         f32 %598 = OpDot %595 %597 
                                Private f32* %599 = OpAccessChain %270 %85 
                                                      OpStore %599 %598 
                                         f32 %600 = OpLoad %260 
                                         f32 %601 = OpFNegate %600 
                                         f32 %602 = OpFAdd %601 %109 
                                                      OpStore %260 %602 
                                         f32 %603 = OpLoad %260 
                                         f32 %604 = OpFMul %603 %211 
                                         f32 %605 = OpFAdd %604 %213 
                                                      OpStore %282 %605 
                                         f32 %606 = OpLoad %260 
                                         f32 %607 = OpLoad %282 
                                         f32 %608 = OpFMul %606 %607 
                                         f32 %609 = OpFAdd %608 %218 
                                                      OpStore %282 %609 
                                         f32 %610 = OpLoad %260 
                                         f32 %611 = OpLoad %282 
                                         f32 %612 = OpFMul %610 %611 
                                         f32 %613 = OpFAdd %612 %223 
                                                      OpStore %282 %613 
                                         f32 %614 = OpLoad %260 
                                         f32 %615 = OpLoad %282 
                                         f32 %616 = OpFMul %614 %615 
                                         f32 %617 = OpFAdd %616 %228 
                                                      OpStore %260 %617 
                                         f32 %618 = OpLoad %260 
                                         f32 %619 = OpFMul %618 %231 
                                                      OpStore %260 %619 
                                         f32 %620 = OpLoad %260 
                                         f32 %621 = OpExtInst %1 29 %620 
                                                      OpStore %260 %621 
                                Private f32* %622 = OpAccessChain %270 %85 
                                         f32 %623 = OpLoad %622 
                                         f32 %624 = OpFNegate %623 
                                         f32 %625 = OpFAdd %624 %109 
                                Private f32* %626 = OpAccessChain %270 %85 
                                                      OpStore %626 %625 
                                Private f32* %627 = OpAccessChain %270 %85 
                                         f32 %628 = OpLoad %627 
                                         f32 %629 = OpFMul %628 %211 
                                         f32 %630 = OpFAdd %629 %213 
                                                      OpStore %282 %630 
                                Private f32* %631 = OpAccessChain %270 %85 
                                         f32 %632 = OpLoad %631 
                                         f32 %633 = OpLoad %282 
                                         f32 %634 = OpFMul %632 %633 
                                         f32 %635 = OpFAdd %634 %218 
                                                      OpStore %282 %635 
                                Private f32* %636 = OpAccessChain %270 %85 
                                         f32 %637 = OpLoad %636 
                                         f32 %638 = OpLoad %282 
                                         f32 %639 = OpFMul %637 %638 
                                         f32 %640 = OpFAdd %639 %223 
                                                      OpStore %282 %640 
                                Private f32* %641 = OpAccessChain %270 %85 
                                         f32 %642 = OpLoad %641 
                                         f32 %643 = OpLoad %282 
                                         f32 %644 = OpFMul %642 %643 
                                         f32 %645 = OpFAdd %644 %228 
                                Private f32* %646 = OpAccessChain %270 %85 
                                                      OpStore %646 %645 
                                Private f32* %647 = OpAccessChain %270 %85 
                                         f32 %648 = OpLoad %647 
                                         f32 %649 = OpFMul %648 %231 
                                Private f32* %650 = OpAccessChain %270 %85 
                                                      OpStore %650 %649 
                                Private f32* %651 = OpAccessChain %270 %85 
                                         f32 %652 = OpLoad %651 
                                         f32 %653 = OpExtInst %1 29 %652 
                                Private f32* %654 = OpAccessChain %270 %85 
                                                      OpStore %654 %653 
                                         f32 %655 = OpLoad %260 
                                       f32_2 %656 = OpCompositeConstruct %655 %655 
                                       f32_2 %659 = OpFMul %656 %658 
                                       f32_4 %660 = OpLoad %364 
                                       f32_4 %661 = OpVectorShuffle %660 %659 4 5 2 3 
                                                      OpStore %364 %661 
                                Private f32* %662 = OpAccessChain %270 %85 
                                         f32 %663 = OpLoad %662 
                                         f32 %664 = OpFMul %663 %345 
                                Private f32* %665 = OpAccessChain %364 %85 
                                         f32 %666 = OpLoad %665 
                                         f32 %667 = OpFAdd %664 %666 
                                                      OpStore %260 %667 
                                         f32 %668 = OpLoad %156 
                                       f32_2 %669 = OpCompositeConstruct %668 %668 
                                       f32_2 %671 = OpFMul %669 %670 
                                                      OpStore %270 %671 
                                       f32_2 %672 = OpLoad %270 
                                       f32_3 %673 = OpVectorShuffle %672 %672 0 0 0 
                                       f32_3 %674 = OpLoad %165 
                                       f32_3 %675 = OpFMul %673 %674 
                                       f32_4 %676 = OpLoad %364 
                                       f32_4 %677 = OpVectorShuffle %676 %675 4 1 5 6 
                                                      OpStore %364 %677 
                                       f32_4 %678 = OpLoad %364 
                                       f32_3 %679 = OpVectorShuffle %678 %678 0 2 3 
                                       f32_3 %680 = OpFMul %679 %250 
                                       f32_3 %681 = OpFAdd %680 %253 
                                       f32_4 %682 = OpLoad %364 
                                       f32_4 %683 = OpVectorShuffle %682 %681 4 1 5 6 
                                                      OpStore %364 %683 
                                       f32_4 %684 = OpLoad %364 
                                       f32_3 %685 = OpVectorShuffle %684 %684 0 2 3 
                                       f32_4 %686 = OpLoad %364 
                                       f32_3 %687 = OpVectorShuffle %686 %686 0 2 3 
                                         f32 %688 = OpDot %685 %687 
                                                      OpStore %156 %688 
                                         f32 %689 = OpLoad %156 
                                         f32 %690 = OpExtInst %1 31 %689 
                                                      OpStore %156 %690 
                                         f32 %691 = OpLoad %156 
                                         f32 %692 = OpFNegate %691 
                                         f32 %693 = OpFAdd %692 %109 
                                                      OpStore %156 %693 
                                         f32 %694 = OpLoad %156 
                                         f32 %695 = OpFMul %694 %265 
                                                      OpStore %156 %695 
                                         f32 %696 = OpLoad %156 
                                         f32 %697 = OpExtInst %1 29 %696 
                                                      OpStore %156 %697 
                                         f32 %698 = OpLoad %156 
                                         f32 %699 = OpLoad %260 
                                         f32 %700 = OpFMul %698 %699 
                                Private f32* %701 = OpAccessChain %364 %70 
                                         f32 %702 = OpLoad %701 
                                         f32 %703 = OpFNegate %702 
                                         f32 %704 = OpFAdd %700 %703 
                                                      OpStore %260 %704 
                                         f32 %705 = OpLoad %260 
                                         f32 %706 = OpExtInst %1 40 %705 %176 
                                                      OpStore %260 %706 
                                         f32 %707 = OpLoad %260 
                                         f32 %708 = OpExtInst %1 37 %707 %362 
                                                      OpStore %260 %708 
                                       f32_4 %709 = OpLoad %44 
                                       f32_3 %710 = OpVectorShuffle %709 %709 0 1 2 
                                       f32_4 %711 = OpLoad %50 
                                       f32_3 %712 = OpVectorShuffle %711 %711 1 1 1 
                                       f32_3 %713 = OpFMul %710 %712 
                                       f32_3 %714 = OpFAdd %713 %371 
                                       f32_4 %715 = OpLoad %364 
                                       f32_4 %716 = OpVectorShuffle %715 %714 4 5 6 3 
                                                      OpStore %364 %716 
                                         f32 %717 = OpLoad %260 
                                       f32_3 %718 = OpCompositeConstruct %717 %717 %717 
                                       f32_3 %719 = OpFNegate %718 
                                       f32_4 %720 = OpLoad %364 
                                       f32_3 %721 = OpVectorShuffle %720 %720 0 1 2 
                                       f32_3 %722 = OpFMul %719 %721 
                                       f32_4 %723 = OpLoad %364 
                                       f32_4 %724 = OpVectorShuffle %723 %722 4 5 6 3 
                                                      OpStore %364 %724 
                                       f32_4 %725 = OpLoad %364 
                                       f32_3 %726 = OpVectorShuffle %725 %725 0 1 2 
                                       f32_3 %727 = OpFMul %726 %383 
                                       f32_4 %728 = OpLoad %364 
                                       f32_4 %729 = OpVectorShuffle %728 %727 4 5 6 3 
                                                      OpStore %364 %729 
                                       f32_4 %730 = OpLoad %364 
                                       f32_3 %731 = OpVectorShuffle %730 %730 0 1 2 
                                       f32_3 %732 = OpExtInst %1 29 %731 
                                       f32_4 %733 = OpLoad %9 
                                       f32_4 %734 = OpVectorShuffle %733 %732 4 5 6 3 
                                                      OpStore %9 %734 
                                Private f32* %735 = OpAccessChain %270 %70 
                                         f32 %736 = OpLoad %735 
                                         f32 %737 = OpLoad %156 
                                         f32 %738 = OpFMul %736 %737 
                                                      OpStore %156 %738 
                                         f32 %740 = OpLoad %156 
                                       f32_3 %741 = OpCompositeConstruct %740 %740 %740 
                                       f32_4 %742 = OpLoad %9 
                                       f32_3 %743 = OpVectorShuffle %742 %742 0 1 2 
                                       f32_3 %744 = OpFMul %741 %743 
                                                      OpStore %739 %744 
                                       f32_4 %745 = OpLoad %44 
                                       f32_3 %746 = OpVectorShuffle %745 %745 0 1 2 
                                       f32_4 %747 = OpLoad %50 
                                       f32_3 %748 = OpVectorShuffle %747 %747 0 0 0 
                                       f32_3 %749 = OpFMul %746 %748 
                                       f32_3 %750 = OpFAdd %749 %569 
                                       f32_4 %751 = OpLoad %44 
                                       f32_4 %752 = OpVectorShuffle %751 %750 4 5 6 3 
                                                      OpStore %44 %752 
                                       f32_4 %753 = OpLoad %44 
                                       f32_3 %754 = OpVectorShuffle %753 %753 0 1 2 
                                       f32_3 %755 = OpLoad %739 
                                       f32_3 %756 = OpFMul %754 %755 
                                                      OpStore %244 %756 
                                                      OpBranch %180 
                                             %180 = OpLabel 
                                Uniform f32* %758 = OpAccessChain %21 %757 %85 
                                         f32 %759 = OpLoad %758 
                                Uniform f32* %760 = OpAccessChain %21 %757 %70 
                                         f32 %761 = OpLoad %760 
                                Uniform f32* %762 = OpAccessChain %21 %757 %91 
                                         f32 %763 = OpLoad %762 
                                       f32_3 %764 = OpCompositeConstruct %759 %761 %763 
                                       f32_4 %765 = OpLoad %9 
                                       f32_3 %766 = OpVectorShuffle %765 %765 0 1 2 
                                       f32_3 %767 = OpFMul %764 %766 
                                       f32_3 %768 = OpLoad %244 
                                       f32_3 %769 = OpFAdd %767 %768 
                                       f32_4 %770 = OpLoad %44 
                                       f32_4 %771 = OpVectorShuffle %770 %769 4 5 6 3 
                                                      OpStore %44 %771 
                                       f32_4 %774 = OpLoad %44 
                                       f32_3 %775 = OpVectorShuffle %774 %774 0 1 2 
                                Uniform f32* %777 = OpAccessChain %21 %776 
                                         f32 %778 = OpLoad %777 
                                       f32_3 %779 = OpCompositeConstruct %778 %778 %778 
                                       f32_3 %780 = OpFMul %775 %779 
                                                      OpStore vs_TEXCOORD1 %780 
                              Uniform f32_4* %781 = OpAccessChain %21 %28 
                                       f32_4 %782 = OpLoad %781 
                                       f32_3 %783 = OpVectorShuffle %782 %782 0 1 2 
                                       f32_3 %784 = OpLoad %165 
                                       f32_3 %785 = OpFNegate %784 
                                         f32 %786 = OpDot %783 %785 
                                                      OpStore %156 %786 
                                         f32 %787 = OpLoad %156 
                                         f32 %788 = OpLoad %156 
                                         f32 %789 = OpFMul %787 %788 
                                                      OpStore %156 %789 
                                         f32 %790 = OpLoad %156 
                                         f32 %792 = OpFMul %790 %791 
                                         f32 %793 = OpFAdd %792 %791 
                                                      OpStore %156 %793 
                                         f32 %794 = OpLoad %156 
                                       f32_3 %795 = OpCompositeConstruct %794 %794 %794 
                                       f32_3 %796 = OpLoad %244 
                                       f32_3 %797 = OpFMul %795 %796 
                                       f32_4 %798 = OpLoad %44 
                                       f32_4 %799 = OpVectorShuffle %798 %797 4 5 6 3 
                                                      OpStore %44 %799 
                                       f32_4 %801 = OpLoad %44 
                                       f32_3 %802 = OpVectorShuffle %801 %801 0 1 2 
                                Uniform f32* %803 = OpAccessChain %21 %776 
                                         f32 %804 = OpLoad %803 
                                       f32_3 %805 = OpCompositeConstruct %804 %804 %804 
                                       f32_3 %806 = OpFMul %802 %805 
                                                      OpStore vs_TEXCOORD2 %806 
                              Uniform f32_4* %807 = OpAccessChain %21 %46 
                                       f32_4 %808 = OpLoad %807 
                                       f32_3 %809 = OpVectorShuffle %808 %808 0 1 2 
                              Uniform f32_4* %810 = OpAccessChain %21 %46 
                                       f32_4 %811 = OpLoad %810 
                                       f32_3 %812 = OpVectorShuffle %811 %811 0 1 2 
                                         f32 %813 = OpDot %809 %812 
                                                      OpStore %156 %813 
                                         f32 %814 = OpLoad %156 
                                         f32 %815 = OpExtInst %1 31 %814 
                                                      OpStore %156 %815 
                                         f32 %816 = OpLoad %156 
                                         f32 %817 = OpExtInst %1 40 %816 %345 
                                                      OpStore %156 %817 
                                         f32 %818 = OpLoad %156 
                                         f32 %819 = OpExtInst %1 37 %818 %109 
                                                      OpStore %156 %819 
                                       f32_4 %820 = OpLoad %9 
                                       f32_3 %821 = OpVectorShuffle %820 %820 0 1 2 
                                       f32_3 %824 = OpFMul %821 %823 
                                       f32_4 %825 = OpLoad %9 
                                       f32_4 %826 = OpVectorShuffle %825 %824 4 5 6 3 
                                                      OpStore %9 %826 
                                       f32_4 %827 = OpLoad %9 
                                       f32_3 %828 = OpVectorShuffle %827 %827 0 1 2 
                                       f32_3 %829 = OpCompositeConstruct %176 %176 %176 
                                       f32_3 %830 = OpCompositeConstruct %109 %109 %109 
                                       f32_3 %831 = OpExtInst %1 43 %828 %829 %830 
                                       f32_4 %832 = OpLoad %9 
                                       f32_4 %833 = OpVectorShuffle %832 %831 4 5 6 3 
                                                      OpStore %9 %833 
                                       f32_4 %834 = OpLoad %9 
                                       f32_3 %835 = OpVectorShuffle %834 %834 0 1 2 
                              Uniform f32_4* %836 = OpAccessChain %21 %46 
                                       f32_4 %837 = OpLoad %836 
                                       f32_3 %838 = OpVectorShuffle %837 %837 0 1 2 
                                       f32_3 %839 = OpFMul %835 %838 
                                       f32_4 %840 = OpLoad %9 
                                       f32_4 %841 = OpVectorShuffle %840 %839 4 5 6 3 
                                                      OpStore %9 %841 
                                       f32_4 %842 = OpLoad %9 
                                       f32_3 %843 = OpVectorShuffle %842 %842 0 1 2 
                                       f32_3 %846 = OpFMul %843 %845 
                                       f32_4 %847 = OpLoad %9 
                                       f32_4 %848 = OpVectorShuffle %847 %846 4 5 6 3 
                                                      OpStore %9 %848 
                                       f32_4 %850 = OpLoad %9 
                                       f32_3 %851 = OpVectorShuffle %850 %850 0 1 2 
                                         f32 %852 = OpLoad %156 
                                       f32_3 %853 = OpCompositeConstruct %852 %852 %852 
                                       f32_3 %854 = OpFDiv %851 %853 
                                                      OpStore vs_TEXCOORD3 %854 
                                       f32_3 %856 = OpLoad %165 
                                       f32_3 %857 = OpFNegate %856 
                                                      OpStore vs_TEXCOORD0 %857 
                                 Output f32* %859 = OpAccessChain %74 %28 %70 
                                         f32 %860 = OpLoad %859 
                                         f32 %861 = OpFNegate %860 
                                 Output f32* %862 = OpAccessChain %74 %28 %70 
                                                      OpStore %862 %861 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 135
; Schema: 0
                                      OpCapability Shader 
                               %1 = OpExtInstImport "GLSL.std.450" 
                                      OpMemoryModel Logical GLSL450 
                                      OpEntryPoint Fragment %4 "main" %11 %93 %95 %105 %119 
                                      OpExecutionMode %4 OriginUpperLeft 
                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                      OpDecorate vs_TEXCOORD0 Location 11 
                                      OpMemberDecorate %14 0 Offset 14 
                                      OpMemberDecorate %14 1 Offset 14 
                                      OpDecorate %14 Block 
                                      OpDecorate %16 DescriptorSet 16 
                                      OpDecorate %16 Binding 16 
                                      OpDecorate vs_TEXCOORD1 Location 93 
                                      OpDecorate vs_TEXCOORD2 Location 95 
                                      OpDecorate vs_TEXCOORD3 Location 105 
                                      OpDecorate %119 Location 119 
                               %2 = OpTypeVoid 
                               %3 = OpTypeFunction %2 
                               %6 = OpTypeFloat 32 
                               %7 = OpTypeVector %6 3 
                               %8 = OpTypePointer Private %7 
                Private f32_3* %9 = OpVariable Private 
                              %10 = OpTypePointer Input %7 
        Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                              %13 = OpTypeVector %6 4 
                              %14 = OpTypeStruct %13 %6 
                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4; f32;}* %16 = OpVariable Uniform 
                              %17 = OpTypeInt 32 1 
                          i32 %18 = OpConstant 0 
                              %19 = OpTypePointer Uniform %13 
                              %27 = OpTypeInt 32 0 
                          u32 %28 = OpConstant 0 
                              %29 = OpTypePointer Private %6 
               Private f32_3* %35 = OpVariable Private 
                          f32 %36 = OpConstant 3.674022E-40 
                          i32 %37 = OpConstant 1 
                              %38 = OpTypePointer Uniform %6 
                          f32 %51 = OpConstant 3.674022E-40 
                          f32 %56 = OpConstant 3.674022E-40 
                          f32 %58 = OpConstant 3.674022E-40 
                          u32 %81 = OpConstant 1 
                              %82 = OpTypePointer Input %6 
                          f32 %85 = OpConstant 3.674022E-40 
               Private f32_3* %92 = OpVariable Private 
        Input f32_3* vs_TEXCOORD1 = OpVariable Input 
        Input f32_3* vs_TEXCOORD2 = OpVariable Input 
        Input f32_3* vs_TEXCOORD3 = OpVariable Input 
                             %112 = OpTypeBool 
                             %113 = OpTypePointer Private %112 
               Private bool* %114 = OpVariable Private 
                             %118 = OpTypePointer Output %13 
               Output f32_4* %119 = OpVariable Output 
                             %121 = OpTypePointer Function %7 
                         u32 %131 = OpConstant 3 
                             %132 = OpTypePointer Output %6 
                          void %4 = OpFunction None %3 
                               %5 = OpLabel 
             Function f32_3* %122 = OpVariable Function 
                        f32_3 %12 = OpLoad vs_TEXCOORD0 
               Uniform f32_4* %20 = OpAccessChain %16 %18 
                        f32_4 %21 = OpLoad %20 
                        f32_3 %22 = OpVectorShuffle %21 %21 0 1 2 
                        f32_3 %23 = OpFAdd %12 %22 
                                      OpStore %9 %23 
                        f32_3 %24 = OpLoad %9 
                        f32_3 %25 = OpLoad %9 
                          f32 %26 = OpDot %24 %25 
                 Private f32* %30 = OpAccessChain %9 %28 
                                      OpStore %30 %26 
                 Private f32* %31 = OpAccessChain %9 %28 
                          f32 %32 = OpLoad %31 
                          f32 %33 = OpExtInst %1 31 %32 
                 Private f32* %34 = OpAccessChain %9 %28 
                                      OpStore %34 %33 
                 Uniform f32* %39 = OpAccessChain %16 %37 
                          f32 %40 = OpLoad %39 
                          f32 %41 = OpFDiv %36 %40 
                 Private f32* %42 = OpAccessChain %35 %28 
                                      OpStore %42 %41 
                 Private f32* %43 = OpAccessChain %35 %28 
                          f32 %44 = OpLoad %43 
                 Private f32* %45 = OpAccessChain %9 %28 
                          f32 %46 = OpLoad %45 
                          f32 %47 = OpFMul %44 %46 
                 Private f32* %48 = OpAccessChain %9 %28 
                                      OpStore %48 %47 
                 Private f32* %49 = OpAccessChain %9 %28 
                          f32 %50 = OpLoad %49 
                          f32 %52 = OpExtInst %1 43 %50 %51 %36 
                 Private f32* %53 = OpAccessChain %9 %28 
                                      OpStore %53 %52 
                 Private f32* %54 = OpAccessChain %9 %28 
                          f32 %55 = OpLoad %54 
                          f32 %57 = OpFMul %55 %56 
                          f32 %59 = OpFAdd %57 %58 
                 Private f32* %60 = OpAccessChain %35 %28 
                                      OpStore %60 %59 
                 Private f32* %61 = OpAccessChain %9 %28 
                          f32 %62 = OpLoad %61 
                 Private f32* %63 = OpAccessChain %9 %28 
                          f32 %64 = OpLoad %63 
                          f32 %65 = OpFMul %62 %64 
                 Private f32* %66 = OpAccessChain %9 %28 
                                      OpStore %66 %65 
                 Private f32* %67 = OpAccessChain %35 %28 
                          f32 %68 = OpLoad %67 
                          f32 %69 = OpFNegate %68 
                 Private f32* %70 = OpAccessChain %9 %28 
                          f32 %71 = OpLoad %70 
                          f32 %72 = OpFMul %69 %71 
                          f32 %73 = OpFAdd %72 %36 
                 Private f32* %74 = OpAccessChain %9 %28 
                                      OpStore %74 %73 
                 Private f32* %75 = OpAccessChain %9 %28 
                          f32 %76 = OpLoad %75 
                 Private f32* %77 = OpAccessChain %9 %28 
                          f32 %78 = OpLoad %77 
                          f32 %79 = OpFMul %76 %78 
                 Private f32* %80 = OpAccessChain %9 %28 
                                      OpStore %80 %79 
                   Input f32* %83 = OpAccessChain vs_TEXCOORD0 %81 
                          f32 %84 = OpLoad %83 
                          f32 %86 = OpFMul %84 %85 
                 Private f32* %87 = OpAccessChain %35 %28 
                                      OpStore %87 %86 
                 Private f32* %88 = OpAccessChain %35 %28 
                          f32 %89 = OpLoad %88 
                          f32 %90 = OpExtInst %1 43 %89 %51 %36 
                 Private f32* %91 = OpAccessChain %35 %28 
                                      OpStore %91 %90 
                        f32_3 %94 = OpLoad vs_TEXCOORD1 
                        f32_3 %96 = OpLoad vs_TEXCOORD2 
                        f32_3 %97 = OpFNegate %96 
                        f32_3 %98 = OpFAdd %94 %97 
                                      OpStore %92 %98 
                        f32_3 %99 = OpLoad %35 
                       f32_3 %100 = OpVectorShuffle %99 %99 0 0 0 
                       f32_3 %101 = OpLoad %92 
                       f32_3 %102 = OpFMul %100 %101 
                       f32_3 %103 = OpLoad vs_TEXCOORD2 
                       f32_3 %104 = OpFAdd %102 %103 
                                      OpStore %35 %104 
                       f32_3 %106 = OpLoad vs_TEXCOORD3 
                       f32_3 %107 = OpLoad %9 
                       f32_3 %108 = OpVectorShuffle %107 %107 0 0 0 
                       f32_3 %109 = OpFMul %106 %108 
                       f32_3 %110 = OpLoad %35 
                       f32_3 %111 = OpFAdd %109 %110 
                                      OpStore %92 %111 
                  Input f32* %115 = OpAccessChain vs_TEXCOORD0 %81 
                         f32 %116 = OpLoad %115 
                        bool %117 = OpFOrdLessThan %116 %51 
                                      OpStore %114 %117 
                        bool %120 = OpLoad %114 
                                      OpSelectionMerge %124 None 
                                      OpBranchConditional %120 %123 %126 
                             %123 = OpLabel 
                       f32_3 %125 = OpLoad %92 
                                      OpStore %122 %125 
                                      OpBranch %124 
                             %126 = OpLabel 
                       f32_3 %127 = OpLoad %35 
                                      OpStore %122 %127 
                                      OpBranch %124 
                             %124 = OpLabel 
                       f32_3 %128 = OpLoad %122 
                       f32_4 %129 = OpLoad %119 
                       f32_4 %130 = OpVectorShuffle %129 %128 4 5 6 3 
                                      OpStore %119 %130 
                 Output f32* %133 = OpAccessChain %119 %131 
                                      OpStore %133 %36 
                                      OpReturn
                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Local Keywords { "_SUNDISK_HIGH_QUALITY" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "_SUNDISK_HIGH_QUALITY" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _LightColor0;
uniform 	float _Exposure;
uniform 	vec3 _GroundColor;
uniform 	vec3 _SkyTint;
uniform 	float _AtmosphereThickness;
in  vec4 in_POSITION0;
out vec3 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
vec3 u_xlat9;
float u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
float u_xlat23;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = log2(vec4(_SkyTint.x, _SkyTint.y, _SkyTint.z, _AtmosphereThickness));
    u_xlat1 = u_xlat1 * vec4(0.454545468, 0.454545468, 0.454545468, 2.5);
    u_xlat1 = exp2(u_xlat1);
    u_xlat1.xyz = (-u_xlat1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.300000012, 0.300000042, 0.300000012) + vec3(0.5, 0.419999987, 0.324999988);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = vec3(1.0, 1.0, 1.0) / u_xlat1.xyz;
    u_xlat2.xy = u_xlat1.ww * vec2(0.049999997, 0.0314159282);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlatb0 = u_xlat3.y>=0.0;
    if(u_xlatb0){
        u_xlat0.x = u_xlat3.y * u_xlat3.y + 0.0506249666;
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat0.x = (-u_xlat0.y) * u_xlat21 + u_xlat0.x;
        u_xlat7 = (-u_xlat3.y) * 1.0 + 1.0;
        u_xlat14 = u_xlat7 * 5.25 + -6.80000019;
        u_xlat14 = u_xlat7 * u_xlat14 + 3.82999992;
        u_xlat14 = u_xlat7 * u_xlat14 + 0.458999991;
        u_xlat7 = u_xlat7 * u_xlat14 + -0.00286999997;
        u_xlat7 = u_xlat7 * 1.44269502;
        u_xlat0.y = exp2(u_xlat7);
        u_xlat0.xyz = u_xlat0.xyx * vec3(0.5, 0.246031836, 20.0);
        u_xlat4.xyz = u_xlat0.xxx * u_xlat3.xyz;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0, 1.00010002, 0.0);
        u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat21 = sqrt(u_xlat21);
        u_xlat22 = (-u_xlat21) + 1.0;
        u_xlat22 = u_xlat22 * 230.831207;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = dot(_WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat16.x = u_xlat16.x / u_xlat21;
        u_xlat23 = dot(u_xlat3.xyz, u_xlat4.xyz);
        u_xlat21 = u_xlat23 / u_xlat21;
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = u_xlat16.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat16.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat16.x * u_xlat23 + 0.458999991;
        u_xlat16.x = u_xlat16.x * u_xlat23 + -0.00286999997;
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat21 = (-u_xlat21) + 1.0;
        u_xlat23 = u_xlat21 * 5.25 + -6.80000019;
        u_xlat23 = u_xlat21 * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat21 * u_xlat23 + 0.458999991;
        u_xlat21 = u_xlat21 * u_xlat23 + -0.00286999997;
        u_xlat21 = u_xlat21 * 1.44269502;
        u_xlat21 = exp2(u_xlat21);
        u_xlat21 = u_xlat21 * 0.25;
        u_xlat21 = u_xlat16.x * 0.25 + (-u_xlat21);
        u_xlat21 = u_xlat22 * u_xlat21 + u_xlat0.y;
        u_xlat21 = max(u_xlat21, 0.0);
        u_xlat21 = min(u_xlat21, 50.0);
        u_xlat5.xyz = u_xlat1.xyz * u_xlat2.yyy + vec3(0.0125663709, 0.0125663709, 0.0125663709);
        u_xlat6.xyz = (-vec3(u_xlat21)) * u_xlat5.xyz;
        u_xlat6.xyz = u_xlat6.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat6.xyz = exp2(u_xlat6.xyz);
        u_xlat21 = u_xlat0.z * u_xlat22;
        u_xlat4.xyz = u_xlat3.xyz * u_xlat0.xxx + u_xlat4.xyz;
        u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat22 = (-u_xlat0.x) + 1.0;
        u_xlat22 = u_xlat22 * 230.831207;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = dot(_WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat16.x = u_xlat16.x / u_xlat0.x;
        u_xlat23 = dot(u_xlat3.xyz, u_xlat4.xyz);
        u_xlat0.x = u_xlat23 / u_xlat0.x;
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = u_xlat16.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat16.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat16.x * u_xlat23 + 0.458999991;
        u_xlat16.x = u_xlat16.x * u_xlat23 + -0.00286999997;
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat23 = u_xlat0.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat0.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat0.x * u_xlat23 + 0.458999991;
        u_xlat0.x = u_xlat0.x * u_xlat23 + -0.00286999997;
        u_xlat0.x = u_xlat0.x * 1.44269502;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * 0.25;
        u_xlat0.x = u_xlat16.x * 0.25 + (-u_xlat0.x);
        u_xlat0.x = u_xlat22 * u_xlat0.x + u_xlat0.y;
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat0.x = min(u_xlat0.x, 50.0);
        u_xlat4.xyz = u_xlat5.xyz * (-u_xlat0.xxx);
        u_xlat4.xyz = u_xlat4.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat4.xyz = exp2(u_xlat4.xyz);
        u_xlat0.x = u_xlat0.z * u_xlat22;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat6.xyz * vec3(u_xlat21) + u_xlat0.xyz;
        u_xlat4.xyz = u_xlat1.xyz * u_xlat2.xxx;
        u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat0.xyz * vec3(0.0199999996, 0.0199999996, 0.0199999996);
    } else {
        u_xlat21 = min(u_xlat3.y, -0.00100000005);
        u_xlat21 = -9.99999975e-05 / u_xlat21;
        u_xlat5.xyz = vec3(u_xlat21) * u_xlat3.xyz + vec3(0.0, 1.00010002, 0.0);
        u_xlat22 = dot((-u_xlat3.xyz), u_xlat5.xyz);
        u_xlat16.x = dot(_WorldSpaceLightPos0.xyz, u_xlat5.xyz);
        u_xlat22 = (-u_xlat22) + 1.0;
        u_xlat23 = u_xlat22 * 5.25 + -6.80000019;
        u_xlat23 = u_xlat22 * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat22 * u_xlat23 + 0.458999991;
        u_xlat22 = u_xlat22 * u_xlat23 + -0.00286999997;
        u_xlat22 = u_xlat22 * 1.44269502;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = u_xlat16.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat16.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat16.x * u_xlat23 + 0.458999991;
        u_xlat16.x = u_xlat16.x * u_xlat23 + -0.00286999997;
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat5.xy = vec2(u_xlat22) * vec2(0.25, 0.249900013);
        u_xlat22 = u_xlat16.x * 0.25 + u_xlat5.x;
        u_xlat16.xy = vec2(u_xlat21) * vec2(0.5, 20.0);
        u_xlat5.xzw = u_xlat16.xxx * u_xlat3.xyz;
        u_xlat5.xzw = u_xlat5.xzw * vec3(0.5, 0.5, 0.5) + vec3(0.0, 1.00010002, 0.0);
        u_xlat21 = dot(u_xlat5.xzw, u_xlat5.xzw);
        u_xlat21 = sqrt(u_xlat21);
        u_xlat21 = (-u_xlat21) + 1.0;
        u_xlat21 = u_xlat21 * 230.831207;
        u_xlat21 = exp2(u_xlat21);
        u_xlat22 = u_xlat21 * u_xlat22 + (-u_xlat5.y);
        u_xlat22 = max(u_xlat22, 0.0);
        u_xlat22 = min(u_xlat22, 50.0);
        u_xlat5.xyz = u_xlat1.xyz * u_xlat2.yyy + vec3(0.0125663709, 0.0125663709, 0.0125663709);
        u_xlat5.xyz = (-vec3(u_xlat22)) * u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat0.xyz = exp2(u_xlat5.xyz);
        u_xlat21 = u_xlat16.y * u_xlat21;
        u_xlat9.xyz = vec3(u_xlat21) * u_xlat0.xyz;
        u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx + vec3(0.0199999996, 0.0199999996, 0.0199999996);
        u_xlat4.xyz = u_xlat1.xyz * u_xlat9.xyz;
    }
    u_xlat1.xyz = vec3(_GroundColor.x, _GroundColor.y, _GroundColor.z) * u_xlat0.xyz + u_xlat4.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz * vec3(_Exposure);
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, (-u_xlat3.xyz));
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * 0.75 + 0.75;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz * vec3(_Exposure);
    u_xlat21 = dot(_LightColor0.xyz, _LightColor0.xyz);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = max(u_xlat21, 0.25);
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat0.xyz = u_xlat0.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(15.0, 15.0, 15.0);
    vs_TEXCOORD3.xyz = u_xlat0.xyz / vec3(u_xlat21);
    vs_TEXCOORD0.xyz = (-u_xlat3.xyz);
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	float _SunSize;
uniform 	float _SunSizeConvergence;
in  vec3 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
bool u_xlatb4;
float u_xlat6;
void main()
{
    u_xlat0.x = log2(_SunSize);
    u_xlat0.x = u_xlat0.x * 0.649999976;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat2.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD0.xyz;
    u_xlat2.x = dot(_WorldSpaceLightPos0.xyz, (-u_xlat2.xyz));
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _SunSizeConvergence;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat6 = (-u_xlat2.x) * 1.98000002 + 1.98010004;
    u_xlat0.y = u_xlat2.x * u_xlat2.x + 1.0;
    u_xlat0.xy = u_xlat0.xy * vec2(10.0, 0.0100164423);
    u_xlat6 = log2(u_xlat6);
    u_xlat0.x = u_xlat6 * u_xlat0.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 9.99999975e-05);
    u_xlat0.x = u_xlat0.y / u_xlat0.x;
    u_xlat2.x = u_xlat2.y * 50.0;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlatb4 = u_xlat2.y<0.0;
    u_xlat1.xyz = vs_TEXCOORD1.xyz + (-vs_TEXCOORD2.xyz);
    u_xlat1.xyz = u_xlat2.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    SV_Target0.xyz = (bool(u_xlatb4)) ? u_xlat0.xyw : u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Local Keywords { "_SUNDISK_HIGH_QUALITY" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 860
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %772 %799 %845 %851 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate vs_TEXCOORD1 Location 772 
                                                      OpDecorate vs_TEXCOORD2 Location 799 
                                                      OpDecorate vs_TEXCOORD3 Location 845 
                                                      OpDecorate vs_TEXCOORD0 Location 851 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeVector %6 3 
                                              %19 = OpTypeStruct %7 %16 %17 %7 %6 %18 %18 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32; f32_3; f32_3; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                          i32 %84 = OpConstant 6 
                                          u32 %85 = OpConstant 0 
                                              %86 = OpTypePointer Uniform %6 
                                          u32 %91 = OpConstant 2 
                                          i32 %94 = OpConstant 7 
                                         f32 %100 = OpConstant 3.674022E-40 
                                         f32 %101 = OpConstant 3.674022E-40 
                                       f32_4 %102 = OpConstantComposite %100 %100 %100 %101 
                                         f32 %109 = OpConstant 3.674022E-40 
                                       f32_3 %110 = OpConstantComposite %109 %109 %109 
                                         f32 %116 = OpConstant 3.674022E-40 
                                         f32 %117 = OpConstant 3.674022E-40 
                                       f32_3 %118 = OpConstantComposite %116 %117 %116 
                                         f32 %120 = OpConstant 3.674022E-40 
                                         f32 %121 = OpConstant 3.674022E-40 
                                         f32 %122 = OpConstant 3.674022E-40 
                                       f32_3 %123 = OpConstantComposite %120 %121 %122 
                                             %146 = OpTypeVector %6 2 
                                         f32 %149 = OpConstant 3.674022E-40 
                                         f32 %150 = OpConstant 3.674022E-40 
                                       f32_2 %151 = OpConstantComposite %149 %150 
                                             %155 = OpTypePointer Private %6 
                                Private f32* %156 = OpVariable Private 
                                             %164 = OpTypePointer Private %18 
                              Private f32_3* %165 = OpVariable Private 
                                             %171 = OpTypeBool 
                                             %172 = OpTypePointer Private %171 
                               Private bool* %173 = OpVariable Private 
                                         f32 %176 = OpConstant 3.674022E-40 
                                         f32 %186 = OpConstant 3.674022E-40 
                                Private f32* %202 = OpVariable Private 
                                Private f32* %208 = OpVariable Private 
                                         f32 %210 = OpConstant 3.674022E-40 
                                         f32 %212 = OpConstant 3.674022E-40 
                                         f32 %217 = OpConstant 3.674022E-40 
                                         f32 %222 = OpConstant 3.674022E-40 
                                         f32 %227 = OpConstant 3.674022E-40 
                                         f32 %230 = OpConstant 3.674022E-40 
                                         f32 %237 = OpConstant 3.674022E-40 
                                         f32 %238 = OpConstant 3.674022E-40 
                                       f32_3 %239 = OpConstantComposite %120 %237 %238 
                              Private f32_3* %243 = OpVariable Private 
                                       f32_3 %249 = OpConstantComposite %120 %120 %120 
                                         f32 %251 = OpConstant 3.674022E-40 
                                       f32_3 %252 = OpConstantComposite %176 %251 %176 
                                Private f32* %259 = OpVariable Private 
                                         f32 %264 = OpConstant 3.674022E-40 
                                             %268 = OpTypePointer Private %146 
                              Private f32_2* %269 = OpVariable Private 
                                Private f32* %281 = OpVariable Private 
                                         f32 %344 = OpConstant 3.674022E-40 
                                         f32 %361 = OpConstant 3.674022E-40 
                              Private f32_4* %363 = OpVariable Private 
                                         f32 %369 = OpConstant 3.674022E-40 
                                       f32_3 %370 = OpConstantComposite %369 %369 %369 
                              Private f32_3* %374 = OpVariable Private 
                                       f32_3 %382 = OpConstantComposite %230 %230 %230 
                                         f32 %567 = OpConstant 3.674022E-40 
                                       f32_3 %568 = OpConstantComposite %567 %567 %567 
                                         f32 %575 = OpConstant 3.674022E-40 
                                         f32 %577 = OpConstant 3.674022E-40 
                                         f32 %656 = OpConstant 3.674022E-40 
                                       f32_2 %657 = OpConstantComposite %344 %656 
                                       f32_2 %669 = OpConstantComposite %120 %238 
                              Private f32_3* %738 = OpVariable Private 
                                         i32 %756 = OpConstant 5 
                                             %771 = OpTypePointer Output %18 
                       Output f32_3* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %775 = OpConstant 4 
                                         f32 %790 = OpConstant 3.674022E-40 
                       Output f32_3* vs_TEXCOORD2 = OpVariable Output 
                                         f32 %840 = OpConstant 3.674022E-40 
                                       f32_3 %841 = OpConstantComposite %840 %840 %840 
                       Output f32_3* vs_TEXCOORD3 = OpVariable Output 
                       Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                             %854 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                                        f32_4 %51 = OpLoad %44 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %21 %36 %23 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %21 %36 %28 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %36 %36 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %21 %36 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %44 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %28 
                                                      OpStore %83 %81 
                                 Uniform f32* %87 = OpAccessChain %21 %84 %85 
                                          f32 %88 = OpLoad %87 
                                 Uniform f32* %89 = OpAccessChain %21 %84 %70 
                                          f32 %90 = OpLoad %89 
                                 Uniform f32* %92 = OpAccessChain %21 %84 %91 
                                          f32 %93 = OpLoad %92 
                                 Uniform f32* %95 = OpAccessChain %21 %94 
                                          f32 %96 = OpLoad %95 
                                        f32_4 %97 = OpCompositeConstruct %88 %90 %93 %96 
                                        f32_4 %98 = OpExtInst %1 30 %97 
                                                      OpStore %44 %98 
                                        f32_4 %99 = OpLoad %44 
                                       f32_4 %103 = OpFMul %99 %102 
                                                      OpStore %44 %103 
                                       f32_4 %104 = OpLoad %44 
                                       f32_4 %105 = OpExtInst %1 29 %104 
                                                      OpStore %44 %105 
                                       f32_4 %106 = OpLoad %44 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                       f32_3 %108 = OpFNegate %107 
                                       f32_3 %111 = OpFAdd %108 %110 
                                       f32_4 %112 = OpLoad %44 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %44 %113 
                                       f32_4 %114 = OpLoad %44 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %119 = OpFMul %115 %118 
                                       f32_3 %124 = OpFAdd %119 %123 
                                       f32_4 %125 = OpLoad %44 
                                       f32_4 %126 = OpVectorShuffle %125 %124 4 5 6 3 
                                                      OpStore %44 %126 
                                       f32_4 %127 = OpLoad %44 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                       f32_4 %129 = OpLoad %44 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32_3 %131 = OpFMul %128 %130 
                                       f32_4 %132 = OpLoad %44 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
                                                      OpStore %44 %133 
                                       f32_4 %134 = OpLoad %44 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                       f32_4 %136 = OpLoad %44 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_3 %138 = OpFMul %135 %137 
                                       f32_4 %139 = OpLoad %44 
                                       f32_4 %140 = OpVectorShuffle %139 %138 4 5 6 3 
                                                      OpStore %44 %140 
                                       f32_4 %141 = OpLoad %44 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFDiv %110 %142 
                                       f32_4 %144 = OpLoad %44 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 6 3 
                                                      OpStore %44 %145 
                                       f32_4 %147 = OpLoad %44 
                                       f32_2 %148 = OpVectorShuffle %147 %147 3 3 
                                       f32_2 %152 = OpFMul %148 %151 
                                       f32_4 %153 = OpLoad %50 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 2 3 
                                                      OpStore %50 %154 
                                       f32_4 %157 = OpLoad %9 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                       f32_4 %159 = OpLoad %9 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                         f32 %161 = OpDot %158 %160 
                                                      OpStore %156 %161 
                                         f32 %162 = OpLoad %156 
                                         f32 %163 = OpExtInst %1 32 %162 
                                                      OpStore %156 %163 
                                         f32 %166 = OpLoad %156 
                                       f32_3 %167 = OpCompositeConstruct %166 %166 %166 
                                       f32_4 %168 = OpLoad %9 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_3 %170 = OpFMul %167 %169 
                                                      OpStore %165 %170 
                                Private f32* %174 = OpAccessChain %165 %70 
                                         f32 %175 = OpLoad %174 
                                        bool %177 = OpFOrdGreaterThanEqual %175 %176 
                                                      OpStore %173 %177 
                                        bool %178 = OpLoad %173 
                                                      OpSelectionMerge %180 None 
                                                      OpBranchConditional %178 %179 %572 
                                             %179 = OpLabel 
                                Private f32* %181 = OpAccessChain %165 %70 
                                         f32 %182 = OpLoad %181 
                                Private f32* %183 = OpAccessChain %165 %70 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFMul %182 %184 
                                         f32 %187 = OpFAdd %185 %186 
                                Private f32* %188 = OpAccessChain %9 %85 
                                                      OpStore %188 %187 
                                Private f32* %189 = OpAccessChain %9 %85 
                                         f32 %190 = OpLoad %189 
                                         f32 %191 = OpExtInst %1 31 %190 
                                Private f32* %192 = OpAccessChain %9 %85 
                                                      OpStore %192 %191 
                                Private f32* %193 = OpAccessChain %9 %70 
                                         f32 %194 = OpLoad %193 
                                         f32 %195 = OpFNegate %194 
                                         f32 %196 = OpLoad %156 
                                         f32 %197 = OpFMul %195 %196 
                                Private f32* %198 = OpAccessChain %9 %85 
                                         f32 %199 = OpLoad %198 
                                         f32 %200 = OpFAdd %197 %199 
                                Private f32* %201 = OpAccessChain %9 %85 
                                                      OpStore %201 %200 
                                Private f32* %203 = OpAccessChain %165 %70 
                                         f32 %204 = OpLoad %203 
                                         f32 %205 = OpFNegate %204 
                                         f32 %206 = OpFMul %205 %109 
                                         f32 %207 = OpFAdd %206 %109 
                                                      OpStore %202 %207 
                                         f32 %209 = OpLoad %202 
                                         f32 %211 = OpFMul %209 %210 
                                         f32 %213 = OpFAdd %211 %212 
                                                      OpStore %208 %213 
                                         f32 %214 = OpLoad %202 
                                         f32 %215 = OpLoad %208 
                                         f32 %216 = OpFMul %214 %215 
                                         f32 %218 = OpFAdd %216 %217 
                                                      OpStore %208 %218 
                                         f32 %219 = OpLoad %202 
                                         f32 %220 = OpLoad %208 
                                         f32 %221 = OpFMul %219 %220 
                                         f32 %223 = OpFAdd %221 %222 
                                                      OpStore %208 %223 
                                         f32 %224 = OpLoad %202 
                                         f32 %225 = OpLoad %208 
                                         f32 %226 = OpFMul %224 %225 
                                         f32 %228 = OpFAdd %226 %227 
                                                      OpStore %202 %228 
                                         f32 %229 = OpLoad %202 
                                         f32 %231 = OpFMul %229 %230 
                                                      OpStore %202 %231 
                                         f32 %232 = OpLoad %202 
                                         f32 %233 = OpExtInst %1 29 %232 
                                Private f32* %234 = OpAccessChain %9 %70 
                                                      OpStore %234 %233 
                                       f32_4 %235 = OpLoad %9 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 0 
                                       f32_3 %240 = OpFMul %236 %239 
                                       f32_4 %241 = OpLoad %9 
                                       f32_4 %242 = OpVectorShuffle %241 %240 4 5 6 3 
                                                      OpStore %9 %242 
                                       f32_4 %244 = OpLoad %9 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
                                       f32_3 %246 = OpLoad %165 
                                       f32_3 %247 = OpFMul %245 %246 
                                                      OpStore %243 %247 
                                       f32_3 %248 = OpLoad %243 
                                       f32_3 %250 = OpFMul %248 %249 
                                       f32_3 %253 = OpFAdd %250 %252 
                                                      OpStore %243 %253 
                                       f32_3 %254 = OpLoad %243 
                                       f32_3 %255 = OpLoad %243 
                                         f32 %256 = OpDot %254 %255 
                                                      OpStore %156 %256 
                                         f32 %257 = OpLoad %156 
                                         f32 %258 = OpExtInst %1 31 %257 
                                                      OpStore %156 %258 
                                         f32 %260 = OpLoad %156 
                                         f32 %261 = OpFNegate %260 
                                         f32 %262 = OpFAdd %261 %109 
                                                      OpStore %259 %262 
                                         f32 %263 = OpLoad %259 
                                         f32 %265 = OpFMul %263 %264 
                                                      OpStore %259 %265 
                                         f32 %266 = OpLoad %259 
                                         f32 %267 = OpExtInst %1 29 %266 
                                                      OpStore %259 %267 
                              Uniform f32_4* %270 = OpAccessChain %21 %28 
                                       f32_4 %271 = OpLoad %270 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                       f32_3 %273 = OpLoad %243 
                                         f32 %274 = OpDot %272 %273 
                                Private f32* %275 = OpAccessChain %269 %85 
                                                      OpStore %275 %274 
                                Private f32* %276 = OpAccessChain %269 %85 
                                         f32 %277 = OpLoad %276 
                                         f32 %278 = OpLoad %156 
                                         f32 %279 = OpFDiv %277 %278 
                                Private f32* %280 = OpAccessChain %269 %85 
                                                      OpStore %280 %279 
                                       f32_3 %282 = OpLoad %165 
                                       f32_3 %283 = OpLoad %243 
                                         f32 %284 = OpDot %282 %283 
                                                      OpStore %281 %284 
                                         f32 %285 = OpLoad %281 
                                         f32 %286 = OpLoad %156 
                                         f32 %287 = OpFDiv %285 %286 
                                                      OpStore %156 %287 
                                Private f32* %288 = OpAccessChain %269 %85 
                                         f32 %289 = OpLoad %288 
                                         f32 %290 = OpFNegate %289 
                                         f32 %291 = OpFAdd %290 %109 
                                Private f32* %292 = OpAccessChain %269 %85 
                                                      OpStore %292 %291 
                                Private f32* %293 = OpAccessChain %269 %85 
                                         f32 %294 = OpLoad %293 
                                         f32 %295 = OpFMul %294 %210 
                                         f32 %296 = OpFAdd %295 %212 
                                                      OpStore %281 %296 
                                Private f32* %297 = OpAccessChain %269 %85 
                                         f32 %298 = OpLoad %297 
                                         f32 %299 = OpLoad %281 
                                         f32 %300 = OpFMul %298 %299 
                                         f32 %301 = OpFAdd %300 %217 
                                                      OpStore %281 %301 
                                Private f32* %302 = OpAccessChain %269 %85 
                                         f32 %303 = OpLoad %302 
                                         f32 %304 = OpLoad %281 
                                         f32 %305 = OpFMul %303 %304 
                                         f32 %306 = OpFAdd %305 %222 
                                                      OpStore %281 %306 
                                Private f32* %307 = OpAccessChain %269 %85 
                                         f32 %308 = OpLoad %307 
                                         f32 %309 = OpLoad %281 
                                         f32 %310 = OpFMul %308 %309 
                                         f32 %311 = OpFAdd %310 %227 
                                Private f32* %312 = OpAccessChain %269 %85 
                                                      OpStore %312 %311 
                                Private f32* %313 = OpAccessChain %269 %85 
                                         f32 %314 = OpLoad %313 
                                         f32 %315 = OpFMul %314 %230 
                                Private f32* %316 = OpAccessChain %269 %85 
                                                      OpStore %316 %315 
                                Private f32* %317 = OpAccessChain %269 %85 
                                         f32 %318 = OpLoad %317 
                                         f32 %319 = OpExtInst %1 29 %318 
                                Private f32* %320 = OpAccessChain %269 %85 
                                                      OpStore %320 %319 
                                         f32 %321 = OpLoad %156 
                                         f32 %322 = OpFNegate %321 
                                         f32 %323 = OpFAdd %322 %109 
                                                      OpStore %156 %323 
                                         f32 %324 = OpLoad %156 
                                         f32 %325 = OpFMul %324 %210 
                                         f32 %326 = OpFAdd %325 %212 
                                                      OpStore %281 %326 
                                         f32 %327 = OpLoad %156 
                                         f32 %328 = OpLoad %281 
                                         f32 %329 = OpFMul %327 %328 
                                         f32 %330 = OpFAdd %329 %217 
                                                      OpStore %281 %330 
                                         f32 %331 = OpLoad %156 
                                         f32 %332 = OpLoad %281 
                                         f32 %333 = OpFMul %331 %332 
                                         f32 %334 = OpFAdd %333 %222 
                                                      OpStore %281 %334 
                                         f32 %335 = OpLoad %156 
                                         f32 %336 = OpLoad %281 
                                         f32 %337 = OpFMul %335 %336 
                                         f32 %338 = OpFAdd %337 %227 
                                                      OpStore %156 %338 
                                         f32 %339 = OpLoad %156 
                                         f32 %340 = OpFMul %339 %230 
                                                      OpStore %156 %340 
                                         f32 %341 = OpLoad %156 
                                         f32 %342 = OpExtInst %1 29 %341 
                                                      OpStore %156 %342 
                                         f32 %343 = OpLoad %156 
                                         f32 %345 = OpFMul %343 %344 
                                                      OpStore %156 %345 
                                Private f32* %346 = OpAccessChain %269 %85 
                                         f32 %347 = OpLoad %346 
                                         f32 %348 = OpFMul %347 %344 
                                         f32 %349 = OpLoad %156 
                                         f32 %350 = OpFNegate %349 
                                         f32 %351 = OpFAdd %348 %350 
                                                      OpStore %156 %351 
                                         f32 %352 = OpLoad %259 
                                         f32 %353 = OpLoad %156 
                                         f32 %354 = OpFMul %352 %353 
                                Private f32* %355 = OpAccessChain %9 %70 
                                         f32 %356 = OpLoad %355 
                                         f32 %357 = OpFAdd %354 %356 
                                                      OpStore %156 %357 
                                         f32 %358 = OpLoad %156 
                                         f32 %359 = OpExtInst %1 40 %358 %176 
                                                      OpStore %156 %359 
                                         f32 %360 = OpLoad %156 
                                         f32 %362 = OpExtInst %1 37 %360 %361 
                                                      OpStore %156 %362 
                                       f32_4 %364 = OpLoad %44 
                                       f32_3 %365 = OpVectorShuffle %364 %364 0 1 2 
                                       f32_4 %366 = OpLoad %50 
                                       f32_3 %367 = OpVectorShuffle %366 %366 1 1 1 
                                       f32_3 %368 = OpFMul %365 %367 
                                       f32_3 %371 = OpFAdd %368 %370 
                                       f32_4 %372 = OpLoad %363 
                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
                                                      OpStore %363 %373 
                                         f32 %375 = OpLoad %156 
                                       f32_3 %376 = OpCompositeConstruct %375 %375 %375 
                                       f32_3 %377 = OpFNegate %376 
                                       f32_4 %378 = OpLoad %363 
                                       f32_3 %379 = OpVectorShuffle %378 %378 0 1 2 
                                       f32_3 %380 = OpFMul %377 %379 
                                                      OpStore %374 %380 
                                       f32_3 %381 = OpLoad %374 
                                       f32_3 %383 = OpFMul %381 %382 
                                                      OpStore %374 %383 
                                       f32_3 %384 = OpLoad %374 
                                       f32_3 %385 = OpExtInst %1 29 %384 
                                                      OpStore %374 %385 
                                Private f32* %386 = OpAccessChain %9 %91 
                                         f32 %387 = OpLoad %386 
                                         f32 %388 = OpLoad %259 
                                         f32 %389 = OpFMul %387 %388 
                                                      OpStore %156 %389 
                                       f32_3 %390 = OpLoad %165 
                                       f32_4 %391 = OpLoad %9 
                                       f32_3 %392 = OpVectorShuffle %391 %391 0 0 0 
                                       f32_3 %393 = OpFMul %390 %392 
                                       f32_3 %394 = OpLoad %243 
                                       f32_3 %395 = OpFAdd %393 %394 
                                                      OpStore %243 %395 
                                       f32_3 %396 = OpLoad %243 
                                       f32_3 %397 = OpLoad %243 
                                         f32 %398 = OpDot %396 %397 
                                Private f32* %399 = OpAccessChain %9 %85 
                                                      OpStore %399 %398 
                                Private f32* %400 = OpAccessChain %9 %85 
                                         f32 %401 = OpLoad %400 
                                         f32 %402 = OpExtInst %1 31 %401 
                                Private f32* %403 = OpAccessChain %9 %85 
                                                      OpStore %403 %402 
                                Private f32* %404 = OpAccessChain %9 %85 
                                         f32 %405 = OpLoad %404 
                                         f32 %406 = OpFNegate %405 
                                         f32 %407 = OpFAdd %406 %109 
                                                      OpStore %259 %407 
                                         f32 %408 = OpLoad %259 
                                         f32 %409 = OpFMul %408 %264 
                                                      OpStore %259 %409 
                                         f32 %410 = OpLoad %259 
                                         f32 %411 = OpExtInst %1 29 %410 
                                                      OpStore %259 %411 
                              Uniform f32_4* %412 = OpAccessChain %21 %28 
                                       f32_4 %413 = OpLoad %412 
                                       f32_3 %414 = OpVectorShuffle %413 %413 0 1 2 
                                       f32_3 %415 = OpLoad %243 
                                         f32 %416 = OpDot %414 %415 
                                Private f32* %417 = OpAccessChain %269 %85 
                                                      OpStore %417 %416 
                                Private f32* %418 = OpAccessChain %269 %85 
                                         f32 %419 = OpLoad %418 
                                Private f32* %420 = OpAccessChain %9 %85 
                                         f32 %421 = OpLoad %420 
                                         f32 %422 = OpFDiv %419 %421 
                                Private f32* %423 = OpAccessChain %269 %85 
                                                      OpStore %423 %422 
                                       f32_3 %424 = OpLoad %165 
                                       f32_3 %425 = OpLoad %243 
                                         f32 %426 = OpDot %424 %425 
                                                      OpStore %281 %426 
                                         f32 %427 = OpLoad %281 
                                Private f32* %428 = OpAccessChain %9 %85 
                                         f32 %429 = OpLoad %428 
                                         f32 %430 = OpFDiv %427 %429 
                                Private f32* %431 = OpAccessChain %9 %85 
                                                      OpStore %431 %430 
                                Private f32* %432 = OpAccessChain %269 %85 
                                         f32 %433 = OpLoad %432 
                                         f32 %434 = OpFNegate %433 
                                         f32 %435 = OpFAdd %434 %109 
                                Private f32* %436 = OpAccessChain %269 %85 
                                                      OpStore %436 %435 
                                Private f32* %437 = OpAccessChain %269 %85 
                                         f32 %438 = OpLoad %437 
                                         f32 %439 = OpFMul %438 %210 
                                         f32 %440 = OpFAdd %439 %212 
                                                      OpStore %281 %440 
                                Private f32* %441 = OpAccessChain %269 %85 
                                         f32 %442 = OpLoad %441 
                                         f32 %443 = OpLoad %281 
                                         f32 %444 = OpFMul %442 %443 
                                         f32 %445 = OpFAdd %444 %217 
                                                      OpStore %281 %445 
                                Private f32* %446 = OpAccessChain %269 %85 
                                         f32 %447 = OpLoad %446 
                                         f32 %448 = OpLoad %281 
                                         f32 %449 = OpFMul %447 %448 
                                         f32 %450 = OpFAdd %449 %222 
                                                      OpStore %281 %450 
                                Private f32* %451 = OpAccessChain %269 %85 
                                         f32 %452 = OpLoad %451 
                                         f32 %453 = OpLoad %281 
                                         f32 %454 = OpFMul %452 %453 
                                         f32 %455 = OpFAdd %454 %227 
                                Private f32* %456 = OpAccessChain %269 %85 
                                                      OpStore %456 %455 
                                Private f32* %457 = OpAccessChain %269 %85 
                                         f32 %458 = OpLoad %457 
                                         f32 %459 = OpFMul %458 %230 
                                Private f32* %460 = OpAccessChain %269 %85 
                                                      OpStore %460 %459 
                                Private f32* %461 = OpAccessChain %269 %85 
                                         f32 %462 = OpLoad %461 
                                         f32 %463 = OpExtInst %1 29 %462 
                                Private f32* %464 = OpAccessChain %269 %85 
                                                      OpStore %464 %463 
                                Private f32* %465 = OpAccessChain %9 %85 
                                         f32 %466 = OpLoad %465 
                                         f32 %467 = OpFNegate %466 
                                         f32 %468 = OpFAdd %467 %109 
                                Private f32* %469 = OpAccessChain %9 %85 
                                                      OpStore %469 %468 
                                Private f32* %470 = OpAccessChain %9 %85 
                                         f32 %471 = OpLoad %470 
                                         f32 %472 = OpFMul %471 %210 
                                         f32 %473 = OpFAdd %472 %212 
                                                      OpStore %281 %473 
                                Private f32* %474 = OpAccessChain %9 %85 
                                         f32 %475 = OpLoad %474 
                                         f32 %476 = OpLoad %281 
                                         f32 %477 = OpFMul %475 %476 
                                         f32 %478 = OpFAdd %477 %217 
                                                      OpStore %281 %478 
                                Private f32* %479 = OpAccessChain %9 %85 
                                         f32 %480 = OpLoad %479 
                                         f32 %481 = OpLoad %281 
                                         f32 %482 = OpFMul %480 %481 
                                         f32 %483 = OpFAdd %482 %222 
                                                      OpStore %281 %483 
                                Private f32* %484 = OpAccessChain %9 %85 
                                         f32 %485 = OpLoad %484 
                                         f32 %486 = OpLoad %281 
                                         f32 %487 = OpFMul %485 %486 
                                         f32 %488 = OpFAdd %487 %227 
                                Private f32* %489 = OpAccessChain %9 %85 
                                                      OpStore %489 %488 
                                Private f32* %490 = OpAccessChain %9 %85 
                                         f32 %491 = OpLoad %490 
                                         f32 %492 = OpFMul %491 %230 
                                Private f32* %493 = OpAccessChain %9 %85 
                                                      OpStore %493 %492 
                                Private f32* %494 = OpAccessChain %9 %85 
                                         f32 %495 = OpLoad %494 
                                         f32 %496 = OpExtInst %1 29 %495 
                                Private f32* %497 = OpAccessChain %9 %85 
                                                      OpStore %497 %496 
                                Private f32* %498 = OpAccessChain %9 %85 
                                         f32 %499 = OpLoad %498 
                                         f32 %500 = OpFMul %499 %344 
                                Private f32* %501 = OpAccessChain %9 %85 
                                                      OpStore %501 %500 
                                Private f32* %502 = OpAccessChain %269 %85 
                                         f32 %503 = OpLoad %502 
                                         f32 %504 = OpFMul %503 %344 
                                Private f32* %505 = OpAccessChain %9 %85 
                                         f32 %506 = OpLoad %505 
                                         f32 %507 = OpFNegate %506 
                                         f32 %508 = OpFAdd %504 %507 
                                Private f32* %509 = OpAccessChain %9 %85 
                                                      OpStore %509 %508 
                                         f32 %510 = OpLoad %259 
                                Private f32* %511 = OpAccessChain %9 %85 
                                         f32 %512 = OpLoad %511 
                                         f32 %513 = OpFMul %510 %512 
                                Private f32* %514 = OpAccessChain %9 %70 
                                         f32 %515 = OpLoad %514 
                                         f32 %516 = OpFAdd %513 %515 
                                Private f32* %517 = OpAccessChain %9 %85 
                                                      OpStore %517 %516 
                                Private f32* %518 = OpAccessChain %9 %85 
                                         f32 %519 = OpLoad %518 
                                         f32 %520 = OpExtInst %1 40 %519 %176 
                                Private f32* %521 = OpAccessChain %9 %85 
                                                      OpStore %521 %520 
                                Private f32* %522 = OpAccessChain %9 %85 
                                         f32 %523 = OpLoad %522 
                                         f32 %524 = OpExtInst %1 37 %523 %361 
                                Private f32* %525 = OpAccessChain %9 %85 
                                                      OpStore %525 %524 
                                       f32_4 %526 = OpLoad %363 
                                       f32_3 %527 = OpVectorShuffle %526 %526 0 1 2 
                                       f32_4 %528 = OpLoad %9 
                                       f32_3 %529 = OpVectorShuffle %528 %528 0 0 0 
                                       f32_3 %530 = OpFNegate %529 
                                       f32_3 %531 = OpFMul %527 %530 
                                                      OpStore %243 %531 
                                       f32_3 %532 = OpLoad %243 
                                       f32_3 %533 = OpFMul %532 %382 
                                                      OpStore %243 %533 
                                       f32_3 %534 = OpLoad %243 
                                       f32_3 %535 = OpExtInst %1 29 %534 
                                                      OpStore %243 %535 
                                Private f32* %536 = OpAccessChain %9 %91 
                                         f32 %537 = OpLoad %536 
                                         f32 %538 = OpLoad %259 
                                         f32 %539 = OpFMul %537 %538 
                                Private f32* %540 = OpAccessChain %9 %85 
                                                      OpStore %540 %539 
                                       f32_4 %541 = OpLoad %9 
                                       f32_3 %542 = OpVectorShuffle %541 %541 0 0 0 
                                       f32_3 %543 = OpLoad %243 
                                       f32_3 %544 = OpFMul %542 %543 
                                       f32_4 %545 = OpLoad %9 
                                       f32_4 %546 = OpVectorShuffle %545 %544 4 5 6 3 
                                                      OpStore %9 %546 
                                       f32_3 %547 = OpLoad %374 
                                         f32 %548 = OpLoad %156 
                                       f32_3 %549 = OpCompositeConstruct %548 %548 %548 
                                       f32_3 %550 = OpFMul %547 %549 
                                       f32_4 %551 = OpLoad %9 
                                       f32_3 %552 = OpVectorShuffle %551 %551 0 1 2 
                                       f32_3 %553 = OpFAdd %550 %552 
                                       f32_4 %554 = OpLoad %9 
                                       f32_4 %555 = OpVectorShuffle %554 %553 4 5 6 3 
                                                      OpStore %9 %555 
                                       f32_4 %556 = OpLoad %44 
                                       f32_3 %557 = OpVectorShuffle %556 %556 0 1 2 
                                       f32_4 %558 = OpLoad %50 
                                       f32_3 %559 = OpVectorShuffle %558 %558 0 0 0 
                                       f32_3 %560 = OpFMul %557 %559 
                                                      OpStore %243 %560 
                                       f32_4 %561 = OpLoad %9 
                                       f32_3 %562 = OpVectorShuffle %561 %561 0 1 2 
                                       f32_3 %563 = OpLoad %243 
                                       f32_3 %564 = OpFMul %562 %563 
                                                      OpStore %243 %564 
                                       f32_4 %565 = OpLoad %9 
                                       f32_3 %566 = OpVectorShuffle %565 %565 0 1 2 
                                       f32_3 %569 = OpFMul %566 %568 
                                       f32_4 %570 = OpLoad %9 
                                       f32_4 %571 = OpVectorShuffle %570 %569 4 5 6 3 
                                                      OpStore %9 %571 
                                                      OpBranch %180 
                                             %572 = OpLabel 
                                Private f32* %573 = OpAccessChain %165 %70 
                                         f32 %574 = OpLoad %573 
                                         f32 %576 = OpExtInst %1 37 %574 %575 
                                                      OpStore %156 %576 
                                         f32 %578 = OpLoad %156 
                                         f32 %579 = OpFDiv %577 %578 
                                                      OpStore %156 %579 
                                         f32 %580 = OpLoad %156 
                                       f32_3 %581 = OpCompositeConstruct %580 %580 %580 
                                       f32_3 %582 = OpLoad %165 
                                       f32_3 %583 = OpFMul %581 %582 
                                       f32_3 %584 = OpFAdd %583 %252 
                                       f32_4 %585 = OpLoad %363 
                                       f32_4 %586 = OpVectorShuffle %585 %584 4 5 6 3 
                                                      OpStore %363 %586 
                                       f32_3 %587 = OpLoad %165 
                                       f32_3 %588 = OpFNegate %587 
                                       f32_4 %589 = OpLoad %363 
                                       f32_3 %590 = OpVectorShuffle %589 %589 0 1 2 
                                         f32 %591 = OpDot %588 %590 
                                                      OpStore %259 %591 
                              Uniform f32_4* %592 = OpAccessChain %21 %28 
                                       f32_4 %593 = OpLoad %592 
                                       f32_3 %594 = OpVectorShuffle %593 %593 0 1 2 
                                       f32_4 %595 = OpLoad %363 
                                       f32_3 %596 = OpVectorShuffle %595 %595 0 1 2 
                                         f32 %597 = OpDot %594 %596 
                                Private f32* %598 = OpAccessChain %269 %85 
                                                      OpStore %598 %597 
                                         f32 %599 = OpLoad %259 
                                         f32 %600 = OpFNegate %599 
                                         f32 %601 = OpFAdd %600 %109 
                                                      OpStore %259 %601 
                                         f32 %602 = OpLoad %259 
                                         f32 %603 = OpFMul %602 %210 
                                         f32 %604 = OpFAdd %603 %212 
                                                      OpStore %281 %604 
                                         f32 %605 = OpLoad %259 
                                         f32 %606 = OpLoad %281 
                                         f32 %607 = OpFMul %605 %606 
                                         f32 %608 = OpFAdd %607 %217 
                                                      OpStore %281 %608 
                                         f32 %609 = OpLoad %259 
                                         f32 %610 = OpLoad %281 
                                         f32 %611 = OpFMul %609 %610 
                                         f32 %612 = OpFAdd %611 %222 
                                                      OpStore %281 %612 
                                         f32 %613 = OpLoad %259 
                                         f32 %614 = OpLoad %281 
                                         f32 %615 = OpFMul %613 %614 
                                         f32 %616 = OpFAdd %615 %227 
                                                      OpStore %259 %616 
                                         f32 %617 = OpLoad %259 
                                         f32 %618 = OpFMul %617 %230 
                                                      OpStore %259 %618 
                                         f32 %619 = OpLoad %259 
                                         f32 %620 = OpExtInst %1 29 %619 
                                                      OpStore %259 %620 
                                Private f32* %621 = OpAccessChain %269 %85 
                                         f32 %622 = OpLoad %621 
                                         f32 %623 = OpFNegate %622 
                                         f32 %624 = OpFAdd %623 %109 
                                Private f32* %625 = OpAccessChain %269 %85 
                                                      OpStore %625 %624 
                                Private f32* %626 = OpAccessChain %269 %85 
                                         f32 %627 = OpLoad %626 
                                         f32 %628 = OpFMul %627 %210 
                                         f32 %629 = OpFAdd %628 %212 
                                                      OpStore %281 %629 
                                Private f32* %630 = OpAccessChain %269 %85 
                                         f32 %631 = OpLoad %630 
                                         f32 %632 = OpLoad %281 
                                         f32 %633 = OpFMul %631 %632 
                                         f32 %634 = OpFAdd %633 %217 
                                                      OpStore %281 %634 
                                Private f32* %635 = OpAccessChain %269 %85 
                                         f32 %636 = OpLoad %635 
                                         f32 %637 = OpLoad %281 
                                         f32 %638 = OpFMul %636 %637 
                                         f32 %639 = OpFAdd %638 %222 
                                                      OpStore %281 %639 
                                Private f32* %640 = OpAccessChain %269 %85 
                                         f32 %641 = OpLoad %640 
                                         f32 %642 = OpLoad %281 
                                         f32 %643 = OpFMul %641 %642 
                                         f32 %644 = OpFAdd %643 %227 
                                Private f32* %645 = OpAccessChain %269 %85 
                                                      OpStore %645 %644 
                                Private f32* %646 = OpAccessChain %269 %85 
                                         f32 %647 = OpLoad %646 
                                         f32 %648 = OpFMul %647 %230 
                                Private f32* %649 = OpAccessChain %269 %85 
                                                      OpStore %649 %648 
                                Private f32* %650 = OpAccessChain %269 %85 
                                         f32 %651 = OpLoad %650 
                                         f32 %652 = OpExtInst %1 29 %651 
                                Private f32* %653 = OpAccessChain %269 %85 
                                                      OpStore %653 %652 
                                         f32 %654 = OpLoad %259 
                                       f32_2 %655 = OpCompositeConstruct %654 %654 
                                       f32_2 %658 = OpFMul %655 %657 
                                       f32_4 %659 = OpLoad %363 
                                       f32_4 %660 = OpVectorShuffle %659 %658 4 5 2 3 
                                                      OpStore %363 %660 
                                Private f32* %661 = OpAccessChain %269 %85 
                                         f32 %662 = OpLoad %661 
                                         f32 %663 = OpFMul %662 %344 
                                Private f32* %664 = OpAccessChain %363 %85 
                                         f32 %665 = OpLoad %664 
                                         f32 %666 = OpFAdd %663 %665 
                                                      OpStore %259 %666 
                                         f32 %667 = OpLoad %156 
                                       f32_2 %668 = OpCompositeConstruct %667 %667 
                                       f32_2 %670 = OpFMul %668 %669 
                                                      OpStore %269 %670 
                                       f32_2 %671 = OpLoad %269 
                                       f32_3 %672 = OpVectorShuffle %671 %671 0 0 0 
                                       f32_3 %673 = OpLoad %165 
                                       f32_3 %674 = OpFMul %672 %673 
                                       f32_4 %675 = OpLoad %363 
                                       f32_4 %676 = OpVectorShuffle %675 %674 4 1 5 6 
                                                      OpStore %363 %676 
                                       f32_4 %677 = OpLoad %363 
                                       f32_3 %678 = OpVectorShuffle %677 %677 0 2 3 
                                       f32_3 %679 = OpFMul %678 %249 
                                       f32_3 %680 = OpFAdd %679 %252 
                                       f32_4 %681 = OpLoad %363 
                                       f32_4 %682 = OpVectorShuffle %681 %680 4 1 5 6 
                                                      OpStore %363 %682 
                                       f32_4 %683 = OpLoad %363 
                                       f32_3 %684 = OpVectorShuffle %683 %683 0 2 3 
                                       f32_4 %685 = OpLoad %363 
                                       f32_3 %686 = OpVectorShuffle %685 %685 0 2 3 
                                         f32 %687 = OpDot %684 %686 
                                                      OpStore %156 %687 
                                         f32 %688 = OpLoad %156 
                                         f32 %689 = OpExtInst %1 31 %688 
                                                      OpStore %156 %689 
                                         f32 %690 = OpLoad %156 
                                         f32 %691 = OpFNegate %690 
                                         f32 %692 = OpFAdd %691 %109 
                                                      OpStore %156 %692 
                                         f32 %693 = OpLoad %156 
                                         f32 %694 = OpFMul %693 %264 
                                                      OpStore %156 %694 
                                         f32 %695 = OpLoad %156 
                                         f32 %696 = OpExtInst %1 29 %695 
                                                      OpStore %156 %696 
                                         f32 %697 = OpLoad %156 
                                         f32 %698 = OpLoad %259 
                                         f32 %699 = OpFMul %697 %698 
                                Private f32* %700 = OpAccessChain %363 %70 
                                         f32 %701 = OpLoad %700 
                                         f32 %702 = OpFNegate %701 
                                         f32 %703 = OpFAdd %699 %702 
                                                      OpStore %259 %703 
                                         f32 %704 = OpLoad %259 
                                         f32 %705 = OpExtInst %1 40 %704 %176 
                                                      OpStore %259 %705 
                                         f32 %706 = OpLoad %259 
                                         f32 %707 = OpExtInst %1 37 %706 %361 
                                                      OpStore %259 %707 
                                       f32_4 %708 = OpLoad %44 
                                       f32_3 %709 = OpVectorShuffle %708 %708 0 1 2 
                                       f32_4 %710 = OpLoad %50 
                                       f32_3 %711 = OpVectorShuffle %710 %710 1 1 1 
                                       f32_3 %712 = OpFMul %709 %711 
                                       f32_3 %713 = OpFAdd %712 %370 
                                       f32_4 %714 = OpLoad %363 
                                       f32_4 %715 = OpVectorShuffle %714 %713 4 5 6 3 
                                                      OpStore %363 %715 
                                         f32 %716 = OpLoad %259 
                                       f32_3 %717 = OpCompositeConstruct %716 %716 %716 
                                       f32_3 %718 = OpFNegate %717 
                                       f32_4 %719 = OpLoad %363 
                                       f32_3 %720 = OpVectorShuffle %719 %719 0 1 2 
                                       f32_3 %721 = OpFMul %718 %720 
                                       f32_4 %722 = OpLoad %363 
                                       f32_4 %723 = OpVectorShuffle %722 %721 4 5 6 3 
                                                      OpStore %363 %723 
                                       f32_4 %724 = OpLoad %363 
                                       f32_3 %725 = OpVectorShuffle %724 %724 0 1 2 
                                       f32_3 %726 = OpFMul %725 %382 
                                       f32_4 %727 = OpLoad %363 
                                       f32_4 %728 = OpVectorShuffle %727 %726 4 5 6 3 
                                                      OpStore %363 %728 
                                       f32_4 %729 = OpLoad %363 
                                       f32_3 %730 = OpVectorShuffle %729 %729 0 1 2 
                                       f32_3 %731 = OpExtInst %1 29 %730 
                                       f32_4 %732 = OpLoad %9 
                                       f32_4 %733 = OpVectorShuffle %732 %731 4 5 6 3 
                                                      OpStore %9 %733 
                                Private f32* %734 = OpAccessChain %269 %70 
                                         f32 %735 = OpLoad %734 
                                         f32 %736 = OpLoad %156 
                                         f32 %737 = OpFMul %735 %736 
                                                      OpStore %156 %737 
                                         f32 %739 = OpLoad %156 
                                       f32_3 %740 = OpCompositeConstruct %739 %739 %739 
                                       f32_4 %741 = OpLoad %9 
                                       f32_3 %742 = OpVectorShuffle %741 %741 0 1 2 
                                       f32_3 %743 = OpFMul %740 %742 
                                                      OpStore %738 %743 
                                       f32_4 %744 = OpLoad %44 
                                       f32_3 %745 = OpVectorShuffle %744 %744 0 1 2 
                                       f32_4 %746 = OpLoad %50 
                                       f32_3 %747 = OpVectorShuffle %746 %746 0 0 0 
                                       f32_3 %748 = OpFMul %745 %747 
                                       f32_3 %749 = OpFAdd %748 %568 
                                       f32_4 %750 = OpLoad %44 
                                       f32_4 %751 = OpVectorShuffle %750 %749 4 5 6 3 
                                                      OpStore %44 %751 
                                       f32_4 %752 = OpLoad %44 
                                       f32_3 %753 = OpVectorShuffle %752 %752 0 1 2 
                                       f32_3 %754 = OpLoad %738 
                                       f32_3 %755 = OpFMul %753 %754 
                                                      OpStore %243 %755 
                                                      OpBranch %180 
                                             %180 = OpLabel 
                                Uniform f32* %757 = OpAccessChain %21 %756 %85 
                                         f32 %758 = OpLoad %757 
                                Uniform f32* %759 = OpAccessChain %21 %756 %70 
                                         f32 %760 = OpLoad %759 
                                Uniform f32* %761 = OpAccessChain %21 %756 %91 
                                         f32 %762 = OpLoad %761 
                                       f32_3 %763 = OpCompositeConstruct %758 %760 %762 
                                       f32_4 %764 = OpLoad %9 
                                       f32_3 %765 = OpVectorShuffle %764 %764 0 1 2 
                                       f32_3 %766 = OpFMul %763 %765 
                                       f32_3 %767 = OpLoad %243 
                                       f32_3 %768 = OpFAdd %766 %767 
                                       f32_4 %769 = OpLoad %44 
                                       f32_4 %770 = OpVectorShuffle %769 %768 4 5 6 3 
                                                      OpStore %44 %770 
                                       f32_4 %773 = OpLoad %44 
                                       f32_3 %774 = OpVectorShuffle %773 %773 0 1 2 
                                Uniform f32* %776 = OpAccessChain %21 %775 
                                         f32 %777 = OpLoad %776 
                                       f32_3 %778 = OpCompositeConstruct %777 %777 %777 
                                       f32_3 %779 = OpFMul %774 %778 
                                                      OpStore vs_TEXCOORD1 %779 
                              Uniform f32_4* %780 = OpAccessChain %21 %28 
                                       f32_4 %781 = OpLoad %780 
                                       f32_3 %782 = OpVectorShuffle %781 %781 0 1 2 
                                       f32_3 %783 = OpLoad %165 
                                       f32_3 %784 = OpFNegate %783 
                                         f32 %785 = OpDot %782 %784 
                                                      OpStore %156 %785 
                                         f32 %786 = OpLoad %156 
                                         f32 %787 = OpLoad %156 
                                         f32 %788 = OpFMul %786 %787 
                                                      OpStore %156 %788 
                                         f32 %789 = OpLoad %156 
                                         f32 %791 = OpFMul %789 %790 
                                         f32 %792 = OpFAdd %791 %790 
                                                      OpStore %156 %792 
                                         f32 %793 = OpLoad %156 
                                       f32_3 %794 = OpCompositeConstruct %793 %793 %793 
                                       f32_3 %795 = OpLoad %243 
                                       f32_3 %796 = OpFMul %794 %795 
                                       f32_4 %797 = OpLoad %44 
                                       f32_4 %798 = OpVectorShuffle %797 %796 4 5 6 3 
                                                      OpStore %44 %798 
                                       f32_4 %800 = OpLoad %44 
                                       f32_3 %801 = OpVectorShuffle %800 %800 0 1 2 
                                Uniform f32* %802 = OpAccessChain %21 %775 
                                         f32 %803 = OpLoad %802 
                                       f32_3 %804 = OpCompositeConstruct %803 %803 %803 
                                       f32_3 %805 = OpFMul %801 %804 
                                                      OpStore vs_TEXCOORD2 %805 
                              Uniform f32_4* %806 = OpAccessChain %21 %46 
                                       f32_4 %807 = OpLoad %806 
                                       f32_3 %808 = OpVectorShuffle %807 %807 0 1 2 
                              Uniform f32_4* %809 = OpAccessChain %21 %46 
                                       f32_4 %810 = OpLoad %809 
                                       f32_3 %811 = OpVectorShuffle %810 %810 0 1 2 
                                         f32 %812 = OpDot %808 %811 
                                                      OpStore %156 %812 
                                         f32 %813 = OpLoad %156 
                                         f32 %814 = OpExtInst %1 31 %813 
                                                      OpStore %156 %814 
                                         f32 %815 = OpLoad %156 
                                         f32 %816 = OpExtInst %1 40 %815 %344 
                                                      OpStore %156 %816 
                                         f32 %817 = OpLoad %156 
                                         f32 %818 = OpExtInst %1 37 %817 %109 
                                                      OpStore %156 %818 
                                       f32_4 %819 = OpLoad %9 
                                       f32_3 %820 = OpVectorShuffle %819 %819 0 1 2 
                                       f32_4 %821 = OpLoad %9 
                                       f32_4 %822 = OpVectorShuffle %821 %820 4 5 6 3 
                                                      OpStore %9 %822 
                                       f32_4 %823 = OpLoad %9 
                                       f32_3 %824 = OpVectorShuffle %823 %823 0 1 2 
                                       f32_3 %825 = OpCompositeConstruct %176 %176 %176 
                                       f32_3 %826 = OpCompositeConstruct %109 %109 %109 
                                       f32_3 %827 = OpExtInst %1 43 %824 %825 %826 
                                       f32_4 %828 = OpLoad %9 
                                       f32_4 %829 = OpVectorShuffle %828 %827 4 5 6 3 
                                                      OpStore %9 %829 
                                       f32_4 %830 = OpLoad %9 
                                       f32_3 %831 = OpVectorShuffle %830 %830 0 1 2 
                              Uniform f32_4* %832 = OpAccessChain %21 %46 
                                       f32_4 %833 = OpLoad %832 
                                       f32_3 %834 = OpVectorShuffle %833 %833 0 1 2 
                                       f32_3 %835 = OpFMul %831 %834 
                                       f32_4 %836 = OpLoad %9 
                                       f32_4 %837 = OpVectorShuffle %836 %835 4 5 6 3 
                                                      OpStore %9 %837 
                                       f32_4 %838 = OpLoad %9 
                                       f32_3 %839 = OpVectorShuffle %838 %838 0 1 2 
                                       f32_3 %842 = OpFMul %839 %841 
                                       f32_4 %843 = OpLoad %9 
                                       f32_4 %844 = OpVectorShuffle %843 %842 4 5 6 3 
                                                      OpStore %9 %844 
                                       f32_4 %846 = OpLoad %9 
                                       f32_3 %847 = OpVectorShuffle %846 %846 0 1 2 
                                         f32 %848 = OpLoad %156 
                                       f32_3 %849 = OpCompositeConstruct %848 %848 %848 
                                       f32_3 %850 = OpFDiv %847 %849 
                                                      OpStore vs_TEXCOORD3 %850 
                                       f32_3 %852 = OpLoad %165 
                                       f32_3 %853 = OpFNegate %852 
                                                      OpStore vs_TEXCOORD0 %853 
                                 Output f32* %855 = OpAccessChain %74 %28 %70 
                                         f32 %856 = OpLoad %855 
                                         f32 %857 = OpFNegate %856 
                                 Output f32* %858 = OpAccessChain %74 %28 %70 
                                                      OpStore %858 %857 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 181
; Schema: 0
                                           OpCapability Shader 
                                    %1 = OpExtInstImport "GLSL.std.450" 
                                           OpMemoryModel Logical GLSL450 
                                           OpEntryPoint Fragment %4 "main" %36 %142 %144 %154 %164 
                                           OpExecutionMode %4 OriginUpperLeft 
                                           OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                           OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                           OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                           OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                           OpMemberDecorate %10 0 Offset 10 
                                           OpMemberDecorate %10 1 Offset 10 
                                           OpMemberDecorate %10 2 Offset 10 
                                           OpDecorate %10 Block 
                                           OpDecorate %12 DescriptorSet 12 
                                           OpDecorate %12 Binding 12 
                                           OpDecorate vs_TEXCOORD0 Location 36 
                                           OpDecorate vs_TEXCOORD1 Location 142 
                                           OpDecorate vs_TEXCOORD2 Location 144 
                                           OpDecorate vs_TEXCOORD3 Location 154 
                                           OpDecorate %164 Location 164 
                                    %2 = OpTypeVoid 
                                    %3 = OpTypeFunction %2 
                                    %6 = OpTypeFloat 32 
                                    %7 = OpTypeVector %6 4 
                                    %8 = OpTypePointer Private %7 
                     Private f32_4* %9 = OpVariable Private 
                                   %10 = OpTypeStruct %7 %6 %6 
                                   %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4; f32; f32;}* %12 = OpVariable Uniform 
                                   %13 = OpTypeInt 32 1 
                               i32 %14 = OpConstant 1 
                                   %15 = OpTypePointer Uniform %6 
                                   %19 = OpTypeInt 32 0 
                               u32 %20 = OpConstant 0 
                                   %21 = OpTypePointer Private %6 
                               f32 %25 = OpConstant 3.674022E-40 
                                   %32 = OpTypeVector %6 3 
                                   %33 = OpTypePointer Private %32 
                    Private f32_3* %34 = OpVariable Private 
                                   %35 = OpTypePointer Input %32 
             Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                               i32 %49 = OpConstant 0 
                                   %50 = OpTypePointer Uniform %7 
                               f32 %60 = OpConstant 3.674022E-40 
                               f32 %61 = OpConstant 3.674022E-40 
                               i32 %70 = OpConstant 2 
                      Private f32* %79 = OpVariable Private 
                               f32 %83 = OpConstant 3.674022E-40 
                               f32 %85 = OpConstant 3.674022E-40 
                               u32 %93 = OpConstant 1 
                                   %95 = OpTypeVector %6 2 
                               f32 %98 = OpConstant 3.674022E-40 
                               f32 %99 = OpConstant 3.674022E-40 
                            f32_2 %100 = OpConstantComposite %98 %99 
                              f32 %117 = OpConstant 3.674022E-40 
                              f32 %128 = OpConstant 3.674022E-40 
                                  %135 = OpTypeBool 
                                  %136 = OpTypePointer Private %135 
                    Private bool* %137 = OpVariable Private 
                   Private f32_3* %141 = OpVariable Private 
             Input f32_3* vs_TEXCOORD1 = OpVariable Input 
             Input f32_3* vs_TEXCOORD2 = OpVariable Input 
             Input f32_3* vs_TEXCOORD3 = OpVariable Input 
                                  %163 = OpTypePointer Output %7 
                    Output f32_4* %164 = OpVariable Output 
                                  %166 = OpTypePointer Function %32 
                              u32 %177 = OpConstant 3 
                                  %178 = OpTypePointer Output %6 
                               void %4 = OpFunction None %3 
                                    %5 = OpLabel 
                  Function f32_3* %167 = OpVariable Function 
                      Uniform f32* %16 = OpAccessChain %12 %14 
                               f32 %17 = OpLoad %16 
                               f32 %18 = OpExtInst %1 30 %17 
                      Private f32* %22 = OpAccessChain %9 %20 
                                           OpStore %22 %18 
                      Private f32* %23 = OpAccessChain %9 %20 
                               f32 %24 = OpLoad %23 
                               f32 %26 = OpFMul %24 %25 
                      Private f32* %27 = OpAccessChain %9 %20 
                                           OpStore %27 %26 
                      Private f32* %28 = OpAccessChain %9 %20 
                               f32 %29 = OpLoad %28 
                               f32 %30 = OpExtInst %1 29 %29 
                      Private f32* %31 = OpAccessChain %9 %20 
                                           OpStore %31 %30 
                             f32_3 %37 = OpLoad vs_TEXCOORD0 
                             f32_3 %38 = OpLoad vs_TEXCOORD0 
                               f32 %39 = OpDot %37 %38 
                      Private f32* %40 = OpAccessChain %34 %20 
                                           OpStore %40 %39 
                      Private f32* %41 = OpAccessChain %34 %20 
                               f32 %42 = OpLoad %41 
                               f32 %43 = OpExtInst %1 32 %42 
                      Private f32* %44 = OpAccessChain %34 %20 
                                           OpStore %44 %43 
                             f32_3 %45 = OpLoad %34 
                             f32_3 %46 = OpVectorShuffle %45 %45 0 0 0 
                             f32_3 %47 = OpLoad vs_TEXCOORD0 
                             f32_3 %48 = OpFMul %46 %47 
                                           OpStore %34 %48 
                    Uniform f32_4* %51 = OpAccessChain %12 %49 
                             f32_4 %52 = OpLoad %51 
                             f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                             f32_3 %54 = OpLoad %34 
                             f32_3 %55 = OpFNegate %54 
                               f32 %56 = OpDot %53 %55 
                      Private f32* %57 = OpAccessChain %34 %20 
                                           OpStore %57 %56 
                      Private f32* %58 = OpAccessChain %34 %20 
                               f32 %59 = OpLoad %58 
                               f32 %62 = OpExtInst %1 43 %59 %60 %61 
                      Private f32* %63 = OpAccessChain %34 %20 
                                           OpStore %63 %62 
                      Private f32* %64 = OpAccessChain %34 %20 
                               f32 %65 = OpLoad %64 
                               f32 %66 = OpExtInst %1 30 %65 
                      Private f32* %67 = OpAccessChain %34 %20 
                                           OpStore %67 %66 
                      Private f32* %68 = OpAccessChain %34 %20 
                               f32 %69 = OpLoad %68 
                      Uniform f32* %71 = OpAccessChain %12 %70 
                               f32 %72 = OpLoad %71 
                               f32 %73 = OpFMul %69 %72 
                      Private f32* %74 = OpAccessChain %34 %20 
                                           OpStore %74 %73 
                      Private f32* %75 = OpAccessChain %34 %20 
                               f32 %76 = OpLoad %75 
                               f32 %77 = OpExtInst %1 29 %76 
                      Private f32* %78 = OpAccessChain %34 %20 
                                           OpStore %78 %77 
                      Private f32* %80 = OpAccessChain %34 %20 
                               f32 %81 = OpLoad %80 
                               f32 %82 = OpFNegate %81 
                               f32 %84 = OpFMul %82 %83 
                               f32 %86 = OpFAdd %84 %85 
                                           OpStore %79 %86 
                      Private f32* %87 = OpAccessChain %34 %20 
                               f32 %88 = OpLoad %87 
                      Private f32* %89 = OpAccessChain %34 %20 
                               f32 %90 = OpLoad %89 
                               f32 %91 = OpFMul %88 %90 
                               f32 %92 = OpFAdd %91 %61 
                      Private f32* %94 = OpAccessChain %9 %93 
                                           OpStore %94 %92 
                             f32_4 %96 = OpLoad %9 
                             f32_2 %97 = OpVectorShuffle %96 %96 0 1 
                            f32_2 %101 = OpFMul %97 %100 
                            f32_4 %102 = OpLoad %9 
                            f32_4 %103 = OpVectorShuffle %102 %101 4 5 2 3 
                                           OpStore %9 %103 
                              f32 %104 = OpLoad %79 
                              f32 %105 = OpExtInst %1 30 %104 
                                           OpStore %79 %105 
                              f32 %106 = OpLoad %79 
                     Private f32* %107 = OpAccessChain %9 %20 
                              f32 %108 = OpLoad %107 
                              f32 %109 = OpFMul %106 %108 
                     Private f32* %110 = OpAccessChain %9 %20 
                                           OpStore %110 %109 
                     Private f32* %111 = OpAccessChain %9 %20 
                              f32 %112 = OpLoad %111 
                              f32 %113 = OpExtInst %1 29 %112 
                     Private f32* %114 = OpAccessChain %9 %20 
                                           OpStore %114 %113 
                     Private f32* %115 = OpAccessChain %9 %20 
                              f32 %116 = OpLoad %115 
                              f32 %118 = OpExtInst %1 40 %116 %117 
                     Private f32* %119 = OpAccessChain %9 %20 
                                           OpStore %119 %118 
                     Private f32* %120 = OpAccessChain %9 %93 
                              f32 %121 = OpLoad %120 
                     Private f32* %122 = OpAccessChain %9 %20 
                              f32 %123 = OpLoad %122 
                              f32 %124 = OpFDiv %121 %123 
                     Private f32* %125 = OpAccessChain %9 %20 
                                           OpStore %125 %124 
                     Private f32* %126 = OpAccessChain %34 %93 
                              f32 %127 = OpLoad %126 
                              f32 %129 = OpFMul %127 %128 
                     Private f32* %130 = OpAccessChain %34 %20 
                                           OpStore %130 %129 
                     Private f32* %131 = OpAccessChain %34 %20 
                              f32 %132 = OpLoad %131 
                              f32 %133 = OpExtInst %1 43 %132 %60 %61 
                     Private f32* %134 = OpAccessChain %34 %20 
                                           OpStore %134 %133 
                     Private f32* %138 = OpAccessChain %34 %93 
                              f32 %139 = OpLoad %138 
                             bool %140 = OpFOrdLessThan %139 %60 
                                           OpStore %137 %140 
                            f32_3 %143 = OpLoad vs_TEXCOORD1 
                            f32_3 %145 = OpLoad vs_TEXCOORD2 
                            f32_3 %146 = OpFNegate %145 
                            f32_3 %147 = OpFAdd %143 %146 
                                           OpStore %141 %147 
                            f32_3 %148 = OpLoad %34 
                            f32_3 %149 = OpVectorShuffle %148 %148 0 0 0 
                            f32_3 %150 = OpLoad %141 
                            f32_3 %151 = OpFMul %149 %150 
                            f32_3 %152 = OpLoad vs_TEXCOORD2 
                            f32_3 %153 = OpFAdd %151 %152 
                                           OpStore %141 %153 
                            f32_3 %155 = OpLoad vs_TEXCOORD3 
                            f32_4 %156 = OpLoad %9 
                            f32_3 %157 = OpVectorShuffle %156 %156 0 0 0 
                            f32_3 %158 = OpFMul %155 %157 
                            f32_3 %159 = OpLoad %141 
                            f32_3 %160 = OpFAdd %158 %159 
                            f32_4 %161 = OpLoad %9 
                            f32_4 %162 = OpVectorShuffle %161 %160 4 5 2 6 
                                           OpStore %9 %162 
                             bool %165 = OpLoad %137 
                                           OpSelectionMerge %169 None 
                                           OpBranchConditional %165 %168 %172 
                                  %168 = OpLabel 
                            f32_4 %170 = OpLoad %9 
                            f32_3 %171 = OpVectorShuffle %170 %170 0 1 3 
                                           OpStore %167 %171 
                                           OpBranch %169 
                                  %172 = OpLabel 
                            f32_3 %173 = OpLoad %141 
                                           OpStore %167 %173 
                                           OpBranch %169 
                                  %169 = OpLabel 
                            f32_3 %174 = OpLoad %167 
                            f32_4 %175 = OpLoad %164 
                            f32_4 %176 = OpVectorShuffle %175 %174 4 5 6 3 
                                           OpStore %164 %176 
                      Output f32* %179 = OpAccessChain %164 %177 
                                           OpStore %179 %61 
                                           OpReturn
                                           OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Local Keywords { "_SUNDISK_NONE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "_SUNDISK_NONE" }
""
}
SubProgram "vulkan " {
Local Keywords { "_SUNDISK_NONE" }
""
}
SubProgram "d3d11 " {
Local Keywords { "_SUNDISK_SIMPLE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "_SUNDISK_SIMPLE" }
""
}
SubProgram "vulkan " {
Local Keywords { "_SUNDISK_SIMPLE" }
""
}
SubProgram "d3d11 " {
Local Keywords { "_SUNDISK_HIGH_QUALITY" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Local Keywords { "_SUNDISK_HIGH_QUALITY" }
""
}
SubProgram "vulkan " {
Local Keywords { "_SUNDISK_HIGH_QUALITY" }
""
}
}
}
}
CustomEditor "SkyboxProceduralShaderGUI"
}