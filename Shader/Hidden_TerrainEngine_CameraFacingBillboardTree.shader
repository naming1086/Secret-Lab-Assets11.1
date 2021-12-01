//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/TerrainEngine/CameraFacingBillboardTree" {
Properties {
_MainTex ("Base (RGB) Alpha (A)", 2D) = "white" { }
_NormalTex ("Base (RGB) Alpha (A)", 2D) = "white" { }
_TranslucencyViewDependency ("View dependency", Range(0, 1)) = 0.7
_TranslucencyColor ("Translucency Color", Color) = (0.73,0.85,0.41,1)
_AlphaToMask ("AlphaToMask", Float) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "RenderType" = "TreeBillboard" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "RenderType" = "TreeBillboard" }
  ColorMask RGB 0
  Cull Off
  GpuProgramID 3341
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _TreeBillboardCameraPos;
uniform 	vec4 _TreeBillboardDistances;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec4 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_COLOR0;
out vec3 vs_TEXCOORD0;
out vec4 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat4;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yzx + (-_TreeBillboardCameraPos.yzx);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = sqrt(u_xlat9);
    u_xlatb9 = _TreeBillboardDistances.x<u_xlat9;
    u_xlat4.xy = (bool(u_xlatb9)) ? vec2(0.0, 0.0) : in_TEXCOORD1.xy;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat1.xxx;
    u_xlat9 = u_xlat1.x + (-_TreeBillboardDistances.z);
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.yzx * vec3(1.0, 0.0, 0.0) + (-u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat0.xz, u_xlat0.xz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx + in_POSITION0.xyz;
    u_xlat0.xyz = u_xlat4.yyy * vec3(0.0, 1.0, 0.0) + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat2.x = u_xlat9 / _TreeBillboardDistances.w;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlatb9 = _TreeBillboardDistances.w<u_xlat9;
    vs_TEXCOORD0.z = (u_xlatb9) ? 1.0 : u_xlat2.x;
    u_xlatb9 = 0.0<in_TEXCOORD0.y;
    vs_TEXCOORD0.y = u_xlatb9 ? 1.0 : float(0.0);
    vs_TEXCOORD0.x = in_TEXCOORD0.x;
    u_xlat9 = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.w = u_xlat9 * 0.5;
    u_xlat2.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat1.zw;
    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
float ImmCB_0_0_0[64];
uniform 	vec4 _ScreenParams;
uniform 	vec4 glstate_lightmodel_ambient;
uniform 	vec4 _TreeBillboardCameraFront;
uniform 	vec3 _TranslucencyColor;
uniform 	float _TranslucencyViewDependency;
uniform 	vec3 _TerrainTreeLightDirections[4];
uniform 	vec4 _TerrainTreeLightColors[4];
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalTex;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
ivec2 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat8;
float u_xlat12;
float u_xlat13;
void main()
{
	ImmCB_0_0_0[0] = 0.0;
	ImmCB_0_0_0[1] = 32.0;
	ImmCB_0_0_0[2] = 8.0;
	ImmCB_0_0_0[3] = 40.0;
	ImmCB_0_0_0[4] = 2.0;
	ImmCB_0_0_0[5] = 34.0;
	ImmCB_0_0_0[6] = 10.0;
	ImmCB_0_0_0[7] = 42.0;
	ImmCB_0_0_0[8] = 48.0;
	ImmCB_0_0_0[9] = 16.0;
	ImmCB_0_0_0[10] = 56.0;
	ImmCB_0_0_0[11] = 24.0;
	ImmCB_0_0_0[12] = 50.0;
	ImmCB_0_0_0[13] = 18.0;
	ImmCB_0_0_0[14] = 58.0;
	ImmCB_0_0_0[15] = 26.0;
	ImmCB_0_0_0[16] = 12.0;
	ImmCB_0_0_0[17] = 44.0;
	ImmCB_0_0_0[18] = 4.0;
	ImmCB_0_0_0[19] = 36.0;
	ImmCB_0_0_0[20] = 14.0;
	ImmCB_0_0_0[21] = 46.0;
	ImmCB_0_0_0[22] = 6.0;
	ImmCB_0_0_0[23] = 38.0;
	ImmCB_0_0_0[24] = 60.0;
	ImmCB_0_0_0[25] = 28.0;
	ImmCB_0_0_0[26] = 52.0;
	ImmCB_0_0_0[27] = 20.0;
	ImmCB_0_0_0[28] = 62.0;
	ImmCB_0_0_0[29] = 30.0;
	ImmCB_0_0_0[30] = 54.0;
	ImmCB_0_0_0[31] = 22.0;
	ImmCB_0_0_0[32] = 3.0;
	ImmCB_0_0_0[33] = 35.0;
	ImmCB_0_0_0[34] = 11.0;
	ImmCB_0_0_0[35] = 43.0;
	ImmCB_0_0_0[36] = 1.0;
	ImmCB_0_0_0[37] = 33.0;
	ImmCB_0_0_0[38] = 9.0;
	ImmCB_0_0_0[39] = 41.0;
	ImmCB_0_0_0[40] = 51.0;
	ImmCB_0_0_0[41] = 19.0;
	ImmCB_0_0_0[42] = 59.0;
	ImmCB_0_0_0[43] = 27.0;
	ImmCB_0_0_0[44] = 49.0;
	ImmCB_0_0_0[45] = 17.0;
	ImmCB_0_0_0[46] = 57.0;
	ImmCB_0_0_0[47] = 25.0;
	ImmCB_0_0_0[48] = 15.0;
	ImmCB_0_0_0[49] = 47.0;
	ImmCB_0_0_0[50] = 7.0;
	ImmCB_0_0_0[51] = 39.0;
	ImmCB_0_0_0[52] = 13.0;
	ImmCB_0_0_0[53] = 45.0;
	ImmCB_0_0_0[54] = 5.0;
	ImmCB_0_0_0[55] = 37.0;
	ImmCB_0_0_0[56] = 63.0;
	ImmCB_0_0_0[57] = 31.0;
	ImmCB_0_0_0[58] = 55.0;
	ImmCB_0_0_0[59] = 23.0;
	ImmCB_0_0_0[60] = 61.0;
	ImmCB_0_0_0[61] = 29.0;
	ImmCB_0_0_0[62] = 53.0;
	ImmCB_0_0_0[63] = 21.0;
    u_xlat0.x = vs_TEXCOORD2.w + 9.99999975e-06;
    u_xlat0.xy = vs_TEXCOORD2.xy / u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * _ScreenParams.xy;
    u_xlati0.xy = ivec2(u_xlat0.xy);
    u_xlati0.y = u_xlati0.y << 3;
    u_xlati0.xy = ivec2(uvec2(u_xlati0.xy) & uvec2(7u, 56u));
    u_xlati0.x = u_xlati0.x + u_xlati0.y;
    u_xlat0.x = 11.0 + ImmCB_0_0_0[u_xlati0.x];
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD0.z;
    u_xlat4.x = u_xlat0.x * 0.015625;
    u_xlat0.x = (-u_xlat0.x) * 0.015625 + 1.0;
    u_xlat0.x = vs_TEXCOORD0.z * u_xlat0.x + u_xlat4.x;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.x = u_xlat1.w * u_xlat0.x + (-_TreeBillboardCameraFront.w);
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat0.x;
    u_xlatb0 = u_xlat4.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, (-_TerrainTreeLightDirections[0].xyz));
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2 = texture(_NormalTex, vs_TEXCOORD0.xy);
    u_xlat4.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat4.xxx * u_xlat2.xyz;
    u_xlat13 = dot(_TerrainTreeLightDirections[0].xyz, u_xlat4.xyz);
    u_xlat2.x = (-u_xlat13);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat13 = u_xlat13 * 0.800000012 + 0.200000003;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat0.x = _TranslucencyViewDependency * u_xlat0.x + u_xlat2.x;
    u_xlat0.x = u_xlat0.x * 0.200000003;
    u_xlat2.xyz = u_xlat0.xxx * _TranslucencyColor.xyz + vec3(u_xlat13);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * glstate_lightmodel_ambient.xyz;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _TerrainTreeLightColors[0].xyz + u_xlat3.xyz;
    u_xlat0.x = dot(_TerrainTreeLightDirections[1].xyz, u_xlat4.xyz);
    u_xlat4.x = dot(_TerrainTreeLightDirections[2].xyz, u_xlat4.xyz);
    u_xlat8 = (-u_xlat0.x);
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * 0.800000012 + 0.200000003;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat12 = dot(vs_TEXCOORD3.xyz, (-_TerrainTreeLightDirections[1].xyz));
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat12 = (-u_xlat8) + u_xlat12;
    u_xlat8 = _TranslucencyViewDependency * u_xlat12 + u_xlat8;
    u_xlat8 = u_xlat8 * 0.200000003;
    u_xlat0.xzw = vec3(u_xlat8) * _TranslucencyColor.xyz + u_xlat0.xxx;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat0.xzw * _TerrainTreeLightColors[1].xyz + u_xlat2.xyz;
    u_xlat13 = (-u_xlat4.x);
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat4.x = u_xlat4.x * 0.800000012 + 0.200000003;
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat2.x = dot(vs_TEXCOORD3.xyz, (-_TerrainTreeLightDirections[2].xyz));
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat2.x = (-u_xlat13) + u_xlat2.x;
    u_xlat13 = _TranslucencyViewDependency * u_xlat2.x + u_xlat13;
    u_xlat13 = u_xlat13 * 0.200000003;
    u_xlat2.xyz = vec3(u_xlat13) * _TranslucencyColor.xyz + u_xlat4.xxx;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat1.xyz * _TerrainTreeLightColors[2].xyz + u_xlat0.xzw;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 273
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %65 %192 %196 %197 %215 %228 %256 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %65 Location 65 
                                                      OpMemberDecorate %190 0 BuiltIn 190 
                                                      OpMemberDecorate %190 1 BuiltIn 190 
                                                      OpMemberDecorate %190 2 BuiltIn 190 
                                                      OpDecorate %190 Block 
                                                      OpDecorate %196 Location 196 
                                                      OpDecorate %197 Location 197 
                                                      OpDecorate vs_TEXCOORD0 Location 215 
                                                      OpDecorate %228 Location 228 
                                                      OpDecorate vs_TEXCOORD2 Location 256 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %7 %17 %18 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 3 
                                              %24 = OpTypePointer Uniform %7 
                                              %32 = OpTypePointer Private %6 
                                 Private f32* %33 = OpVariable Private 
                               Private f32_4* %39 = OpVariable Private 
                                          u32 %42 = OpConstant 0 
                                              %44 = OpTypeBool 
                                              %45 = OpTypePointer Private %44 
                                Private bool* %46 = OpVariable Private 
                                          i32 %47 = OpConstant 4 
                                              %48 = OpTypePointer Uniform %6 
                                              %53 = OpTypeVector %6 2 
                                              %54 = OpTypePointer Private %53 
                               Private f32_2* %55 = OpVariable Private 
                                              %57 = OpTypePointer Function %53 
                                          f32 %61 = OpConstant 3.674022E-40 
                                        f32_2 %62 = OpConstantComposite %61 %61 
                                              %64 = OpTypePointer Input %53 
                                 Input f32_2* %65 = OpVariable Input 
                                          u32 %77 = OpConstant 2 
                               Private f32_4* %82 = OpVariable Private 
                                          f32 %85 = OpConstant 3.674022E-40 
                                        f32_3 %86 = OpConstantComposite %61 %61 %85 
                                        f32_3 %92 = OpConstantComposite %85 %61 %61 
                                       f32_3 %129 = OpConstantComposite %61 %85 %61 
                                         i32 %138 = OpConstant 1 
                                         i32 %142 = OpConstant 0 
                                         i32 %150 = OpConstant 2 
                                         u32 %188 = OpConstant 1 
                                             %189 = OpTypeArray %6 %188 
                                             %190 = OpTypeStruct %7 %6 %189 
                                             %191 = OpTypePointer Output %190 
        Output struct {f32_4; f32; f32[1];}* %192 = OpVariable Output 
                                             %194 = OpTypePointer Output %7 
                               Output f32_4* %196 = OpVariable Output 
                                Input f32_4* %197 = OpVariable Input 
                                         u32 %200 = OpConstant 3 
                               Private bool* %209 = OpVariable Private 
                                             %214 = OpTypePointer Output %12 
                       Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                             %217 = OpTypePointer Function %6 
                                             %225 = OpTypePointer Output %6 
                               Private bool* %227 = OpVariable Private 
                                Input f32_4* %228 = OpVariable Input 
                                             %229 = OpTypePointer Input %6 
                                         f32 %247 = OpConstant 3.674022E-40 
                                       f32_2 %252 = OpConstantComposite %247 %247 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_2* %58 = OpVariable Function 
                               Function f32* %218 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 1 2 0 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_3 %27 = OpVectorShuffle %26 %26 1 2 0 
                                        f32_3 %28 = OpFNegate %27 
                                        f32_3 %29 = OpFAdd %14 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                      OpStore %9 %31 
                                        f32_4 %34 = OpLoad %9 
                                        f32_3 %35 = OpVectorShuffle %34 %34 0 1 2 
                                        f32_4 %36 = OpLoad %9 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                          f32 %38 = OpDot %35 %37 
                                                      OpStore %33 %38 
                                          f32 %40 = OpLoad %33 
                                          f32 %41 = OpExtInst %1 31 %40 
                                 Private f32* %43 = OpAccessChain %39 %42 
                                                      OpStore %43 %41 
                                 Uniform f32* %49 = OpAccessChain %21 %47 %42 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpLoad %33 
                                         bool %52 = OpFOrdLessThan %50 %51 
                                                      OpStore %46 %52 
                                         bool %56 = OpLoad %46 
                                                      OpSelectionMerge %60 None 
                                                      OpBranchConditional %56 %59 %63 
                                              %59 = OpLabel 
                                                      OpStore %58 %62 
                                                      OpBranch %60 
                                              %63 = OpLabel 
                                        f32_2 %66 = OpLoad %65 
                                                      OpStore %58 %66 
                                                      OpBranch %60 
                                              %60 = OpLabel 
                                        f32_2 %67 = OpLoad %58 
                                                      OpStore %55 %67 
                                        f32_4 %68 = OpLoad %9 
                                        f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
                                        f32_4 %70 = OpLoad %39 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 0 0 
                                        f32_3 %72 = OpFDiv %69 %71 
                                        f32_4 %73 = OpLoad %9 
                                        f32_4 %74 = OpVectorShuffle %73 %72 4 5 6 3 
                                                      OpStore %9 %74 
                                 Private f32* %75 = OpAccessChain %39 %42 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %78 = OpAccessChain %21 %47 %77 
                                          f32 %79 = OpLoad %78 
                                          f32 %80 = OpFNegate %79 
                                          f32 %81 = OpFAdd %76 %80 
                                                      OpStore %33 %81 
                                        f32_4 %83 = OpLoad %9 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_3 %87 = OpFMul %84 %86 
                                        f32_4 %88 = OpLoad %82 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %82 %89 
                                        f32_4 %90 = OpLoad %9 
                                        f32_3 %91 = OpVectorShuffle %90 %90 1 2 0 
                                        f32_3 %93 = OpFMul %91 %92 
                                        f32_4 %94 = OpLoad %82 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_3 %96 = OpFNegate %95 
                                        f32_3 %97 = OpFAdd %93 %96 
                                        f32_4 %98 = OpLoad %9 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 6 3 
                                                      OpStore %9 %99 
                                       f32_4 %100 = OpLoad %9 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 2 
                                       f32_4 %102 = OpLoad %9 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 2 
                                         f32 %104 = OpDot %101 %103 
                                Private f32* %105 = OpAccessChain %39 %42 
                                                      OpStore %105 %104 
                                Private f32* %106 = OpAccessChain %39 %42 
                                         f32 %107 = OpLoad %106 
                                         f32 %108 = OpExtInst %1 32 %107 
                                Private f32* %109 = OpAccessChain %39 %42 
                                                      OpStore %109 %108 
                                       f32_4 %110 = OpLoad %9 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                       f32_4 %112 = OpLoad %39 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 0 0 
                                       f32_3 %114 = OpFMul %111 %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
                                                      OpStore %9 %116 
                                       f32_4 %117 = OpLoad %9 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                                       f32_2 %119 = OpLoad %55 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 0 0 
                                       f32_3 %121 = OpFMul %118 %120 
                                       f32_4 %122 = OpLoad %11 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                       f32_3 %124 = OpFAdd %121 %123 
                                       f32_4 %125 = OpLoad %9 
                                       f32_4 %126 = OpVectorShuffle %125 %124 4 5 6 3 
                                                      OpStore %9 %126 
                                       f32_2 %127 = OpLoad %55 
                                       f32_3 %128 = OpVectorShuffle %127 %127 1 1 1 
                                       f32_3 %130 = OpFMul %128 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpFAdd %130 %132 
                                       f32_4 %134 = OpLoad %9 
                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
                                                      OpStore %9 %135 
                                       f32_4 %136 = OpLoad %9 
                                       f32_4 %137 = OpVectorShuffle %136 %136 1 1 1 1 
                              Uniform f32_4* %139 = OpAccessChain %21 %138 %138 
                                       f32_4 %140 = OpLoad %139 
                                       f32_4 %141 = OpFMul %137 %140 
                                                      OpStore %39 %141 
                              Uniform f32_4* %143 = OpAccessChain %21 %138 %142 
                                       f32_4 %144 = OpLoad %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_4 %146 = OpVectorShuffle %145 %145 0 0 0 0 
                                       f32_4 %147 = OpFMul %144 %146 
                                       f32_4 %148 = OpLoad %39 
                                       f32_4 %149 = OpFAdd %147 %148 
                                                      OpStore %39 %149 
                              Uniform f32_4* %151 = OpAccessChain %21 %138 %150 
                                       f32_4 %152 = OpLoad %151 
                                       f32_4 %153 = OpLoad %9 
                                       f32_4 %154 = OpVectorShuffle %153 %153 2 2 2 2 
                                       f32_4 %155 = OpFMul %152 %154 
                                       f32_4 %156 = OpLoad %39 
                                       f32_4 %157 = OpFAdd %155 %156 
                                                      OpStore %39 %157 
                                       f32_4 %158 = OpLoad %39 
                              Uniform f32_4* %159 = OpAccessChain %21 %138 %23 
                                       f32_4 %160 = OpLoad %159 
                                       f32_4 %161 = OpFAdd %158 %160 
                                                      OpStore %39 %161 
                                       f32_4 %162 = OpLoad %39 
                                       f32_4 %163 = OpVectorShuffle %162 %162 1 1 1 1 
                              Uniform f32_4* %164 = OpAccessChain %21 %150 %138 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %166 = OpFMul %163 %165 
                                                      OpStore %82 %166 
                              Uniform f32_4* %167 = OpAccessChain %21 %150 %142 
                                       f32_4 %168 = OpLoad %167 
                                       f32_4 %169 = OpLoad %39 
                                       f32_4 %170 = OpVectorShuffle %169 %169 0 0 0 0 
                                       f32_4 %171 = OpFMul %168 %170 
                                       f32_4 %172 = OpLoad %82 
                                       f32_4 %173 = OpFAdd %171 %172 
                                                      OpStore %82 %173 
                              Uniform f32_4* %174 = OpAccessChain %21 %150 %150 
                                       f32_4 %175 = OpLoad %174 
                                       f32_4 %176 = OpLoad %39 
                                       f32_4 %177 = OpVectorShuffle %176 %176 2 2 2 2 
                                       f32_4 %178 = OpFMul %175 %177 
                                       f32_4 %179 = OpLoad %82 
                                       f32_4 %180 = OpFAdd %178 %179 
                                                      OpStore %82 %180 
                              Uniform f32_4* %181 = OpAccessChain %21 %150 %23 
                                       f32_4 %182 = OpLoad %181 
                                       f32_4 %183 = OpLoad %39 
                                       f32_4 %184 = OpVectorShuffle %183 %183 3 3 3 3 
                                       f32_4 %185 = OpFMul %182 %184 
                                       f32_4 %186 = OpLoad %82 
                                       f32_4 %187 = OpFAdd %185 %186 
                                                      OpStore %39 %187 
                                       f32_4 %193 = OpLoad %39 
                               Output f32_4* %195 = OpAccessChain %192 %142 
                                                      OpStore %195 %193 
                                       f32_4 %198 = OpLoad %197 
                                                      OpStore %196 %198 
                                         f32 %199 = OpLoad %33 
                                Uniform f32* %201 = OpAccessChain %21 %47 %200 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpFDiv %199 %202 
                                Private f32* %204 = OpAccessChain %9 %42 
                                                      OpStore %204 %203 
                                Private f32* %205 = OpAccessChain %9 %42 
                                         f32 %206 = OpLoad %205 
                                         f32 %207 = OpExtInst %1 43 %206 %61 %85 
                                Private f32* %208 = OpAccessChain %9 %42 
                                                      OpStore %208 %207 
                                Uniform f32* %210 = OpAccessChain %21 %47 %200 
                                         f32 %211 = OpLoad %210 
                                         f32 %212 = OpLoad %33 
                                        bool %213 = OpFOrdLessThan %211 %212 
                                                      OpStore %209 %213 
                                        bool %216 = OpLoad %209 
                                                      OpSelectionMerge %220 None 
                                                      OpBranchConditional %216 %219 %221 
                                             %219 = OpLabel 
                                                      OpStore %218 %85 
                                                      OpBranch %220 
                                             %221 = OpLabel 
                                Private f32* %222 = OpAccessChain %9 %42 
                                         f32 %223 = OpLoad %222 
                                                      OpStore %218 %223 
                                                      OpBranch %220 
                                             %220 = OpLabel 
                                         f32 %224 = OpLoad %218 
                                 Output f32* %226 = OpAccessChain vs_TEXCOORD0 %77 
                                                      OpStore %226 %224 
                                  Input f32* %230 = OpAccessChain %228 %188 
                                         f32 %231 = OpLoad %230 
                                        bool %232 = OpFOrdLessThan %61 %231 
                                                      OpStore %227 %232 
                                        bool %233 = OpLoad %227 
                                         f32 %234 = OpSelect %233 %85 %61 
                                 Output f32* %235 = OpAccessChain vs_TEXCOORD0 %188 
                                                      OpStore %235 %234 
                                  Input f32* %236 = OpAccessChain %228 %42 
                                         f32 %237 = OpLoad %236 
                                 Output f32* %238 = OpAccessChain vs_TEXCOORD0 %42 
                                                      OpStore %238 %237 
                                Private f32* %239 = OpAccessChain %39 %188 
                                         f32 %240 = OpLoad %239 
                                Uniform f32* %241 = OpAccessChain %21 %142 %42 
                                         f32 %242 = OpLoad %241 
                                         f32 %243 = OpFMul %240 %242 
                                Private f32* %244 = OpAccessChain %9 %42 
                                                      OpStore %244 %243 
                                Private f32* %245 = OpAccessChain %9 %42 
                                         f32 %246 = OpLoad %245 
                                         f32 %248 = OpFMul %246 %247 
                                Private f32* %249 = OpAccessChain %9 %200 
                                                      OpStore %249 %248 
                                       f32_4 %250 = OpLoad %39 
                                       f32_2 %251 = OpVectorShuffle %250 %250 0 3 
                                       f32_2 %253 = OpFMul %251 %252 
                                       f32_4 %254 = OpLoad %9 
                                       f32_4 %255 = OpVectorShuffle %254 %253 4 1 5 3 
                                                      OpStore %9 %255 
                                       f32_4 %257 = OpLoad %39 
                                       f32_2 %258 = OpVectorShuffle %257 %257 2 3 
                                       f32_4 %259 = OpLoad vs_TEXCOORD2 
                                       f32_4 %260 = OpVectorShuffle %259 %258 0 1 4 5 
                                                      OpStore vs_TEXCOORD2 %260 
                                       f32_4 %261 = OpLoad %9 
                                       f32_2 %262 = OpVectorShuffle %261 %261 2 2 
                                       f32_4 %263 = OpLoad %9 
                                       f32_2 %264 = OpVectorShuffle %263 %263 0 3 
                                       f32_2 %265 = OpFAdd %262 %264 
                                       f32_4 %266 = OpLoad vs_TEXCOORD2 
                                       f32_4 %267 = OpVectorShuffle %266 %265 4 5 2 3 
                                                      OpStore vs_TEXCOORD2 %267 
                                 Output f32* %268 = OpAccessChain %192 %142 %188 
                                         f32 %269 = OpLoad %268 
                                         f32 %270 = OpFNegate %269 
                                 Output f32* %271 = OpAccessChain %192 %142 %188 
                                                      OpStore %271 %270 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 74
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %59 %63 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpMemberDecorate %33 0 Offset 33 
                                             OpDecorate %33 Block 
                                             OpDecorate %35 DescriptorSet 35 
                                             OpDecorate %35 Binding 35 
                                             OpDecorate %59 Location 59 
                                             OpDecorate %63 Location 63 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 3 
                                     %21 = OpTypePointer Input %20 
               Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 2 
                                     %27 = OpTypePointer Private %6 
                        Private f32* %28 = OpVariable Private 
                                     %29 = OpTypeInt 32 0 
                                 u32 %30 = OpConstant 3 
                                     %33 = OpTypeStruct %7 
                                     %34 = OpTypePointer Uniform %33 
            Uniform struct {f32_4;}* %35 = OpVariable Uniform 
                                     %36 = OpTypeInt 32 1 
                                 i32 %37 = OpConstant 0 
                                     %38 = OpTypePointer Uniform %6 
                                     %43 = OpTypeBool 
                                     %44 = OpTypePointer Private %43 
                       Private bool* %45 = OpVariable Private 
                                 f32 %47 = OpConstant 3.674022E-40 
                                 i32 %50 = OpConstant 1 
                                 i32 %52 = OpConstant -1 
                                     %58 = OpTypePointer Output %7 
                       Output f32_4* %59 = OpVariable Output 
                                     %62 = OpTypePointer Input %7 
                        Input f32_4* %63 = OpVariable Input 
                                     %71 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_3 %24 = OpLoad vs_TEXCOORD0 
                               f32_2 %25 = OpVectorShuffle %24 %24 0 1 
                               f32_4 %26 = OpImageSampleImplicitLod %19 %25 
                                             OpStore %9 %26 
                        Private f32* %31 = OpAccessChain %9 %30 
                                 f32 %32 = OpLoad %31 
                        Uniform f32* %39 = OpAccessChain %35 %37 %30 
                                 f32 %40 = OpLoad %39 
                                 f32 %41 = OpFNegate %40 
                                 f32 %42 = OpFAdd %32 %41 
                                             OpStore %28 %42 
                                 f32 %46 = OpLoad %28 
                                bool %48 = OpFOrdLessThan %46 %47 
                                             OpStore %45 %48 
                                bool %49 = OpLoad %45 
                                 i32 %51 = OpSelect %49 %50 %37 
                                 i32 %53 = OpIMul %51 %52 
                                bool %54 = OpINotEqual %53 %37 
                                             OpSelectionMerge %56 None 
                                             OpBranchConditional %54 %55 %56 
                                     %55 = OpLabel 
                                             OpKill
                                     %56 = OpLabel 
                               f32_4 %60 = OpLoad %9 
                               f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                               f32_4 %64 = OpLoad %63 
                               f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                               f32_3 %66 = OpFMul %61 %65 
                               f32_4 %67 = OpLoad %59 
                               f32_4 %68 = OpVectorShuffle %67 %66 4 5 6 3 
                                             OpStore %59 %68 
                        Private f32* %69 = OpAccessChain %9 %30 
                                 f32 %70 = OpLoad %69 
                         Output f32* %72 = OpAccessChain %59 %30 
                                             OpStore %72 %70 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _TreeBillboardCameraPos;
uniform 	vec4 _TreeBillboardDistances;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec4 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_COLOR0;
out vec3 vs_TEXCOORD0;
out float vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat4;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yzx + (-_TreeBillboardCameraPos.yzx);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = sqrt(u_xlat9);
    u_xlatb9 = _TreeBillboardDistances.x<u_xlat9;
    u_xlat4.xy = (bool(u_xlatb9)) ? vec2(0.0, 0.0) : in_TEXCOORD1.xy;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat1.xxx;
    u_xlat9 = u_xlat1.x + (-_TreeBillboardDistances.z);
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.yzx * vec3(1.0, 0.0, 0.0) + (-u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat0.xz, u_xlat0.xz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx + in_POSITION0.xyz;
    u_xlat0.xyz = u_xlat4.yyy * vec3(0.0, 1.0, 0.0) + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat2.x = u_xlat9 / _TreeBillboardDistances.w;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlatb9 = _TreeBillboardDistances.w<u_xlat9;
    vs_TEXCOORD0.z = (u_xlatb9) ? 1.0 : u_xlat2.x;
    vs_TEXCOORD1 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    u_xlatb9 = 0.0<in_TEXCOORD0.y;
    vs_TEXCOORD0.y = u_xlatb9 ? 1.0 : float(0.0);
    vs_TEXCOORD0.x = in_TEXCOORD0.x;
    u_xlat9 = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.w = u_xlat9 * 0.5;
    u_xlat2.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat1.zw;
    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
float ImmCB_0_0_0[64];
uniform 	vec4 _ScreenParams;
uniform 	vec4 glstate_lightmodel_ambient;
uniform 	vec4 unity_FogColor;
uniform 	vec4 _TreeBillboardCameraFront;
uniform 	vec3 _TranslucencyColor;
uniform 	float _TranslucencyViewDependency;
uniform 	vec3 _TerrainTreeLightDirections[4];
uniform 	vec4 _TerrainTreeLightColors[4];
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalTex;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD0;
in  float vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
ivec2 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat8;
float u_xlat12;
float u_xlat13;
void main()
{
	ImmCB_0_0_0[0] = 0.0;
	ImmCB_0_0_0[1] = 32.0;
	ImmCB_0_0_0[2] = 8.0;
	ImmCB_0_0_0[3] = 40.0;
	ImmCB_0_0_0[4] = 2.0;
	ImmCB_0_0_0[5] = 34.0;
	ImmCB_0_0_0[6] = 10.0;
	ImmCB_0_0_0[7] = 42.0;
	ImmCB_0_0_0[8] = 48.0;
	ImmCB_0_0_0[9] = 16.0;
	ImmCB_0_0_0[10] = 56.0;
	ImmCB_0_0_0[11] = 24.0;
	ImmCB_0_0_0[12] = 50.0;
	ImmCB_0_0_0[13] = 18.0;
	ImmCB_0_0_0[14] = 58.0;
	ImmCB_0_0_0[15] = 26.0;
	ImmCB_0_0_0[16] = 12.0;
	ImmCB_0_0_0[17] = 44.0;
	ImmCB_0_0_0[18] = 4.0;
	ImmCB_0_0_0[19] = 36.0;
	ImmCB_0_0_0[20] = 14.0;
	ImmCB_0_0_0[21] = 46.0;
	ImmCB_0_0_0[22] = 6.0;
	ImmCB_0_0_0[23] = 38.0;
	ImmCB_0_0_0[24] = 60.0;
	ImmCB_0_0_0[25] = 28.0;
	ImmCB_0_0_0[26] = 52.0;
	ImmCB_0_0_0[27] = 20.0;
	ImmCB_0_0_0[28] = 62.0;
	ImmCB_0_0_0[29] = 30.0;
	ImmCB_0_0_0[30] = 54.0;
	ImmCB_0_0_0[31] = 22.0;
	ImmCB_0_0_0[32] = 3.0;
	ImmCB_0_0_0[33] = 35.0;
	ImmCB_0_0_0[34] = 11.0;
	ImmCB_0_0_0[35] = 43.0;
	ImmCB_0_0_0[36] = 1.0;
	ImmCB_0_0_0[37] = 33.0;
	ImmCB_0_0_0[38] = 9.0;
	ImmCB_0_0_0[39] = 41.0;
	ImmCB_0_0_0[40] = 51.0;
	ImmCB_0_0_0[41] = 19.0;
	ImmCB_0_0_0[42] = 59.0;
	ImmCB_0_0_0[43] = 27.0;
	ImmCB_0_0_0[44] = 49.0;
	ImmCB_0_0_0[45] = 17.0;
	ImmCB_0_0_0[46] = 57.0;
	ImmCB_0_0_0[47] = 25.0;
	ImmCB_0_0_0[48] = 15.0;
	ImmCB_0_0_0[49] = 47.0;
	ImmCB_0_0_0[50] = 7.0;
	ImmCB_0_0_0[51] = 39.0;
	ImmCB_0_0_0[52] = 13.0;
	ImmCB_0_0_0[53] = 45.0;
	ImmCB_0_0_0[54] = 5.0;
	ImmCB_0_0_0[55] = 37.0;
	ImmCB_0_0_0[56] = 63.0;
	ImmCB_0_0_0[57] = 31.0;
	ImmCB_0_0_0[58] = 55.0;
	ImmCB_0_0_0[59] = 23.0;
	ImmCB_0_0_0[60] = 61.0;
	ImmCB_0_0_0[61] = 29.0;
	ImmCB_0_0_0[62] = 53.0;
	ImmCB_0_0_0[63] = 21.0;
    u_xlat0.x = vs_TEXCOORD2.w + 9.99999975e-06;
    u_xlat0.xy = vs_TEXCOORD2.xy / u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * _ScreenParams.xy;
    u_xlati0.xy = ivec2(u_xlat0.xy);
    u_xlati0.y = u_xlati0.y << 3;
    u_xlati0.xy = ivec2(uvec2(u_xlati0.xy) & uvec2(7u, 56u));
    u_xlati0.x = u_xlati0.x + u_xlati0.y;
    u_xlat0.x = 11.0 + ImmCB_0_0_0[u_xlati0.x];
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD0.z;
    u_xlat4.x = u_xlat0.x * 0.015625;
    u_xlat0.x = (-u_xlat0.x) * 0.015625 + 1.0;
    u_xlat0.x = vs_TEXCOORD0.z * u_xlat0.x + u_xlat4.x;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.x = u_xlat1.w * u_xlat0.x + (-_TreeBillboardCameraFront.w);
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat0.x;
    u_xlatb0 = u_xlat4.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, (-_TerrainTreeLightDirections[0].xyz));
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2 = texture(_NormalTex, vs_TEXCOORD0.xy);
    u_xlat4.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat4.xxx * u_xlat2.xyz;
    u_xlat13 = dot(_TerrainTreeLightDirections[0].xyz, u_xlat4.xyz);
    u_xlat2.x = (-u_xlat13);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat13 = u_xlat13 * 0.800000012 + 0.200000003;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat0.x = _TranslucencyViewDependency * u_xlat0.x + u_xlat2.x;
    u_xlat0.x = u_xlat0.x * 0.200000003;
    u_xlat2.xyz = u_xlat0.xxx * _TranslucencyColor.xyz + vec3(u_xlat13);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * glstate_lightmodel_ambient.xyz;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _TerrainTreeLightColors[0].xyz + u_xlat3.xyz;
    u_xlat0.x = dot(_TerrainTreeLightDirections[1].xyz, u_xlat4.xyz);
    u_xlat4.x = dot(_TerrainTreeLightDirections[2].xyz, u_xlat4.xyz);
    u_xlat8 = (-u_xlat0.x);
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * 0.800000012 + 0.200000003;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat12 = dot(vs_TEXCOORD3.xyz, (-_TerrainTreeLightDirections[1].xyz));
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat12 = (-u_xlat8) + u_xlat12;
    u_xlat8 = _TranslucencyViewDependency * u_xlat12 + u_xlat8;
    u_xlat8 = u_xlat8 * 0.200000003;
    u_xlat0.xzw = vec3(u_xlat8) * _TranslucencyColor.xyz + u_xlat0.xxx;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat0.xzw * _TerrainTreeLightColors[1].xyz + u_xlat2.xyz;
    u_xlat13 = (-u_xlat4.x);
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat4.x = u_xlat4.x * 0.800000012 + 0.200000003;
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat2.x = dot(vs_TEXCOORD3.xyz, (-_TerrainTreeLightDirections[2].xyz));
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat2.x = (-u_xlat13) + u_xlat2.x;
    u_xlat13 = _TranslucencyViewDependency * u_xlat2.x + u_xlat13;
    u_xlat13 = u_xlat13 * 0.200000003;
    u_xlat2.xyz = vec3(u_xlat13) * _TranslucencyColor.xyz + u_xlat4.xxx;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _TerrainTreeLightColors[2].xyz + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat12 = vs_TEXCOORD1;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 304
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %65 %193 %197 %198 %216 %249 %259 %287 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %65 Location 65 
                                                      OpMemberDecorate %191 0 BuiltIn 191 
                                                      OpMemberDecorate %191 1 BuiltIn 191 
                                                      OpMemberDecorate %191 2 BuiltIn 191 
                                                      OpDecorate %191 Block 
                                                      OpDecorate %197 Location 197 
                                                      OpDecorate %198 Location 198 
                                                      OpDecorate vs_TEXCOORD0 Location 216 
                                                      OpDecorate vs_TEXCOORD1 Location 249 
                                                      OpDecorate %259 Location 259 
                                                      OpDecorate vs_TEXCOORD2 Location 287 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %7 %17 %18 %7 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 4 
                                              %24 = OpTypePointer Uniform %7 
                                              %32 = OpTypePointer Private %6 
                                 Private f32* %33 = OpVariable Private 
                               Private f32_4* %39 = OpVariable Private 
                                          u32 %42 = OpConstant 0 
                                              %44 = OpTypeBool 
                                              %45 = OpTypePointer Private %44 
                                Private bool* %46 = OpVariable Private 
                                          i32 %47 = OpConstant 5 
                                              %48 = OpTypePointer Uniform %6 
                                              %53 = OpTypeVector %6 2 
                                              %54 = OpTypePointer Private %53 
                               Private f32_2* %55 = OpVariable Private 
                                              %57 = OpTypePointer Function %53 
                                          f32 %61 = OpConstant 3.674022E-40 
                                        f32_2 %62 = OpConstantComposite %61 %61 
                                              %64 = OpTypePointer Input %53 
                                 Input f32_2* %65 = OpVariable Input 
                                          u32 %77 = OpConstant 2 
                               Private f32_4* %82 = OpVariable Private 
                                          f32 %85 = OpConstant 3.674022E-40 
                                        f32_3 %86 = OpConstantComposite %61 %61 %85 
                                        f32_3 %92 = OpConstantComposite %85 %61 %61 
                                       f32_3 %129 = OpConstantComposite %61 %85 %61 
                                         i32 %138 = OpConstant 1 
                                         i32 %142 = OpConstant 0 
                                         i32 %150 = OpConstant 2 
                                         i32 %159 = OpConstant 3 
                                         u32 %189 = OpConstant 1 
                                             %190 = OpTypeArray %6 %189 
                                             %191 = OpTypeStruct %7 %6 %190 
                                             %192 = OpTypePointer Output %191 
        Output struct {f32_4; f32; f32[1];}* %193 = OpVariable Output 
                                             %195 = OpTypePointer Output %7 
                               Output f32_4* %197 = OpVariable Output 
                                Input f32_4* %198 = OpVariable Input 
                                         u32 %201 = OpConstant 3 
                               Private bool* %210 = OpVariable Private 
                                             %215 = OpTypePointer Output %12 
                       Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                             %218 = OpTypePointer Function %6 
                                             %226 = OpTypePointer Output %6 
                         Output f32* vs_TEXCOORD1 = OpVariable Output 
                               Private bool* %258 = OpVariable Private 
                                Input f32_4* %259 = OpVariable Input 
                                             %260 = OpTypePointer Input %6 
                                         f32 %278 = OpConstant 3.674022E-40 
                                       f32_2 %283 = OpConstantComposite %278 %278 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_2* %58 = OpVariable Function 
                               Function f32* %219 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 1 2 0 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_3 %27 = OpVectorShuffle %26 %26 1 2 0 
                                        f32_3 %28 = OpFNegate %27 
                                        f32_3 %29 = OpFAdd %14 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                      OpStore %9 %31 
                                        f32_4 %34 = OpLoad %9 
                                        f32_3 %35 = OpVectorShuffle %34 %34 0 1 2 
                                        f32_4 %36 = OpLoad %9 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                          f32 %38 = OpDot %35 %37 
                                                      OpStore %33 %38 
                                          f32 %40 = OpLoad %33 
                                          f32 %41 = OpExtInst %1 31 %40 
                                 Private f32* %43 = OpAccessChain %39 %42 
                                                      OpStore %43 %41 
                                 Uniform f32* %49 = OpAccessChain %21 %47 %42 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpLoad %33 
                                         bool %52 = OpFOrdLessThan %50 %51 
                                                      OpStore %46 %52 
                                         bool %56 = OpLoad %46 
                                                      OpSelectionMerge %60 None 
                                                      OpBranchConditional %56 %59 %63 
                                              %59 = OpLabel 
                                                      OpStore %58 %62 
                                                      OpBranch %60 
                                              %63 = OpLabel 
                                        f32_2 %66 = OpLoad %65 
                                                      OpStore %58 %66 
                                                      OpBranch %60 
                                              %60 = OpLabel 
                                        f32_2 %67 = OpLoad %58 
                                                      OpStore %55 %67 
                                        f32_4 %68 = OpLoad %9 
                                        f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
                                        f32_4 %70 = OpLoad %39 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 0 0 
                                        f32_3 %72 = OpFDiv %69 %71 
                                        f32_4 %73 = OpLoad %9 
                                        f32_4 %74 = OpVectorShuffle %73 %72 4 5 6 3 
                                                      OpStore %9 %74 
                                 Private f32* %75 = OpAccessChain %39 %42 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %78 = OpAccessChain %21 %47 %77 
                                          f32 %79 = OpLoad %78 
                                          f32 %80 = OpFNegate %79 
                                          f32 %81 = OpFAdd %76 %80 
                                                      OpStore %33 %81 
                                        f32_4 %83 = OpLoad %9 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_3 %87 = OpFMul %84 %86 
                                        f32_4 %88 = OpLoad %82 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %82 %89 
                                        f32_4 %90 = OpLoad %9 
                                        f32_3 %91 = OpVectorShuffle %90 %90 1 2 0 
                                        f32_3 %93 = OpFMul %91 %92 
                                        f32_4 %94 = OpLoad %82 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_3 %96 = OpFNegate %95 
                                        f32_3 %97 = OpFAdd %93 %96 
                                        f32_4 %98 = OpLoad %9 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 6 3 
                                                      OpStore %9 %99 
                                       f32_4 %100 = OpLoad %9 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 2 
                                       f32_4 %102 = OpLoad %9 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 2 
                                         f32 %104 = OpDot %101 %103 
                                Private f32* %105 = OpAccessChain %39 %42 
                                                      OpStore %105 %104 
                                Private f32* %106 = OpAccessChain %39 %42 
                                         f32 %107 = OpLoad %106 
                                         f32 %108 = OpExtInst %1 32 %107 
                                Private f32* %109 = OpAccessChain %39 %42 
                                                      OpStore %109 %108 
                                       f32_4 %110 = OpLoad %9 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                       f32_4 %112 = OpLoad %39 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 0 0 
                                       f32_3 %114 = OpFMul %111 %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
                                                      OpStore %9 %116 
                                       f32_4 %117 = OpLoad %9 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                                       f32_2 %119 = OpLoad %55 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 0 0 
                                       f32_3 %121 = OpFMul %118 %120 
                                       f32_4 %122 = OpLoad %11 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                       f32_3 %124 = OpFAdd %121 %123 
                                       f32_4 %125 = OpLoad %9 
                                       f32_4 %126 = OpVectorShuffle %125 %124 4 5 6 3 
                                                      OpStore %9 %126 
                                       f32_2 %127 = OpLoad %55 
                                       f32_3 %128 = OpVectorShuffle %127 %127 1 1 1 
                                       f32_3 %130 = OpFMul %128 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpFAdd %130 %132 
                                       f32_4 %134 = OpLoad %9 
                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
                                                      OpStore %9 %135 
                                       f32_4 %136 = OpLoad %9 
                                       f32_4 %137 = OpVectorShuffle %136 %136 1 1 1 1 
                              Uniform f32_4* %139 = OpAccessChain %21 %138 %138 
                                       f32_4 %140 = OpLoad %139 
                                       f32_4 %141 = OpFMul %137 %140 
                                                      OpStore %39 %141 
                              Uniform f32_4* %143 = OpAccessChain %21 %138 %142 
                                       f32_4 %144 = OpLoad %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_4 %146 = OpVectorShuffle %145 %145 0 0 0 0 
                                       f32_4 %147 = OpFMul %144 %146 
                                       f32_4 %148 = OpLoad %39 
                                       f32_4 %149 = OpFAdd %147 %148 
                                                      OpStore %39 %149 
                              Uniform f32_4* %151 = OpAccessChain %21 %138 %150 
                                       f32_4 %152 = OpLoad %151 
                                       f32_4 %153 = OpLoad %9 
                                       f32_4 %154 = OpVectorShuffle %153 %153 2 2 2 2 
                                       f32_4 %155 = OpFMul %152 %154 
                                       f32_4 %156 = OpLoad %39 
                                       f32_4 %157 = OpFAdd %155 %156 
                                                      OpStore %39 %157 
                                       f32_4 %158 = OpLoad %39 
                              Uniform f32_4* %160 = OpAccessChain %21 %138 %159 
                                       f32_4 %161 = OpLoad %160 
                                       f32_4 %162 = OpFAdd %158 %161 
                                                      OpStore %39 %162 
                                       f32_4 %163 = OpLoad %39 
                                       f32_4 %164 = OpVectorShuffle %163 %163 1 1 1 1 
                              Uniform f32_4* %165 = OpAccessChain %21 %150 %138 
                                       f32_4 %166 = OpLoad %165 
                                       f32_4 %167 = OpFMul %164 %166 
                                                      OpStore %82 %167 
                              Uniform f32_4* %168 = OpAccessChain %21 %150 %142 
                                       f32_4 %169 = OpLoad %168 
                                       f32_4 %170 = OpLoad %39 
                                       f32_4 %171 = OpVectorShuffle %170 %170 0 0 0 0 
                                       f32_4 %172 = OpFMul %169 %171 
                                       f32_4 %173 = OpLoad %82 
                                       f32_4 %174 = OpFAdd %172 %173 
                                                      OpStore %82 %174 
                              Uniform f32_4* %175 = OpAccessChain %21 %150 %150 
                                       f32_4 %176 = OpLoad %175 
                                       f32_4 %177 = OpLoad %39 
                                       f32_4 %178 = OpVectorShuffle %177 %177 2 2 2 2 
                                       f32_4 %179 = OpFMul %176 %178 
                                       f32_4 %180 = OpLoad %82 
                                       f32_4 %181 = OpFAdd %179 %180 
                                                      OpStore %82 %181 
                              Uniform f32_4* %182 = OpAccessChain %21 %150 %159 
                                       f32_4 %183 = OpLoad %182 
                                       f32_4 %184 = OpLoad %39 
                                       f32_4 %185 = OpVectorShuffle %184 %184 3 3 3 3 
                                       f32_4 %186 = OpFMul %183 %185 
                                       f32_4 %187 = OpLoad %82 
                                       f32_4 %188 = OpFAdd %186 %187 
                                                      OpStore %39 %188 
                                       f32_4 %194 = OpLoad %39 
                               Output f32_4* %196 = OpAccessChain %193 %142 
                                                      OpStore %196 %194 
                                       f32_4 %199 = OpLoad %198 
                                                      OpStore %197 %199 
                                         f32 %200 = OpLoad %33 
                                Uniform f32* %202 = OpAccessChain %21 %47 %201 
                                         f32 %203 = OpLoad %202 
                                         f32 %204 = OpFDiv %200 %203 
                                Private f32* %205 = OpAccessChain %9 %42 
                                                      OpStore %205 %204 
                                Private f32* %206 = OpAccessChain %9 %42 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpExtInst %1 43 %207 %61 %85 
                                Private f32* %209 = OpAccessChain %9 %42 
                                                      OpStore %209 %208 
                                Uniform f32* %211 = OpAccessChain %21 %47 %201 
                                         f32 %212 = OpLoad %211 
                                         f32 %213 = OpLoad %33 
                                        bool %214 = OpFOrdLessThan %212 %213 
                                                      OpStore %210 %214 
                                        bool %217 = OpLoad %210 
                                                      OpSelectionMerge %221 None 
                                                      OpBranchConditional %217 %220 %222 
                                             %220 = OpLabel 
                                                      OpStore %219 %85 
                                                      OpBranch %221 
                                             %222 = OpLabel 
                                Private f32* %223 = OpAccessChain %9 %42 
                                         f32 %224 = OpLoad %223 
                                                      OpStore %219 %224 
                                                      OpBranch %221 
                                             %221 = OpLabel 
                                         f32 %225 = OpLoad %219 
                                 Output f32* %227 = OpAccessChain vs_TEXCOORD0 %77 
                                                      OpStore %227 %225 
                                Private f32* %228 = OpAccessChain %39 %77 
                                         f32 %229 = OpLoad %228 
                                Uniform f32* %230 = OpAccessChain %21 %142 %189 
                                         f32 %231 = OpLoad %230 
                                         f32 %232 = OpFDiv %229 %231 
                                Private f32* %233 = OpAccessChain %9 %42 
                                                      OpStore %233 %232 
                                Private f32* %234 = OpAccessChain %9 %42 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpFNegate %235 
                                         f32 %237 = OpFAdd %236 %85 
                                Private f32* %238 = OpAccessChain %9 %42 
                                                      OpStore %238 %237 
                                Private f32* %239 = OpAccessChain %9 %42 
                                         f32 %240 = OpLoad %239 
                                Uniform f32* %241 = OpAccessChain %21 %142 %77 
                                         f32 %242 = OpLoad %241 
                                         f32 %243 = OpFMul %240 %242 
                                Private f32* %244 = OpAccessChain %9 %42 
                                                      OpStore %244 %243 
                                Private f32* %245 = OpAccessChain %9 %42 
                                         f32 %246 = OpLoad %245 
                                         f32 %247 = OpExtInst %1 40 %246 %61 
                                Private f32* %248 = OpAccessChain %9 %42 
                                                      OpStore %248 %247 
                                Private f32* %250 = OpAccessChain %9 %42 
                                         f32 %251 = OpLoad %250 
                                Uniform f32* %252 = OpAccessChain %21 %159 %77 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpFMul %251 %253 
                                Uniform f32* %255 = OpAccessChain %21 %159 %201 
                                         f32 %256 = OpLoad %255 
                                         f32 %257 = OpFAdd %254 %256 
                                                      OpStore vs_TEXCOORD1 %257 
                                  Input f32* %261 = OpAccessChain %259 %189 
                                         f32 %262 = OpLoad %261 
                                        bool %263 = OpFOrdLessThan %61 %262 
                                                      OpStore %258 %263 
                                        bool %264 = OpLoad %258 
                                         f32 %265 = OpSelect %264 %85 %61 
                                 Output f32* %266 = OpAccessChain vs_TEXCOORD0 %189 
                                                      OpStore %266 %265 
                                  Input f32* %267 = OpAccessChain %259 %42 
                                         f32 %268 = OpLoad %267 
                                 Output f32* %269 = OpAccessChain vs_TEXCOORD0 %42 
                                                      OpStore %269 %268 
                                Private f32* %270 = OpAccessChain %39 %189 
                                         f32 %271 = OpLoad %270 
                                Uniform f32* %272 = OpAccessChain %21 %142 %42 
                                         f32 %273 = OpLoad %272 
                                         f32 %274 = OpFMul %271 %273 
                                Private f32* %275 = OpAccessChain %9 %42 
                                                      OpStore %275 %274 
                                Private f32* %276 = OpAccessChain %9 %42 
                                         f32 %277 = OpLoad %276 
                                         f32 %279 = OpFMul %277 %278 
                                Private f32* %280 = OpAccessChain %9 %201 
                                                      OpStore %280 %279 
                                       f32_4 %281 = OpLoad %39 
                                       f32_2 %282 = OpVectorShuffle %281 %281 0 3 
                                       f32_2 %284 = OpFMul %282 %283 
                                       f32_4 %285 = OpLoad %9 
                                       f32_4 %286 = OpVectorShuffle %285 %284 4 1 5 3 
                                                      OpStore %9 %286 
                                       f32_4 %288 = OpLoad %39 
                                       f32_2 %289 = OpVectorShuffle %288 %288 2 3 
                                       f32_4 %290 = OpLoad vs_TEXCOORD2 
                                       f32_4 %291 = OpVectorShuffle %290 %289 0 1 4 5 
                                                      OpStore vs_TEXCOORD2 %291 
                                       f32_4 %292 = OpLoad %9 
                                       f32_2 %293 = OpVectorShuffle %292 %292 2 2 
                                       f32_4 %294 = OpLoad %9 
                                       f32_2 %295 = OpVectorShuffle %294 %294 0 3 
                                       f32_2 %296 = OpFAdd %293 %295 
                                       f32_4 %297 = OpLoad vs_TEXCOORD2 
                                       f32_4 %298 = OpVectorShuffle %297 %296 4 5 2 3 
                                                      OpStore vs_TEXCOORD2 %298 
                                 Output f32* %299 = OpAccessChain %193 %142 %189 
                                         f32 %300 = OpLoad %299 
                                         f32 %301 = OpFNegate %300 
                                 Output f32* %302 = OpAccessChain %193 %142 %189 
                                                      OpStore %302 %301 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 98
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %61 %74 %81 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpMemberDecorate %33 0 Offset 33 
                                             OpMemberDecorate %33 1 Offset 33 
                                             OpDecorate %33 Block 
                                             OpDecorate %35 DescriptorSet 35 
                                             OpDecorate %35 Binding 35 
                                             OpDecorate %61 Location 61 
                                             OpDecorate %74 Location 74 
                                             OpDecorate vs_TEXCOORD1 Location 81 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 3 
                                     %21 = OpTypePointer Input %20 
               Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 2 
                                     %27 = OpTypePointer Private %6 
                        Private f32* %28 = OpVariable Private 
                                     %29 = OpTypeInt 32 0 
                                 u32 %30 = OpConstant 3 
                                     %33 = OpTypeStruct %7 %7 
                                     %34 = OpTypePointer Uniform %33 
     Uniform struct {f32_4; f32_4;}* %35 = OpVariable Uniform 
                                     %36 = OpTypeInt 32 1 
                                 i32 %37 = OpConstant 1 
                                     %38 = OpTypePointer Uniform %6 
                                     %43 = OpTypeBool 
                                     %44 = OpTypePointer Private %43 
                       Private bool* %45 = OpVariable Private 
                                 f32 %47 = OpConstant 3.674022E-40 
                                 i32 %50 = OpConstant 0 
                                 i32 %52 = OpConstant -1 
                                     %60 = OpTypePointer Input %7 
                        Input f32_4* %61 = OpVariable Input 
                                     %65 = OpTypePointer Uniform %7 
                                     %73 = OpTypePointer Output %7 
                       Output f32_4* %74 = OpVariable Output 
                                     %77 = OpTypePointer Output %6 
                        Private f32* %79 = OpVariable Private 
                                     %80 = OpTypePointer Input %6 
                 Input f32* vs_TEXCOORD1 = OpVariable Input 
                                 f32 %84 = OpConstant 3.674022E-40 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_3 %24 = OpLoad vs_TEXCOORD0 
                               f32_2 %25 = OpVectorShuffle %24 %24 0 1 
                               f32_4 %26 = OpImageSampleImplicitLod %19 %25 
                                             OpStore %9 %26 
                        Private f32* %31 = OpAccessChain %9 %30 
                                 f32 %32 = OpLoad %31 
                        Uniform f32* %39 = OpAccessChain %35 %37 %30 
                                 f32 %40 = OpLoad %39 
                                 f32 %41 = OpFNegate %40 
                                 f32 %42 = OpFAdd %32 %41 
                                             OpStore %28 %42 
                                 f32 %46 = OpLoad %28 
                                bool %48 = OpFOrdLessThan %46 %47 
                                             OpStore %45 %48 
                                bool %49 = OpLoad %45 
                                 i32 %51 = OpSelect %49 %37 %50 
                                 i32 %53 = OpIMul %51 %52 
                                bool %54 = OpINotEqual %53 %50 
                                             OpSelectionMerge %56 None 
                                             OpBranchConditional %54 %55 %56 
                                     %55 = OpLabel 
                                             OpKill
                                     %56 = OpLabel 
                               f32_4 %58 = OpLoad %9 
                               f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                               f32_4 %62 = OpLoad %61 
                               f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                               f32_3 %64 = OpFMul %59 %63 
                      Uniform f32_4* %66 = OpAccessChain %35 %50 
                               f32_4 %67 = OpLoad %66 
                               f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                               f32_3 %69 = OpFNegate %68 
                               f32_3 %70 = OpFAdd %64 %69 
                               f32_4 %71 = OpLoad %9 
                               f32_4 %72 = OpVectorShuffle %71 %70 4 5 6 3 
                                             OpStore %9 %72 
                        Private f32* %75 = OpAccessChain %9 %30 
                                 f32 %76 = OpLoad %75 
                         Output f32* %78 = OpAccessChain %74 %30 
                                             OpStore %78 %76 
                                 f32 %82 = OpLoad vs_TEXCOORD1 
                                             OpStore %79 %82 
                                 f32 %83 = OpLoad %79 
                                 f32 %85 = OpExtInst %1 43 %83 %47 %84 
                                             OpStore %79 %85 
                                 f32 %86 = OpLoad %79 
                               f32_3 %87 = OpCompositeConstruct %86 %86 %86 
                               f32_4 %88 = OpLoad %9 
                               f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                               f32_3 %90 = OpFMul %87 %89 
                      Uniform f32_4* %91 = OpAccessChain %35 %50 
                               f32_4 %92 = OpLoad %91 
                               f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                               f32_3 %94 = OpFAdd %90 %93 
                               f32_4 %95 = OpLoad %74 
                               f32_4 %96 = OpVectorShuffle %95 %94 4 5 6 3 
                                             OpStore %74 %96 
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
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" }
""
}
}
}
}
}