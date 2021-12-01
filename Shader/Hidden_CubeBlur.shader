//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/CubeBlur" {
Properties {
_MainTex ("Main", Cube) = "" { }
_Texel ("Texel", Float) = 0.0078125
_Level ("Level", Float) = 0
_Scale ("Scale", Float) = 1
}
SubShader {
 LOD 200
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 200
  Tags { "RenderType" = "Opaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 34126
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
in  vec4 in_TEXCOORD0;
out vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0 = in_TEXCOORD0;
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
uniform 	float _Level;
uniform 	float _Texel;
uniform 	float _Scale;
UNITY_LOCATION(0) uniform  samplerCube _MainTex;
in  vec4 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
bvec3 u_xlatb1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
vec4 u_xlat11;
vec4 u_xlat12;
vec4 u_xlat13;
vec4 u_xlat14;
vec4 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
float u_xlat34;
float u_xlat51;
float u_xlat52;
void main()
{
    u_xlat0.x = _Scale;
    u_xlat0.y = float(3.0);
    u_xlat0.z = float(5.0);
    u_xlatb1.xyz = equal(abs(vs_TEXCOORD0.xyzx), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
;
    u_xlat1.xyz = u_xlat1.xyz * vs_TEXCOORD0.xyz;
    u_xlat2.xyz = -abs(u_xlat1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz * vs_TEXCOORD0.xyz;
    u_xlat51 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat51 = u_xlat51 + 1.0;
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat52 = u_xlat51 * u_xlat51;
    u_xlat2.x = u_xlat51 * u_xlat52;
    u_xlat2.yz = u_xlat2.xx * vec2(vec2(_Scale, _Scale));
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat2.xyz = u_xlat0.zzz * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat1.zxy * vec3(vec3(_Texel, _Texel, _Texel));
    u_xlat4.xyz = (-u_xlat3.xyz) * vec3(1.5, 1.5, 1.5) + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (-u_xlat3.zxy) * vec3(2.5, 2.5, 2.5) + u_xlat4.xyz;
    u_xlat6.xyz = max(u_xlat5.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat6.xyz = min(u_xlat6.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat5.xyz = u_xlat5.xyz + (-u_xlat6.xyz);
    u_xlat51 = max(abs(u_xlat5.y), abs(u_xlat5.x));
    u_xlat51 = max(abs(u_xlat5.z), u_xlat51);
    u_xlat5.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat6.xyz;
    u_xlat5 = textureLod(_MainTex, u_xlat5.xyz, _Level);
    u_xlat5 = max(u_xlat5, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat6.xyz = u_xlat3.xyz * vec3(1.5, 1.5, 1.5) + vs_TEXCOORD0.xyz;
    u_xlat7.xyz = (-u_xlat3.zxy) * vec3(2.5, 2.5, 2.5) + u_xlat6.xyz;
    u_xlat8.xyz = max(u_xlat7.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat8.xyz = min(u_xlat8.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat7.xyz = u_xlat7.xyz + (-u_xlat8.xyz);
    u_xlat51 = max(abs(u_xlat7.y), abs(u_xlat7.x));
    u_xlat51 = max(abs(u_xlat7.z), u_xlat51);
    u_xlat7.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat8.xyz;
    u_xlat7 = textureLod(_MainTex, u_xlat7.xyz, _Level);
    u_xlat7 = max(u_xlat7, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat5 = u_xlat5 + u_xlat7;
    u_xlat5 = u_xlat2.yyyy * u_xlat5;
    u_xlat7.xyz = (-u_xlat3.zxy) * vec3(2.5, 2.5, 2.5) + vs_TEXCOORD0.xyz;
    u_xlat8.xyz = max(u_xlat7.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat8.xyz = min(u_xlat8.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat7.xyz = u_xlat7.xyz + (-u_xlat8.xyz);
    u_xlat51 = max(abs(u_xlat7.y), abs(u_xlat7.x));
    u_xlat51 = max(abs(u_xlat7.z), u_xlat51);
    u_xlat7.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat8.xyz;
    u_xlat8.xyz = (-u_xlat3.xyz) * vec3(0.5, 0.5, 0.5) + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat7.xyz;
    u_xlat7 = textureLod(_MainTex, u_xlat7.xyz, _Level);
    u_xlat7 = max(u_xlat7, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat8 = textureLod(_MainTex, u_xlat8.xyz, _Level);
    u_xlat8 = max(u_xlat8, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat7 = u_xlat7 + u_xlat8;
    u_xlat5 = u_xlat2.xxxx * u_xlat7 + u_xlat5;
    u_xlat7.xyz = (-u_xlat3.xyz) * vec3(2.5, 2.5, 2.5) + vs_TEXCOORD0.xyz;
    u_xlat8.xyz = (-u_xlat3.zxy) * vec3(2.5, 2.5, 2.5) + u_xlat7.xyz;
    u_xlat9.xyz = max(u_xlat8.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat9.xyz = min(u_xlat9.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat8.xyz = u_xlat8.xyz + (-u_xlat9.xyz);
    u_xlat51 = max(abs(u_xlat8.y), abs(u_xlat8.x));
    u_xlat51 = max(abs(u_xlat8.z), u_xlat51);
    u_xlat8.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat9.xyz;
    u_xlat8 = textureLod(_MainTex, u_xlat8.xyz, _Level);
    u_xlat8 = max(u_xlat8, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat9.xyz = u_xlat3.xyz * vec3(2.5, 2.5, 2.5) + vs_TEXCOORD0.xyz;
    u_xlat10.xyz = (-u_xlat3.zxy) * vec3(2.5, 2.5, 2.5) + u_xlat9.xyz;
    u_xlat11.xyz = max(u_xlat10.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat11.xyz = min(u_xlat11.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat10.xyz = u_xlat10.xyz + (-u_xlat11.xyz);
    u_xlat51 = max(abs(u_xlat10.y), abs(u_xlat10.x));
    u_xlat51 = max(abs(u_xlat10.z), u_xlat51);
    u_xlat10.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat11.xyz;
    u_xlat10 = textureLod(_MainTex, u_xlat10.xyz, _Level);
    u_xlat10 = max(u_xlat10, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat8 = u_xlat8 + u_xlat10;
    u_xlat5 = u_xlat2.zzzz * u_xlat8 + u_xlat5;
    u_xlat8.xyz = u_xlat0.yyy * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat0.xyz;
    u_xlat10.xyz = (-u_xlat3.zxy) * vec3(1.5, 1.5, 1.5) + u_xlat9.xyz;
    u_xlat11.xyz = max(u_xlat10.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat11.xyz = min(u_xlat11.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat10.xyz = u_xlat10.xyz + (-u_xlat11.xyz);
    u_xlat51 = max(abs(u_xlat10.y), abs(u_xlat10.x));
    u_xlat51 = max(abs(u_xlat10.z), u_xlat51);
    u_xlat10.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat11.xyz;
    u_xlat10 = textureLod(_MainTex, u_xlat10.xyz, _Level);
    u_xlat10 = max(u_xlat10, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat11.xyz = (-u_xlat3.zxy) * vec3(1.5, 1.5, 1.5) + u_xlat7.xyz;
    u_xlat12.xyz = max(u_xlat11.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat12.xyz = min(u_xlat12.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat11.xyz = u_xlat11.xyz + (-u_xlat12.xyz);
    u_xlat51 = max(abs(u_xlat11.y), abs(u_xlat11.x));
    u_xlat51 = max(abs(u_xlat11.z), u_xlat51);
    u_xlat11.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat11 = textureLod(_MainTex, u_xlat11.xyz, _Level);
    u_xlat11 = max(u_xlat11, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat10 = u_xlat10 + u_xlat11;
    u_xlat5 = u_xlat8.zzzz * u_xlat10 + u_xlat5;
    u_xlat10.xyz = (-u_xlat3.zxy) * vec3(1.5, 1.5, 1.5) + u_xlat6.xyz;
    u_xlat11.xyz = max(u_xlat10.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat11.xyz = min(u_xlat11.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat10.xyz = u_xlat10.xyz + (-u_xlat11.xyz);
    u_xlat51 = max(abs(u_xlat10.y), abs(u_xlat10.x));
    u_xlat51 = max(abs(u_xlat10.z), u_xlat51);
    u_xlat10.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat11.xyz;
    u_xlat10 = textureLod(_MainTex, u_xlat10.xyz, _Level);
    u_xlat10 = max(u_xlat10, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat11.xyz = (-u_xlat3.zxy) * vec3(1.5, 1.5, 1.5) + u_xlat4.xyz;
    u_xlat12.xyz = max(u_xlat11.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat12.xyz = min(u_xlat12.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat11.xyz = u_xlat11.xyz + (-u_xlat12.xyz);
    u_xlat51 = max(abs(u_xlat11.y), abs(u_xlat11.x));
    u_xlat51 = max(abs(u_xlat11.z), u_xlat51);
    u_xlat11.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat11 = textureLod(_MainTex, u_xlat11.xyz, _Level);
    u_xlat11 = max(u_xlat11, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat10 = u_xlat10 + u_xlat11;
    u_xlat10 = u_xlat8.yyyy * u_xlat10;
    u_xlat11.xyz = (-u_xlat3.zxy) * vec3(1.5, 1.5, 1.5) + vs_TEXCOORD0.xyz;
    u_xlat12.xyz = max(u_xlat11.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat12.xyz = min(u_xlat12.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat11.xyz = u_xlat11.xyz + (-u_xlat12.xyz);
    u_xlat51 = max(abs(u_xlat11.y), abs(u_xlat11.x));
    u_xlat51 = max(abs(u_xlat11.z), u_xlat51);
    u_xlat11.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat12.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat11.xyz;
    u_xlat11.xyz = (-u_xlat3.xyz) * vec3(0.5, 0.5, 0.5) + u_xlat11.xyz;
    u_xlat11 = textureLod(_MainTex, u_xlat11.xyz, _Level);
    u_xlat11 = max(u_xlat11, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat12 = textureLod(_MainTex, u_xlat12.xyz, _Level);
    u_xlat12 = max(u_xlat12, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat11 = u_xlat11 + u_xlat12;
    u_xlat10 = u_xlat8.xxxx * u_xlat11 + u_xlat10;
    u_xlat5 = u_xlat5 + u_xlat10;
    u_xlat10.xyz = max(u_xlat7.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat10.xyz = min(u_xlat10.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat11.xyz = u_xlat7.xyz + (-u_xlat10.xyz);
    u_xlat51 = max(abs(u_xlat11.y), abs(u_xlat11.x));
    u_xlat51 = max(abs(u_xlat11.z), u_xlat51);
    u_xlat10.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat10.xyz;
    u_xlat11.xyz = (-u_xlat3.zxy) * vec3(0.5, 0.5, 0.5) + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat3.zxy * vec3(0.5, 0.5, 0.5) + u_xlat10.xyz;
    u_xlat10 = textureLod(_MainTex, u_xlat10.xyz, _Level);
    u_xlat10 = max(u_xlat10, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat11 = textureLod(_MainTex, u_xlat11.xyz, _Level);
    u_xlat11 = max(u_xlat11, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat12.xyz = max(u_xlat9.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat12.xyz = min(u_xlat12.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat13.xyz = u_xlat9.xyz + (-u_xlat12.xyz);
    u_xlat51 = max(abs(u_xlat13.y), abs(u_xlat13.x));
    u_xlat51 = max(abs(u_xlat13.z), u_xlat51);
    u_xlat12.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat13.xyz = (-u_xlat3.zxy) * vec3(0.5, 0.5, 0.5) + u_xlat12.xyz;
    u_xlat12.xyz = u_xlat3.zxy * vec3(0.5, 0.5, 0.5) + u_xlat12.xyz;
    u_xlat12 = textureLod(_MainTex, u_xlat12.xyz, _Level);
    u_xlat12 = max(u_xlat12, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat10 = u_xlat10 + u_xlat12;
    u_xlat12 = textureLod(_MainTex, u_xlat13.xyz, _Level);
    u_xlat12 = max(u_xlat12, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat11 = u_xlat11 + u_xlat12;
    u_xlat5 = u_xlat0.zzzz * u_xlat11 + u_xlat5;
    u_xlat11.xyz = max(u_xlat4.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat11.xyz = min(u_xlat11.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat12.xyz = u_xlat4.xyz + (-u_xlat11.xyz);
    u_xlat51 = max(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat51 = max(abs(u_xlat12.z), u_xlat51);
    u_xlat11.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat11.xyz;
    u_xlat12.xyz = (-u_xlat3.zxy) * vec3(0.5, 0.5, 0.5) + u_xlat11.xyz;
    u_xlat11.xyz = u_xlat3.zxy * vec3(0.5, 0.5, 0.5) + u_xlat11.xyz;
    u_xlat11 = textureLod(_MainTex, u_xlat11.xyz, _Level);
    u_xlat11 = max(u_xlat11, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat12 = textureLod(_MainTex, u_xlat12.xyz, _Level);
    u_xlat12 = max(u_xlat12, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat13.xyz = max(u_xlat6.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat13.xyz = min(u_xlat13.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat14.xyz = u_xlat6.xyz + (-u_xlat13.xyz);
    u_xlat51 = max(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat51 = max(abs(u_xlat14.z), u_xlat51);
    u_xlat13.xyz = (-vec3(u_xlat51)) * u_xlat1.xyz + u_xlat13.xyz;
    u_xlat14.xyz = (-u_xlat3.zxy) * vec3(0.5, 0.5, 0.5) + u_xlat13.xyz;
    u_xlat13.xyz = u_xlat3.zxy * vec3(0.5, 0.5, 0.5) + u_xlat13.xyz;
    u_xlat13 = textureLod(_MainTex, u_xlat13.xyz, _Level);
    u_xlat13 = max(u_xlat13, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat11 = u_xlat11 + u_xlat13;
    u_xlat11 = u_xlat0.yyyy * u_xlat11;
    u_xlat13 = textureLod(_MainTex, u_xlat14.xyz, _Level);
    u_xlat13 = max(u_xlat13, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat12 = u_xlat12 + u_xlat13;
    u_xlat12 = u_xlat0.yyyy * u_xlat12;
    u_xlat13.xyz = (-u_xlat3.xyz) * vec3(0.5, 0.5, 0.5) + vs_TEXCOORD0.xyz;
    u_xlat14.xyz = (-u_xlat3.zxy) * vec3(0.5, 0.5, 0.5) + u_xlat13.xyz;
    u_xlat13.xyz = u_xlat3.zxy * vec3(0.5, 0.5, 0.5) + u_xlat13.xyz;
    u_xlat13 = textureLod(_MainTex, u_xlat13.xyz, _Level);
    u_xlat13 = max(u_xlat13, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat14 = textureLod(_MainTex, u_xlat14.xyz, _Level);
    u_xlat14 = max(u_xlat14, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat15.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + vs_TEXCOORD0.xyz;
    u_xlat16.xyz = (-u_xlat3.zxy) * vec3(0.5, 0.5, 0.5) + u_xlat15.xyz;
    u_xlat15.xyz = u_xlat3.zxy * vec3(0.5, 0.5, 0.5) + u_xlat15.xyz;
    u_xlat15 = textureLod(_MainTex, u_xlat15.xyz, _Level);
    u_xlat15 = max(u_xlat15, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat13 = u_xlat13 + u_xlat15;
    u_xlat11 = u_xlat0.xxxx * u_xlat13 + u_xlat11;
    u_xlat13 = textureLod(_MainTex, u_xlat16.xyz, _Level);
    u_xlat13 = max(u_xlat13, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat13 = u_xlat13 + u_xlat14;
    u_xlat12 = u_xlat0.xxxx * u_xlat13 + u_xlat12;
    u_xlat5 = u_xlat5 + u_xlat12;
    u_xlat5 = u_xlat0.zzzz * u_xlat10 + u_xlat5;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(2.0, 2.0, 2.0));
    u_xlat5 = u_xlat11 + u_xlat5;
    u_xlat17.xyz = u_xlat3.zxy * vec3(1.5, 1.5, 1.5) + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat3.zxy * vec3(2.5, 2.5, 2.5) + u_xlat7.xyz;
    u_xlat10.xyz = max(u_xlat17.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat10.xyz = min(u_xlat10.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat17.xyz = u_xlat17.xyz + (-u_xlat10.xyz);
    u_xlat17.x = max(abs(u_xlat17.y), abs(u_xlat17.x));
    u_xlat17.x = max(abs(u_xlat17.z), u_xlat17.x);
    u_xlat17.xyz = (-u_xlat17.xxx) * u_xlat1.xyz + u_xlat10.xyz;
    u_xlat10 = textureLod(_MainTex, u_xlat17.xyz, _Level);
    u_xlat10 = max(u_xlat10, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat17.xyz = u_xlat3.zxy * vec3(1.5, 1.5, 1.5) + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat3.zxy * vec3(2.5, 2.5, 2.5) + u_xlat9.xyz;
    u_xlat11.xyz = max(u_xlat17.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat11.xyz = min(u_xlat11.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat17.xyz = u_xlat17.xyz + (-u_xlat11.xyz);
    u_xlat17.x = max(abs(u_xlat17.y), abs(u_xlat17.x));
    u_xlat17.x = max(abs(u_xlat17.z), u_xlat17.x);
    u_xlat17.xyz = (-u_xlat17.xxx) * u_xlat1.xyz + u_xlat11.xyz;
    u_xlat11 = textureLod(_MainTex, u_xlat17.xyz, _Level);
    u_xlat11 = max(u_xlat11, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat10 = u_xlat10 + u_xlat11;
    u_xlat5 = u_xlat8.zzzz * u_xlat10 + u_xlat5;
    u_xlat17.xyz = u_xlat3.zxy * vec3(1.5, 1.5, 1.5) + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat3.zxy * vec3(2.5, 2.5, 2.5) + u_xlat4.xyz;
    u_xlat10.xyz = max(u_xlat17.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat10.xyz = min(u_xlat10.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat17.xyz = u_xlat17.xyz + (-u_xlat10.xyz);
    u_xlat17.x = max(abs(u_xlat17.y), abs(u_xlat17.x));
    u_xlat17.x = max(abs(u_xlat17.z), u_xlat17.x);
    u_xlat17.xyz = (-u_xlat17.xxx) * u_xlat1.xyz + u_xlat10.xyz;
    u_xlat10 = textureLod(_MainTex, u_xlat17.xyz, _Level);
    u_xlat10 = max(u_xlat10, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat17.xyz = u_xlat3.zxy * vec3(1.5, 1.5, 1.5) + u_xlat6.xyz;
    u_xlat6.xyz = u_xlat3.zxy * vec3(2.5, 2.5, 2.5) + u_xlat6.xyz;
    u_xlat11.xyz = max(u_xlat17.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat11.xyz = min(u_xlat11.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat17.xyz = u_xlat17.xyz + (-u_xlat11.xyz);
    u_xlat17.x = max(abs(u_xlat17.y), abs(u_xlat17.x));
    u_xlat17.x = max(abs(u_xlat17.z), u_xlat17.x);
    u_xlat17.xyz = (-u_xlat17.xxx) * u_xlat1.xyz + u_xlat11.xyz;
    u_xlat11 = textureLod(_MainTex, u_xlat17.xyz, _Level);
    u_xlat11 = max(u_xlat11, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat10 = u_xlat10 + u_xlat11;
    u_xlat10 = u_xlat8.yyyy * u_xlat10;
    u_xlat17.xyz = u_xlat3.zxy * vec3(1.5, 1.5, 1.5) + vs_TEXCOORD0.xyz;
    u_xlat11.xyz = max(u_xlat17.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat11.xyz = min(u_xlat11.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat17.xyz = u_xlat17.xyz + (-u_xlat11.xyz);
    u_xlat17.x = max(abs(u_xlat17.y), abs(u_xlat17.x));
    u_xlat17.x = max(abs(u_xlat17.z), u_xlat17.x);
    u_xlat17.xyz = (-u_xlat17.xxx) * u_xlat1.xyz + u_xlat11.xyz;
    u_xlat11.xyz = (-u_xlat3.xyz) * vec3(0.5, 0.5, 0.5) + u_xlat17.xyz;
    u_xlat17.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat17.xyz;
    u_xlat12 = textureLod(_MainTex, u_xlat17.xyz, _Level);
    u_xlat12 = max(u_xlat12, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat11 = textureLod(_MainTex, u_xlat11.xyz, _Level);
    u_xlat11 = max(u_xlat11, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat11 = u_xlat12 + u_xlat11;
    u_xlat10 = u_xlat8.xxxx * u_xlat11 + u_xlat10;
    u_xlat17.x = dot(u_xlat8.xyz, vec3(2.0, 2.0, 2.0));
    u_xlat5 = u_xlat5 + u_xlat10;
    u_xlat8.xyz = max(u_xlat9.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat8.xyz = min(u_xlat8.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat9.xyz = (-u_xlat8.xyz) + u_xlat9.xyz;
    u_xlat34 = max(abs(u_xlat9.y), abs(u_xlat9.x));
    u_xlat34 = max(abs(u_xlat9.z), u_xlat34);
    u_xlat8.xyz = (-vec3(u_xlat34)) * u_xlat1.xyz + u_xlat8.xyz;
    u_xlat8 = textureLod(_MainTex, u_xlat8.xyz, _Level);
    u_xlat8 = max(u_xlat8, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat9.xyz = max(u_xlat7.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat9.xyz = min(u_xlat9.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat7.xyz = u_xlat7.xyz + (-u_xlat9.xyz);
    u_xlat34 = max(abs(u_xlat7.y), abs(u_xlat7.x));
    u_xlat34 = max(abs(u_xlat7.z), u_xlat34);
    u_xlat7.xyz = (-vec3(u_xlat34)) * u_xlat1.xyz + u_xlat9.xyz;
    u_xlat7 = textureLod(_MainTex, u_xlat7.xyz, _Level);
    u_xlat7 = max(u_xlat7, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat7 = u_xlat7 + u_xlat8;
    u_xlat5 = u_xlat2.zzzz * u_xlat7 + u_xlat5;
    u_xlat7.xyz = u_xlat3.zxy * vec3(2.5, 2.5, 2.5) + vs_TEXCOORD0.xyz;
    u_xlat8.xyz = max(u_xlat7.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat8.xyz = min(u_xlat8.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat7.xyz = u_xlat7.xyz + (-u_xlat8.xyz);
    u_xlat34 = max(abs(u_xlat7.y), abs(u_xlat7.x));
    u_xlat34 = max(abs(u_xlat7.z), u_xlat34);
    u_xlat7.xyz = (-vec3(u_xlat34)) * u_xlat1.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat7.xyz;
    u_xlat3.xyz = (-u_xlat3.xyz) * vec3(0.5, 0.5, 0.5) + u_xlat7.xyz;
    u_xlat3 = textureLod(_MainTex, u_xlat3.xyz, _Level);
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat7 = textureLod(_MainTex, u_xlat8.xyz, _Level);
    u_xlat7 = max(u_xlat7, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat3 = u_xlat3 + u_xlat7;
    u_xlat7.xyz = max(u_xlat6.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat7.xyz = min(u_xlat7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat6.xyz = u_xlat6.xyz + (-u_xlat7.xyz);
    u_xlat34 = max(abs(u_xlat6.y), abs(u_xlat6.x));
    u_xlat34 = max(abs(u_xlat6.z), u_xlat34);
    u_xlat6.xyz = (-vec3(u_xlat34)) * u_xlat1.xyz + u_xlat7.xyz;
    u_xlat6 = textureLod(_MainTex, u_xlat6.xyz, _Level);
    u_xlat6 = max(u_xlat6, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat7.xyz = max(u_xlat4.xyz, vec3(-1.0, -1.0, -1.0));
    u_xlat7.xyz = min(u_xlat7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat4.xyz = u_xlat4.xyz + (-u_xlat7.xyz);
    u_xlat34 = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat34 = max(abs(u_xlat4.z), u_xlat34);
    u_xlat1.xyz = (-vec3(u_xlat34)) * u_xlat1.xyz + u_xlat7.xyz;
    u_xlat1 = textureLod(_MainTex, u_xlat1.xyz, _Level);
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat1 + u_xlat6;
    u_xlat1 = u_xlat1 * u_xlat2.yyyy;
    u_xlat1 = u_xlat2.xxxx * u_xlat3 + u_xlat1;
    u_xlat34 = dot(u_xlat2.xyz, vec3(2.0, 2.0, 2.0));
    u_xlat1 = u_xlat1 + u_xlat5;
    u_xlat51 = u_xlat17.x + u_xlat34;
    u_xlat0.x = u_xlat0.x * 2.0 + u_xlat51;
    u_xlat0.x = u_xlat17.x + u_xlat0.x;
    u_xlat0.x = u_xlat34 + u_xlat0.x;
    SV_Target0 = u_xlat1 / u_xlat0.xxxx;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 91
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %82 %83 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 Location 82 
                                              OpDecorate %83 Location 83 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
               Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                         Input f32_4* %83 = OpVariable Input 
                                      %85 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_4 %84 = OpLoad %83 
                                              OpStore vs_TEXCOORD0 %84 
                          Output f32* %86 = OpAccessChain %72 %22 %68 
                                  f32 %87 = OpLoad %86 
                                  f32 %88 = OpFNegate %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                              OpStore %89 %88 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 2046
; Schema: 0
                                                OpCapability Shader 
                                         %1 = OpExtInstImport "GLSL.std.450" 
                                                OpMemoryModel Logical GLSL450 
                                                OpEntryPoint Fragment %4 "main" %34 %2040 
                                                OpExecutionMode %4 OriginUpperLeft 
                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                OpMemberDecorate %10 0 Offset 10 
                                                OpMemberDecorate %10 1 Offset 10 
                                                OpMemberDecorate %10 2 Offset 10 
                                                OpDecorate %10 Block 
                                                OpDecorate %12 DescriptorSet 12 
                                                OpDecorate %12 Binding 12 
                                                OpDecorate vs_TEXCOORD0 Location 34 
                                                OpDecorate %211 DescriptorSet 211 
                                                OpDecorate %211 Binding 211 
                                                OpDecorate %215 DescriptorSet 215 
                                                OpDecorate %215 Binding 215 
                                                OpDecorate %2040 Location 2040 
                                         %2 = OpTypeVoid 
                                         %3 = OpTypeFunction %2 
                                         %6 = OpTypeFloat 32 
                                         %7 = OpTypeVector %6 3 
                                         %8 = OpTypePointer Private %7 
                          Private f32_3* %9 = OpVariable Private 
                                        %10 = OpTypeStruct %6 %6 %6 
                                        %11 = OpTypePointer Uniform %10 
       Uniform struct {f32; f32; f32;}* %12 = OpVariable Uniform 
                                        %13 = OpTypeInt 32 1 
                                    i32 %14 = OpConstant 2 
                                        %15 = OpTypePointer Uniform %6 
                                        %18 = OpTypeInt 32 0 
                                    u32 %19 = OpConstant 0 
                                        %20 = OpTypePointer Private %6 
                                    f32 %22 = OpConstant 3.674022E-40 
                                    u32 %23 = OpConstant 1 
                                    f32 %25 = OpConstant 3.674022E-40 
                                    u32 %26 = OpConstant 2 
                                        %28 = OpTypeBool 
                                        %29 = OpTypeVector %28 3 
                                        %30 = OpTypePointer Private %29 
                        Private bool_3* %31 = OpVariable Private 
                                        %32 = OpTypeVector %6 4 
                                        %33 = OpTypePointer Input %32 
                  Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                    f32 %38 = OpConstant 3.674022E-40 
                                    f32 %39 = OpConstant 3.674022E-40 
                                  f32_4 %40 = OpConstantComposite %38 %38 %38 %39 
                                        %41 = OpTypeVector %28 4 
                                        %44 = OpTypePointer Private %32 
                         Private f32_4* %45 = OpVariable Private 
                                        %46 = OpTypePointer Private %28 
                         Private f32_3* %66 = OpVariable Private 
                                  f32_3 %71 = OpConstantComposite %38 %38 %38 
                           Private f32* %77 = OpVariable Private 
                           Private f32* %87 = OpVariable Private 
                                        %95 = OpTypeVector %6 2 
                                   f32 %117 = OpConstant 3.674022E-40 
                                 f32_3 %118 = OpConstantComposite %117 %117 %117 
                        Private f32_4* %126 = OpVariable Private 
                                   i32 %129 = OpConstant 1 
                        Private f32_3* %144 = OpVariable Private 
                                   f32 %148 = OpConstant 3.674022E-40 
                                 f32_3 %149 = OpConstantComposite %148 %148 %148 
                        Private f32_4* %154 = OpVariable Private 
                                   f32 %158 = OpConstant 3.674022E-40 
                                 f32_3 %159 = OpConstantComposite %158 %158 %158 
                        Private f32_4* %165 = OpVariable Private 
                                   f32 %168 = OpConstant 3.674022E-40 
                                 f32_3 %169 = OpConstantComposite %168 %168 %168 
                                       %209 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                       %210 = OpTypePointer UniformConstant %209 
UniformConstant read_only TextureCube* %211 = OpVariable UniformConstant 
                                       %213 = OpTypeSampler 
                                       %214 = OpTypePointer UniformConstant %213 
              UniformConstant sampler* %215 = OpVariable UniformConstant 
                                       %217 = OpTypeSampledImage %209 
                                   i32 %221 = OpConstant 0 
                                 f32_4 %226 = OpConstantComposite %39 %39 %39 %39 
                        Private f32_4* %236 = OpVariable Private 
                        Private f32_4* %246 = OpVariable Private 
                                   f32 %358 = OpConstant 3.674022E-40 
                                 f32_3 %359 = OpConstantComposite %358 %358 %358 
                        Private f32_3* %421 = OpVariable Private 
                        Private f32_4* %472 = OpVariable Private 
                        Private f32_4* %481 = OpVariable Private 
                        Private f32_4* %620 = OpVariable Private 
                        Private f32_4* %993 = OpVariable Private 
                       Private f32_4* %1159 = OpVariable Private 
                       Private f32_4* %1288 = OpVariable Private 
                       Private f32_3* %1297 = OpVariable Private 
                                  f32 %1360 = OpConstant 3.674022E-40 
                                f32_3 %1361 = OpConstantComposite %1360 %1360 %1360 
                       Private f32_3* %1367 = OpVariable Private 
                         Private f32* %1726 = OpVariable Private 
                                      %2039 = OpTypePointer Output %32 
                        Output f32_4* %2040 = OpVariable Output 
                                    void %4 = OpFunction None %3 
                                         %5 = OpLabel 
                           Uniform f32* %16 = OpAccessChain %12 %14 
                                    f32 %17 = OpLoad %16 
                           Private f32* %21 = OpAccessChain %9 %19 
                                                OpStore %21 %17 
                           Private f32* %24 = OpAccessChain %9 %23 
                                                OpStore %24 %22 
                           Private f32* %27 = OpAccessChain %9 %26 
                                                OpStore %27 %25 
                                  f32_4 %35 = OpLoad vs_TEXCOORD0 
                                  f32_4 %36 = OpVectorShuffle %35 %35 0 1 2 0 
                                  f32_4 %37 = OpExtInst %1 4 %36 
                                 bool_4 %42 = OpFOrdEqual %37 %40 
                                 bool_3 %43 = OpVectorShuffle %42 %42 0 1 2 
                                                OpStore %31 %43 
                          Private bool* %47 = OpAccessChain %31 %19 
                                   bool %48 = OpLoad %47 
                                    f32 %49 = OpSelect %48 %38 %39 
                           Private f32* %50 = OpAccessChain %45 %19 
                                                OpStore %50 %49 
                          Private bool* %51 = OpAccessChain %31 %23 
                                   bool %52 = OpLoad %51 
                                    f32 %53 = OpSelect %52 %38 %39 
                           Private f32* %54 = OpAccessChain %45 %23 
                                                OpStore %54 %53 
                          Private bool* %55 = OpAccessChain %31 %26 
                                   bool %56 = OpLoad %55 
                                    f32 %57 = OpSelect %56 %38 %39 
                           Private f32* %58 = OpAccessChain %45 %26 
                                                OpStore %58 %57 
                                  f32_4 %59 = OpLoad %45 
                                  f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                  f32_4 %61 = OpLoad vs_TEXCOORD0 
                                  f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                  f32_3 %63 = OpFMul %60 %62 
                                  f32_4 %64 = OpLoad %45 
                                  f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                                OpStore %45 %65 
                                  f32_4 %67 = OpLoad %45 
                                  f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                                  f32_3 %69 = OpExtInst %1 4 %68 
                                  f32_3 %70 = OpFNegate %69 
                                  f32_3 %72 = OpFAdd %70 %71 
                                                OpStore %66 %72 
                                  f32_3 %73 = OpLoad %66 
                                  f32_4 %74 = OpLoad vs_TEXCOORD0 
                                  f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                  f32_3 %76 = OpFMul %73 %75 
                                                OpStore %66 %76 
                                  f32_3 %78 = OpLoad %66 
                                  f32_3 %79 = OpLoad %66 
                                    f32 %80 = OpDot %78 %79 
                                                OpStore %77 %80 
                                    f32 %81 = OpLoad %77 
                                    f32 %82 = OpFAdd %81 %38 
                                                OpStore %77 %82 
                                    f32 %83 = OpLoad %77 
                                    f32 %84 = OpExtInst %1 31 %83 
                                                OpStore %77 %84 
                                    f32 %85 = OpLoad %77 
                                    f32 %86 = OpFDiv %38 %85 
                                                OpStore %77 %86 
                                    f32 %88 = OpLoad %77 
                                    f32 %89 = OpLoad %77 
                                    f32 %90 = OpFMul %88 %89 
                                                OpStore %87 %90 
                                    f32 %91 = OpLoad %77 
                                    f32 %92 = OpLoad %87 
                                    f32 %93 = OpFMul %91 %92 
                           Private f32* %94 = OpAccessChain %66 %19 
                                                OpStore %94 %93 
                                  f32_3 %96 = OpLoad %66 
                                  f32_2 %97 = OpVectorShuffle %96 %96 0 0 
                           Uniform f32* %98 = OpAccessChain %12 %14 
                                    f32 %99 = OpLoad %98 
                          Uniform f32* %100 = OpAccessChain %12 %14 
                                   f32 %101 = OpLoad %100 
                                 f32_2 %102 = OpCompositeConstruct %99 %101 
                                   f32 %103 = OpCompositeExtract %102 0 
                                   f32 %104 = OpCompositeExtract %102 1 
                                 f32_2 %105 = OpCompositeConstruct %103 %104 
                                 f32_2 %106 = OpFMul %97 %105 
                                 f32_3 %107 = OpLoad %66 
                                 f32_3 %108 = OpVectorShuffle %107 %106 0 3 4 
                                                OpStore %66 %108 
                                 f32_3 %109 = OpLoad %9 
                                 f32_3 %110 = OpLoad %66 
                                 f32_3 %111 = OpFMul %109 %110 
                                                OpStore %9 %111 
                                 f32_3 %112 = OpLoad %9 
                                 f32_3 %113 = OpLoad %9 
                                 f32_3 %114 = OpFNegate %113 
                                 f32_3 %115 = OpFMul %112 %114 
                                                OpStore %9 %115 
                                 f32_3 %116 = OpLoad %9 
                                 f32_3 %119 = OpFMul %116 %118 
                                                OpStore %9 %119 
                                 f32_3 %120 = OpLoad %9 
                                 f32_3 %121 = OpExtInst %1 29 %120 
                                                OpStore %9 %121 
                                 f32_3 %122 = OpLoad %9 
                                 f32_3 %123 = OpVectorShuffle %122 %122 2 2 2 
                                 f32_3 %124 = OpLoad %9 
                                 f32_3 %125 = OpFMul %123 %124 
                                                OpStore %66 %125 
                                 f32_4 %127 = OpLoad %45 
                                 f32_3 %128 = OpVectorShuffle %127 %127 2 0 1 
                          Uniform f32* %130 = OpAccessChain %12 %129 
                                   f32 %131 = OpLoad %130 
                          Uniform f32* %132 = OpAccessChain %12 %129 
                                   f32 %133 = OpLoad %132 
                          Uniform f32* %134 = OpAccessChain %12 %129 
                                   f32 %135 = OpLoad %134 
                                 f32_3 %136 = OpCompositeConstruct %131 %133 %135 
                                   f32 %137 = OpCompositeExtract %136 0 
                                   f32 %138 = OpCompositeExtract %136 1 
                                   f32 %139 = OpCompositeExtract %136 2 
                                 f32_3 %140 = OpCompositeConstruct %137 %138 %139 
                                 f32_3 %141 = OpFMul %128 %140 
                                 f32_4 %142 = OpLoad %126 
                                 f32_4 %143 = OpVectorShuffle %142 %141 4 5 6 3 
                                                OpStore %126 %143 
                                 f32_4 %145 = OpLoad %126 
                                 f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                 f32_3 %147 = OpFNegate %146 
                                 f32_3 %150 = OpFMul %147 %149 
                                 f32_4 %151 = OpLoad vs_TEXCOORD0 
                                 f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                 f32_3 %153 = OpFAdd %150 %152 
                                                OpStore %144 %153 
                                 f32_4 %155 = OpLoad %126 
                                 f32_3 %156 = OpVectorShuffle %155 %155 2 0 1 
                                 f32_3 %157 = OpFNegate %156 
                                 f32_3 %160 = OpFMul %157 %159 
                                 f32_3 %161 = OpLoad %144 
                                 f32_3 %162 = OpFAdd %160 %161 
                                 f32_4 %163 = OpLoad %154 
                                 f32_4 %164 = OpVectorShuffle %163 %162 4 5 6 3 
                                                OpStore %154 %164 
                                 f32_4 %166 = OpLoad %154 
                                 f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                 f32_3 %170 = OpExtInst %1 40 %167 %169 
                                 f32_4 %171 = OpLoad %165 
                                 f32_4 %172 = OpVectorShuffle %171 %170 4 5 6 3 
                                                OpStore %165 %172 
                                 f32_4 %173 = OpLoad %165 
                                 f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                 f32_3 %175 = OpExtInst %1 37 %174 %71 
                                 f32_4 %176 = OpLoad %165 
                                 f32_4 %177 = OpVectorShuffle %176 %175 4 5 6 3 
                                                OpStore %165 %177 
                                 f32_4 %178 = OpLoad %154 
                                 f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
                                 f32_4 %180 = OpLoad %165 
                                 f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                 f32_3 %182 = OpFNegate %181 
                                 f32_3 %183 = OpFAdd %179 %182 
                                 f32_4 %184 = OpLoad %154 
                                 f32_4 %185 = OpVectorShuffle %184 %183 4 5 6 3 
                                                OpStore %154 %185 
                          Private f32* %186 = OpAccessChain %154 %23 
                                   f32 %187 = OpLoad %186 
                                   f32 %188 = OpExtInst %1 4 %187 
                          Private f32* %189 = OpAccessChain %154 %19 
                                   f32 %190 = OpLoad %189 
                                   f32 %191 = OpExtInst %1 4 %190 
                                   f32 %192 = OpExtInst %1 40 %188 %191 
                                                OpStore %77 %192 
                          Private f32* %193 = OpAccessChain %154 %26 
                                   f32 %194 = OpLoad %193 
                                   f32 %195 = OpExtInst %1 4 %194 
                                   f32 %196 = OpLoad %77 
                                   f32 %197 = OpExtInst %1 40 %195 %196 
                                                OpStore %77 %197 
                                   f32 %198 = OpLoad %77 
                                 f32_3 %199 = OpCompositeConstruct %198 %198 %198 
                                 f32_3 %200 = OpFNegate %199 
                                 f32_4 %201 = OpLoad %45 
                                 f32_3 %202 = OpVectorShuffle %201 %201 0 1 2 
                                 f32_3 %203 = OpFMul %200 %202 
                                 f32_4 %204 = OpLoad %165 
                                 f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                 f32_3 %206 = OpFAdd %203 %205 
                                 f32_4 %207 = OpLoad %154 
                                 f32_4 %208 = OpVectorShuffle %207 %206 4 5 6 3 
                                                OpStore %154 %208 
                 read_only TextureCube %212 = OpLoad %211 
                               sampler %216 = OpLoad %215 
          read_only TextureCubeSampled %218 = OpSampledImage %212 %216 
                                 f32_4 %219 = OpLoad %154 
                                 f32_3 %220 = OpVectorShuffle %219 %219 0 1 2 
                          Uniform f32* %222 = OpAccessChain %12 %221 
                                   f32 %223 = OpLoad %222 
                                 f32_4 %224 = OpImageSampleExplicitLod %218 %220 Lod %32 
                                                OpStore %154 %224 
                                 f32_4 %225 = OpLoad %154 
                                 f32_4 %227 = OpExtInst %1 40 %225 %226 
                                                OpStore %154 %227 
                                 f32_4 %228 = OpLoad %126 
                                 f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
                                 f32_3 %230 = OpFMul %229 %149 
                                 f32_4 %231 = OpLoad vs_TEXCOORD0 
                                 f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                                 f32_3 %233 = OpFAdd %230 %232 
                                 f32_4 %234 = OpLoad %165 
                                 f32_4 %235 = OpVectorShuffle %234 %233 4 5 6 3 
                                                OpStore %165 %235 
                                 f32_4 %237 = OpLoad %126 
                                 f32_3 %238 = OpVectorShuffle %237 %237 2 0 1 
                                 f32_3 %239 = OpFNegate %238 
                                 f32_3 %240 = OpFMul %239 %159 
                                 f32_4 %241 = OpLoad %165 
                                 f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                                 f32_3 %243 = OpFAdd %240 %242 
                                 f32_4 %244 = OpLoad %236 
                                 f32_4 %245 = OpVectorShuffle %244 %243 4 5 6 3 
                                                OpStore %236 %245 
                                 f32_4 %247 = OpLoad %236 
                                 f32_3 %248 = OpVectorShuffle %247 %247 0 1 2 
                                 f32_3 %249 = OpExtInst %1 40 %248 %169 
                                 f32_4 %250 = OpLoad %246 
                                 f32_4 %251 = OpVectorShuffle %250 %249 4 5 6 3 
                                                OpStore %246 %251 
                                 f32_4 %252 = OpLoad %246 
                                 f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                                 f32_3 %254 = OpExtInst %1 37 %253 %71 
                                 f32_4 %255 = OpLoad %246 
                                 f32_4 %256 = OpVectorShuffle %255 %254 4 5 6 3 
                                                OpStore %246 %256 
                                 f32_4 %257 = OpLoad %236 
                                 f32_3 %258 = OpVectorShuffle %257 %257 0 1 2 
                                 f32_4 %259 = OpLoad %246 
                                 f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                                 f32_3 %261 = OpFNegate %260 
                                 f32_3 %262 = OpFAdd %258 %261 
                                 f32_4 %263 = OpLoad %236 
                                 f32_4 %264 = OpVectorShuffle %263 %262 4 5 6 3 
                                                OpStore %236 %264 
                          Private f32* %265 = OpAccessChain %236 %23 
                                   f32 %266 = OpLoad %265 
                                   f32 %267 = OpExtInst %1 4 %266 
                          Private f32* %268 = OpAccessChain %236 %19 
                                   f32 %269 = OpLoad %268 
                                   f32 %270 = OpExtInst %1 4 %269 
                                   f32 %271 = OpExtInst %1 40 %267 %270 
                                                OpStore %77 %271 
                          Private f32* %272 = OpAccessChain %236 %26 
                                   f32 %273 = OpLoad %272 
                                   f32 %274 = OpExtInst %1 4 %273 
                                   f32 %275 = OpLoad %77 
                                   f32 %276 = OpExtInst %1 40 %274 %275 
                                                OpStore %77 %276 
                                   f32 %277 = OpLoad %77 
                                 f32_3 %278 = OpCompositeConstruct %277 %277 %277 
                                 f32_3 %279 = OpFNegate %278 
                                 f32_4 %280 = OpLoad %45 
                                 f32_3 %281 = OpVectorShuffle %280 %280 0 1 2 
                                 f32_3 %282 = OpFMul %279 %281 
                                 f32_4 %283 = OpLoad %246 
                                 f32_3 %284 = OpVectorShuffle %283 %283 0 1 2 
                                 f32_3 %285 = OpFAdd %282 %284 
                                 f32_4 %286 = OpLoad %236 
                                 f32_4 %287 = OpVectorShuffle %286 %285 4 5 6 3 
                                                OpStore %236 %287 
                 read_only TextureCube %288 = OpLoad %211 
                               sampler %289 = OpLoad %215 
          read_only TextureCubeSampled %290 = OpSampledImage %288 %289 
                                 f32_4 %291 = OpLoad %236 
                                 f32_3 %292 = OpVectorShuffle %291 %291 0 1 2 
                          Uniform f32* %293 = OpAccessChain %12 %221 
                                   f32 %294 = OpLoad %293 
                                 f32_4 %295 = OpImageSampleExplicitLod %290 %292 Lod %32 
                                                OpStore %236 %295 
                                 f32_4 %296 = OpLoad %236 
                                 f32_4 %297 = OpExtInst %1 40 %296 %226 
                                                OpStore %236 %297 
                                 f32_4 %298 = OpLoad %154 
                                 f32_4 %299 = OpLoad %236 
                                 f32_4 %300 = OpFAdd %298 %299 
                                                OpStore %154 %300 
                                 f32_3 %301 = OpLoad %66 
                                 f32_4 %302 = OpVectorShuffle %301 %301 1 1 1 1 
                                 f32_4 %303 = OpLoad %154 
                                 f32_4 %304 = OpFMul %302 %303 
                                                OpStore %154 %304 
                                 f32_4 %305 = OpLoad %126 
                                 f32_3 %306 = OpVectorShuffle %305 %305 2 0 1 
                                 f32_3 %307 = OpFNegate %306 
                                 f32_3 %308 = OpFMul %307 %159 
                                 f32_4 %309 = OpLoad vs_TEXCOORD0 
                                 f32_3 %310 = OpVectorShuffle %309 %309 0 1 2 
                                 f32_3 %311 = OpFAdd %308 %310 
                                 f32_4 %312 = OpLoad %236 
                                 f32_4 %313 = OpVectorShuffle %312 %311 4 5 6 3 
                                                OpStore %236 %313 
                                 f32_4 %314 = OpLoad %236 
                                 f32_3 %315 = OpVectorShuffle %314 %314 0 1 2 
                                 f32_3 %316 = OpExtInst %1 40 %315 %169 
                                 f32_4 %317 = OpLoad %246 
                                 f32_4 %318 = OpVectorShuffle %317 %316 4 5 6 3 
                                                OpStore %246 %318 
                                 f32_4 %319 = OpLoad %246 
                                 f32_3 %320 = OpVectorShuffle %319 %319 0 1 2 
                                 f32_3 %321 = OpExtInst %1 37 %320 %71 
                                 f32_4 %322 = OpLoad %246 
                                 f32_4 %323 = OpVectorShuffle %322 %321 4 5 6 3 
                                                OpStore %246 %323 
                                 f32_4 %324 = OpLoad %236 
                                 f32_3 %325 = OpVectorShuffle %324 %324 0 1 2 
                                 f32_4 %326 = OpLoad %246 
                                 f32_3 %327 = OpVectorShuffle %326 %326 0 1 2 
                                 f32_3 %328 = OpFNegate %327 
                                 f32_3 %329 = OpFAdd %325 %328 
                                 f32_4 %330 = OpLoad %236 
                                 f32_4 %331 = OpVectorShuffle %330 %329 4 5 6 3 
                                                OpStore %236 %331 
                          Private f32* %332 = OpAccessChain %236 %23 
                                   f32 %333 = OpLoad %332 
                                   f32 %334 = OpExtInst %1 4 %333 
                          Private f32* %335 = OpAccessChain %236 %19 
                                   f32 %336 = OpLoad %335 
                                   f32 %337 = OpExtInst %1 4 %336 
                                   f32 %338 = OpExtInst %1 40 %334 %337 
                                                OpStore %77 %338 
                          Private f32* %339 = OpAccessChain %236 %26 
                                   f32 %340 = OpLoad %339 
                                   f32 %341 = OpExtInst %1 4 %340 
                                   f32 %342 = OpLoad %77 
                                   f32 %343 = OpExtInst %1 40 %341 %342 
                                                OpStore %77 %343 
                                   f32 %344 = OpLoad %77 
                                 f32_3 %345 = OpCompositeConstruct %344 %344 %344 
                                 f32_3 %346 = OpFNegate %345 
                                 f32_4 %347 = OpLoad %45 
                                 f32_3 %348 = OpVectorShuffle %347 %347 0 1 2 
                                 f32_3 %349 = OpFMul %346 %348 
                                 f32_4 %350 = OpLoad %246 
                                 f32_3 %351 = OpVectorShuffle %350 %350 0 1 2 
                                 f32_3 %352 = OpFAdd %349 %351 
                                 f32_4 %353 = OpLoad %236 
                                 f32_4 %354 = OpVectorShuffle %353 %352 4 5 6 3 
                                                OpStore %236 %354 
                                 f32_4 %355 = OpLoad %126 
                                 f32_3 %356 = OpVectorShuffle %355 %355 0 1 2 
                                 f32_3 %357 = OpFNegate %356 
                                 f32_3 %360 = OpFMul %357 %359 
                                 f32_4 %361 = OpLoad %236 
                                 f32_3 %362 = OpVectorShuffle %361 %361 0 1 2 
                                 f32_3 %363 = OpFAdd %360 %362 
                                 f32_4 %364 = OpLoad %246 
                                 f32_4 %365 = OpVectorShuffle %364 %363 4 5 6 3 
                                                OpStore %246 %365 
                                 f32_4 %366 = OpLoad %126 
                                 f32_3 %367 = OpVectorShuffle %366 %366 0 1 2 
                                 f32_3 %368 = OpFMul %367 %359 
                                 f32_4 %369 = OpLoad %236 
                                 f32_3 %370 = OpVectorShuffle %369 %369 0 1 2 
                                 f32_3 %371 = OpFAdd %368 %370 
                                 f32_4 %372 = OpLoad %236 
                                 f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
                                                OpStore %236 %373 
                 read_only TextureCube %374 = OpLoad %211 
                               sampler %375 = OpLoad %215 
          read_only TextureCubeSampled %376 = OpSampledImage %374 %375 
                                 f32_4 %377 = OpLoad %236 
                                 f32_3 %378 = OpVectorShuffle %377 %377 0 1 2 
                          Uniform f32* %379 = OpAccessChain %12 %221 
                                   f32 %380 = OpLoad %379 
                                 f32_4 %381 = OpImageSampleExplicitLod %376 %378 Lod %32 
                                                OpStore %236 %381 
                                 f32_4 %382 = OpLoad %236 
                                 f32_4 %383 = OpExtInst %1 40 %382 %226 
                                                OpStore %236 %383 
                 read_only TextureCube %384 = OpLoad %211 
                               sampler %385 = OpLoad %215 
          read_only TextureCubeSampled %386 = OpSampledImage %384 %385 
                                 f32_4 %387 = OpLoad %246 
                                 f32_3 %388 = OpVectorShuffle %387 %387 0 1 2 
                          Uniform f32* %389 = OpAccessChain %12 %221 
                                   f32 %390 = OpLoad %389 
                                 f32_4 %391 = OpImageSampleExplicitLod %386 %388 Lod %32 
                                                OpStore %246 %391 
                                 f32_4 %392 = OpLoad %246 
                                 f32_4 %393 = OpExtInst %1 40 %392 %226 
                                                OpStore %246 %393 
                                 f32_4 %394 = OpLoad %236 
                                 f32_4 %395 = OpLoad %246 
                                 f32_4 %396 = OpFAdd %394 %395 
                                                OpStore %236 %396 
                                 f32_3 %397 = OpLoad %66 
                                 f32_4 %398 = OpVectorShuffle %397 %397 0 0 0 0 
                                 f32_4 %399 = OpLoad %236 
                                 f32_4 %400 = OpFMul %398 %399 
                                 f32_4 %401 = OpLoad %154 
                                 f32_4 %402 = OpFAdd %400 %401 
                                                OpStore %154 %402 
                                 f32_4 %403 = OpLoad %126 
                                 f32_3 %404 = OpVectorShuffle %403 %403 0 1 2 
                                 f32_3 %405 = OpFNegate %404 
                                 f32_3 %406 = OpFMul %405 %159 
                                 f32_4 %407 = OpLoad vs_TEXCOORD0 
                                 f32_3 %408 = OpVectorShuffle %407 %407 0 1 2 
                                 f32_3 %409 = OpFAdd %406 %408 
                                 f32_4 %410 = OpLoad %236 
                                 f32_4 %411 = OpVectorShuffle %410 %409 4 5 6 3 
                                                OpStore %236 %411 
                                 f32_4 %412 = OpLoad %126 
                                 f32_3 %413 = OpVectorShuffle %412 %412 2 0 1 
                                 f32_3 %414 = OpFNegate %413 
                                 f32_3 %415 = OpFMul %414 %159 
                                 f32_4 %416 = OpLoad %236 
                                 f32_3 %417 = OpVectorShuffle %416 %416 0 1 2 
                                 f32_3 %418 = OpFAdd %415 %417 
                                 f32_4 %419 = OpLoad %246 
                                 f32_4 %420 = OpVectorShuffle %419 %418 4 5 6 3 
                                                OpStore %246 %420 
                                 f32_4 %422 = OpLoad %246 
                                 f32_3 %423 = OpVectorShuffle %422 %422 0 1 2 
                                 f32_3 %424 = OpExtInst %1 40 %423 %169 
                                                OpStore %421 %424 
                                 f32_3 %425 = OpLoad %421 
                                 f32_3 %426 = OpExtInst %1 37 %425 %71 
                                                OpStore %421 %426 
                                 f32_4 %427 = OpLoad %246 
                                 f32_3 %428 = OpVectorShuffle %427 %427 0 1 2 
                                 f32_3 %429 = OpLoad %421 
                                 f32_3 %430 = OpFNegate %429 
                                 f32_3 %431 = OpFAdd %428 %430 
                                 f32_4 %432 = OpLoad %246 
                                 f32_4 %433 = OpVectorShuffle %432 %431 4 5 6 3 
                                                OpStore %246 %433 
                          Private f32* %434 = OpAccessChain %246 %23 
                                   f32 %435 = OpLoad %434 
                                   f32 %436 = OpExtInst %1 4 %435 
                          Private f32* %437 = OpAccessChain %246 %19 
                                   f32 %438 = OpLoad %437 
                                   f32 %439 = OpExtInst %1 4 %438 
                                   f32 %440 = OpExtInst %1 40 %436 %439 
                                                OpStore %77 %440 
                          Private f32* %441 = OpAccessChain %246 %26 
                                   f32 %442 = OpLoad %441 
                                   f32 %443 = OpExtInst %1 4 %442 
                                   f32 %444 = OpLoad %77 
                                   f32 %445 = OpExtInst %1 40 %443 %444 
                                                OpStore %77 %445 
                                   f32 %446 = OpLoad %77 
                                 f32_3 %447 = OpCompositeConstruct %446 %446 %446 
                                 f32_3 %448 = OpFNegate %447 
                                 f32_4 %449 = OpLoad %45 
                                 f32_3 %450 = OpVectorShuffle %449 %449 0 1 2 
                                 f32_3 %451 = OpFMul %448 %450 
                                 f32_3 %452 = OpLoad %421 
                                 f32_3 %453 = OpFAdd %451 %452 
                                 f32_4 %454 = OpLoad %246 
                                 f32_4 %455 = OpVectorShuffle %454 %453 4 5 6 3 
                                                OpStore %246 %455 
                 read_only TextureCube %456 = OpLoad %211 
                               sampler %457 = OpLoad %215 
          read_only TextureCubeSampled %458 = OpSampledImage %456 %457 
                                 f32_4 %459 = OpLoad %246 
                                 f32_3 %460 = OpVectorShuffle %459 %459 0 1 2 
                          Uniform f32* %461 = OpAccessChain %12 %221 
                                   f32 %462 = OpLoad %461 
                                 f32_4 %463 = OpImageSampleExplicitLod %458 %460 Lod %32 
                                                OpStore %246 %463 
                                 f32_4 %464 = OpLoad %246 
                                 f32_4 %465 = OpExtInst %1 40 %464 %226 
                                                OpStore %246 %465 
                                 f32_4 %466 = OpLoad %126 
                                 f32_3 %467 = OpVectorShuffle %466 %466 0 1 2 
                                 f32_3 %468 = OpFMul %467 %159 
                                 f32_4 %469 = OpLoad vs_TEXCOORD0 
                                 f32_3 %470 = OpVectorShuffle %469 %469 0 1 2 
                                 f32_3 %471 = OpFAdd %468 %470 
                                                OpStore %421 %471 
                                 f32_4 %473 = OpLoad %126 
                                 f32_3 %474 = OpVectorShuffle %473 %473 2 0 1 
                                 f32_3 %475 = OpFNegate %474 
                                 f32_3 %476 = OpFMul %475 %159 
                                 f32_3 %477 = OpLoad %421 
                                 f32_3 %478 = OpFAdd %476 %477 
                                 f32_4 %479 = OpLoad %472 
                                 f32_4 %480 = OpVectorShuffle %479 %478 4 5 6 3 
                                                OpStore %472 %480 
                                 f32_4 %482 = OpLoad %472 
                                 f32_3 %483 = OpVectorShuffle %482 %482 0 1 2 
                                 f32_3 %484 = OpExtInst %1 40 %483 %169 
                                 f32_4 %485 = OpLoad %481 
                                 f32_4 %486 = OpVectorShuffle %485 %484 4 5 6 3 
                                                OpStore %481 %486 
                                 f32_4 %487 = OpLoad %481 
                                 f32_3 %488 = OpVectorShuffle %487 %487 0 1 2 
                                 f32_3 %489 = OpExtInst %1 37 %488 %71 
                                 f32_4 %490 = OpLoad %481 
                                 f32_4 %491 = OpVectorShuffle %490 %489 4 5 6 3 
                                                OpStore %481 %491 
                                 f32_4 %492 = OpLoad %472 
                                 f32_3 %493 = OpVectorShuffle %492 %492 0 1 2 
                                 f32_4 %494 = OpLoad %481 
                                 f32_3 %495 = OpVectorShuffle %494 %494 0 1 2 
                                 f32_3 %496 = OpFNegate %495 
                                 f32_3 %497 = OpFAdd %493 %496 
                                 f32_4 %498 = OpLoad %472 
                                 f32_4 %499 = OpVectorShuffle %498 %497 4 5 6 3 
                                                OpStore %472 %499 
                          Private f32* %500 = OpAccessChain %472 %23 
                                   f32 %501 = OpLoad %500 
                                   f32 %502 = OpExtInst %1 4 %501 
                          Private f32* %503 = OpAccessChain %472 %19 
                                   f32 %504 = OpLoad %503 
                                   f32 %505 = OpExtInst %1 4 %504 
                                   f32 %506 = OpExtInst %1 40 %502 %505 
                                                OpStore %77 %506 
                          Private f32* %507 = OpAccessChain %472 %26 
                                   f32 %508 = OpLoad %507 
                                   f32 %509 = OpExtInst %1 4 %508 
                                   f32 %510 = OpLoad %77 
                                   f32 %511 = OpExtInst %1 40 %509 %510 
                                                OpStore %77 %511 
                                   f32 %512 = OpLoad %77 
                                 f32_3 %513 = OpCompositeConstruct %512 %512 %512 
                                 f32_3 %514 = OpFNegate %513 
                                 f32_4 %515 = OpLoad %45 
                                 f32_3 %516 = OpVectorShuffle %515 %515 0 1 2 
                                 f32_3 %517 = OpFMul %514 %516 
                                 f32_4 %518 = OpLoad %481 
                                 f32_3 %519 = OpVectorShuffle %518 %518 0 1 2 
                                 f32_3 %520 = OpFAdd %517 %519 
                                 f32_4 %521 = OpLoad %472 
                                 f32_4 %522 = OpVectorShuffle %521 %520 4 5 6 3 
                                                OpStore %472 %522 
                 read_only TextureCube %523 = OpLoad %211 
                               sampler %524 = OpLoad %215 
          read_only TextureCubeSampled %525 = OpSampledImage %523 %524 
                                 f32_4 %526 = OpLoad %472 
                                 f32_3 %527 = OpVectorShuffle %526 %526 0 1 2 
                          Uniform f32* %528 = OpAccessChain %12 %221 
                                   f32 %529 = OpLoad %528 
                                 f32_4 %530 = OpImageSampleExplicitLod %525 %527 Lod %32 
                                                OpStore %472 %530 
                                 f32_4 %531 = OpLoad %472 
                                 f32_4 %532 = OpExtInst %1 40 %531 %226 
                                                OpStore %472 %532 
                                 f32_4 %533 = OpLoad %246 
                                 f32_4 %534 = OpLoad %472 
                                 f32_4 %535 = OpFAdd %533 %534 
                                                OpStore %246 %535 
                                 f32_3 %536 = OpLoad %66 
                                 f32_4 %537 = OpVectorShuffle %536 %536 2 2 2 2 
                                 f32_4 %538 = OpLoad %246 
                                 f32_4 %539 = OpFMul %537 %538 
                                 f32_4 %540 = OpLoad %154 
                                 f32_4 %541 = OpFAdd %539 %540 
                                                OpStore %154 %541 
                                 f32_3 %542 = OpLoad %9 
                                 f32_3 %543 = OpVectorShuffle %542 %542 1 1 1 
                                 f32_3 %544 = OpLoad %9 
                                 f32_3 %545 = OpFMul %543 %544 
                                 f32_4 %546 = OpLoad %246 
                                 f32_4 %547 = OpVectorShuffle %546 %545 4 5 6 3 
                                                OpStore %246 %547 
                                 f32_3 %548 = OpLoad %9 
                                 f32_3 %549 = OpVectorShuffle %548 %548 0 0 0 
                                 f32_3 %550 = OpLoad %9 
                                 f32_3 %551 = OpFMul %549 %550 
                                                OpStore %9 %551 
                                 f32_4 %552 = OpLoad %126 
                                 f32_3 %553 = OpVectorShuffle %552 %552 2 0 1 
                                 f32_3 %554 = OpFNegate %553 
                                 f32_3 %555 = OpFMul %554 %149 
                                 f32_3 %556 = OpLoad %421 
                                 f32_3 %557 = OpFAdd %555 %556 
                                 f32_4 %558 = OpLoad %472 
                                 f32_4 %559 = OpVectorShuffle %558 %557 4 5 6 3 
                                                OpStore %472 %559 
                                 f32_4 %560 = OpLoad %472 
                                 f32_3 %561 = OpVectorShuffle %560 %560 0 1 2 
                                 f32_3 %562 = OpExtInst %1 40 %561 %169 
                                 f32_4 %563 = OpLoad %481 
                                 f32_4 %564 = OpVectorShuffle %563 %562 4 5 6 3 
                                                OpStore %481 %564 
                                 f32_4 %565 = OpLoad %481 
                                 f32_3 %566 = OpVectorShuffle %565 %565 0 1 2 
                                 f32_3 %567 = OpExtInst %1 37 %566 %71 
                                 f32_4 %568 = OpLoad %481 
                                 f32_4 %569 = OpVectorShuffle %568 %567 4 5 6 3 
                                                OpStore %481 %569 
                                 f32_4 %570 = OpLoad %472 
                                 f32_3 %571 = OpVectorShuffle %570 %570 0 1 2 
                                 f32_4 %572 = OpLoad %481 
                                 f32_3 %573 = OpVectorShuffle %572 %572 0 1 2 
                                 f32_3 %574 = OpFNegate %573 
                                 f32_3 %575 = OpFAdd %571 %574 
                                 f32_4 %576 = OpLoad %472 
                                 f32_4 %577 = OpVectorShuffle %576 %575 4 5 6 3 
                                                OpStore %472 %577 
                          Private f32* %578 = OpAccessChain %472 %23 
                                   f32 %579 = OpLoad %578 
                                   f32 %580 = OpExtInst %1 4 %579 
                          Private f32* %581 = OpAccessChain %472 %19 
                                   f32 %582 = OpLoad %581 
                                   f32 %583 = OpExtInst %1 4 %582 
                                   f32 %584 = OpExtInst %1 40 %580 %583 
                                                OpStore %77 %584 
                          Private f32* %585 = OpAccessChain %472 %26 
                                   f32 %586 = OpLoad %585 
                                   f32 %587 = OpExtInst %1 4 %586 
                                   f32 %588 = OpLoad %77 
                                   f32 %589 = OpExtInst %1 40 %587 %588 
                                                OpStore %77 %589 
                                   f32 %590 = OpLoad %77 
                                 f32_3 %591 = OpCompositeConstruct %590 %590 %590 
                                 f32_3 %592 = OpFNegate %591 
                                 f32_4 %593 = OpLoad %45 
                                 f32_3 %594 = OpVectorShuffle %593 %593 0 1 2 
                                 f32_3 %595 = OpFMul %592 %594 
                                 f32_4 %596 = OpLoad %481 
                                 f32_3 %597 = OpVectorShuffle %596 %596 0 1 2 
                                 f32_3 %598 = OpFAdd %595 %597 
                                 f32_4 %599 = OpLoad %472 
                                 f32_4 %600 = OpVectorShuffle %599 %598 4 5 6 3 
                                                OpStore %472 %600 
                 read_only TextureCube %601 = OpLoad %211 
                               sampler %602 = OpLoad %215 
          read_only TextureCubeSampled %603 = OpSampledImage %601 %602 
                                 f32_4 %604 = OpLoad %472 
                                 f32_3 %605 = OpVectorShuffle %604 %604 0 1 2 
                          Uniform f32* %606 = OpAccessChain %12 %221 
                                   f32 %607 = OpLoad %606 
                                 f32_4 %608 = OpImageSampleExplicitLod %603 %605 Lod %32 
                                                OpStore %472 %608 
                                 f32_4 %609 = OpLoad %472 
                                 f32_4 %610 = OpExtInst %1 40 %609 %226 
                                                OpStore %472 %610 
                                 f32_4 %611 = OpLoad %126 
                                 f32_3 %612 = OpVectorShuffle %611 %611 2 0 1 
                                 f32_3 %613 = OpFNegate %612 
                                 f32_3 %614 = OpFMul %613 %149 
                                 f32_4 %615 = OpLoad %236 
                                 f32_3 %616 = OpVectorShuffle %615 %615 0 1 2 
                                 f32_3 %617 = OpFAdd %614 %616 
                                 f32_4 %618 = OpLoad %481 
                                 f32_4 %619 = OpVectorShuffle %618 %617 4 5 6 3 
                                                OpStore %481 %619 
                                 f32_4 %621 = OpLoad %481 
                                 f32_3 %622 = OpVectorShuffle %621 %621 0 1 2 
                                 f32_3 %623 = OpExtInst %1 40 %622 %169 
                                 f32_4 %624 = OpLoad %620 
                                 f32_4 %625 = OpVectorShuffle %624 %623 4 5 6 3 
                                                OpStore %620 %625 
                                 f32_4 %626 = OpLoad %620 
                                 f32_3 %627 = OpVectorShuffle %626 %626 0 1 2 
                                 f32_3 %628 = OpExtInst %1 37 %627 %71 
                                 f32_4 %629 = OpLoad %620 
                                 f32_4 %630 = OpVectorShuffle %629 %628 4 5 6 3 
                                                OpStore %620 %630 
                                 f32_4 %631 = OpLoad %481 
                                 f32_3 %632 = OpVectorShuffle %631 %631 0 1 2 
                                 f32_4 %633 = OpLoad %620 
                                 f32_3 %634 = OpVectorShuffle %633 %633 0 1 2 
                                 f32_3 %635 = OpFNegate %634 
                                 f32_3 %636 = OpFAdd %632 %635 
                                 f32_4 %637 = OpLoad %481 
                                 f32_4 %638 = OpVectorShuffle %637 %636 4 5 6 3 
                                                OpStore %481 %638 
                          Private f32* %639 = OpAccessChain %481 %23 
                                   f32 %640 = OpLoad %639 
                                   f32 %641 = OpExtInst %1 4 %640 
                          Private f32* %642 = OpAccessChain %481 %19 
                                   f32 %643 = OpLoad %642 
                                   f32 %644 = OpExtInst %1 4 %643 
                                   f32 %645 = OpExtInst %1 40 %641 %644 
                                                OpStore %77 %645 
                          Private f32* %646 = OpAccessChain %481 %26 
                                   f32 %647 = OpLoad %646 
                                   f32 %648 = OpExtInst %1 4 %647 
                                   f32 %649 = OpLoad %77 
                                   f32 %650 = OpExtInst %1 40 %648 %649 
                                                OpStore %77 %650 
                                   f32 %651 = OpLoad %77 
                                 f32_3 %652 = OpCompositeConstruct %651 %651 %651 
                                 f32_3 %653 = OpFNegate %652 
                                 f32_4 %654 = OpLoad %45 
                                 f32_3 %655 = OpVectorShuffle %654 %654 0 1 2 
                                 f32_3 %656 = OpFMul %653 %655 
                                 f32_4 %657 = OpLoad %620 
                                 f32_3 %658 = OpVectorShuffle %657 %657 0 1 2 
                                 f32_3 %659 = OpFAdd %656 %658 
                                 f32_4 %660 = OpLoad %481 
                                 f32_4 %661 = OpVectorShuffle %660 %659 4 5 6 3 
                                                OpStore %481 %661 
                 read_only TextureCube %662 = OpLoad %211 
                               sampler %663 = OpLoad %215 
          read_only TextureCubeSampled %664 = OpSampledImage %662 %663 
                                 f32_4 %665 = OpLoad %481 
                                 f32_3 %666 = OpVectorShuffle %665 %665 0 1 2 
                          Uniform f32* %667 = OpAccessChain %12 %221 
                                   f32 %668 = OpLoad %667 
                                 f32_4 %669 = OpImageSampleExplicitLod %664 %666 Lod %32 
                                                OpStore %481 %669 
                                 f32_4 %670 = OpLoad %481 
                                 f32_4 %671 = OpExtInst %1 40 %670 %226 
                                                OpStore %481 %671 
                                 f32_4 %672 = OpLoad %472 
                                 f32_4 %673 = OpLoad %481 
                                 f32_4 %674 = OpFAdd %672 %673 
                                                OpStore %472 %674 
                                 f32_4 %675 = OpLoad %246 
                                 f32_4 %676 = OpVectorShuffle %675 %675 2 2 2 2 
                                 f32_4 %677 = OpLoad %472 
                                 f32_4 %678 = OpFMul %676 %677 
                                 f32_4 %679 = OpLoad %154 
                                 f32_4 %680 = OpFAdd %678 %679 
                                                OpStore %154 %680 
                                 f32_4 %681 = OpLoad %126 
                                 f32_3 %682 = OpVectorShuffle %681 %681 2 0 1 
                                 f32_3 %683 = OpFNegate %682 
                                 f32_3 %684 = OpFMul %683 %149 
                                 f32_4 %685 = OpLoad %165 
                                 f32_3 %686 = OpVectorShuffle %685 %685 0 1 2 
                                 f32_3 %687 = OpFAdd %684 %686 
                                 f32_4 %688 = OpLoad %472 
                                 f32_4 %689 = OpVectorShuffle %688 %687 4 5 6 3 
                                                OpStore %472 %689 
                                 f32_4 %690 = OpLoad %472 
                                 f32_3 %691 = OpVectorShuffle %690 %690 0 1 2 
                                 f32_3 %692 = OpExtInst %1 40 %691 %169 
                                 f32_4 %693 = OpLoad %481 
                                 f32_4 %694 = OpVectorShuffle %693 %692 4 5 6 3 
                                                OpStore %481 %694 
                                 f32_4 %695 = OpLoad %481 
                                 f32_3 %696 = OpVectorShuffle %695 %695 0 1 2 
                                 f32_3 %697 = OpExtInst %1 37 %696 %71 
                                 f32_4 %698 = OpLoad %481 
                                 f32_4 %699 = OpVectorShuffle %698 %697 4 5 6 3 
                                                OpStore %481 %699 
                                 f32_4 %700 = OpLoad %472 
                                 f32_3 %701 = OpVectorShuffle %700 %700 0 1 2 
                                 f32_4 %702 = OpLoad %481 
                                 f32_3 %703 = OpVectorShuffle %702 %702 0 1 2 
                                 f32_3 %704 = OpFNegate %703 
                                 f32_3 %705 = OpFAdd %701 %704 
                                 f32_4 %706 = OpLoad %472 
                                 f32_4 %707 = OpVectorShuffle %706 %705 4 5 6 3 
                                                OpStore %472 %707 
                          Private f32* %708 = OpAccessChain %472 %23 
                                   f32 %709 = OpLoad %708 
                                   f32 %710 = OpExtInst %1 4 %709 
                          Private f32* %711 = OpAccessChain %472 %19 
                                   f32 %712 = OpLoad %711 
                                   f32 %713 = OpExtInst %1 4 %712 
                                   f32 %714 = OpExtInst %1 40 %710 %713 
                                                OpStore %77 %714 
                          Private f32* %715 = OpAccessChain %472 %26 
                                   f32 %716 = OpLoad %715 
                                   f32 %717 = OpExtInst %1 4 %716 
                                   f32 %718 = OpLoad %77 
                                   f32 %719 = OpExtInst %1 40 %717 %718 
                                                OpStore %77 %719 
                                   f32 %720 = OpLoad %77 
                                 f32_3 %721 = OpCompositeConstruct %720 %720 %720 
                                 f32_3 %722 = OpFNegate %721 
                                 f32_4 %723 = OpLoad %45 
                                 f32_3 %724 = OpVectorShuffle %723 %723 0 1 2 
                                 f32_3 %725 = OpFMul %722 %724 
                                 f32_4 %726 = OpLoad %481 
                                 f32_3 %727 = OpVectorShuffle %726 %726 0 1 2 
                                 f32_3 %728 = OpFAdd %725 %727 
                                 f32_4 %729 = OpLoad %472 
                                 f32_4 %730 = OpVectorShuffle %729 %728 4 5 6 3 
                                                OpStore %472 %730 
                 read_only TextureCube %731 = OpLoad %211 
                               sampler %732 = OpLoad %215 
          read_only TextureCubeSampled %733 = OpSampledImage %731 %732 
                                 f32_4 %734 = OpLoad %472 
                                 f32_3 %735 = OpVectorShuffle %734 %734 0 1 2 
                          Uniform f32* %736 = OpAccessChain %12 %221 
                                   f32 %737 = OpLoad %736 
                                 f32_4 %738 = OpImageSampleExplicitLod %733 %735 Lod %32 
                                                OpStore %472 %738 
                                 f32_4 %739 = OpLoad %472 
                                 f32_4 %740 = OpExtInst %1 40 %739 %226 
                                                OpStore %472 %740 
                                 f32_4 %741 = OpLoad %126 
                                 f32_3 %742 = OpVectorShuffle %741 %741 2 0 1 
                                 f32_3 %743 = OpFNegate %742 
                                 f32_3 %744 = OpFMul %743 %149 
                                 f32_3 %745 = OpLoad %144 
                                 f32_3 %746 = OpFAdd %744 %745 
                                 f32_4 %747 = OpLoad %481 
                                 f32_4 %748 = OpVectorShuffle %747 %746 4 5 6 3 
                                                OpStore %481 %748 
                                 f32_4 %749 = OpLoad %481 
                                 f32_3 %750 = OpVectorShuffle %749 %749 0 1 2 
                                 f32_3 %751 = OpExtInst %1 40 %750 %169 
                                 f32_4 %752 = OpLoad %620 
                                 f32_4 %753 = OpVectorShuffle %752 %751 4 5 6 3 
                                                OpStore %620 %753 
                                 f32_4 %754 = OpLoad %620 
                                 f32_3 %755 = OpVectorShuffle %754 %754 0 1 2 
                                 f32_3 %756 = OpExtInst %1 37 %755 %71 
                                 f32_4 %757 = OpLoad %620 
                                 f32_4 %758 = OpVectorShuffle %757 %756 4 5 6 3 
                                                OpStore %620 %758 
                                 f32_4 %759 = OpLoad %481 
                                 f32_3 %760 = OpVectorShuffle %759 %759 0 1 2 
                                 f32_4 %761 = OpLoad %620 
                                 f32_3 %762 = OpVectorShuffle %761 %761 0 1 2 
                                 f32_3 %763 = OpFNegate %762 
                                 f32_3 %764 = OpFAdd %760 %763 
                                 f32_4 %765 = OpLoad %481 
                                 f32_4 %766 = OpVectorShuffle %765 %764 4 5 6 3 
                                                OpStore %481 %766 
                          Private f32* %767 = OpAccessChain %481 %23 
                                   f32 %768 = OpLoad %767 
                                   f32 %769 = OpExtInst %1 4 %768 
                          Private f32* %770 = OpAccessChain %481 %19 
                                   f32 %771 = OpLoad %770 
                                   f32 %772 = OpExtInst %1 4 %771 
                                   f32 %773 = OpExtInst %1 40 %769 %772 
                                                OpStore %77 %773 
                          Private f32* %774 = OpAccessChain %481 %26 
                                   f32 %775 = OpLoad %774 
                                   f32 %776 = OpExtInst %1 4 %775 
                                   f32 %777 = OpLoad %77 
                                   f32 %778 = OpExtInst %1 40 %776 %777 
                                                OpStore %77 %778 
                                   f32 %779 = OpLoad %77 
                                 f32_3 %780 = OpCompositeConstruct %779 %779 %779 
                                 f32_3 %781 = OpFNegate %780 
                                 f32_4 %782 = OpLoad %45 
                                 f32_3 %783 = OpVectorShuffle %782 %782 0 1 2 
                                 f32_3 %784 = OpFMul %781 %783 
                                 f32_4 %785 = OpLoad %620 
                                 f32_3 %786 = OpVectorShuffle %785 %785 0 1 2 
                                 f32_3 %787 = OpFAdd %784 %786 
                                 f32_4 %788 = OpLoad %481 
                                 f32_4 %789 = OpVectorShuffle %788 %787 4 5 6 3 
                                                OpStore %481 %789 
                 read_only TextureCube %790 = OpLoad %211 
                               sampler %791 = OpLoad %215 
          read_only TextureCubeSampled %792 = OpSampledImage %790 %791 
                                 f32_4 %793 = OpLoad %481 
                                 f32_3 %794 = OpVectorShuffle %793 %793 0 1 2 
                          Uniform f32* %795 = OpAccessChain %12 %221 
                                   f32 %796 = OpLoad %795 
                                 f32_4 %797 = OpImageSampleExplicitLod %792 %794 Lod %32 
                                                OpStore %481 %797 
                                 f32_4 %798 = OpLoad %481 
                                 f32_4 %799 = OpExtInst %1 40 %798 %226 
                                                OpStore %481 %799 
                                 f32_4 %800 = OpLoad %472 
                                 f32_4 %801 = OpLoad %481 
                                 f32_4 %802 = OpFAdd %800 %801 
                                                OpStore %472 %802 
                                 f32_4 %803 = OpLoad %246 
                                 f32_4 %804 = OpVectorShuffle %803 %803 1 1 1 1 
                                 f32_4 %805 = OpLoad %472 
                                 f32_4 %806 = OpFMul %804 %805 
                                                OpStore %472 %806 
                                 f32_4 %807 = OpLoad %126 
                                 f32_3 %808 = OpVectorShuffle %807 %807 2 0 1 
                                 f32_3 %809 = OpFNegate %808 
                                 f32_3 %810 = OpFMul %809 %149 
                                 f32_4 %811 = OpLoad vs_TEXCOORD0 
                                 f32_3 %812 = OpVectorShuffle %811 %811 0 1 2 
                                 f32_3 %813 = OpFAdd %810 %812 
                                 f32_4 %814 = OpLoad %481 
                                 f32_4 %815 = OpVectorShuffle %814 %813 4 5 6 3 
                                                OpStore %481 %815 
                                 f32_4 %816 = OpLoad %481 
                                 f32_3 %817 = OpVectorShuffle %816 %816 0 1 2 
                                 f32_3 %818 = OpExtInst %1 40 %817 %169 
                                 f32_4 %819 = OpLoad %620 
                                 f32_4 %820 = OpVectorShuffle %819 %818 4 5 6 3 
                                                OpStore %620 %820 
                                 f32_4 %821 = OpLoad %620 
                                 f32_3 %822 = OpVectorShuffle %821 %821 0 1 2 
                                 f32_3 %823 = OpExtInst %1 37 %822 %71 
                                 f32_4 %824 = OpLoad %620 
                                 f32_4 %825 = OpVectorShuffle %824 %823 4 5 6 3 
                                                OpStore %620 %825 
                                 f32_4 %826 = OpLoad %481 
                                 f32_3 %827 = OpVectorShuffle %826 %826 0 1 2 
                                 f32_4 %828 = OpLoad %620 
                                 f32_3 %829 = OpVectorShuffle %828 %828 0 1 2 
                                 f32_3 %830 = OpFNegate %829 
                                 f32_3 %831 = OpFAdd %827 %830 
                                 f32_4 %832 = OpLoad %481 
                                 f32_4 %833 = OpVectorShuffle %832 %831 4 5 6 3 
                                                OpStore %481 %833 
                          Private f32* %834 = OpAccessChain %481 %23 
                                   f32 %835 = OpLoad %834 
                                   f32 %836 = OpExtInst %1 4 %835 
                          Private f32* %837 = OpAccessChain %481 %19 
                                   f32 %838 = OpLoad %837 
                                   f32 %839 = OpExtInst %1 4 %838 
                                   f32 %840 = OpExtInst %1 40 %836 %839 
                                                OpStore %77 %840 
                          Private f32* %841 = OpAccessChain %481 %26 
                                   f32 %842 = OpLoad %841 
                                   f32 %843 = OpExtInst %1 4 %842 
                                   f32 %844 = OpLoad %77 
                                   f32 %845 = OpExtInst %1 40 %843 %844 
                                                OpStore %77 %845 
                                   f32 %846 = OpLoad %77 
                                 f32_3 %847 = OpCompositeConstruct %846 %846 %846 
                                 f32_3 %848 = OpFNegate %847 
                                 f32_4 %849 = OpLoad %45 
                                 f32_3 %850 = OpVectorShuffle %849 %849 0 1 2 
                                 f32_3 %851 = OpFMul %848 %850 
                                 f32_4 %852 = OpLoad %620 
                                 f32_3 %853 = OpVectorShuffle %852 %852 0 1 2 
                                 f32_3 %854 = OpFAdd %851 %853 
                                 f32_4 %855 = OpLoad %481 
                                 f32_4 %856 = OpVectorShuffle %855 %854 4 5 6 3 
                                                OpStore %481 %856 
                                 f32_4 %857 = OpLoad %126 
                                 f32_3 %858 = OpVectorShuffle %857 %857 0 1 2 
                                 f32_3 %859 = OpFMul %858 %359 
                                 f32_4 %860 = OpLoad %481 
                                 f32_3 %861 = OpVectorShuffle %860 %860 0 1 2 
                                 f32_3 %862 = OpFAdd %859 %861 
                                 f32_4 %863 = OpLoad %620 
                                 f32_4 %864 = OpVectorShuffle %863 %862 4 5 6 3 
                                                OpStore %620 %864 
                                 f32_4 %865 = OpLoad %126 
                                 f32_3 %866 = OpVectorShuffle %865 %865 0 1 2 
                                 f32_3 %867 = OpFNegate %866 
                                 f32_3 %868 = OpFMul %867 %359 
                                 f32_4 %869 = OpLoad %481 
                                 f32_3 %870 = OpVectorShuffle %869 %869 0 1 2 
                                 f32_3 %871 = OpFAdd %868 %870 
                                 f32_4 %872 = OpLoad %481 
                                 f32_4 %873 = OpVectorShuffle %872 %871 4 5 6 3 
                                                OpStore %481 %873 
                 read_only TextureCube %874 = OpLoad %211 
                               sampler %875 = OpLoad %215 
          read_only TextureCubeSampled %876 = OpSampledImage %874 %875 
                                 f32_4 %877 = OpLoad %481 
                                 f32_3 %878 = OpVectorShuffle %877 %877 0 1 2 
                          Uniform f32* %879 = OpAccessChain %12 %221 
                                   f32 %880 = OpLoad %879 
                                 f32_4 %881 = OpImageSampleExplicitLod %876 %878 Lod %32 
                                                OpStore %481 %881 
                                 f32_4 %882 = OpLoad %481 
                                 f32_4 %883 = OpExtInst %1 40 %882 %226 
                                                OpStore %481 %883 
                 read_only TextureCube %884 = OpLoad %211 
                               sampler %885 = OpLoad %215 
          read_only TextureCubeSampled %886 = OpSampledImage %884 %885 
                                 f32_4 %887 = OpLoad %620 
                                 f32_3 %888 = OpVectorShuffle %887 %887 0 1 2 
                          Uniform f32* %889 = OpAccessChain %12 %221 
                                   f32 %890 = OpLoad %889 
                                 f32_4 %891 = OpImageSampleExplicitLod %886 %888 Lod %32 
                                                OpStore %620 %891 
                                 f32_4 %892 = OpLoad %620 
                                 f32_4 %893 = OpExtInst %1 40 %892 %226 
                                                OpStore %620 %893 
                                 f32_4 %894 = OpLoad %481 
                                 f32_4 %895 = OpLoad %620 
                                 f32_4 %896 = OpFAdd %894 %895 
                                                OpStore %481 %896 
                                 f32_4 %897 = OpLoad %246 
                                 f32_4 %898 = OpVectorShuffle %897 %897 0 0 0 0 
                                 f32_4 %899 = OpLoad %481 
                                 f32_4 %900 = OpFMul %898 %899 
                                 f32_4 %901 = OpLoad %472 
                                 f32_4 %902 = OpFAdd %900 %901 
                                                OpStore %472 %902 
                                 f32_4 %903 = OpLoad %154 
                                 f32_4 %904 = OpLoad %472 
                                 f32_4 %905 = OpFAdd %903 %904 
                                                OpStore %154 %905 
                                 f32_4 %906 = OpLoad %236 
                                 f32_3 %907 = OpVectorShuffle %906 %906 0 1 2 
                                 f32_3 %908 = OpExtInst %1 40 %907 %169 
                                 f32_4 %909 = OpLoad %472 
                                 f32_4 %910 = OpVectorShuffle %909 %908 4 5 6 3 
                                                OpStore %472 %910 
                                 f32_4 %911 = OpLoad %472 
                                 f32_3 %912 = OpVectorShuffle %911 %911 0 1 2 
                                 f32_3 %913 = OpExtInst %1 37 %912 %71 
                                 f32_4 %914 = OpLoad %472 
                                 f32_4 %915 = OpVectorShuffle %914 %913 4 5 6 3 
                                                OpStore %472 %915 
                                 f32_4 %916 = OpLoad %236 
                                 f32_3 %917 = OpVectorShuffle %916 %916 0 1 2 
                                 f32_4 %918 = OpLoad %472 
                                 f32_3 %919 = OpVectorShuffle %918 %918 0 1 2 
                                 f32_3 %920 = OpFNegate %919 
                                 f32_3 %921 = OpFAdd %917 %920 
                                 f32_4 %922 = OpLoad %481 
                                 f32_4 %923 = OpVectorShuffle %922 %921 4 5 6 3 
                                                OpStore %481 %923 
                          Private f32* %924 = OpAccessChain %481 %23 
                                   f32 %925 = OpLoad %924 
                                   f32 %926 = OpExtInst %1 4 %925 
                          Private f32* %927 = OpAccessChain %481 %19 
                                   f32 %928 = OpLoad %927 
                                   f32 %929 = OpExtInst %1 4 %928 
                                   f32 %930 = OpExtInst %1 40 %926 %929 
                                                OpStore %77 %930 
                          Private f32* %931 = OpAccessChain %481 %26 
                                   f32 %932 = OpLoad %931 
                                   f32 %933 = OpExtInst %1 4 %932 
                                   f32 %934 = OpLoad %77 
                                   f32 %935 = OpExtInst %1 40 %933 %934 
                                                OpStore %77 %935 
                                   f32 %936 = OpLoad %77 
                                 f32_3 %937 = OpCompositeConstruct %936 %936 %936 
                                 f32_3 %938 = OpFNegate %937 
                                 f32_4 %939 = OpLoad %45 
                                 f32_3 %940 = OpVectorShuffle %939 %939 0 1 2 
                                 f32_3 %941 = OpFMul %938 %940 
                                 f32_4 %942 = OpLoad %472 
                                 f32_3 %943 = OpVectorShuffle %942 %942 0 1 2 
                                 f32_3 %944 = OpFAdd %941 %943 
                                 f32_4 %945 = OpLoad %472 
                                 f32_4 %946 = OpVectorShuffle %945 %944 4 5 6 3 
                                                OpStore %472 %946 
                                 f32_4 %947 = OpLoad %126 
                                 f32_3 %948 = OpVectorShuffle %947 %947 2 0 1 
                                 f32_3 %949 = OpFNegate %948 
                                 f32_3 %950 = OpFMul %949 %359 
                                 f32_4 %951 = OpLoad %472 
                                 f32_3 %952 = OpVectorShuffle %951 %951 0 1 2 
                                 f32_3 %953 = OpFAdd %950 %952 
                                 f32_4 %954 = OpLoad %481 
                                 f32_4 %955 = OpVectorShuffle %954 %953 4 5 6 3 
                                                OpStore %481 %955 
                                 f32_4 %956 = OpLoad %126 
                                 f32_3 %957 = OpVectorShuffle %956 %956 2 0 1 
                                 f32_3 %958 = OpFMul %957 %359 
                                 f32_4 %959 = OpLoad %472 
                                 f32_3 %960 = OpVectorShuffle %959 %959 0 1 2 
                                 f32_3 %961 = OpFAdd %958 %960 
                                 f32_4 %962 = OpLoad %472 
                                 f32_4 %963 = OpVectorShuffle %962 %961 4 5 6 3 
                                                OpStore %472 %963 
                 read_only TextureCube %964 = OpLoad %211 
                               sampler %965 = OpLoad %215 
          read_only TextureCubeSampled %966 = OpSampledImage %964 %965 
                                 f32_4 %967 = OpLoad %472 
                                 f32_3 %968 = OpVectorShuffle %967 %967 0 1 2 
                          Uniform f32* %969 = OpAccessChain %12 %221 
                                   f32 %970 = OpLoad %969 
                                 f32_4 %971 = OpImageSampleExplicitLod %966 %968 Lod %32 
                                                OpStore %472 %971 
                                 f32_4 %972 = OpLoad %472 
                                 f32_4 %973 = OpExtInst %1 40 %972 %226 
                                                OpStore %472 %973 
                 read_only TextureCube %974 = OpLoad %211 
                               sampler %975 = OpLoad %215 
          read_only TextureCubeSampled %976 = OpSampledImage %974 %975 
                                 f32_4 %977 = OpLoad %481 
                                 f32_3 %978 = OpVectorShuffle %977 %977 0 1 2 
                          Uniform f32* %979 = OpAccessChain %12 %221 
                                   f32 %980 = OpLoad %979 
                                 f32_4 %981 = OpImageSampleExplicitLod %976 %978 Lod %32 
                                                OpStore %481 %981 
                                 f32_4 %982 = OpLoad %481 
                                 f32_4 %983 = OpExtInst %1 40 %982 %226 
                                                OpStore %481 %983 
                                 f32_3 %984 = OpLoad %421 
                                 f32_3 %985 = OpExtInst %1 40 %984 %169 
                                 f32_4 %986 = OpLoad %620 
                                 f32_4 %987 = OpVectorShuffle %986 %985 4 5 6 3 
                                                OpStore %620 %987 
                                 f32_4 %988 = OpLoad %620 
                                 f32_3 %989 = OpVectorShuffle %988 %988 0 1 2 
                                 f32_3 %990 = OpExtInst %1 37 %989 %71 
                                 f32_4 %991 = OpLoad %620 
                                 f32_4 %992 = OpVectorShuffle %991 %990 4 5 6 3 
                                                OpStore %620 %992 
                                 f32_3 %994 = OpLoad %421 
                                 f32_4 %995 = OpLoad %620 
                                 f32_3 %996 = OpVectorShuffle %995 %995 0 1 2 
                                 f32_3 %997 = OpFNegate %996 
                                 f32_3 %998 = OpFAdd %994 %997 
                                 f32_4 %999 = OpLoad %993 
                                f32_4 %1000 = OpVectorShuffle %999 %998 4 5 6 3 
                                                OpStore %993 %1000 
                         Private f32* %1001 = OpAccessChain %993 %23 
                                  f32 %1002 = OpLoad %1001 
                                  f32 %1003 = OpExtInst %1 4 %1002 
                         Private f32* %1004 = OpAccessChain %993 %19 
                                  f32 %1005 = OpLoad %1004 
                                  f32 %1006 = OpExtInst %1 4 %1005 
                                  f32 %1007 = OpExtInst %1 40 %1003 %1006 
                                                OpStore %77 %1007 
                         Private f32* %1008 = OpAccessChain %993 %26 
                                  f32 %1009 = OpLoad %1008 
                                  f32 %1010 = OpExtInst %1 4 %1009 
                                  f32 %1011 = OpLoad %77 
                                  f32 %1012 = OpExtInst %1 40 %1010 %1011 
                                                OpStore %77 %1012 
                                  f32 %1013 = OpLoad %77 
                                f32_3 %1014 = OpCompositeConstruct %1013 %1013 %1013 
                                f32_3 %1015 = OpFNegate %1014 
                                f32_4 %1016 = OpLoad %45 
                                f32_3 %1017 = OpVectorShuffle %1016 %1016 0 1 2 
                                f32_3 %1018 = OpFMul %1015 %1017 
                                f32_4 %1019 = OpLoad %620 
                                f32_3 %1020 = OpVectorShuffle %1019 %1019 0 1 2 
                                f32_3 %1021 = OpFAdd %1018 %1020 
                                f32_4 %1022 = OpLoad %620 
                                f32_4 %1023 = OpVectorShuffle %1022 %1021 4 5 6 3 
                                                OpStore %620 %1023 
                                f32_4 %1024 = OpLoad %126 
                                f32_3 %1025 = OpVectorShuffle %1024 %1024 2 0 1 
                                f32_3 %1026 = OpFNegate %1025 
                                f32_3 %1027 = OpFMul %1026 %359 
                                f32_4 %1028 = OpLoad %620 
                                f32_3 %1029 = OpVectorShuffle %1028 %1028 0 1 2 
                                f32_3 %1030 = OpFAdd %1027 %1029 
                                f32_4 %1031 = OpLoad %993 
                                f32_4 %1032 = OpVectorShuffle %1031 %1030 4 5 6 3 
                                                OpStore %993 %1032 
                                f32_4 %1033 = OpLoad %126 
                                f32_3 %1034 = OpVectorShuffle %1033 %1033 2 0 1 
                                f32_3 %1035 = OpFMul %1034 %359 
                                f32_4 %1036 = OpLoad %620 
                                f32_3 %1037 = OpVectorShuffle %1036 %1036 0 1 2 
                                f32_3 %1038 = OpFAdd %1035 %1037 
                                f32_4 %1039 = OpLoad %620 
                                f32_4 %1040 = OpVectorShuffle %1039 %1038 4 5 6 3 
                                                OpStore %620 %1040 
                read_only TextureCube %1041 = OpLoad %211 
                              sampler %1042 = OpLoad %215 
         read_only TextureCubeSampled %1043 = OpSampledImage %1041 %1042 
                                f32_4 %1044 = OpLoad %620 
                                f32_3 %1045 = OpVectorShuffle %1044 %1044 0 1 2 
                         Uniform f32* %1046 = OpAccessChain %12 %221 
                                  f32 %1047 = OpLoad %1046 
                                f32_4 %1048 = OpImageSampleExplicitLod %1043 %1045 Lod %32 
                                                OpStore %620 %1048 
                                f32_4 %1049 = OpLoad %620 
                                f32_4 %1050 = OpExtInst %1 40 %1049 %226 
                                                OpStore %620 %1050 
                                f32_4 %1051 = OpLoad %472 
                                f32_4 %1052 = OpLoad %620 
                                f32_4 %1053 = OpFAdd %1051 %1052 
                                                OpStore %472 %1053 
                read_only TextureCube %1054 = OpLoad %211 
                              sampler %1055 = OpLoad %215 
         read_only TextureCubeSampled %1056 = OpSampledImage %1054 %1055 
                                f32_4 %1057 = OpLoad %993 
                                f32_3 %1058 = OpVectorShuffle %1057 %1057 0 1 2 
                         Uniform f32* %1059 = OpAccessChain %12 %221 
                                  f32 %1060 = OpLoad %1059 
                                f32_4 %1061 = OpImageSampleExplicitLod %1056 %1058 Lod %32 
                                                OpStore %620 %1061 
                                f32_4 %1062 = OpLoad %620 
                                f32_4 %1063 = OpExtInst %1 40 %1062 %226 
                                                OpStore %620 %1063 
                                f32_4 %1064 = OpLoad %481 
                                f32_4 %1065 = OpLoad %620 
                                f32_4 %1066 = OpFAdd %1064 %1065 
                                                OpStore %481 %1066 
                                f32_3 %1067 = OpLoad %9 
                                f32_4 %1068 = OpVectorShuffle %1067 %1067 2 2 2 2 
                                f32_4 %1069 = OpLoad %481 
                                f32_4 %1070 = OpFMul %1068 %1069 
                                f32_4 %1071 = OpLoad %154 
                                f32_4 %1072 = OpFAdd %1070 %1071 
                                                OpStore %154 %1072 
                                f32_3 %1073 = OpLoad %144 
                                f32_3 %1074 = OpExtInst %1 40 %1073 %169 
                                f32_4 %1075 = OpLoad %481 
                                f32_4 %1076 = OpVectorShuffle %1075 %1074 4 5 6 3 
                                                OpStore %481 %1076 
                                f32_4 %1077 = OpLoad %481 
                                f32_3 %1078 = OpVectorShuffle %1077 %1077 0 1 2 
                                f32_3 %1079 = OpExtInst %1 37 %1078 %71 
                                f32_4 %1080 = OpLoad %481 
                                f32_4 %1081 = OpVectorShuffle %1080 %1079 4 5 6 3 
                                                OpStore %481 %1081 
                                f32_3 %1082 = OpLoad %144 
                                f32_4 %1083 = OpLoad %481 
                                f32_3 %1084 = OpVectorShuffle %1083 %1083 0 1 2 
                                f32_3 %1085 = OpFNegate %1084 
                                f32_3 %1086 = OpFAdd %1082 %1085 
                                f32_4 %1087 = OpLoad %620 
                                f32_4 %1088 = OpVectorShuffle %1087 %1086 4 5 6 3 
                                                OpStore %620 %1088 
                         Private f32* %1089 = OpAccessChain %620 %23 
                                  f32 %1090 = OpLoad %1089 
                                  f32 %1091 = OpExtInst %1 4 %1090 
                         Private f32* %1092 = OpAccessChain %620 %19 
                                  f32 %1093 = OpLoad %1092 
                                  f32 %1094 = OpExtInst %1 4 %1093 
                                  f32 %1095 = OpExtInst %1 40 %1091 %1094 
                                                OpStore %77 %1095 
                         Private f32* %1096 = OpAccessChain %620 %26 
                                  f32 %1097 = OpLoad %1096 
                                  f32 %1098 = OpExtInst %1 4 %1097 
                                  f32 %1099 = OpLoad %77 
                                  f32 %1100 = OpExtInst %1 40 %1098 %1099 
                                                OpStore %77 %1100 
                                  f32 %1101 = OpLoad %77 
                                f32_3 %1102 = OpCompositeConstruct %1101 %1101 %1101 
                                f32_3 %1103 = OpFNegate %1102 
                                f32_4 %1104 = OpLoad %45 
                                f32_3 %1105 = OpVectorShuffle %1104 %1104 0 1 2 
                                f32_3 %1106 = OpFMul %1103 %1105 
                                f32_4 %1107 = OpLoad %481 
                                f32_3 %1108 = OpVectorShuffle %1107 %1107 0 1 2 
                                f32_3 %1109 = OpFAdd %1106 %1108 
                                f32_4 %1110 = OpLoad %481 
                                f32_4 %1111 = OpVectorShuffle %1110 %1109 4 5 6 3 
                                                OpStore %481 %1111 
                                f32_4 %1112 = OpLoad %126 
                                f32_3 %1113 = OpVectorShuffle %1112 %1112 2 0 1 
                                f32_3 %1114 = OpFNegate %1113 
                                f32_3 %1115 = OpFMul %1114 %359 
                                f32_4 %1116 = OpLoad %481 
                                f32_3 %1117 = OpVectorShuffle %1116 %1116 0 1 2 
                                f32_3 %1118 = OpFAdd %1115 %1117 
                                f32_4 %1119 = OpLoad %620 
                                f32_4 %1120 = OpVectorShuffle %1119 %1118 4 5 6 3 
                                                OpStore %620 %1120 
                                f32_4 %1121 = OpLoad %126 
                                f32_3 %1122 = OpVectorShuffle %1121 %1121 2 0 1 
                                f32_3 %1123 = OpFMul %1122 %359 
                                f32_4 %1124 = OpLoad %481 
                                f32_3 %1125 = OpVectorShuffle %1124 %1124 0 1 2 
                                f32_3 %1126 = OpFAdd %1123 %1125 
                                f32_4 %1127 = OpLoad %481 
                                f32_4 %1128 = OpVectorShuffle %1127 %1126 4 5 6 3 
                                                OpStore %481 %1128 
                read_only TextureCube %1129 = OpLoad %211 
                              sampler %1130 = OpLoad %215 
         read_only TextureCubeSampled %1131 = OpSampledImage %1129 %1130 
                                f32_4 %1132 = OpLoad %481 
                                f32_3 %1133 = OpVectorShuffle %1132 %1132 0 1 2 
                         Uniform f32* %1134 = OpAccessChain %12 %221 
                                  f32 %1135 = OpLoad %1134 
                                f32_4 %1136 = OpImageSampleExplicitLod %1131 %1133 Lod %32 
                                                OpStore %481 %1136 
                                f32_4 %1137 = OpLoad %481 
                                f32_4 %1138 = OpExtInst %1 40 %1137 %226 
                                                OpStore %481 %1138 
                read_only TextureCube %1139 = OpLoad %211 
                              sampler %1140 = OpLoad %215 
         read_only TextureCubeSampled %1141 = OpSampledImage %1139 %1140 
                                f32_4 %1142 = OpLoad %620 
                                f32_3 %1143 = OpVectorShuffle %1142 %1142 0 1 2 
                         Uniform f32* %1144 = OpAccessChain %12 %221 
                                  f32 %1145 = OpLoad %1144 
                                f32_4 %1146 = OpImageSampleExplicitLod %1141 %1143 Lod %32 
                                                OpStore %620 %1146 
                                f32_4 %1147 = OpLoad %620 
                                f32_4 %1148 = OpExtInst %1 40 %1147 %226 
                                                OpStore %620 %1148 
                                f32_4 %1149 = OpLoad %165 
                                f32_3 %1150 = OpVectorShuffle %1149 %1149 0 1 2 
                                f32_3 %1151 = OpExtInst %1 40 %1150 %169 
                                f32_4 %1152 = OpLoad %993 
                                f32_4 %1153 = OpVectorShuffle %1152 %1151 4 5 6 3 
                                                OpStore %993 %1153 
                                f32_4 %1154 = OpLoad %993 
                                f32_3 %1155 = OpVectorShuffle %1154 %1154 0 1 2 
                                f32_3 %1156 = OpExtInst %1 37 %1155 %71 
                                f32_4 %1157 = OpLoad %993 
                                f32_4 %1158 = OpVectorShuffle %1157 %1156 4 5 6 3 
                                                OpStore %993 %1158 
                                f32_4 %1160 = OpLoad %165 
                                f32_3 %1161 = OpVectorShuffle %1160 %1160 0 1 2 
                                f32_4 %1162 = OpLoad %993 
                                f32_3 %1163 = OpVectorShuffle %1162 %1162 0 1 2 
                                f32_3 %1164 = OpFNegate %1163 
                                f32_3 %1165 = OpFAdd %1161 %1164 
                                f32_4 %1166 = OpLoad %1159 
                                f32_4 %1167 = OpVectorShuffle %1166 %1165 4 5 6 3 
                                                OpStore %1159 %1167 
                         Private f32* %1168 = OpAccessChain %1159 %23 
                                  f32 %1169 = OpLoad %1168 
                                  f32 %1170 = OpExtInst %1 4 %1169 
                         Private f32* %1171 = OpAccessChain %1159 %19 
                                  f32 %1172 = OpLoad %1171 
                                  f32 %1173 = OpExtInst %1 4 %1172 
                                  f32 %1174 = OpExtInst %1 40 %1170 %1173 
                                                OpStore %77 %1174 
                         Private f32* %1175 = OpAccessChain %1159 %26 
                                  f32 %1176 = OpLoad %1175 
                                  f32 %1177 = OpExtInst %1 4 %1176 
                                  f32 %1178 = OpLoad %77 
                                  f32 %1179 = OpExtInst %1 40 %1177 %1178 
                                                OpStore %77 %1179 
                                  f32 %1180 = OpLoad %77 
                                f32_3 %1181 = OpCompositeConstruct %1180 %1180 %1180 
                                f32_3 %1182 = OpFNegate %1181 
                                f32_4 %1183 = OpLoad %45 
                                f32_3 %1184 = OpVectorShuffle %1183 %1183 0 1 2 
                                f32_3 %1185 = OpFMul %1182 %1184 
                                f32_4 %1186 = OpLoad %993 
                                f32_3 %1187 = OpVectorShuffle %1186 %1186 0 1 2 
                                f32_3 %1188 = OpFAdd %1185 %1187 
                                f32_4 %1189 = OpLoad %993 
                                f32_4 %1190 = OpVectorShuffle %1189 %1188 4 5 6 3 
                                                OpStore %993 %1190 
                                f32_4 %1191 = OpLoad %126 
                                f32_3 %1192 = OpVectorShuffle %1191 %1191 2 0 1 
                                f32_3 %1193 = OpFNegate %1192 
                                f32_3 %1194 = OpFMul %1193 %359 
                                f32_4 %1195 = OpLoad %993 
                                f32_3 %1196 = OpVectorShuffle %1195 %1195 0 1 2 
                                f32_3 %1197 = OpFAdd %1194 %1196 
                                f32_4 %1198 = OpLoad %1159 
                                f32_4 %1199 = OpVectorShuffle %1198 %1197 4 5 6 3 
                                                OpStore %1159 %1199 
                                f32_4 %1200 = OpLoad %126 
                                f32_3 %1201 = OpVectorShuffle %1200 %1200 2 0 1 
                                f32_3 %1202 = OpFMul %1201 %359 
                                f32_4 %1203 = OpLoad %993 
                                f32_3 %1204 = OpVectorShuffle %1203 %1203 0 1 2 
                                f32_3 %1205 = OpFAdd %1202 %1204 
                                f32_4 %1206 = OpLoad %993 
                                f32_4 %1207 = OpVectorShuffle %1206 %1205 4 5 6 3 
                                                OpStore %993 %1207 
                read_only TextureCube %1208 = OpLoad %211 
                              sampler %1209 = OpLoad %215 
         read_only TextureCubeSampled %1210 = OpSampledImage %1208 %1209 
                                f32_4 %1211 = OpLoad %993 
                                f32_3 %1212 = OpVectorShuffle %1211 %1211 0 1 2 
                         Uniform f32* %1213 = OpAccessChain %12 %221 
                                  f32 %1214 = OpLoad %1213 
                                f32_4 %1215 = OpImageSampleExplicitLod %1210 %1212 Lod %32 
                                                OpStore %993 %1215 
                                f32_4 %1216 = OpLoad %993 
                                f32_4 %1217 = OpExtInst %1 40 %1216 %226 
                                                OpStore %993 %1217 
                                f32_4 %1218 = OpLoad %481 
                                f32_4 %1219 = OpLoad %993 
                                f32_4 %1220 = OpFAdd %1218 %1219 
                                                OpStore %481 %1220 
                                f32_3 %1221 = OpLoad %9 
                                f32_4 %1222 = OpVectorShuffle %1221 %1221 1 1 1 1 
                                f32_4 %1223 = OpLoad %481 
                                f32_4 %1224 = OpFMul %1222 %1223 
                                                OpStore %481 %1224 
                read_only TextureCube %1225 = OpLoad %211 
                              sampler %1226 = OpLoad %215 
         read_only TextureCubeSampled %1227 = OpSampledImage %1225 %1226 
                                f32_4 %1228 = OpLoad %1159 
                                f32_3 %1229 = OpVectorShuffle %1228 %1228 0 1 2 
                         Uniform f32* %1230 = OpAccessChain %12 %221 
                                  f32 %1231 = OpLoad %1230 
                                f32_4 %1232 = OpImageSampleExplicitLod %1227 %1229 Lod %32 
                                                OpStore %993 %1232 
                                f32_4 %1233 = OpLoad %993 
                                f32_4 %1234 = OpExtInst %1 40 %1233 %226 
                                                OpStore %993 %1234 
                                f32_4 %1235 = OpLoad %620 
                                f32_4 %1236 = OpLoad %993 
                                f32_4 %1237 = OpFAdd %1235 %1236 
                                                OpStore %620 %1237 
                                f32_3 %1238 = OpLoad %9 
                                f32_4 %1239 = OpVectorShuffle %1238 %1238 1 1 1 1 
                                f32_4 %1240 = OpLoad %620 
                                f32_4 %1241 = OpFMul %1239 %1240 
                                                OpStore %620 %1241 
                                f32_4 %1242 = OpLoad %126 
                                f32_3 %1243 = OpVectorShuffle %1242 %1242 0 1 2 
                                f32_3 %1244 = OpFNegate %1243 
                                f32_3 %1245 = OpFMul %1244 %359 
                                f32_4 %1246 = OpLoad vs_TEXCOORD0 
                                f32_3 %1247 = OpVectorShuffle %1246 %1246 0 1 2 
                                f32_3 %1248 = OpFAdd %1245 %1247 
                                f32_4 %1249 = OpLoad %993 
                                f32_4 %1250 = OpVectorShuffle %1249 %1248 4 5 6 3 
                                                OpStore %993 %1250 
                                f32_4 %1251 = OpLoad %126 
                                f32_3 %1252 = OpVectorShuffle %1251 %1251 2 0 1 
                                f32_3 %1253 = OpFNegate %1252 
                                f32_3 %1254 = OpFMul %1253 %359 
                                f32_4 %1255 = OpLoad %993 
                                f32_3 %1256 = OpVectorShuffle %1255 %1255 0 1 2 
                                f32_3 %1257 = OpFAdd %1254 %1256 
                                f32_4 %1258 = OpLoad %1159 
                                f32_4 %1259 = OpVectorShuffle %1258 %1257 4 5 6 3 
                                                OpStore %1159 %1259 
                                f32_4 %1260 = OpLoad %126 
                                f32_3 %1261 = OpVectorShuffle %1260 %1260 2 0 1 
                                f32_3 %1262 = OpFMul %1261 %359 
                                f32_4 %1263 = OpLoad %993 
                                f32_3 %1264 = OpVectorShuffle %1263 %1263 0 1 2 
                                f32_3 %1265 = OpFAdd %1262 %1264 
                                f32_4 %1266 = OpLoad %993 
                                f32_4 %1267 = OpVectorShuffle %1266 %1265 4 5 6 3 
                                                OpStore %993 %1267 
                read_only TextureCube %1268 = OpLoad %211 
                              sampler %1269 = OpLoad %215 
         read_only TextureCubeSampled %1270 = OpSampledImage %1268 %1269 
                                f32_4 %1271 = OpLoad %993 
                                f32_3 %1272 = OpVectorShuffle %1271 %1271 0 1 2 
                         Uniform f32* %1273 = OpAccessChain %12 %221 
                                  f32 %1274 = OpLoad %1273 
                                f32_4 %1275 = OpImageSampleExplicitLod %1270 %1272 Lod %32 
                                                OpStore %993 %1275 
                                f32_4 %1276 = OpLoad %993 
                                f32_4 %1277 = OpExtInst %1 40 %1276 %226 
                                                OpStore %993 %1277 
                read_only TextureCube %1278 = OpLoad %211 
                              sampler %1279 = OpLoad %215 
         read_only TextureCubeSampled %1280 = OpSampledImage %1278 %1279 
                                f32_4 %1281 = OpLoad %1159 
                                f32_3 %1282 = OpVectorShuffle %1281 %1281 0 1 2 
                         Uniform f32* %1283 = OpAccessChain %12 %221 
                                  f32 %1284 = OpLoad %1283 
                                f32_4 %1285 = OpImageSampleExplicitLod %1280 %1282 Lod %32 
                                                OpStore %1159 %1285 
                                f32_4 %1286 = OpLoad %1159 
                                f32_4 %1287 = OpExtInst %1 40 %1286 %226 
                                                OpStore %1159 %1287 
                                f32_4 %1289 = OpLoad %126 
                                f32_3 %1290 = OpVectorShuffle %1289 %1289 0 1 2 
                                f32_3 %1291 = OpFMul %1290 %359 
                                f32_4 %1292 = OpLoad vs_TEXCOORD0 
                                f32_3 %1293 = OpVectorShuffle %1292 %1292 0 1 2 
                                f32_3 %1294 = OpFAdd %1291 %1293 
                                f32_4 %1295 = OpLoad %1288 
                                f32_4 %1296 = OpVectorShuffle %1295 %1294 4 5 6 3 
                                                OpStore %1288 %1296 
                                f32_4 %1298 = OpLoad %126 
                                f32_3 %1299 = OpVectorShuffle %1298 %1298 2 0 1 
                                f32_3 %1300 = OpFNegate %1299 
                                f32_3 %1301 = OpFMul %1300 %359 
                                f32_4 %1302 = OpLoad %1288 
                                f32_3 %1303 = OpVectorShuffle %1302 %1302 0 1 2 
                                f32_3 %1304 = OpFAdd %1301 %1303 
                                                OpStore %1297 %1304 
                                f32_4 %1305 = OpLoad %126 
                                f32_3 %1306 = OpVectorShuffle %1305 %1305 2 0 1 
                                f32_3 %1307 = OpFMul %1306 %359 
                                f32_4 %1308 = OpLoad %1288 
                                f32_3 %1309 = OpVectorShuffle %1308 %1308 0 1 2 
                                f32_3 %1310 = OpFAdd %1307 %1309 
                                f32_4 %1311 = OpLoad %1288 
                                f32_4 %1312 = OpVectorShuffle %1311 %1310 4 5 6 3 
                                                OpStore %1288 %1312 
                read_only TextureCube %1313 = OpLoad %211 
                              sampler %1314 = OpLoad %215 
         read_only TextureCubeSampled %1315 = OpSampledImage %1313 %1314 
                                f32_4 %1316 = OpLoad %1288 
                                f32_3 %1317 = OpVectorShuffle %1316 %1316 0 1 2 
                         Uniform f32* %1318 = OpAccessChain %12 %221 
                                  f32 %1319 = OpLoad %1318 
                                f32_4 %1320 = OpImageSampleExplicitLod %1315 %1317 Lod %32 
                                                OpStore %1288 %1320 
                                f32_4 %1321 = OpLoad %1288 
                                f32_4 %1322 = OpExtInst %1 40 %1321 %226 
                                                OpStore %1288 %1322 
                                f32_4 %1323 = OpLoad %993 
                                f32_4 %1324 = OpLoad %1288 
                                f32_4 %1325 = OpFAdd %1323 %1324 
                                                OpStore %993 %1325 
                                f32_3 %1326 = OpLoad %9 
                                f32_4 %1327 = OpVectorShuffle %1326 %1326 0 0 0 0 
                                f32_4 %1328 = OpLoad %993 
                                f32_4 %1329 = OpFMul %1327 %1328 
                                f32_4 %1330 = OpLoad %481 
                                f32_4 %1331 = OpFAdd %1329 %1330 
                                                OpStore %481 %1331 
                read_only TextureCube %1332 = OpLoad %211 
                              sampler %1333 = OpLoad %215 
         read_only TextureCubeSampled %1334 = OpSampledImage %1332 %1333 
                                f32_3 %1335 = OpLoad %1297 
                         Uniform f32* %1336 = OpAccessChain %12 %221 
                                  f32 %1337 = OpLoad %1336 
                                f32_4 %1338 = OpImageSampleExplicitLod %1334 %1335 Lod %32 
                                                OpStore %993 %1338 
                                f32_4 %1339 = OpLoad %993 
                                f32_4 %1340 = OpExtInst %1 40 %1339 %226 
                                                OpStore %993 %1340 
                                f32_4 %1341 = OpLoad %993 
                                f32_4 %1342 = OpLoad %1159 
                                f32_4 %1343 = OpFAdd %1341 %1342 
                                                OpStore %993 %1343 
                                f32_3 %1344 = OpLoad %9 
                                f32_4 %1345 = OpVectorShuffle %1344 %1344 0 0 0 0 
                                f32_4 %1346 = OpLoad %993 
                                f32_4 %1347 = OpFMul %1345 %1346 
                                f32_4 %1348 = OpLoad %620 
                                f32_4 %1349 = OpFAdd %1347 %1348 
                                                OpStore %620 %1349 
                                f32_4 %1350 = OpLoad %154 
                                f32_4 %1351 = OpLoad %620 
                                f32_4 %1352 = OpFAdd %1350 %1351 
                                                OpStore %154 %1352 
                                f32_3 %1353 = OpLoad %9 
                                f32_4 %1354 = OpVectorShuffle %1353 %1353 2 2 2 2 
                                f32_4 %1355 = OpLoad %472 
                                f32_4 %1356 = OpFMul %1354 %1355 
                                f32_4 %1357 = OpLoad %154 
                                f32_4 %1358 = OpFAdd %1356 %1357 
                                                OpStore %154 %1358 
                                f32_3 %1359 = OpLoad %9 
                                  f32 %1362 = OpDot %1359 %1361 
                         Private f32* %1363 = OpAccessChain %9 %19 
                                                OpStore %1363 %1362 
                                f32_4 %1364 = OpLoad %481 
                                f32_4 %1365 = OpLoad %154 
                                f32_4 %1366 = OpFAdd %1364 %1365 
                                                OpStore %154 %1366 
                                f32_4 %1368 = OpLoad %126 
                                f32_3 %1369 = OpVectorShuffle %1368 %1368 2 0 1 
                                f32_3 %1370 = OpFMul %1369 %149 
                                f32_4 %1371 = OpLoad %236 
                                f32_3 %1372 = OpVectorShuffle %1371 %1371 0 1 2 
                                f32_3 %1373 = OpFAdd %1370 %1372 
                                                OpStore %1367 %1373 
                                f32_4 %1374 = OpLoad %126 
                                f32_3 %1375 = OpVectorShuffle %1374 %1374 2 0 1 
                                f32_3 %1376 = OpFMul %1375 %159 
                                f32_4 %1377 = OpLoad %236 
                                f32_3 %1378 = OpVectorShuffle %1377 %1377 0 1 2 
                                f32_3 %1379 = OpFAdd %1376 %1378 
                                f32_4 %1380 = OpLoad %236 
                                f32_4 %1381 = OpVectorShuffle %1380 %1379 4 5 6 3 
                                                OpStore %236 %1381 
                                f32_3 %1382 = OpLoad %1367 
                                f32_3 %1383 = OpExtInst %1 40 %1382 %169 
                                f32_4 %1384 = OpLoad %472 
                                f32_4 %1385 = OpVectorShuffle %1384 %1383 4 5 6 3 
                                                OpStore %472 %1385 
                                f32_4 %1386 = OpLoad %472 
                                f32_3 %1387 = OpVectorShuffle %1386 %1386 0 1 2 
                                f32_3 %1388 = OpExtInst %1 37 %1387 %71 
                                f32_4 %1389 = OpLoad %472 
                                f32_4 %1390 = OpVectorShuffle %1389 %1388 4 5 6 3 
                                                OpStore %472 %1390 
                                f32_3 %1391 = OpLoad %1367 
                                f32_4 %1392 = OpLoad %472 
                                f32_3 %1393 = OpVectorShuffle %1392 %1392 0 1 2 
                                f32_3 %1394 = OpFNegate %1393 
                                f32_3 %1395 = OpFAdd %1391 %1394 
                                                OpStore %1367 %1395 
                         Private f32* %1396 = OpAccessChain %1367 %23 
                                  f32 %1397 = OpLoad %1396 
                                  f32 %1398 = OpExtInst %1 4 %1397 
                         Private f32* %1399 = OpAccessChain %1367 %19 
                                  f32 %1400 = OpLoad %1399 
                                  f32 %1401 = OpExtInst %1 4 %1400 
                                  f32 %1402 = OpExtInst %1 40 %1398 %1401 
                         Private f32* %1403 = OpAccessChain %1367 %19 
                                                OpStore %1403 %1402 
                         Private f32* %1404 = OpAccessChain %1367 %26 
                                  f32 %1405 = OpLoad %1404 
                                  f32 %1406 = OpExtInst %1 4 %1405 
                         Private f32* %1407 = OpAccessChain %1367 %19 
                                  f32 %1408 = OpLoad %1407 
                                  f32 %1409 = OpExtInst %1 40 %1406 %1408 
                         Private f32* %1410 = OpAccessChain %1367 %19 
                                                OpStore %1410 %1409 
                                f32_3 %1411 = OpLoad %1367 
                                f32_3 %1412 = OpVectorShuffle %1411 %1411 0 0 0 
                                f32_3 %1413 = OpFNegate %1412 
                                f32_4 %1414 = OpLoad %45 
                                f32_3 %1415 = OpVectorShuffle %1414 %1414 0 1 2 
                                f32_3 %1416 = OpFMul %1413 %1415 
                                f32_4 %1417 = OpLoad %472 
                                f32_3 %1418 = OpVectorShuffle %1417 %1417 0 1 2 
                                f32_3 %1419 = OpFAdd %1416 %1418 
                                                OpStore %1367 %1419 
                read_only TextureCube %1420 = OpLoad %211 
                              sampler %1421 = OpLoad %215 
         read_only TextureCubeSampled %1422 = OpSampledImage %1420 %1421 
                                f32_3 %1423 = OpLoad %1367 
                         Uniform f32* %1424 = OpAccessChain %12 %221 
                                  f32 %1425 = OpLoad %1424 
                                f32_4 %1426 = OpImageSampleExplicitLod %1422 %1423 Lod %32 
                                                OpStore %472 %1426 
                                f32_4 %1427 = OpLoad %472 
                                f32_4 %1428 = OpExtInst %1 40 %1427 %226 
                                                OpStore %472 %1428 
                                f32_4 %1429 = OpLoad %126 
                                f32_3 %1430 = OpVectorShuffle %1429 %1429 2 0 1 
                                f32_3 %1431 = OpFMul %1430 %149 
                                f32_3 %1432 = OpLoad %421 
                                f32_3 %1433 = OpFAdd %1431 %1432 
                                                OpStore %1367 %1433 
                                f32_4 %1434 = OpLoad %126 
                                f32_3 %1435 = OpVectorShuffle %1434 %1434 2 0 1 
                                f32_3 %1436 = OpFMul %1435 %159 
                                f32_3 %1437 = OpLoad %421 
                                f32_3 %1438 = OpFAdd %1436 %1437 
                                                OpStore %421 %1438 
                                f32_3 %1439 = OpLoad %1367 
                                f32_3 %1440 = OpExtInst %1 40 %1439 %169 
                                f32_4 %1441 = OpLoad %481 
                                f32_4 %1442 = OpVectorShuffle %1441 %1440 4 5 6 3 
                                                OpStore %481 %1442 
                                f32_4 %1443 = OpLoad %481 
                                f32_3 %1444 = OpVectorShuffle %1443 %1443 0 1 2 
                                f32_3 %1445 = OpExtInst %1 37 %1444 %71 
                                f32_4 %1446 = OpLoad %481 
                                f32_4 %1447 = OpVectorShuffle %1446 %1445 4 5 6 3 
                                                OpStore %481 %1447 
                                f32_3 %1448 = OpLoad %1367 
                                f32_4 %1449 = OpLoad %481 
                                f32_3 %1450 = OpVectorShuffle %1449 %1449 0 1 2 
                                f32_3 %1451 = OpFNegate %1450 
                                f32_3 %1452 = OpFAdd %1448 %1451 
                                                OpStore %1367 %1452 
                         Private f32* %1453 = OpAccessChain %1367 %23 
                                  f32 %1454 = OpLoad %1453 
                                  f32 %1455 = OpExtInst %1 4 %1454 
                         Private f32* %1456 = OpAccessChain %1367 %19 
                                  f32 %1457 = OpLoad %1456 
                                  f32 %1458 = OpExtInst %1 4 %1457 
                                  f32 %1459 = OpExtInst %1 40 %1455 %1458 
                         Private f32* %1460 = OpAccessChain %1367 %19 
                                                OpStore %1460 %1459 
                         Private f32* %1461 = OpAccessChain %1367 %26 
                                  f32 %1462 = OpLoad %1461 
                                  f32 %1463 = OpExtInst %1 4 %1462 
                         Private f32* %1464 = OpAccessChain %1367 %19 
                                  f32 %1465 = OpLoad %1464 
                                  f32 %1466 = OpExtInst %1 40 %1463 %1465 
                         Private f32* %1467 = OpAccessChain %1367 %19 
                                                OpStore %1467 %1466 
                                f32_3 %1468 = OpLoad %1367 
                                f32_3 %1469 = OpVectorShuffle %1468 %1468 0 0 0 
                                f32_3 %1470 = OpFNegate %1469 
                                f32_4 %1471 = OpLoad %45 
                                f32_3 %1472 = OpVectorShuffle %1471 %1471 0 1 2 
                                f32_3 %1473 = OpFMul %1470 %1472 
                                f32_4 %1474 = OpLoad %481 
                                f32_3 %1475 = OpVectorShuffle %1474 %1474 0 1 2 
                                f32_3 %1476 = OpFAdd %1473 %1475 
                                                OpStore %1367 %1476 
                read_only TextureCube %1477 = OpLoad %211 
                              sampler %1478 = OpLoad %215 
         read_only TextureCubeSampled %1479 = OpSampledImage %1477 %1478 
                                f32_3 %1480 = OpLoad %1367 
                         Uniform f32* %1481 = OpAccessChain %12 %221 
                                  f32 %1482 = OpLoad %1481 
                                f32_4 %1483 = OpImageSampleExplicitLod %1479 %1480 Lod %32 
                                                OpStore %481 %1483 
                                f32_4 %1484 = OpLoad %481 
                                f32_4 %1485 = OpExtInst %1 40 %1484 %226 
                                                OpStore %481 %1485 
                                f32_4 %1486 = OpLoad %472 
                                f32_4 %1487 = OpLoad %481 
                                f32_4 %1488 = OpFAdd %1486 %1487 
                                                OpStore %472 %1488 
                                f32_4 %1489 = OpLoad %246 
                                f32_4 %1490 = OpVectorShuffle %1489 %1489 2 2 2 2 
                                f32_4 %1491 = OpLoad %472 
                                f32_4 %1492 = OpFMul %1490 %1491 
                                f32_4 %1493 = OpLoad %154 
                                f32_4 %1494 = OpFAdd %1492 %1493 
                                                OpStore %154 %1494 
                                f32_4 %1495 = OpLoad %126 
                                f32_3 %1496 = OpVectorShuffle %1495 %1495 2 0 1 
                                f32_3 %1497 = OpFMul %1496 %149 
                                f32_3 %1498 = OpLoad %144 
                                f32_3 %1499 = OpFAdd %1497 %1498 
                                                OpStore %1367 %1499 
                                f32_4 %1500 = OpLoad %126 
                                f32_3 %1501 = OpVectorShuffle %1500 %1500 2 0 1 
                                f32_3 %1502 = OpFMul %1501 %159 
                                f32_3 %1503 = OpLoad %144 
                                f32_3 %1504 = OpFAdd %1502 %1503 
                                                OpStore %144 %1504 
                                f32_3 %1505 = OpLoad %1367 
                                f32_3 %1506 = OpExtInst %1 40 %1505 %169 
                                f32_4 %1507 = OpLoad %472 
                                f32_4 %1508 = OpVectorShuffle %1507 %1506 4 5 6 3 
                                                OpStore %472 %1508 
                                f32_4 %1509 = OpLoad %472 
                                f32_3 %1510 = OpVectorShuffle %1509 %1509 0 1 2 
                                f32_3 %1511 = OpExtInst %1 37 %1510 %71 
                                f32_4 %1512 = OpLoad %472 
                                f32_4 %1513 = OpVectorShuffle %1512 %1511 4 5 6 3 
                                                OpStore %472 %1513 
                                f32_3 %1514 = OpLoad %1367 
                                f32_4 %1515 = OpLoad %472 
                                f32_3 %1516 = OpVectorShuffle %1515 %1515 0 1 2 
                                f32_3 %1517 = OpFNegate %1516 
                                f32_3 %1518 = OpFAdd %1514 %1517 
                                                OpStore %1367 %1518 
                         Private f32* %1519 = OpAccessChain %1367 %23 
                                  f32 %1520 = OpLoad %1519 
                                  f32 %1521 = OpExtInst %1 4 %1520 
                         Private f32* %1522 = OpAccessChain %1367 %19 
                                  f32 %1523 = OpLoad %1522 
                                  f32 %1524 = OpExtInst %1 4 %1523 
                                  f32 %1525 = OpExtInst %1 40 %1521 %1524 
                         Private f32* %1526 = OpAccessChain %1367 %19 
                                                OpStore %1526 %1525 
                         Private f32* %1527 = OpAccessChain %1367 %26 
                                  f32 %1528 = OpLoad %1527 
                                  f32 %1529 = OpExtInst %1 4 %1528 
                         Private f32* %1530 = OpAccessChain %1367 %19 
                                  f32 %1531 = OpLoad %1530 
                                  f32 %1532 = OpExtInst %1 40 %1529 %1531 
                         Private f32* %1533 = OpAccessChain %1367 %19 
                                                OpStore %1533 %1532 
                                f32_3 %1534 = OpLoad %1367 
                                f32_3 %1535 = OpVectorShuffle %1534 %1534 0 0 0 
                                f32_3 %1536 = OpFNegate %1535 
                                f32_4 %1537 = OpLoad %45 
                                f32_3 %1538 = OpVectorShuffle %1537 %1537 0 1 2 
                                f32_3 %1539 = OpFMul %1536 %1538 
                                f32_4 %1540 = OpLoad %472 
                                f32_3 %1541 = OpVectorShuffle %1540 %1540 0 1 2 
                                f32_3 %1542 = OpFAdd %1539 %1541 
                                                OpStore %1367 %1542 
                read_only TextureCube %1543 = OpLoad %211 
                              sampler %1544 = OpLoad %215 
         read_only TextureCubeSampled %1545 = OpSampledImage %1543 %1544 
                                f32_3 %1546 = OpLoad %1367 
                         Uniform f32* %1547 = OpAccessChain %12 %221 
                                  f32 %1548 = OpLoad %1547 
                                f32_4 %1549 = OpImageSampleExplicitLod %1545 %1546 Lod %32 
                                                OpStore %472 %1549 
                                f32_4 %1550 = OpLoad %472 
                                f32_4 %1551 = OpExtInst %1 40 %1550 %226 
                                                OpStore %472 %1551 
                                f32_4 %1552 = OpLoad %126 
                                f32_3 %1553 = OpVectorShuffle %1552 %1552 2 0 1 
                                f32_3 %1554 = OpFMul %1553 %149 
                                f32_4 %1555 = OpLoad %165 
                                f32_3 %1556 = OpVectorShuffle %1555 %1555 0 1 2 
                                f32_3 %1557 = OpFAdd %1554 %1556 
                                                OpStore %1367 %1557 
                                f32_4 %1558 = OpLoad %126 
                                f32_3 %1559 = OpVectorShuffle %1558 %1558 2 0 1 
                                f32_3 %1560 = OpFMul %1559 %159 
                                f32_4 %1561 = OpLoad %165 
                                f32_3 %1562 = OpVectorShuffle %1561 %1561 0 1 2 
                                f32_3 %1563 = OpFAdd %1560 %1562 
                                f32_4 %1564 = OpLoad %165 
                                f32_4 %1565 = OpVectorShuffle %1564 %1563 4 5 6 3 
                                                OpStore %165 %1565 
                                f32_3 %1566 = OpLoad %1367 
                                f32_3 %1567 = OpExtInst %1 40 %1566 %169 
                                f32_4 %1568 = OpLoad %481 
                                f32_4 %1569 = OpVectorShuffle %1568 %1567 4 5 6 3 
                                                OpStore %481 %1569 
                                f32_4 %1570 = OpLoad %481 
                                f32_3 %1571 = OpVectorShuffle %1570 %1570 0 1 2 
                                f32_3 %1572 = OpExtInst %1 37 %1571 %71 
                                f32_4 %1573 = OpLoad %481 
                                f32_4 %1574 = OpVectorShuffle %1573 %1572 4 5 6 3 
                                                OpStore %481 %1574 
                                f32_3 %1575 = OpLoad %1367 
                                f32_4 %1576 = OpLoad %481 
                                f32_3 %1577 = OpVectorShuffle %1576 %1576 0 1 2 
                                f32_3 %1578 = OpFNegate %1577 
                                f32_3 %1579 = OpFAdd %1575 %1578 
                                                OpStore %1367 %1579 
                         Private f32* %1580 = OpAccessChain %1367 %23 
                                  f32 %1581 = OpLoad %1580 
                                  f32 %1582 = OpExtInst %1 4 %1581 
                         Private f32* %1583 = OpAccessChain %1367 %19 
                                  f32 %1584 = OpLoad %1583 
                                  f32 %1585 = OpExtInst %1 4 %1584 
                                  f32 %1586 = OpExtInst %1 40 %1582 %1585 
                         Private f32* %1587 = OpAccessChain %1367 %19 
                                                OpStore %1587 %1586 
                         Private f32* %1588 = OpAccessChain %1367 %26 
                                  f32 %1589 = OpLoad %1588 
                                  f32 %1590 = OpExtInst %1 4 %1589 
                         Private f32* %1591 = OpAccessChain %1367 %19 
                                  f32 %1592 = OpLoad %1591 
                                  f32 %1593 = OpExtInst %1 40 %1590 %1592 
                         Private f32* %1594 = OpAccessChain %1367 %19 
                                                OpStore %1594 %1593 
                                f32_3 %1595 = OpLoad %1367 
                                f32_3 %1596 = OpVectorShuffle %1595 %1595 0 0 0 
                                f32_3 %1597 = OpFNegate %1596 
                                f32_4 %1598 = OpLoad %45 
                                f32_3 %1599 = OpVectorShuffle %1598 %1598 0 1 2 
                                f32_3 %1600 = OpFMul %1597 %1599 
                                f32_4 %1601 = OpLoad %481 
                                f32_3 %1602 = OpVectorShuffle %1601 %1601 0 1 2 
                                f32_3 %1603 = OpFAdd %1600 %1602 
                                                OpStore %1367 %1603 
                read_only TextureCube %1604 = OpLoad %211 
                              sampler %1605 = OpLoad %215 
         read_only TextureCubeSampled %1606 = OpSampledImage %1604 %1605 
                                f32_3 %1607 = OpLoad %1367 
                         Uniform f32* %1608 = OpAccessChain %12 %221 
                                  f32 %1609 = OpLoad %1608 
                                f32_4 %1610 = OpImageSampleExplicitLod %1606 %1607 Lod %32 
                                                OpStore %481 %1610 
                                f32_4 %1611 = OpLoad %481 
                                f32_4 %1612 = OpExtInst %1 40 %1611 %226 
                                                OpStore %481 %1612 
                                f32_4 %1613 = OpLoad %472 
                                f32_4 %1614 = OpLoad %481 
                                f32_4 %1615 = OpFAdd %1613 %1614 
                                                OpStore %472 %1615 
                                f32_4 %1616 = OpLoad %246 
                                f32_4 %1617 = OpVectorShuffle %1616 %1616 1 1 1 1 
                                f32_4 %1618 = OpLoad %472 
                                f32_4 %1619 = OpFMul %1617 %1618 
                                                OpStore %472 %1619 
                                f32_4 %1620 = OpLoad %126 
                                f32_3 %1621 = OpVectorShuffle %1620 %1620 2 0 1 
                                f32_3 %1622 = OpFMul %1621 %149 
                                f32_4 %1623 = OpLoad vs_TEXCOORD0 
                                f32_3 %1624 = OpVectorShuffle %1623 %1623 0 1 2 
                                f32_3 %1625 = OpFAdd %1622 %1624 
                                                OpStore %1367 %1625 
                                f32_3 %1626 = OpLoad %1367 
                                f32_3 %1627 = OpExtInst %1 40 %1626 %169 
                                f32_4 %1628 = OpLoad %481 
                                f32_4 %1629 = OpVectorShuffle %1628 %1627 4 5 6 3 
                                                OpStore %481 %1629 
                                f32_4 %1630 = OpLoad %481 
                                f32_3 %1631 = OpVectorShuffle %1630 %1630 0 1 2 
                                f32_3 %1632 = OpExtInst %1 37 %1631 %71 
                                f32_4 %1633 = OpLoad %481 
                                f32_4 %1634 = OpVectorShuffle %1633 %1632 4 5 6 3 
                                                OpStore %481 %1634 
                                f32_3 %1635 = OpLoad %1367 
                                f32_4 %1636 = OpLoad %481 
                                f32_3 %1637 = OpVectorShuffle %1636 %1636 0 1 2 
                                f32_3 %1638 = OpFNegate %1637 
                                f32_3 %1639 = OpFAdd %1635 %1638 
                                                OpStore %1367 %1639 
                         Private f32* %1640 = OpAccessChain %1367 %23 
                                  f32 %1641 = OpLoad %1640 
                                  f32 %1642 = OpExtInst %1 4 %1641 
                         Private f32* %1643 = OpAccessChain %1367 %19 
                                  f32 %1644 = OpLoad %1643 
                                  f32 %1645 = OpExtInst %1 4 %1644 
                                  f32 %1646 = OpExtInst %1 40 %1642 %1645 
                         Private f32* %1647 = OpAccessChain %1367 %19 
                                                OpStore %1647 %1646 
                         Private f32* %1648 = OpAccessChain %1367 %26 
                                  f32 %1649 = OpLoad %1648 
                                  f32 %1650 = OpExtInst %1 4 %1649 
                         Private f32* %1651 = OpAccessChain %1367 %19 
                                  f32 %1652 = OpLoad %1651 
                                  f32 %1653 = OpExtInst %1 40 %1650 %1652 
                         Private f32* %1654 = OpAccessChain %1367 %19 
                                                OpStore %1654 %1653 
                                f32_3 %1655 = OpLoad %1367 
                                f32_3 %1656 = OpVectorShuffle %1655 %1655 0 0 0 
                                f32_3 %1657 = OpFNegate %1656 
                                f32_4 %1658 = OpLoad %45 
                                f32_3 %1659 = OpVectorShuffle %1658 %1658 0 1 2 
                                f32_3 %1660 = OpFMul %1657 %1659 
                                f32_4 %1661 = OpLoad %481 
                                f32_3 %1662 = OpVectorShuffle %1661 %1661 0 1 2 
                                f32_3 %1663 = OpFAdd %1660 %1662 
                                                OpStore %1367 %1663 
                                f32_4 %1664 = OpLoad %126 
                                f32_3 %1665 = OpVectorShuffle %1664 %1664 0 1 2 
                                f32_3 %1666 = OpFNegate %1665 
                                f32_3 %1667 = OpFMul %1666 %359 
                                f32_3 %1668 = OpLoad %1367 
                                f32_3 %1669 = OpFAdd %1667 %1668 
                                f32_4 %1670 = OpLoad %481 
                                f32_4 %1671 = OpVectorShuffle %1670 %1669 4 5 6 3 
                                                OpStore %481 %1671 
                                f32_4 %1672 = OpLoad %126 
                                f32_3 %1673 = OpVectorShuffle %1672 %1672 0 1 2 
                                f32_3 %1674 = OpFMul %1673 %359 
                                f32_3 %1675 = OpLoad %1367 
                                f32_3 %1676 = OpFAdd %1674 %1675 
                                                OpStore %1367 %1676 
                read_only TextureCube %1677 = OpLoad %211 
                              sampler %1678 = OpLoad %215 
         read_only TextureCubeSampled %1679 = OpSampledImage %1677 %1678 
                                f32_3 %1680 = OpLoad %1367 
                         Uniform f32* %1681 = OpAccessChain %12 %221 
                                  f32 %1682 = OpLoad %1681 
                                f32_4 %1683 = OpImageSampleExplicitLod %1679 %1680 Lod %32 
                                                OpStore %620 %1683 
                                f32_4 %1684 = OpLoad %620 
                                f32_4 %1685 = OpExtInst %1 40 %1684 %226 
                                                OpStore %620 %1685 
                read_only TextureCube %1686 = OpLoad %211 
                              sampler %1687 = OpLoad %215 
         read_only TextureCubeSampled %1688 = OpSampledImage %1686 %1687 
                                f32_4 %1689 = OpLoad %481 
                                f32_3 %1690 = OpVectorShuffle %1689 %1689 0 1 2 
                         Uniform f32* %1691 = OpAccessChain %12 %221 
                                  f32 %1692 = OpLoad %1691 
                                f32_4 %1693 = OpImageSampleExplicitLod %1688 %1690 Lod %32 
                                                OpStore %481 %1693 
                                f32_4 %1694 = OpLoad %481 
                                f32_4 %1695 = OpExtInst %1 40 %1694 %226 
                                                OpStore %481 %1695 
                                f32_4 %1696 = OpLoad %620 
                                f32_4 %1697 = OpLoad %481 
                                f32_4 %1698 = OpFAdd %1696 %1697 
                                                OpStore %481 %1698 
                                f32_4 %1699 = OpLoad %246 
                                f32_4 %1700 = OpVectorShuffle %1699 %1699 0 0 0 0 
                                f32_4 %1701 = OpLoad %481 
                                f32_4 %1702 = OpFMul %1700 %1701 
                                f32_4 %1703 = OpLoad %472 
                                f32_4 %1704 = OpFAdd %1702 %1703 
                                                OpStore %472 %1704 
                                f32_4 %1705 = OpLoad %246 
                                f32_3 %1706 = OpVectorShuffle %1705 %1705 0 1 2 
                                  f32 %1707 = OpDot %1706 %1361 
                         Private f32* %1708 = OpAccessChain %1367 %19 
                                                OpStore %1708 %1707 
                                f32_4 %1709 = OpLoad %154 
                                f32_4 %1710 = OpLoad %472 
                                f32_4 %1711 = OpFAdd %1709 %1710 
                                                OpStore %154 %1711 
                                f32_3 %1712 = OpLoad %421 
                                f32_3 %1713 = OpExtInst %1 40 %1712 %169 
                                f32_4 %1714 = OpLoad %246 
                                f32_4 %1715 = OpVectorShuffle %1714 %1713 4 5 6 3 
                                                OpStore %246 %1715 
                                f32_4 %1716 = OpLoad %246 
                                f32_3 %1717 = OpVectorShuffle %1716 %1716 0 1 2 
                                f32_3 %1718 = OpExtInst %1 37 %1717 %71 
                                f32_4 %1719 = OpLoad %246 
                                f32_4 %1720 = OpVectorShuffle %1719 %1718 4 5 6 3 
                                                OpStore %246 %1720 
                                f32_4 %1721 = OpLoad %246 
                                f32_3 %1722 = OpVectorShuffle %1721 %1721 0 1 2 
                                f32_3 %1723 = OpFNegate %1722 
                                f32_3 %1724 = OpLoad %421 
                                f32_3 %1725 = OpFAdd %1723 %1724 
                                                OpStore %421 %1725 
                         Private f32* %1727 = OpAccessChain %421 %23 
                                  f32 %1728 = OpLoad %1727 
                                  f32 %1729 = OpExtInst %1 4 %1728 
                         Private f32* %1730 = OpAccessChain %421 %19 
                                  f32 %1731 = OpLoad %1730 
                                  f32 %1732 = OpExtInst %1 4 %1731 
                                  f32 %1733 = OpExtInst %1 40 %1729 %1732 
                                                OpStore %1726 %1733 
                         Private f32* %1734 = OpAccessChain %421 %26 
                                  f32 %1735 = OpLoad %1734 
                                  f32 %1736 = OpExtInst %1 4 %1735 
                                  f32 %1737 = OpLoad %1726 
                                  f32 %1738 = OpExtInst %1 40 %1736 %1737 
                                                OpStore %1726 %1738 
                                  f32 %1739 = OpLoad %1726 
                                f32_3 %1740 = OpCompositeConstruct %1739 %1739 %1739 
                                f32_3 %1741 = OpFNegate %1740 
                                f32_4 %1742 = OpLoad %45 
                                f32_3 %1743 = OpVectorShuffle %1742 %1742 0 1 2 
                                f32_3 %1744 = OpFMul %1741 %1743 
                                f32_4 %1745 = OpLoad %246 
                                f32_3 %1746 = OpVectorShuffle %1745 %1745 0 1 2 
                                f32_3 %1747 = OpFAdd %1744 %1746 
                                f32_4 %1748 = OpLoad %246 
                                f32_4 %1749 = OpVectorShuffle %1748 %1747 4 5 6 3 
                                                OpStore %246 %1749 
                read_only TextureCube %1750 = OpLoad %211 
                              sampler %1751 = OpLoad %215 
         read_only TextureCubeSampled %1752 = OpSampledImage %1750 %1751 
                                f32_4 %1753 = OpLoad %246 
                                f32_3 %1754 = OpVectorShuffle %1753 %1753 0 1 2 
                         Uniform f32* %1755 = OpAccessChain %12 %221 
                                  f32 %1756 = OpLoad %1755 
                                f32_4 %1757 = OpImageSampleExplicitLod %1752 %1754 Lod %32 
                                                OpStore %246 %1757 
                                f32_4 %1758 = OpLoad %246 
                                f32_4 %1759 = OpExtInst %1 40 %1758 %226 
                                                OpStore %246 %1759 
                                f32_4 %1760 = OpLoad %236 
                                f32_3 %1761 = OpVectorShuffle %1760 %1760 0 1 2 
                                f32_3 %1762 = OpExtInst %1 40 %1761 %169 
                                                OpStore %421 %1762 
                                f32_3 %1763 = OpLoad %421 
                                f32_3 %1764 = OpExtInst %1 37 %1763 %71 
                                                OpStore %421 %1764 
                                f32_4 %1765 = OpLoad %236 
                                f32_3 %1766 = OpVectorShuffle %1765 %1765 0 1 2 
                                f32_3 %1767 = OpLoad %421 
                                f32_3 %1768 = OpFNegate %1767 
                                f32_3 %1769 = OpFAdd %1766 %1768 
                                f32_4 %1770 = OpLoad %236 
                                f32_4 %1771 = OpVectorShuffle %1770 %1769 4 5 6 3 
                                                OpStore %236 %1771 
                         Private f32* %1772 = OpAccessChain %236 %23 
                                  f32 %1773 = OpLoad %1772 
                                  f32 %1774 = OpExtInst %1 4 %1773 
                         Private f32* %1775 = OpAccessChain %236 %19 
                                  f32 %1776 = OpLoad %1775 
                                  f32 %1777 = OpExtInst %1 4 %1776 
                                  f32 %1778 = OpExtInst %1 40 %1774 %1777 
                                                OpStore %1726 %1778 
                         Private f32* %1779 = OpAccessChain %236 %26 
                                  f32 %1780 = OpLoad %1779 
                                  f32 %1781 = OpExtInst %1 4 %1780 
                                  f32 %1782 = OpLoad %1726 
                                  f32 %1783 = OpExtInst %1 40 %1781 %1782 
                                                OpStore %1726 %1783 
                                  f32 %1784 = OpLoad %1726 
                                f32_3 %1785 = OpCompositeConstruct %1784 %1784 %1784 
                                f32_3 %1786 = OpFNegate %1785 
                                f32_4 %1787 = OpLoad %45 
                                f32_3 %1788 = OpVectorShuffle %1787 %1787 0 1 2 
                                f32_3 %1789 = OpFMul %1786 %1788 
                                f32_3 %1790 = OpLoad %421 
                                f32_3 %1791 = OpFAdd %1789 %1790 
                                f32_4 %1792 = OpLoad %236 
                                f32_4 %1793 = OpVectorShuffle %1792 %1791 4 5 6 3 
                                                OpStore %236 %1793 
                read_only TextureCube %1794 = OpLoad %211 
                              sampler %1795 = OpLoad %215 
         read_only TextureCubeSampled %1796 = OpSampledImage %1794 %1795 
                                f32_4 %1797 = OpLoad %236 
                                f32_3 %1798 = OpVectorShuffle %1797 %1797 0 1 2 
                         Uniform f32* %1799 = OpAccessChain %12 %221 
                                  f32 %1800 = OpLoad %1799 
                                f32_4 %1801 = OpImageSampleExplicitLod %1796 %1798 Lod %32 
                                                OpStore %236 %1801 
                                f32_4 %1802 = OpLoad %236 
                                f32_4 %1803 = OpExtInst %1 40 %1802 %226 
                                                OpStore %236 %1803 
                                f32_4 %1804 = OpLoad %236 
                                f32_4 %1805 = OpLoad %246 
                                f32_4 %1806 = OpFAdd %1804 %1805 
                                                OpStore %236 %1806 
                                f32_3 %1807 = OpLoad %66 
                                f32_4 %1808 = OpVectorShuffle %1807 %1807 2 2 2 2 
                                f32_4 %1809 = OpLoad %236 
                                f32_4 %1810 = OpFMul %1808 %1809 
                                f32_4 %1811 = OpLoad %154 
                                f32_4 %1812 = OpFAdd %1810 %1811 
                                                OpStore %154 %1812 
                                f32_4 %1813 = OpLoad %126 
                                f32_3 %1814 = OpVectorShuffle %1813 %1813 2 0 1 
                                f32_3 %1815 = OpFMul %1814 %159 
                                f32_4 %1816 = OpLoad vs_TEXCOORD0 
                                f32_3 %1817 = OpVectorShuffle %1816 %1816 0 1 2 
                                f32_3 %1818 = OpFAdd %1815 %1817 
                                f32_4 %1819 = OpLoad %236 
                                f32_4 %1820 = OpVectorShuffle %1819 %1818 4 5 6 3 
                                                OpStore %236 %1820 
                                f32_4 %1821 = OpLoad %236 
                                f32_3 %1822 = OpVectorShuffle %1821 %1821 0 1 2 
                                f32_3 %1823 = OpExtInst %1 40 %1822 %169 
                                f32_4 %1824 = OpLoad %246 
                                f32_4 %1825 = OpVectorShuffle %1824 %1823 4 5 6 3 
                                                OpStore %246 %1825 
                                f32_4 %1826 = OpLoad %246 
                                f32_3 %1827 = OpVectorShuffle %1826 %1826 0 1 2 
                                f32_3 %1828 = OpExtInst %1 37 %1827 %71 
                                f32_4 %1829 = OpLoad %246 
                                f32_4 %1830 = OpVectorShuffle %1829 %1828 4 5 6 3 
                                                OpStore %246 %1830 
                                f32_4 %1831 = OpLoad %236 
                                f32_3 %1832 = OpVectorShuffle %1831 %1831 0 1 2 
                                f32_4 %1833 = OpLoad %246 
                                f32_3 %1834 = OpVectorShuffle %1833 %1833 0 1 2 
                                f32_3 %1835 = OpFNegate %1834 
                                f32_3 %1836 = OpFAdd %1832 %1835 
                                f32_4 %1837 = OpLoad %236 
                                f32_4 %1838 = OpVectorShuffle %1837 %1836 4 5 6 3 
                                                OpStore %236 %1838 
                         Private f32* %1839 = OpAccessChain %236 %23 
                                  f32 %1840 = OpLoad %1839 
                                  f32 %1841 = OpExtInst %1 4 %1840 
                         Private f32* %1842 = OpAccessChain %236 %19 
                                  f32 %1843 = OpLoad %1842 
                                  f32 %1844 = OpExtInst %1 4 %1843 
                                  f32 %1845 = OpExtInst %1 40 %1841 %1844 
                                                OpStore %1726 %1845 
                         Private f32* %1846 = OpAccessChain %236 %26 
                                  f32 %1847 = OpLoad %1846 
                                  f32 %1848 = OpExtInst %1 4 %1847 
                                  f32 %1849 = OpLoad %1726 
                                  f32 %1850 = OpExtInst %1 40 %1848 %1849 
                                                OpStore %1726 %1850 
                                  f32 %1851 = OpLoad %1726 
                                f32_3 %1852 = OpCompositeConstruct %1851 %1851 %1851 
                                f32_3 %1853 = OpFNegate %1852 
                                f32_4 %1854 = OpLoad %45 
                                f32_3 %1855 = OpVectorShuffle %1854 %1854 0 1 2 
                                f32_3 %1856 = OpFMul %1853 %1855 
                                f32_4 %1857 = OpLoad %246 
                                f32_3 %1858 = OpVectorShuffle %1857 %1857 0 1 2 
                                f32_3 %1859 = OpFAdd %1856 %1858 
                                f32_4 %1860 = OpLoad %236 
                                f32_4 %1861 = OpVectorShuffle %1860 %1859 4 5 6 3 
                                                OpStore %236 %1861 
                                f32_4 %1862 = OpLoad %126 
                                f32_3 %1863 = OpVectorShuffle %1862 %1862 0 1 2 
                                f32_3 %1864 = OpFMul %1863 %359 
                                f32_4 %1865 = OpLoad %236 
                                f32_3 %1866 = OpVectorShuffle %1865 %1865 0 1 2 
                                f32_3 %1867 = OpFAdd %1864 %1866 
                                f32_4 %1868 = OpLoad %246 
                                f32_4 %1869 = OpVectorShuffle %1868 %1867 4 5 6 3 
                                                OpStore %246 %1869 
                                f32_4 %1870 = OpLoad %126 
                                f32_3 %1871 = OpVectorShuffle %1870 %1870 0 1 2 
                                f32_3 %1872 = OpFNegate %1871 
                                f32_3 %1873 = OpFMul %1872 %359 
                                f32_4 %1874 = OpLoad %236 
                                f32_3 %1875 = OpVectorShuffle %1874 %1874 0 1 2 
                                f32_3 %1876 = OpFAdd %1873 %1875 
                                f32_4 %1877 = OpLoad %126 
                                f32_4 %1878 = OpVectorShuffle %1877 %1876 4 5 6 3 
                                                OpStore %126 %1878 
                read_only TextureCube %1879 = OpLoad %211 
                              sampler %1880 = OpLoad %215 
         read_only TextureCubeSampled %1881 = OpSampledImage %1879 %1880 
                                f32_4 %1882 = OpLoad %126 
                                f32_3 %1883 = OpVectorShuffle %1882 %1882 0 1 2 
                         Uniform f32* %1884 = OpAccessChain %12 %221 
                                  f32 %1885 = OpLoad %1884 
                                f32_4 %1886 = OpImageSampleExplicitLod %1881 %1883 Lod %32 
                                                OpStore %126 %1886 
                                f32_4 %1887 = OpLoad %126 
                                f32_4 %1888 = OpExtInst %1 40 %1887 %226 
                                                OpStore %126 %1888 
                read_only TextureCube %1889 = OpLoad %211 
                              sampler %1890 = OpLoad %215 
         read_only TextureCubeSampled %1891 = OpSampledImage %1889 %1890 
                                f32_4 %1892 = OpLoad %246 
                                f32_3 %1893 = OpVectorShuffle %1892 %1892 0 1 2 
                         Uniform f32* %1894 = OpAccessChain %12 %221 
                                  f32 %1895 = OpLoad %1894 
                                f32_4 %1896 = OpImageSampleExplicitLod %1891 %1893 Lod %32 
                                                OpStore %236 %1896 
                                f32_4 %1897 = OpLoad %236 
                                f32_4 %1898 = OpExtInst %1 40 %1897 %226 
                                                OpStore %236 %1898 
                                f32_4 %1899 = OpLoad %126 
                                f32_4 %1900 = OpLoad %236 
                                f32_4 %1901 = OpFAdd %1899 %1900 
                                                OpStore %126 %1901 
                                f32_4 %1902 = OpLoad %165 
                                f32_3 %1903 = OpVectorShuffle %1902 %1902 0 1 2 
                                f32_3 %1904 = OpExtInst %1 40 %1903 %169 
                                f32_4 %1905 = OpLoad %236 
                                f32_4 %1906 = OpVectorShuffle %1905 %1904 4 5 6 3 
                                                OpStore %236 %1906 
                                f32_4 %1907 = OpLoad %236 
                                f32_3 %1908 = OpVectorShuffle %1907 %1907 0 1 2 
                                f32_3 %1909 = OpExtInst %1 37 %1908 %71 
                                f32_4 %1910 = OpLoad %236 
                                f32_4 %1911 = OpVectorShuffle %1910 %1909 4 5 6 3 
                                                OpStore %236 %1911 
                                f32_4 %1912 = OpLoad %165 
                                f32_3 %1913 = OpVectorShuffle %1912 %1912 0 1 2 
                                f32_4 %1914 = OpLoad %236 
                                f32_3 %1915 = OpVectorShuffle %1914 %1914 0 1 2 
                                f32_3 %1916 = OpFNegate %1915 
                                f32_3 %1917 = OpFAdd %1913 %1916 
                                f32_4 %1918 = OpLoad %165 
                                f32_4 %1919 = OpVectorShuffle %1918 %1917 4 5 6 3 
                                                OpStore %165 %1919 
                         Private f32* %1920 = OpAccessChain %165 %23 
                                  f32 %1921 = OpLoad %1920 
                                  f32 %1922 = OpExtInst %1 4 %1921 
                         Private f32* %1923 = OpAccessChain %165 %19 
                                  f32 %1924 = OpLoad %1923 
                                  f32 %1925 = OpExtInst %1 4 %1924 
                                  f32 %1926 = OpExtInst %1 40 %1922 %1925 
                                                OpStore %1726 %1926 
                         Private f32* %1927 = OpAccessChain %165 %26 
                                  f32 %1928 = OpLoad %1927 
                                  f32 %1929 = OpExtInst %1 4 %1928 
                                  f32 %1930 = OpLoad %1726 
                                  f32 %1931 = OpExtInst %1 40 %1929 %1930 
                                                OpStore %1726 %1931 
                                  f32 %1932 = OpLoad %1726 
                                f32_3 %1933 = OpCompositeConstruct %1932 %1932 %1932 
                                f32_3 %1934 = OpFNegate %1933 
                                f32_4 %1935 = OpLoad %45 
                                f32_3 %1936 = OpVectorShuffle %1935 %1935 0 1 2 
                                f32_3 %1937 = OpFMul %1934 %1936 
                                f32_4 %1938 = OpLoad %236 
                                f32_3 %1939 = OpVectorShuffle %1938 %1938 0 1 2 
                                f32_3 %1940 = OpFAdd %1937 %1939 
                                f32_4 %1941 = OpLoad %165 
                                f32_4 %1942 = OpVectorShuffle %1941 %1940 4 5 6 3 
                                                OpStore %165 %1942 
                read_only TextureCube %1943 = OpLoad %211 
                              sampler %1944 = OpLoad %215 
         read_only TextureCubeSampled %1945 = OpSampledImage %1943 %1944 
                                f32_4 %1946 = OpLoad %165 
                                f32_3 %1947 = OpVectorShuffle %1946 %1946 0 1 2 
                         Uniform f32* %1948 = OpAccessChain %12 %221 
                                  f32 %1949 = OpLoad %1948 
                                f32_4 %1950 = OpImageSampleExplicitLod %1945 %1947 Lod %32 
                                                OpStore %165 %1950 
                                f32_4 %1951 = OpLoad %165 
                                f32_4 %1952 = OpExtInst %1 40 %1951 %226 
                                                OpStore %165 %1952 
                                f32_3 %1953 = OpLoad %144 
                                f32_3 %1954 = OpExtInst %1 40 %1953 %169 
                                f32_4 %1955 = OpLoad %236 
                                f32_4 %1956 = OpVectorShuffle %1955 %1954 4 5 6 3 
                                                OpStore %236 %1956 
                                f32_4 %1957 = OpLoad %236 
                                f32_3 %1958 = OpVectorShuffle %1957 %1957 0 1 2 
                                f32_3 %1959 = OpExtInst %1 37 %1958 %71 
                                f32_4 %1960 = OpLoad %236 
                                f32_4 %1961 = OpVectorShuffle %1960 %1959 4 5 6 3 
                                                OpStore %236 %1961 
                                f32_3 %1962 = OpLoad %144 
                                f32_4 %1963 = OpLoad %236 
                                f32_3 %1964 = OpVectorShuffle %1963 %1963 0 1 2 
                                f32_3 %1965 = OpFNegate %1964 
                                f32_3 %1966 = OpFAdd %1962 %1965 
                                                OpStore %144 %1966 
                         Private f32* %1967 = OpAccessChain %144 %23 
                                  f32 %1968 = OpLoad %1967 
                                  f32 %1969 = OpExtInst %1 4 %1968 
                         Private f32* %1970 = OpAccessChain %144 %19 
                                  f32 %1971 = OpLoad %1970 
                                  f32 %1972 = OpExtInst %1 4 %1971 
                                  f32 %1973 = OpExtInst %1 40 %1969 %1972 
                                                OpStore %1726 %1973 
                         Private f32* %1974 = OpAccessChain %144 %26 
                                  f32 %1975 = OpLoad %1974 
                                  f32 %1976 = OpExtInst %1 4 %1975 
                                  f32 %1977 = OpLoad %1726 
                                  f32 %1978 = OpExtInst %1 40 %1976 %1977 
                                                OpStore %1726 %1978 
                                  f32 %1979 = OpLoad %1726 
                                f32_3 %1980 = OpCompositeConstruct %1979 %1979 %1979 
                                f32_3 %1981 = OpFNegate %1980 
                                f32_4 %1982 = OpLoad %45 
                                f32_3 %1983 = OpVectorShuffle %1982 %1982 0 1 2 
                                f32_3 %1984 = OpFMul %1981 %1983 
                                f32_4 %1985 = OpLoad %236 
                                f32_3 %1986 = OpVectorShuffle %1985 %1985 0 1 2 
                                f32_3 %1987 = OpFAdd %1984 %1986 
                                f32_4 %1988 = OpLoad %45 
                                f32_4 %1989 = OpVectorShuffle %1988 %1987 4 5 6 3 
                                                OpStore %45 %1989 
                read_only TextureCube %1990 = OpLoad %211 
                              sampler %1991 = OpLoad %215 
         read_only TextureCubeSampled %1992 = OpSampledImage %1990 %1991 
                                f32_4 %1993 = OpLoad %45 
                                f32_3 %1994 = OpVectorShuffle %1993 %1993 0 1 2 
                         Uniform f32* %1995 = OpAccessChain %12 %221 
                                  f32 %1996 = OpLoad %1995 
                                f32_4 %1997 = OpImageSampleExplicitLod %1992 %1994 Lod %32 
                                                OpStore %45 %1997 
                                f32_4 %1998 = OpLoad %45 
                                f32_4 %1999 = OpExtInst %1 40 %1998 %226 
                                                OpStore %45 %1999 
                                f32_4 %2000 = OpLoad %45 
                                f32_4 %2001 = OpLoad %165 
                                f32_4 %2002 = OpFAdd %2000 %2001 
                                                OpStore %45 %2002 
                                f32_4 %2003 = OpLoad %45 
                                f32_3 %2004 = OpLoad %66 
                                f32_4 %2005 = OpVectorShuffle %2004 %2004 1 1 1 1 
                                f32_4 %2006 = OpFMul %2003 %2005 
                                                OpStore %45 %2006 
                                f32_3 %2007 = OpLoad %66 
                                f32_4 %2008 = OpVectorShuffle %2007 %2007 0 0 0 0 
                                f32_4 %2009 = OpLoad %126 
                                f32_4 %2010 = OpFMul %2008 %2009 
                                f32_4 %2011 = OpLoad %45 
                                f32_4 %2012 = OpFAdd %2010 %2011 
                                                OpStore %45 %2012 
                                f32_3 %2013 = OpLoad %66 
                                  f32 %2014 = OpDot %2013 %1361 
                                                OpStore %1726 %2014 
                                f32_4 %2015 = OpLoad %45 
                                f32_4 %2016 = OpLoad %154 
                                f32_4 %2017 = OpFAdd %2015 %2016 
                                                OpStore %45 %2017 
                         Private f32* %2018 = OpAccessChain %1367 %19 
                                  f32 %2019 = OpLoad %2018 
                                  f32 %2020 = OpLoad %1726 
                                  f32 %2021 = OpFAdd %2019 %2020 
                                                OpStore %77 %2021 
                         Private f32* %2022 = OpAccessChain %9 %19 
                                  f32 %2023 = OpLoad %2022 
                                  f32 %2024 = OpFMul %2023 %1360 
                                  f32 %2025 = OpLoad %77 
                                  f32 %2026 = OpFAdd %2024 %2025 
                         Private f32* %2027 = OpAccessChain %9 %19 
                                                OpStore %2027 %2026 
                         Private f32* %2028 = OpAccessChain %1367 %19 
                                  f32 %2029 = OpLoad %2028 
                         Private f32* %2030 = OpAccessChain %9 %19 
                                  f32 %2031 = OpLoad %2030 
                                  f32 %2032 = OpFAdd %2029 %2031 
                         Private f32* %2033 = OpAccessChain %9 %19 
                                                OpStore %2033 %2032 
                                  f32 %2034 = OpLoad %1726 
                         Private f32* %2035 = OpAccessChain %9 %19 
                                  f32 %2036 = OpLoad %2035 
                                  f32 %2037 = OpFAdd %2034 %2036 
                         Private f32* %2038 = OpAccessChain %9 %19 
                                                OpStore %2038 %2037 
                                f32_4 %2041 = OpLoad %45 
                                f32_3 %2042 = OpLoad %9 
                                f32_4 %2043 = OpVectorShuffle %2042 %2042 0 0 0 0 
                                f32_4 %2044 = OpFDiv %2041 %2043 
                                                OpStore %2040 %2044 
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
SubShader {
 LOD 200
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 200
  Tags { "RenderType" = "Opaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 80360
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
in  vec4 in_TEXCOORD0;
out vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0 = in_TEXCOORD0;
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
uniform 	float _Level;
UNITY_LOCATION(0) uniform  samplerCube _MainTex;
in  vec4 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = textureLod(_MainTex, vs_TEXCOORD0.xyz, _Level);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 91
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %82 %83 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 Location 82 
                                              OpDecorate %83 Location 83 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
               Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                         Input f32_4* %83 = OpVariable Input 
                                      %85 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_4 %84 = OpLoad %83 
                                              OpStore vs_TEXCOORD0 %84 
                          Output f32* %86 = OpAccessChain %72 %22 %68 
                                  f32 %87 = OpLoad %86 
                                  f32 %88 = OpFNegate %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                              OpStore %89 %88 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 35
; Schema: 0
                                               OpCapability Shader 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Fragment %4 "main" %9 %21 
                                               OpExecutionMode %4 OriginUpperLeft 
                                               OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                               OpDecorate %9 Location 9 
                                               OpDecorate %12 DescriptorSet 12 
                                               OpDecorate %12 Binding 12 
                                               OpDecorate %16 DescriptorSet 16 
                                               OpDecorate %16 Binding 16 
                                               OpDecorate vs_TEXCOORD0 Location 21 
                                               OpMemberDecorate %25 0 Offset 25 
                                               OpDecorate %25 Block 
                                               OpDecorate %27 DescriptorSet 27 
                                               OpDecorate %27 Binding 27 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 4 
                                        %8 = OpTypePointer Output %7 
                          Output f32_4* %9 = OpVariable Output 
                                       %10 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                       %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only TextureCube* %12 = OpVariable UniformConstant 
                                       %14 = OpTypeSampler 
                                       %15 = OpTypePointer UniformConstant %14 
              UniformConstant sampler* %16 = OpVariable UniformConstant 
                                       %18 = OpTypeSampledImage %10 
                                       %20 = OpTypePointer Input %7 
                 Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                       %22 = OpTypeVector %6 3 
                                       %25 = OpTypeStruct %6 
                                       %26 = OpTypePointer Uniform %25 
                Uniform struct {f32;}* %27 = OpVariable Uniform 
                                       %28 = OpTypeInt 32 1 
                                   i32 %29 = OpConstant 0 
                                       %30 = OpTypePointer Uniform %6 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                 read_only TextureCube %13 = OpLoad %12 
                               sampler %17 = OpLoad %16 
          read_only TextureCubeSampled %19 = OpSampledImage %13 %17 
                                 f32_4 %23 = OpLoad vs_TEXCOORD0 
                                 f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                          Uniform f32* %31 = OpAccessChain %27 %29 
                                   f32 %32 = OpLoad %31 
                                 f32_4 %33 = OpImageSampleExplicitLod %19 %24 Lod %7 
                                               OpStore %9 %33 
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