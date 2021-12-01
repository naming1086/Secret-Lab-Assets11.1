//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-GUIRoundedRectWithColorPerBorder" {
Properties {
_MainTex ("Texture", any) = "white" { }
_SrcBlend ("SrcBlend", Float) = 5
_DstBlend ("DstBlend", Float) = 10
}
SubShader {
 Pass {
  Blend Zero Zero, One OneMinusSrcAlpha
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 54034
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
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
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	int _ManualTex2SRGB;
uniform 	int _SrcBlend;
uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
uniform 	vec4 _BorderColors[4];
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _GUIClipTexture;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
ivec3 u_xlati2;
bvec4 u_xlatb2;
vec4 u_xlat3;
bvec2 u_xlatb3;
vec4 u_xlat4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
bvec2 u_xlatb9;
float u_xlat11;
bvec3 u_xlatb11;
vec3 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
int u_xlati13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
float u_xlat20;
bool u_xlatb20;
bool u_xlatb21;
float u_xlat27;
int u_xlati27;
bool u_xlatb27;
float u_xlat28;
int u_xlati29;
bool u_xlatb29;
float u_xlat30;
int u_xlati30;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD2.x);
    u_xlat0.x = float(1.0) / abs(u_xlat0.x);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat9.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = (_ManualTex2SRGB != 0) ? u_xlat9.xyz : u_xlat1.xyz;
    u_xlat9.x = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat9.x = (-_Rect[2]) * 0.5 + u_xlat9.x;
    u_xlat18 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat9.y = (-_Rect[3]) * 0.5 + u_xlat18;
    u_xlatb9.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlati2.xyz = (u_xlatb9.y) ? ivec3(0, 1, 2) : ivec3(3, 2, 8);
    u_xlati27 = (u_xlatb9.x) ? u_xlati2.x : u_xlati2.y;
    u_xlati2.x = (u_xlatb9.x) ? 1 : 4;
    u_xlat3.y = _Rect[0] + _CornerRadiuses[u_xlati27];
    u_xlat4.y = _Rect[1] + _CornerRadiuses[u_xlati27];
    u_xlat3.w = _BorderWidths[0] + _Rect[0];
    u_xlat4.w = _BorderWidths[1] + _Rect[1];
    u_xlat5.x = _Rect[0] + _Rect[2];
    u_xlat5.y = u_xlat5.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat5.w = u_xlat5.x + (-_BorderWidths[2]);
    u_xlat3.x = _Rect[0];
    u_xlat3.z = _BorderWidths[0];
    u_xlat5.z = _BorderWidths[2];
    u_xlat5 = (u_xlatb9.x) ? u_xlat3 : u_xlat5;
    u_xlat6.x = _Rect[1] + _Rect[3];
    u_xlat6.y = u_xlat6.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat6.w = u_xlat6.x + (-_BorderWidths[3]);
    u_xlat4.x = _Rect[1];
    u_xlat4.z = _BorderWidths[1];
    u_xlat6.z = _BorderWidths[3];
    u_xlat6 = (u_xlatb9.y) ? u_xlat4.yxzw : u_xlat6.yxzw;
    u_xlatb11.xz = greaterThanEqual(u_xlat5.yyww, vs_TEXCOORD2.xxxx).xz;
    u_xlatb3.xy = greaterThanEqual(vs_TEXCOORD2.xxxx, u_xlat5.ywyy).xy;
    u_xlatb11.xz = (u_xlatb9.x) ? u_xlatb11.xz : u_xlatb3.xy;
    u_xlatb3.xy = greaterThanEqual(u_xlat6.xwxx, vs_TEXCOORD2.yyyy).xy;
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD2.yyyy, u_xlat6.xwxx).xy;
    u_xlatb9.xy = (u_xlatb9.y) ? u_xlatb3.xy : u_xlatb4.xy;
    u_xlatb9.x = u_xlatb9.x && u_xlatb11.x;
    u_xlat11 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat11 = (-u_xlat11) + _Rect[2];
    u_xlat3.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat3.x = (-u_xlat3.x) + _Rect[3];
    u_xlatb12 = vs_TEXCOORD2.x>=u_xlat3.w;
    u_xlat11 = u_xlat11 + u_xlat3.w;
    u_xlatb11.x = u_xlat11>=vs_TEXCOORD2.x;
    u_xlatb11.x = u_xlatb11.x && u_xlatb12;
    u_xlatb12 = vs_TEXCOORD2.y>=u_xlat4.w;
    u_xlatb11.x = u_xlatb11.x && u_xlatb12;
    u_xlat3.x = u_xlat3.x + u_xlat4.w;
    u_xlatb3.x = u_xlat3.x>=vs_TEXCOORD2.y;
    u_xlatb11.x = u_xlatb11.x && u_xlatb3.x;
    u_xlatb3.xy = equal(ivec4(u_xlati27), ivec4(0, 2, 0, 0)).xy;
    u_xlatb3.x = u_xlatb3.y || u_xlatb3.x;
    u_xlatb12 = 0.0<_CornerRadiuses[u_xlati27];
    u_xlatb12 = u_xlatb9.x && u_xlatb12;
    u_xlatb21 = 0.0<u_xlat5.z;
    u_xlati30 = u_xlatb21 ? 1 : int(0);
    u_xlatb4.x = 0.0<u_xlat6.z;
    u_xlati13 = u_xlatb4.x ? 1 : int(0);
    u_xlati13 = u_xlati2.z * u_xlati13;
    u_xlati30 = u_xlati30 * u_xlati2.x + u_xlati13;
    u_xlatb29 = u_xlatb11.z && u_xlatb21;
    u_xlatb18 = u_xlatb9.y && u_xlatb4.x;
    u_xlati29 = u_xlatb29 ? 1 : int(0);
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlati18 = u_xlati2.z * u_xlati18;
    u_xlati18 = u_xlati29 * u_xlati2.x + u_xlati18;
    u_xlati18 = (u_xlatb11.x) ? 0 : u_xlati18;
    u_xlati18 = (u_xlatb12) ? u_xlati30 : u_xlati18;
    u_xlati29 = u_xlati2.z + u_xlati2.x;
    u_xlat3.x = (u_xlatb3.x) ? 1.0 : -1.0;
    u_xlat7.xz = u_xlat5.wy;
    u_xlat7.yw = u_xlat6.wx;
    u_xlat6.x = u_xlat5.x;
    u_xlat12.xz = (-u_xlat7.yx) + u_xlat6.yx;
    u_xlat3.xy = u_xlat12.xz * u_xlat3.xx;
    u_xlat30 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.xy = vec2(u_xlat30) * u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(100.0, 100.0) + u_xlat6.yx;
    u_xlat13.xy = (-u_xlat3.yx) + u_xlat6.xy;
    u_xlat3.xy = (-u_xlat3.xy) + vs_TEXCOORD2.yx;
    u_xlat12.x = u_xlat3.y * u_xlat13.y;
    u_xlat3.x = u_xlat13.x * u_xlat3.x + (-u_xlat12.x);
    u_xlatb3.x = u_xlat3.x>=0.0;
    u_xlati2.x = (u_xlatb3.x) ? u_xlati2.x : u_xlati2.z;
    u_xlatb20 = u_xlati18!=u_xlati29;
    u_xlati18 = (u_xlatb20) ? u_xlati18 : u_xlati2.x;
    if(u_xlati18 == 0) {
        u_xlat8 = u_xlat1 * vs_COLOR0;
    } else {
        u_xlatb2.xzw = equal(ivec4(u_xlati18), ivec4(2, 0, 4, 8)).xzw;
        u_xlati18 = u_xlatb2.w ? 3 : int(0);
        u_xlati18 = (u_xlatb2.z) ? 2 : u_xlati18;
        u_xlati18 = (u_xlatb2.x) ? 1 : u_xlati18;
        u_xlat8 = u_xlat1 * _BorderColors[u_xlati18];
    }
    u_xlatb18 = u_xlatb21 || u_xlatb4.x;
    u_xlat1.xy = (-u_xlat7.zw) + vs_TEXCOORD2.xy;
    u_xlat28 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = u_xlat28 + (-_CornerRadiuses[u_xlati27]);
    u_xlat28 = u_xlat28 * u_xlat0.x + 0.5;
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlat28 = u_xlatb18 ? u_xlat28 : float(0.0);
    u_xlat2 = (-u_xlat5.z) + _CornerRadiuses[u_xlati27];
    u_xlat27 = (-u_xlat6.z) + _CornerRadiuses[u_xlati27];
    u_xlat20 = u_xlat2 / u_xlat27;
    u_xlat1.z = u_xlat1.y * u_xlat20;
    u_xlat1.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat2) + u_xlat1.x;
    u_xlat0.x = u_xlat1.x * u_xlat0.x + 0.5;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlatb1 = 0.0<u_xlat2;
    u_xlatb27 = 0.0<u_xlat27;
    u_xlatb27 = u_xlatb27 && u_xlatb1;
    u_xlat0.x = (u_xlatb27) ? u_xlat0.x : 1.0;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
    u_xlatb18 = u_xlat28==0.0;
    u_xlat27 = (-u_xlat28) + 1.0;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat27;
    u_xlat0.x = (u_xlatb9.x) ? u_xlat0.x : 1.0;
    u_xlat0.z = u_xlat0.x * u_xlat8.w;
    u_xlat27 = (u_xlatb11.x) ? 0.0 : 1.0;
    u_xlat9.x = (u_xlatb9.x) ? 1.0 : u_xlat27;
    u_xlat0.xz = u_xlat9.xx * u_xlat0.xz;
    u_xlat1 = texture(_GUIClipTexture, vs_TEXCOORD1.xy);
    SV_Target0.w = u_xlat0.z * u_xlat1.w;
    u_xlatb18 = _SrcBlend!=5;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat8.xyz;
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyw : u_xlat8.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 176
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %149 %156 %158 %168 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate vs_TEXCOORD1 Location 149 
                                                      OpDecorate vs_TEXCOORD0 Location 156 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate vs_TEXCOORD2 Location 168 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeStruct %16 %17 %18 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                              %87 = OpTypeVector %6 2 
                                             %129 = OpTypePointer Private %87 
                              Private f32_2* %130 = OpVariable Private 
                                         i32 %133 = OpConstant 4 
                                             %148 = OpTypePointer Output %87 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %157 = OpTypePointer Input %87 
                                Input f32_2* %158 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %170 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                                                      OpStore %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_2 %89 = OpVectorShuffle %88 %88 1 1 
                               Uniform f32_4* %90 = OpAccessChain %22 %25 %25 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_2 %93 = OpFMul %89 %92 
                                        f32_4 %94 = OpLoad %50 
                                        f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                      OpStore %50 %95 
                               Uniform f32_4* %96 = OpAccessChain %22 %25 %24 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                        f32_4 %99 = OpLoad %9 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 0 
                                       f32_2 %101 = OpFMul %98 %100 
                                       f32_4 %102 = OpLoad %50 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFAdd %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %22 %25 %37 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 2 
                                       f32_2 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %9 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
                                       f32_2 %115 = OpFAdd %112 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 2 3 
                                                      OpStore %9 %117 
                              Uniform f32_4* %118 = OpAccessChain %22 %25 %46 
                                       f32_4 %119 = OpLoad %118 
                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_2 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_2 %126 = OpFAdd %123 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                       f32_4 %131 = OpLoad %9 
                                       f32_2 %132 = OpVectorShuffle %131 %131 1 1 
                              Uniform f32_4* %134 = OpAccessChain %22 %133 %25 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFMul %132 %136 
                                                      OpStore %130 %137 
                              Uniform f32_4* %138 = OpAccessChain %22 %133 %24 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_4 %141 = OpLoad %9 
                                       f32_2 %142 = OpVectorShuffle %141 %141 0 0 
                                       f32_2 %143 = OpFMul %140 %142 
                                       f32_2 %144 = OpLoad %130 
                                       f32_2 %145 = OpFAdd %143 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 2 3 
                                                      OpStore %9 %147 
                                       f32_4 %150 = OpLoad %9 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                              Uniform f32_4* %152 = OpAccessChain %22 %133 %46 
                                       f32_4 %153 = OpLoad %152 
                                       f32_2 %154 = OpVectorShuffle %153 %153 0 1 
                                       f32_2 %155 = OpFAdd %151 %154 
                                                      OpStore vs_TEXCOORD1 %155 
                                       f32_2 %159 = OpLoad %158 
                              Uniform f32_4* %160 = OpAccessChain %22 %46 
                                       f32_4 %161 = OpLoad %160 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %163 = OpFMul %159 %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 2 3 
                                       f32_2 %167 = OpFAdd %163 %166 
                                                      OpStore vs_TEXCOORD0 %167 
                                       f32_4 %169 = OpLoad %11 
                                                      OpStore vs_TEXCOORD2 %169 
                                 Output f32* %171 = OpAccessChain %74 %24 %70 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFNegate %172 
                                 Output f32* %174 = OpAccessChain %74 %24 %70 
                                                      OpStore %174 %173 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 857
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %39 %618 %812 %817 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate vs_TEXCOORD2 Location 11 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate vs_TEXCOORD0 Location 39 
                                                      OpDecorate %69 ArrayStride 69 
                                                      OpDecorate %70 ArrayStride 70 
                                                      OpDecorate %71 ArrayStride 71 
                                                      OpDecorate %72 ArrayStride 72 
                                                      OpMemberDecorate %73 0 Offset 73 
                                                      OpMemberDecorate %73 1 Offset 73 
                                                      OpMemberDecorate %73 2 Offset 73 
                                                      OpMemberDecorate %73 3 Offset 73 
                                                      OpMemberDecorate %73 4 Offset 73 
                                                      OpMemberDecorate %73 5 Offset 73 
                                                      OpDecorate %73 Block 
                                                      OpDecorate %75 DescriptorSet 75 
                                                      OpDecorate %75 Binding 75 
                                                      OpDecorate %618 Location 618 
                                                      OpDecorate %807 DescriptorSet 807 
                                                      OpDecorate %807 Binding 807 
                                                      OpDecorate %809 DescriptorSet 809 
                                                      OpDecorate %809 Binding 809 
                                                      OpDecorate vs_TEXCOORD1 Location 812 
                                                      OpDecorate %817 Location 817 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %12 = OpTypeInt 32 0 
                                          u32 %13 = OpConstant 0 
                                              %14 = OpTypePointer Input %6 
                                              %18 = OpTypePointer Private %6 
                                          f32 %20 = OpConstant 3.674022E-40 
                               Private f32_4* %26 = OpVariable Private 
                                              %27 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %28 = OpTypePointer UniformConstant %27 
         UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
                                              %31 = OpTypeSampler 
                                              %32 = OpTypePointer UniformConstant %31 
                     UniformConstant sampler* %33 = OpVariable UniformConstant 
                                              %35 = OpTypeSampledImage %27 
                                              %37 = OpTypeVector %6 2 
                                              %38 = OpTypePointer Input %37 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %42 = OpTypeVector %6 3 
                                              %43 = OpTypePointer Private %42 
                               Private f32_3* %44 = OpVariable Private 
                                          f32 %47 = OpConstant 3.674022E-40 
                                        f32_3 %48 = OpConstantComposite %47 %47 %47 
                                          f32 %53 = OpConstant 3.674022E-40 
                                        f32_3 %54 = OpConstantComposite %53 %53 %53 
                                          f32 %59 = OpConstant 3.674022E-40 
                                        f32_3 %60 = OpConstantComposite %59 %59 %59 
                                          f32 %62 = OpConstant 3.674022E-40 
                                        f32_3 %63 = OpConstantComposite %62 %62 %62 
                                              %67 = OpTypeInt 32 1 
                                          u32 %68 = OpConstant 4 
                                              %69 = OpTypeArray %6 %68 
                                              %70 = OpTypeArray %6 %68 
                                              %71 = OpTypeArray %6 %68 
                                              %72 = OpTypeArray %7 %68 
                                              %73 = OpTypeStruct %67 %67 %69 %70 %71 %72 
                                              %74 = OpTypePointer Uniform %73 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4]; f32_4[4];}* %75 = OpVariable Uniform 
                                          i32 %76 = OpConstant 0 
                                              %77 = OpTypePointer Uniform %67 
                                              %80 = OpTypeBool 
                                              %82 = OpTypePointer Function %42 
                                          i32 %95 = OpConstant 4 
                                              %96 = OpTypePointer Uniform %6 
                                         i32 %102 = OpConstant 2 
                                         f32 %106 = OpConstant 3.674022E-40 
                                Private f32* %112 = OpVariable Private 
                                         u32 %113 = OpConstant 1 
                                         i32 %116 = OpConstant 1 
                                         i32 %121 = OpConstant 3 
                                             %129 = OpTypeVector %80 2 
                                             %130 = OpTypePointer Private %129 
                             Private bool_2* %131 = OpVariable Private 
                                       f32_4 %132 = OpConstantComposite %47 %47 %47 %47 
                                             %135 = OpTypeVector %80 4 
                                             %138 = OpTypeVector %67 3 
                                             %139 = OpTypePointer Private %138 
                              Private i32_3* %140 = OpVariable Private 
                                             %141 = OpTypePointer Private %80 
                                       i32_3 %144 = OpConstantComposite %76 %116 %102 
                                         i32 %145 = OpConstant 8 
                                       i32_3 %146 = OpConstantComposite %121 %102 %145 
                                             %147 = OpTypeVector %80 3 
                                             %150 = OpTypePointer Private %67 
                                Private i32* %151 = OpVariable Private 
                                             %154 = OpTypePointer Function %67 
                              Private f32_4* %168 = OpVariable Private 
                              Private f32_4* %176 = OpVariable Private 
                                         u32 %189 = OpConstant 3 
                              Private f32_4* %197 = OpVariable Private 
                                         u32 %224 = OpConstant 2 
                              Private f32_4* %235 = OpVariable Private 
                                             %268 = OpTypePointer Function %7 
                                             %278 = OpTypePointer Private %147 
                             Private bool_3* %279 = OpVariable Private 
                             Private bool_2* %288 = OpVariable Private 
                                             %297 = OpTypePointer Function %129 
                             Private bool_2* %314 = OpVariable Private 
                                Private f32* %336 = OpVariable Private 
                               Private bool* %360 = OpVariable Private 
                                             %409 = OpTypeVector %67 4 
                                       i32_4 %411 = OpConstantComposite %76 %102 %76 %76 
                               Private bool* %428 = OpVariable Private 
                                Private i32* %432 = OpVariable Private 
                                Private i32* %439 = OpVariable Private 
                               Private bool* %453 = OpVariable Private 
                               Private bool* %458 = OpVariable Private 
                                Private i32* %464 = OpVariable Private 
                                Private i32* %467 = OpVariable Private 
                                         f32 %495 = OpConstant 3.674022E-40 
                              Private f32_4* %498 = OpVariable Private 
                              Private f32_3* %510 = OpVariable Private 
                                Private f32* %526 = OpVariable Private 
                                         f32 %543 = OpConstant 3.674022E-40 
                                       f32_2 %544 = OpConstantComposite %543 %543 
                                             %551 = OpTypePointer Private %37 
                              Private f32_2* %552 = OpVariable Private 
                               Private bool* %599 = OpVariable Private 
                              Private f32_4* %616 = OpVariable Private 
                                Input f32_4* %618 = OpVariable Input 
                                             %622 = OpTypePointer Private %135 
                             Private bool_4* %623 = OpVariable Private 
                                       i32_4 %626 = OpConstantComposite %102 %76 %95 %145 
                                         i32 %643 = OpConstant 5 
                                             %645 = OpTypePointer Uniform %7 
                                Private f32* %661 = OpVariable Private 
                                Private f32* %685 = OpVariable Private 
                                Private f32* %693 = OpVariable Private 
                                Private f32* %701 = OpVariable Private 
                               Private bool* %737 = OpVariable Private 
                               Private bool* %740 = OpVariable Private 
                                             %747 = OpTypePointer Function %6 
        UniformConstant read_only Texture2D* %807 = OpVariable UniformConstant 
                    UniformConstant sampler* %809 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                             %816 = OpTypePointer Output %7 
                               Output f32_4* %817 = OpVariable Output 
                                             %821 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %83 = OpVariable Function 
                               Function i32* %155 = OpVariable Function 
                             Function f32_4* %269 = OpVariable Function 
                            Function bool_2* %298 = OpVariable Function 
                            Function bool_2* %323 = OpVariable Function 
                               Function i32* %589 = OpVariable Function 
                               Function i32* %604 = OpVariable Function 
                               Function f32* %748 = OpVariable Function 
                               Function f32* %757 = OpVariable Function 
                               Function f32* %771 = OpVariable Function 
                               Function f32* %782 = OpVariable Function 
                             Function f32_3* %845 = OpVariable Function 
                                   Input f32* %15 = OpAccessChain vs_TEXCOORD2 %13 
                                          f32 %16 = OpLoad %15 
                                          f32 %17 = OpDPdx %16 
                                 Private f32* %19 = OpAccessChain %9 %13 
                                                      OpStore %19 %17 
                                 Private f32* %21 = OpAccessChain %9 %13 
                                          f32 %22 = OpLoad %21 
                                          f32 %23 = OpExtInst %1 4 %22 
                                          f32 %24 = OpFDiv %20 %23 
                                 Private f32* %25 = OpAccessChain %9 %13 
                                                      OpStore %25 %24 
                          read_only Texture2D %30 = OpLoad %29 
                                      sampler %34 = OpLoad %33 
                   read_only Texture2DSampled %36 = OpSampledImage %30 %34 
                                        f32_2 %40 = OpLoad vs_TEXCOORD0 
                                        f32_4 %41 = OpImageSampleImplicitLod %36 %40 
                                                      OpStore %26 %41 
                                        f32_4 %45 = OpLoad %26 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_3 %49 = OpExtInst %1 40 %46 %48 
                                                      OpStore %44 %49 
                                        f32_3 %50 = OpLoad %44 
                                        f32_3 %51 = OpExtInst %1 30 %50 
                                                      OpStore %44 %51 
                                        f32_3 %52 = OpLoad %44 
                                        f32_3 %55 = OpFMul %52 %54 
                                                      OpStore %44 %55 
                                        f32_3 %56 = OpLoad %44 
                                        f32_3 %57 = OpExtInst %1 29 %56 
                                                      OpStore %44 %57 
                                        f32_3 %58 = OpLoad %44 
                                        f32_3 %61 = OpFMul %58 %60 
                                        f32_3 %64 = OpFAdd %61 %63 
                                                      OpStore %44 %64 
                                        f32_3 %65 = OpLoad %44 
                                        f32_3 %66 = OpExtInst %1 40 %65 %48 
                                                      OpStore %44 %66 
                                 Uniform i32* %78 = OpAccessChain %75 %76 
                                          i32 %79 = OpLoad %78 
                                         bool %81 = OpINotEqual %79 %76 
                                                      OpSelectionMerge %85 None 
                                                      OpBranchConditional %81 %84 %87 
                                              %84 = OpLabel 
                                        f32_3 %86 = OpLoad %44 
                                                      OpStore %83 %86 
                                                      OpBranch %85 
                                              %87 = OpLabel 
                                        f32_4 %88 = OpLoad %26 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                                      OpStore %83 %89 
                                                      OpBranch %85 
                                              %85 = OpLabel 
                                        f32_3 %90 = OpLoad %83 
                                        f32_4 %91 = OpLoad %26 
                                        f32_4 %92 = OpVectorShuffle %91 %90 4 5 6 3 
                                                      OpStore %26 %92 
                                   Input f32* %93 = OpAccessChain vs_TEXCOORD2 %13 
                                          f32 %94 = OpLoad %93 
                                 Uniform f32* %97 = OpAccessChain %75 %95 %76 
                                          f32 %98 = OpLoad %97 
                                          f32 %99 = OpFNegate %98 
                                         f32 %100 = OpFAdd %94 %99 
                                Private f32* %101 = OpAccessChain %44 %13 
                                                      OpStore %101 %100 
                                Uniform f32* %103 = OpAccessChain %75 %95 %102 
                                         f32 %104 = OpLoad %103 
                                         f32 %105 = OpFNegate %104 
                                         f32 %107 = OpFMul %105 %106 
                                Private f32* %108 = OpAccessChain %44 %13 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpFAdd %107 %109 
                                Private f32* %111 = OpAccessChain %44 %13 
                                                      OpStore %111 %110 
                                  Input f32* %114 = OpAccessChain vs_TEXCOORD2 %113 
                                         f32 %115 = OpLoad %114 
                                Uniform f32* %117 = OpAccessChain %75 %95 %116 
                                         f32 %118 = OpLoad %117 
                                         f32 %119 = OpFNegate %118 
                                         f32 %120 = OpFAdd %115 %119 
                                                      OpStore %112 %120 
                                Uniform f32* %122 = OpAccessChain %75 %95 %121 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFNegate %123 
                                         f32 %125 = OpFMul %124 %106 
                                         f32 %126 = OpLoad %112 
                                         f32 %127 = OpFAdd %125 %126 
                                Private f32* %128 = OpAccessChain %44 %113 
                                                      OpStore %128 %127 
                                       f32_3 %133 = OpLoad %44 
                                       f32_4 %134 = OpVectorShuffle %133 %133 0 1 0 0 
                                      bool_4 %136 = OpFOrdGreaterThanEqual %132 %134 
                                      bool_2 %137 = OpVectorShuffle %136 %136 0 1 
                                                      OpStore %131 %137 
                               Private bool* %142 = OpAccessChain %131 %113 
                                        bool %143 = OpLoad %142 
                                      bool_3 %148 = OpCompositeConstruct %143 %143 %143 
                                       i32_3 %149 = OpSelect %148 %144 %146 
                                                      OpStore %140 %149 
                               Private bool* %152 = OpAccessChain %131 %13 
                                        bool %153 = OpLoad %152 
                                                      OpSelectionMerge %157 None 
                                                      OpBranchConditional %153 %156 %160 
                                             %156 = OpLabel 
                                Private i32* %158 = OpAccessChain %140 %13 
                                         i32 %159 = OpLoad %158 
                                                      OpStore %155 %159 
                                                      OpBranch %157 
                                             %160 = OpLabel 
                                Private i32* %161 = OpAccessChain %140 %113 
                                         i32 %162 = OpLoad %161 
                                                      OpStore %155 %162 
                                                      OpBranch %157 
                                             %157 = OpLabel 
                                         i32 %163 = OpLoad %155 
                                                      OpStore %151 %163 
                               Private bool* %164 = OpAccessChain %131 %13 
                                        bool %165 = OpLoad %164 
                                         i32 %166 = OpSelect %165 %116 %95 
                                Private i32* %167 = OpAccessChain %140 %13 
                                                      OpStore %167 %166 
                                Uniform f32* %169 = OpAccessChain %75 %95 %76 
                                         f32 %170 = OpLoad %169 
                                         i32 %171 = OpLoad %151 
                                Uniform f32* %172 = OpAccessChain %75 %102 %171 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFAdd %170 %173 
                                Private f32* %175 = OpAccessChain %168 %113 
                                                      OpStore %175 %174 
                                Uniform f32* %177 = OpAccessChain %75 %95 %116 
                                         f32 %178 = OpLoad %177 
                                         i32 %179 = OpLoad %151 
                                Uniform f32* %180 = OpAccessChain %75 %102 %179 
                                         f32 %181 = OpLoad %180 
                                         f32 %182 = OpFAdd %178 %181 
                                Private f32* %183 = OpAccessChain %176 %113 
                                                      OpStore %183 %182 
                                Uniform f32* %184 = OpAccessChain %75 %121 %76 
                                         f32 %185 = OpLoad %184 
                                Uniform f32* %186 = OpAccessChain %75 %95 %76 
                                         f32 %187 = OpLoad %186 
                                         f32 %188 = OpFAdd %185 %187 
                                Private f32* %190 = OpAccessChain %168 %189 
                                                      OpStore %190 %188 
                                Uniform f32* %191 = OpAccessChain %75 %121 %116 
                                         f32 %192 = OpLoad %191 
                                Uniform f32* %193 = OpAccessChain %75 %95 %116 
                                         f32 %194 = OpLoad %193 
                                         f32 %195 = OpFAdd %192 %194 
                                Private f32* %196 = OpAccessChain %176 %189 
                                                      OpStore %196 %195 
                                Uniform f32* %198 = OpAccessChain %75 %95 %76 
                                         f32 %199 = OpLoad %198 
                                Uniform f32* %200 = OpAccessChain %75 %95 %102 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpFAdd %199 %201 
                                Private f32* %203 = OpAccessChain %197 %13 
                                                      OpStore %203 %202 
                                Private f32* %204 = OpAccessChain %197 %13 
                                         f32 %205 = OpLoad %204 
                                         i32 %206 = OpLoad %151 
                                Uniform f32* %207 = OpAccessChain %75 %102 %206 
                                         f32 %208 = OpLoad %207 
                                         f32 %209 = OpFNegate %208 
                                         f32 %210 = OpFAdd %205 %209 
                                Private f32* %211 = OpAccessChain %197 %113 
                                                      OpStore %211 %210 
                                Private f32* %212 = OpAccessChain %197 %13 
                                         f32 %213 = OpLoad %212 
                                Uniform f32* %214 = OpAccessChain %75 %121 %102 
                                         f32 %215 = OpLoad %214 
                                         f32 %216 = OpFNegate %215 
                                         f32 %217 = OpFAdd %213 %216 
                                Private f32* %218 = OpAccessChain %197 %189 
                                                      OpStore %218 %217 
                                Uniform f32* %219 = OpAccessChain %75 %95 %76 
                                         f32 %220 = OpLoad %219 
                                Private f32* %221 = OpAccessChain %168 %13 
                                                      OpStore %221 %220 
                                Uniform f32* %222 = OpAccessChain %75 %121 %76 
                                         f32 %223 = OpLoad %222 
                                Private f32* %225 = OpAccessChain %168 %224 
                                                      OpStore %225 %223 
                                Uniform f32* %226 = OpAccessChain %75 %121 %102 
                                         f32 %227 = OpLoad %226 
                                Private f32* %228 = OpAccessChain %197 %224 
                                                      OpStore %228 %227 
                               Private bool* %229 = OpAccessChain %131 %13 
                                        bool %230 = OpLoad %229 
                                       f32_4 %231 = OpLoad %168 
                                       f32_4 %232 = OpLoad %197 
                                      bool_4 %233 = OpCompositeConstruct %230 %230 %230 %230 
                                       f32_4 %234 = OpSelect %233 %231 %232 
                                                      OpStore %197 %234 
                                Uniform f32* %236 = OpAccessChain %75 %95 %116 
                                         f32 %237 = OpLoad %236 
                                Uniform f32* %238 = OpAccessChain %75 %95 %121 
                                         f32 %239 = OpLoad %238 
                                         f32 %240 = OpFAdd %237 %239 
                                Private f32* %241 = OpAccessChain %235 %13 
                                                      OpStore %241 %240 
                                Private f32* %242 = OpAccessChain %235 %13 
                                         f32 %243 = OpLoad %242 
                                         i32 %244 = OpLoad %151 
                                Uniform f32* %245 = OpAccessChain %75 %102 %244 
                                         f32 %246 = OpLoad %245 
                                         f32 %247 = OpFNegate %246 
                                         f32 %248 = OpFAdd %243 %247 
                                Private f32* %249 = OpAccessChain %235 %113 
                                                      OpStore %249 %248 
                                Private f32* %250 = OpAccessChain %235 %13 
                                         f32 %251 = OpLoad %250 
                                Uniform f32* %252 = OpAccessChain %75 %121 %121 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpFNegate %253 
                                         f32 %255 = OpFAdd %251 %254 
                                Private f32* %256 = OpAccessChain %235 %189 
                                                      OpStore %256 %255 
                                Uniform f32* %257 = OpAccessChain %75 %95 %116 
                                         f32 %258 = OpLoad %257 
                                Private f32* %259 = OpAccessChain %176 %13 
                                                      OpStore %259 %258 
                                Uniform f32* %260 = OpAccessChain %75 %121 %116 
                                         f32 %261 = OpLoad %260 
                                Private f32* %262 = OpAccessChain %176 %224 
                                                      OpStore %262 %261 
                                Uniform f32* %263 = OpAccessChain %75 %121 %121 
                                         f32 %264 = OpLoad %263 
                                Private f32* %265 = OpAccessChain %235 %224 
                                                      OpStore %265 %264 
                               Private bool* %266 = OpAccessChain %131 %113 
                                        bool %267 = OpLoad %266 
                                                      OpSelectionMerge %271 None 
                                                      OpBranchConditional %267 %270 %274 
                                             %270 = OpLabel 
                                       f32_4 %272 = OpLoad %176 
                                       f32_4 %273 = OpVectorShuffle %272 %272 1 0 2 3 
                                                      OpStore %269 %273 
                                                      OpBranch %271 
                                             %274 = OpLabel 
                                       f32_4 %275 = OpLoad %235 
                                       f32_4 %276 = OpVectorShuffle %275 %275 1 0 2 3 
                                                      OpStore %269 %276 
                                                      OpBranch %271 
                                             %271 = OpLabel 
                                       f32_4 %277 = OpLoad %269 
                                                      OpStore %235 %277 
                                       f32_4 %280 = OpLoad %197 
                                       f32_4 %281 = OpVectorShuffle %280 %280 1 1 3 3 
                                       f32_4 %282 = OpLoad vs_TEXCOORD2 
                                       f32_4 %283 = OpVectorShuffle %282 %282 0 0 0 0 
                                      bool_4 %284 = OpFOrdGreaterThanEqual %281 %283 
                                      bool_2 %285 = OpVectorShuffle %284 %284 0 2 
                                      bool_3 %286 = OpLoad %279 
                                      bool_3 %287 = OpVectorShuffle %286 %285 3 1 4 
                                                      OpStore %279 %287 
                                       f32_4 %289 = OpLoad vs_TEXCOORD2 
                                       f32_4 %290 = OpVectorShuffle %289 %289 0 0 0 0 
                                       f32_4 %291 = OpLoad %197 
                                       f32_4 %292 = OpVectorShuffle %291 %291 1 3 1 1 
                                      bool_4 %293 = OpFOrdGreaterThanEqual %290 %292 
                                      bool_2 %294 = OpVectorShuffle %293 %293 0 1 
                                                      OpStore %288 %294 
                               Private bool* %295 = OpAccessChain %131 %13 
                                        bool %296 = OpLoad %295 
                                                      OpSelectionMerge %300 None 
                                                      OpBranchConditional %296 %299 %303 
                                             %299 = OpLabel 
                                      bool_3 %301 = OpLoad %279 
                                      bool_2 %302 = OpVectorShuffle %301 %301 0 2 
                                                      OpStore %298 %302 
                                                      OpBranch %300 
                                             %303 = OpLabel 
                                      bool_2 %304 = OpLoad %288 
                                                      OpStore %298 %304 
                                                      OpBranch %300 
                                             %300 = OpLabel 
                                      bool_2 %305 = OpLoad %298 
                                      bool_3 %306 = OpLoad %279 
                                      bool_3 %307 = OpVectorShuffle %306 %305 3 1 4 
                                                      OpStore %279 %307 
                                       f32_4 %308 = OpLoad %235 
                                       f32_4 %309 = OpVectorShuffle %308 %308 0 3 0 0 
                                       f32_4 %310 = OpLoad vs_TEXCOORD2 
                                       f32_4 %311 = OpVectorShuffle %310 %310 1 1 1 1 
                                      bool_4 %312 = OpFOrdGreaterThanEqual %309 %311 
                                      bool_2 %313 = OpVectorShuffle %312 %312 0 1 
                                                      OpStore %288 %313 
                                       f32_4 %315 = OpLoad vs_TEXCOORD2 
                                       f32_4 %316 = OpVectorShuffle %315 %315 1 1 1 1 
                                       f32_4 %317 = OpLoad %235 
                                       f32_4 %318 = OpVectorShuffle %317 %317 0 3 0 0 
                                      bool_4 %319 = OpFOrdGreaterThanEqual %316 %318 
                                      bool_2 %320 = OpVectorShuffle %319 %319 0 1 
                                                      OpStore %314 %320 
                               Private bool* %321 = OpAccessChain %131 %113 
                                        bool %322 = OpLoad %321 
                                                      OpSelectionMerge %325 None 
                                                      OpBranchConditional %322 %324 %327 
                                             %324 = OpLabel 
                                      bool_2 %326 = OpLoad %288 
                                                      OpStore %323 %326 
                                                      OpBranch %325 
                                             %327 = OpLabel 
                                      bool_2 %328 = OpLoad %314 
                                                      OpStore %323 %328 
                                                      OpBranch %325 
                                             %325 = OpLabel 
                                      bool_2 %329 = OpLoad %323 
                                                      OpStore %131 %329 
                               Private bool* %330 = OpAccessChain %131 %13 
                                        bool %331 = OpLoad %330 
                               Private bool* %332 = OpAccessChain %279 %13 
                                        bool %333 = OpLoad %332 
                                        bool %334 = OpLogicalAnd %331 %333 
                               Private bool* %335 = OpAccessChain %131 %13 
                                                      OpStore %335 %334 
                                Uniform f32* %337 = OpAccessChain %75 %121 %76 
                                         f32 %338 = OpLoad %337 
                                Uniform f32* %339 = OpAccessChain %75 %121 %102 
                                         f32 %340 = OpLoad %339 
                                         f32 %341 = OpFAdd %338 %340 
                                                      OpStore %336 %341 
                                         f32 %342 = OpLoad %336 
                                         f32 %343 = OpFNegate %342 
                                Uniform f32* %344 = OpAccessChain %75 %95 %102 
                                         f32 %345 = OpLoad %344 
                                         f32 %346 = OpFAdd %343 %345 
                                                      OpStore %336 %346 
                                Uniform f32* %347 = OpAccessChain %75 %121 %116 
                                         f32 %348 = OpLoad %347 
                                Uniform f32* %349 = OpAccessChain %75 %121 %121 
                                         f32 %350 = OpLoad %349 
                                         f32 %351 = OpFAdd %348 %350 
                                Private f32* %352 = OpAccessChain %168 %13 
                                                      OpStore %352 %351 
                                Private f32* %353 = OpAccessChain %168 %13 
                                         f32 %354 = OpLoad %353 
                                         f32 %355 = OpFNegate %354 
                                Uniform f32* %356 = OpAccessChain %75 %95 %121 
                                         f32 %357 = OpLoad %356 
                                         f32 %358 = OpFAdd %355 %357 
                                Private f32* %359 = OpAccessChain %168 %13 
                                                      OpStore %359 %358 
                                  Input f32* %361 = OpAccessChain vs_TEXCOORD2 %13 
                                         f32 %362 = OpLoad %361 
                                Private f32* %363 = OpAccessChain %168 %189 
                                         f32 %364 = OpLoad %363 
                                        bool %365 = OpFOrdGreaterThanEqual %362 %364 
                                                      OpStore %360 %365 
                                         f32 %366 = OpLoad %336 
                                Private f32* %367 = OpAccessChain %168 %189 
                                         f32 %368 = OpLoad %367 
                                         f32 %369 = OpFAdd %366 %368 
                                                      OpStore %336 %369 
                                         f32 %370 = OpLoad %336 
                                  Input f32* %371 = OpAccessChain vs_TEXCOORD2 %13 
                                         f32 %372 = OpLoad %371 
                                        bool %373 = OpFOrdGreaterThanEqual %370 %372 
                               Private bool* %374 = OpAccessChain %279 %13 
                                                      OpStore %374 %373 
                               Private bool* %375 = OpAccessChain %279 %13 
                                        bool %376 = OpLoad %375 
                                        bool %377 = OpLoad %360 
                                        bool %378 = OpLogicalAnd %376 %377 
                               Private bool* %379 = OpAccessChain %279 %13 
                                                      OpStore %379 %378 
                                  Input f32* %380 = OpAccessChain vs_TEXCOORD2 %113 
                                         f32 %381 = OpLoad %380 
                                Private f32* %382 = OpAccessChain %176 %189 
                                         f32 %383 = OpLoad %382 
                                        bool %384 = OpFOrdGreaterThanEqual %381 %383 
                                                      OpStore %360 %384 
                               Private bool* %385 = OpAccessChain %279 %13 
                                        bool %386 = OpLoad %385 
                                        bool %387 = OpLoad %360 
                                        bool %388 = OpLogicalAnd %386 %387 
                               Private bool* %389 = OpAccessChain %279 %13 
                                                      OpStore %389 %388 
                                Private f32* %390 = OpAccessChain %168 %13 
                                         f32 %391 = OpLoad %390 
                                Private f32* %392 = OpAccessChain %176 %189 
                                         f32 %393 = OpLoad %392 
                                         f32 %394 = OpFAdd %391 %393 
                                Private f32* %395 = OpAccessChain %168 %13 
                                                      OpStore %395 %394 
                                Private f32* %396 = OpAccessChain %168 %13 
                                         f32 %397 = OpLoad %396 
                                  Input f32* %398 = OpAccessChain vs_TEXCOORD2 %113 
                                         f32 %399 = OpLoad %398 
                                        bool %400 = OpFOrdGreaterThanEqual %397 %399 
                               Private bool* %401 = OpAccessChain %288 %13 
                                                      OpStore %401 %400 
                               Private bool* %402 = OpAccessChain %279 %13 
                                        bool %403 = OpLoad %402 
                               Private bool* %404 = OpAccessChain %288 %13 
                                        bool %405 = OpLoad %404 
                                        bool %406 = OpLogicalAnd %403 %405 
                               Private bool* %407 = OpAccessChain %279 %13 
                                                      OpStore %407 %406 
                                         i32 %408 = OpLoad %151 
                                       i32_4 %410 = OpCompositeConstruct %408 %408 %408 %408 
                                      bool_4 %412 = OpIEqual %410 %411 
                                      bool_2 %413 = OpVectorShuffle %412 %412 0 1 
                                                      OpStore %288 %413 
                               Private bool* %414 = OpAccessChain %288 %113 
                                        bool %415 = OpLoad %414 
                               Private bool* %416 = OpAccessChain %288 %13 
                                        bool %417 = OpLoad %416 
                                        bool %418 = OpLogicalOr %415 %417 
                               Private bool* %419 = OpAccessChain %288 %13 
                                                      OpStore %419 %418 
                                         i32 %420 = OpLoad %151 
                                Uniform f32* %421 = OpAccessChain %75 %102 %420 
                                         f32 %422 = OpLoad %421 
                                        bool %423 = OpFOrdLessThan %47 %422 
                                                      OpStore %360 %423 
                               Private bool* %424 = OpAccessChain %131 %13 
                                        bool %425 = OpLoad %424 
                                        bool %426 = OpLoad %360 
                                        bool %427 = OpLogicalAnd %425 %426 
                                                      OpStore %360 %427 
                                Private f32* %429 = OpAccessChain %197 %224 
                                         f32 %430 = OpLoad %429 
                                        bool %431 = OpFOrdLessThan %47 %430 
                                                      OpStore %428 %431 
                                        bool %433 = OpLoad %428 
                                         i32 %434 = OpSelect %433 %116 %76 
                                                      OpStore %432 %434 
                                Private f32* %435 = OpAccessChain %235 %224 
                                         f32 %436 = OpLoad %435 
                                        bool %437 = OpFOrdLessThan %47 %436 
                               Private bool* %438 = OpAccessChain %314 %13 
                                                      OpStore %438 %437 
                               Private bool* %440 = OpAccessChain %314 %13 
                                        bool %441 = OpLoad %440 
                                         i32 %442 = OpSelect %441 %116 %76 
                                                      OpStore %439 %442 
                                Private i32* %443 = OpAccessChain %140 %224 
                                         i32 %444 = OpLoad %443 
                                         i32 %445 = OpLoad %439 
                                         i32 %446 = OpIMul %444 %445 
                                                      OpStore %439 %446 
                                         i32 %447 = OpLoad %432 
                                Private i32* %448 = OpAccessChain %140 %13 
                                         i32 %449 = OpLoad %448 
                                         i32 %450 = OpIMul %447 %449 
                                         i32 %451 = OpLoad %439 
                                         i32 %452 = OpIAdd %450 %451 
                                                      OpStore %432 %452 
                               Private bool* %454 = OpAccessChain %279 %224 
                                        bool %455 = OpLoad %454 
                                        bool %456 = OpLoad %428 
                                        bool %457 = OpLogicalAnd %455 %456 
                                                      OpStore %453 %457 
                               Private bool* %459 = OpAccessChain %131 %113 
                                        bool %460 = OpLoad %459 
                               Private bool* %461 = OpAccessChain %314 %13 
                                        bool %462 = OpLoad %461 
                                        bool %463 = OpLogicalAnd %460 %462 
                                                      OpStore %458 %463 
                                        bool %465 = OpLoad %453 
                                         i32 %466 = OpSelect %465 %116 %76 
                                                      OpStore %464 %466 
                                        bool %468 = OpLoad %458 
                                         i32 %469 = OpSelect %468 %116 %76 
                                                      OpStore %467 %469 
                                Private i32* %470 = OpAccessChain %140 %224 
                                         i32 %471 = OpLoad %470 
                                         i32 %472 = OpLoad %467 
                                         i32 %473 = OpIMul %471 %472 
                                                      OpStore %467 %473 
                                         i32 %474 = OpLoad %464 
                                Private i32* %475 = OpAccessChain %140 %13 
                                         i32 %476 = OpLoad %475 
                                         i32 %477 = OpIMul %474 %476 
                                         i32 %478 = OpLoad %467 
                                         i32 %479 = OpIAdd %477 %478 
                                                      OpStore %467 %479 
                               Private bool* %480 = OpAccessChain %279 %13 
                                        bool %481 = OpLoad %480 
                                         i32 %482 = OpLoad %467 
                                         i32 %483 = OpSelect %481 %76 %482 
                                                      OpStore %467 %483 
                                        bool %484 = OpLoad %360 
                                         i32 %485 = OpLoad %432 
                                         i32 %486 = OpLoad %467 
                                         i32 %487 = OpSelect %484 %485 %486 
                                                      OpStore %467 %487 
                                Private i32* %488 = OpAccessChain %140 %224 
                                         i32 %489 = OpLoad %488 
                                Private i32* %490 = OpAccessChain %140 %13 
                                         i32 %491 = OpLoad %490 
                                         i32 %492 = OpIAdd %489 %491 
                                                      OpStore %464 %492 
                               Private bool* %493 = OpAccessChain %288 %13 
                                        bool %494 = OpLoad %493 
                                         f32 %496 = OpSelect %494 %20 %495 
                                Private f32* %497 = OpAccessChain %168 %13 
                                                      OpStore %497 %496 
                                       f32_4 %499 = OpLoad %197 
                                       f32_2 %500 = OpVectorShuffle %499 %499 3 1 
                                       f32_4 %501 = OpLoad %498 
                                       f32_4 %502 = OpVectorShuffle %501 %500 4 1 5 3 
                                                      OpStore %498 %502 
                                       f32_4 %503 = OpLoad %235 
                                       f32_2 %504 = OpVectorShuffle %503 %503 3 0 
                                       f32_4 %505 = OpLoad %498 
                                       f32_4 %506 = OpVectorShuffle %505 %504 0 4 2 5 
                                                      OpStore %498 %506 
                                Private f32* %507 = OpAccessChain %197 %13 
                                         f32 %508 = OpLoad %507 
                                Private f32* %509 = OpAccessChain %235 %13 
                                                      OpStore %509 %508 
                                       f32_4 %511 = OpLoad %498 
                                       f32_2 %512 = OpVectorShuffle %511 %511 1 0 
                                       f32_2 %513 = OpFNegate %512 
                                       f32_4 %514 = OpLoad %235 
                                       f32_2 %515 = OpVectorShuffle %514 %514 1 0 
                                       f32_2 %516 = OpFAdd %513 %515 
                                       f32_3 %517 = OpLoad %510 
                                       f32_3 %518 = OpVectorShuffle %517 %516 3 1 4 
                                                      OpStore %510 %518 
                                       f32_3 %519 = OpLoad %510 
                                       f32_2 %520 = OpVectorShuffle %519 %519 0 2 
                                       f32_4 %521 = OpLoad %168 
                                       f32_2 %522 = OpVectorShuffle %521 %521 0 0 
                                       f32_2 %523 = OpFMul %520 %522 
                                       f32_4 %524 = OpLoad %168 
                                       f32_4 %525 = OpVectorShuffle %524 %523 4 5 2 3 
                                                      OpStore %168 %525 
                                       f32_4 %527 = OpLoad %168 
                                       f32_2 %528 = OpVectorShuffle %527 %527 0 1 
                                       f32_4 %529 = OpLoad %168 
                                       f32_2 %530 = OpVectorShuffle %529 %529 0 1 
                                         f32 %531 = OpDot %528 %530 
                                                      OpStore %526 %531 
                                         f32 %532 = OpLoad %526 
                                         f32 %533 = OpExtInst %1 32 %532 
                                                      OpStore %526 %533 
                                         f32 %534 = OpLoad %526 
                                       f32_2 %535 = OpCompositeConstruct %534 %534 
                                       f32_4 %536 = OpLoad %168 
                                       f32_2 %537 = OpVectorShuffle %536 %536 0 1 
                                       f32_2 %538 = OpFMul %535 %537 
                                       f32_4 %539 = OpLoad %168 
                                       f32_4 %540 = OpVectorShuffle %539 %538 4 5 2 3 
                                                      OpStore %168 %540 
                                       f32_4 %541 = OpLoad %168 
                                       f32_2 %542 = OpVectorShuffle %541 %541 0 1 
                                       f32_2 %545 = OpFMul %542 %544 
                                       f32_4 %546 = OpLoad %235 
                                       f32_2 %547 = OpVectorShuffle %546 %546 1 0 
                                       f32_2 %548 = OpFAdd %545 %547 
                                       f32_4 %549 = OpLoad %168 
                                       f32_4 %550 = OpVectorShuffle %549 %548 4 5 2 3 
                                                      OpStore %168 %550 
                                       f32_4 %553 = OpLoad %168 
                                       f32_2 %554 = OpVectorShuffle %553 %553 1 0 
                                       f32_2 %555 = OpFNegate %554 
                                       f32_4 %556 = OpLoad %235 
                                       f32_2 %557 = OpVectorShuffle %556 %556 0 1 
                                       f32_2 %558 = OpFAdd %555 %557 
                                                      OpStore %552 %558 
                                       f32_4 %559 = OpLoad %168 
                                       f32_2 %560 = OpVectorShuffle %559 %559 0 1 
                                       f32_2 %561 = OpFNegate %560 
                                       f32_4 %562 = OpLoad vs_TEXCOORD2 
                                       f32_2 %563 = OpVectorShuffle %562 %562 1 0 
                                       f32_2 %564 = OpFAdd %561 %563 
                                       f32_4 %565 = OpLoad %168 
                                       f32_4 %566 = OpVectorShuffle %565 %564 4 5 2 3 
                                                      OpStore %168 %566 
                                Private f32* %567 = OpAccessChain %168 %113 
                                         f32 %568 = OpLoad %567 
                                Private f32* %569 = OpAccessChain %552 %113 
                                         f32 %570 = OpLoad %569 
                                         f32 %571 = OpFMul %568 %570 
                                Private f32* %572 = OpAccessChain %510 %13 
                                                      OpStore %572 %571 
                                Private f32* %573 = OpAccessChain %552 %13 
                                         f32 %574 = OpLoad %573 
                                Private f32* %575 = OpAccessChain %168 %13 
                                         f32 %576 = OpLoad %575 
                                         f32 %577 = OpFMul %574 %576 
                                Private f32* %578 = OpAccessChain %510 %13 
                                         f32 %579 = OpLoad %578 
                                         f32 %580 = OpFNegate %579 
                                         f32 %581 = OpFAdd %577 %580 
                                Private f32* %582 = OpAccessChain %168 %13 
                                                      OpStore %582 %581 
                                Private f32* %583 = OpAccessChain %168 %13 
                                         f32 %584 = OpLoad %583 
                                        bool %585 = OpFOrdGreaterThanEqual %584 %47 
                               Private bool* %586 = OpAccessChain %288 %13 
                                                      OpStore %586 %585 
                               Private bool* %587 = OpAccessChain %288 %13 
                                        bool %588 = OpLoad %587 
                                                      OpSelectionMerge %591 None 
                                                      OpBranchConditional %588 %590 %594 
                                             %590 = OpLabel 
                                Private i32* %592 = OpAccessChain %140 %13 
                                         i32 %593 = OpLoad %592 
                                                      OpStore %589 %593 
                                                      OpBranch %591 
                                             %594 = OpLabel 
                                Private i32* %595 = OpAccessChain %140 %224 
                                         i32 %596 = OpLoad %595 
                                                      OpStore %589 %596 
                                                      OpBranch %591 
                                             %591 = OpLabel 
                                         i32 %597 = OpLoad %589 
                                Private i32* %598 = OpAccessChain %140 %13 
                                                      OpStore %598 %597 
                                         i32 %600 = OpLoad %467 
                                         i32 %601 = OpLoad %464 
                                        bool %602 = OpINotEqual %600 %601 
                                                      OpStore %599 %602 
                                        bool %603 = OpLoad %599 
                                                      OpSelectionMerge %606 None 
                                                      OpBranchConditional %603 %605 %608 
                                             %605 = OpLabel 
                                         i32 %607 = OpLoad %467 
                                                      OpStore %604 %607 
                                                      OpBranch %606 
                                             %608 = OpLabel 
                                Private i32* %609 = OpAccessChain %140 %13 
                                         i32 %610 = OpLoad %609 
                                                      OpStore %604 %610 
                                                      OpBranch %606 
                                             %606 = OpLabel 
                                         i32 %611 = OpLoad %604 
                                                      OpStore %467 %611 
                                         i32 %612 = OpLoad %467 
                                        bool %613 = OpIEqual %612 %76 
                                                      OpSelectionMerge %615 None 
                                                      OpBranchConditional %613 %614 %621 
                                             %614 = OpLabel 
                                       f32_4 %617 = OpLoad %26 
                                       f32_4 %619 = OpLoad %618 
                                       f32_4 %620 = OpFMul %617 %619 
                                                      OpStore %616 %620 
                                                      OpBranch %615 
                                             %621 = OpLabel 
                                         i32 %624 = OpLoad %467 
                                       i32_4 %625 = OpCompositeConstruct %624 %624 %624 %624 
                                      bool_4 %627 = OpIEqual %625 %626 
                                      bool_3 %628 = OpVectorShuffle %627 %627 0 2 3 
                                      bool_4 %629 = OpLoad %623 
                                      bool_4 %630 = OpVectorShuffle %629 %628 4 1 5 6 
                                                      OpStore %623 %630 
                               Private bool* %631 = OpAccessChain %623 %189 
                                        bool %632 = OpLoad %631 
                                         i32 %633 = OpSelect %632 %121 %76 
                                                      OpStore %467 %633 
                               Private bool* %634 = OpAccessChain %623 %224 
                                        bool %635 = OpLoad %634 
                                         i32 %636 = OpLoad %467 
                                         i32 %637 = OpSelect %635 %102 %636 
                                                      OpStore %467 %637 
                               Private bool* %638 = OpAccessChain %623 %13 
                                        bool %639 = OpLoad %638 
                                         i32 %640 = OpLoad %467 
                                         i32 %641 = OpSelect %639 %116 %640 
                                                      OpStore %467 %641 
                                       f32_4 %642 = OpLoad %26 
                                         i32 %644 = OpLoad %467 
                              Uniform f32_4* %646 = OpAccessChain %75 %643 %644 
                                       f32_4 %647 = OpLoad %646 
                                       f32_4 %648 = OpFMul %642 %647 
                                                      OpStore %616 %648 
                                                      OpBranch %615 
                                             %615 = OpLabel 
                                        bool %649 = OpLoad %428 
                               Private bool* %650 = OpAccessChain %314 %13 
                                        bool %651 = OpLoad %650 
                                        bool %652 = OpLogicalOr %649 %651 
                                                      OpStore %458 %652 
                                       f32_4 %653 = OpLoad %498 
                                       f32_2 %654 = OpVectorShuffle %653 %653 2 3 
                                       f32_2 %655 = OpFNegate %654 
                                       f32_4 %656 = OpLoad vs_TEXCOORD2 
                                       f32_2 %657 = OpVectorShuffle %656 %656 0 1 
                                       f32_2 %658 = OpFAdd %655 %657 
                                       f32_4 %659 = OpLoad %26 
                                       f32_4 %660 = OpVectorShuffle %659 %658 4 5 2 3 
                                                      OpStore %26 %660 
                                       f32_4 %662 = OpLoad %26 
                                       f32_2 %663 = OpVectorShuffle %662 %662 0 1 
                                       f32_4 %664 = OpLoad %26 
                                       f32_2 %665 = OpVectorShuffle %664 %664 0 1 
                                         f32 %666 = OpDot %663 %665 
                                                      OpStore %661 %666 
                                         f32 %667 = OpLoad %661 
                                         f32 %668 = OpExtInst %1 31 %667 
                                                      OpStore %661 %668 
                                         f32 %669 = OpLoad %661 
                                         i32 %670 = OpLoad %151 
                                Uniform f32* %671 = OpAccessChain %75 %102 %670 
                                         f32 %672 = OpLoad %671 
                                         f32 %673 = OpFNegate %672 
                                         f32 %674 = OpFAdd %669 %673 
                                                      OpStore %661 %674 
                                         f32 %675 = OpLoad %661 
                                Private f32* %676 = OpAccessChain %9 %13 
                                         f32 %677 = OpLoad %676 
                                         f32 %678 = OpFMul %675 %677 
                                         f32 %679 = OpFAdd %678 %106 
                                                      OpStore %661 %679 
                                         f32 %680 = OpLoad %661 
                                         f32 %681 = OpExtInst %1 43 %680 %47 %20 
                                                      OpStore %661 %681 
                                        bool %682 = OpLoad %458 
                                         f32 %683 = OpLoad %661 
                                         f32 %684 = OpSelect %682 %683 %47 
                                                      OpStore %661 %684 
                                Private f32* %686 = OpAccessChain %197 %224 
                                         f32 %687 = OpLoad %686 
                                         f32 %688 = OpFNegate %687 
                                         i32 %689 = OpLoad %151 
                                Uniform f32* %690 = OpAccessChain %75 %102 %689 
                                         f32 %691 = OpLoad %690 
                                         f32 %692 = OpFAdd %688 %691 
                                                      OpStore %685 %692 
                                Private f32* %694 = OpAccessChain %235 %224 
                                         f32 %695 = OpLoad %694 
                                         f32 %696 = OpFNegate %695 
                                         i32 %697 = OpLoad %151 
                                Uniform f32* %698 = OpAccessChain %75 %102 %697 
                                         f32 %699 = OpLoad %698 
                                         f32 %700 = OpFAdd %696 %699 
                                                      OpStore %693 %700 
                                         f32 %702 = OpLoad %685 
                                         f32 %703 = OpLoad %693 
                                         f32 %704 = OpFDiv %702 %703 
                                                      OpStore %701 %704 
                                Private f32* %705 = OpAccessChain %26 %113 
                                         f32 %706 = OpLoad %705 
                                         f32 %707 = OpLoad %701 
                                         f32 %708 = OpFMul %706 %707 
                                Private f32* %709 = OpAccessChain %26 %224 
                                                      OpStore %709 %708 
                                       f32_4 %710 = OpLoad %26 
                                       f32_2 %711 = OpVectorShuffle %710 %710 0 2 
                                       f32_4 %712 = OpLoad %26 
                                       f32_2 %713 = OpVectorShuffle %712 %712 0 2 
                                         f32 %714 = OpDot %711 %713 
                                Private f32* %715 = OpAccessChain %26 %13 
                                                      OpStore %715 %714 
                                Private f32* %716 = OpAccessChain %26 %13 
                                         f32 %717 = OpLoad %716 
                                         f32 %718 = OpExtInst %1 31 %717 
                                Private f32* %719 = OpAccessChain %26 %13 
                                                      OpStore %719 %718 
                                         f32 %720 = OpLoad %685 
                                         f32 %721 = OpFNegate %720 
                                Private f32* %722 = OpAccessChain %26 %13 
                                         f32 %723 = OpLoad %722 
                                         f32 %724 = OpFAdd %721 %723 
                                Private f32* %725 = OpAccessChain %26 %13 
                                                      OpStore %725 %724 
                                Private f32* %726 = OpAccessChain %26 %13 
                                         f32 %727 = OpLoad %726 
                                Private f32* %728 = OpAccessChain %9 %13 
                                         f32 %729 = OpLoad %728 
                                         f32 %730 = OpFMul %727 %729 
                                         f32 %731 = OpFAdd %730 %106 
                                Private f32* %732 = OpAccessChain %9 %13 
                                                      OpStore %732 %731 
                                Private f32* %733 = OpAccessChain %9 %13 
                                         f32 %734 = OpLoad %733 
                                         f32 %735 = OpExtInst %1 43 %734 %47 %20 
                                Private f32* %736 = OpAccessChain %9 %13 
                                                      OpStore %736 %735 
                                         f32 %738 = OpLoad %685 
                                        bool %739 = OpFOrdLessThan %47 %738 
                                                      OpStore %737 %739 
                                         f32 %741 = OpLoad %693 
                                        bool %742 = OpFOrdLessThan %47 %741 
                                                      OpStore %740 %742 
                                        bool %743 = OpLoad %740 
                                        bool %744 = OpLoad %737 
                                        bool %745 = OpLogicalAnd %743 %744 
                                                      OpStore %740 %745 
                                        bool %746 = OpLoad %740 
                                                      OpSelectionMerge %750 None 
                                                      OpBranchConditional %746 %749 %753 
                                             %749 = OpLabel 
                                Private f32* %751 = OpAccessChain %9 %13 
                                         f32 %752 = OpLoad %751 
                                                      OpStore %748 %752 
                                                      OpBranch %750 
                                             %753 = OpLabel 
                                                      OpStore %748 %20 
                                                      OpBranch %750 
                                             %750 = OpLabel 
                                         f32 %754 = OpLoad %748 
                                Private f32* %755 = OpAccessChain %9 %13 
                                                      OpStore %755 %754 
                                        bool %756 = OpLoad %458 
                                                      OpSelectionMerge %759 None 
                                                      OpBranchConditional %756 %758 %762 
                                             %758 = OpLabel 
                                Private f32* %760 = OpAccessChain %9 %13 
                                         f32 %761 = OpLoad %760 
                                                      OpStore %757 %761 
                                                      OpBranch %759 
                                             %762 = OpLabel 
                                                      OpStore %757 %47 
                                                      OpBranch %759 
                                             %759 = OpLabel 
                                         f32 %763 = OpLoad %757 
                                Private f32* %764 = OpAccessChain %9 %13 
                                                      OpStore %764 %763 
                                         f32 %765 = OpLoad %661 
                                        bool %766 = OpFOrdEqual %765 %47 
                                                      OpStore %458 %766 
                                         f32 %767 = OpLoad %661 
                                         f32 %768 = OpFNegate %767 
                                         f32 %769 = OpFAdd %768 %20 
                                                      OpStore %693 %769 
                                        bool %770 = OpLoad %458 
                                                      OpSelectionMerge %773 None 
                                                      OpBranchConditional %770 %772 %776 
                                             %772 = OpLabel 
                                Private f32* %774 = OpAccessChain %9 %13 
                                         f32 %775 = OpLoad %774 
                                                      OpStore %771 %775 
                                                      OpBranch %773 
                                             %776 = OpLabel 
                                         f32 %777 = OpLoad %693 
                                                      OpStore %771 %777 
                                                      OpBranch %773 
                                             %773 = OpLabel 
                                         f32 %778 = OpLoad %771 
                                Private f32* %779 = OpAccessChain %9 %13 
                                                      OpStore %779 %778 
                               Private bool* %780 = OpAccessChain %131 %13 
                                        bool %781 = OpLoad %780 
                                                      OpSelectionMerge %784 None 
                                                      OpBranchConditional %781 %783 %787 
                                             %783 = OpLabel 
                                Private f32* %785 = OpAccessChain %9 %13 
                                         f32 %786 = OpLoad %785 
                                                      OpStore %782 %786 
                                                      OpBranch %784 
                                             %787 = OpLabel 
                                                      OpStore %782 %20 
                                                      OpBranch %784 
                                             %784 = OpLabel 
                                         f32 %788 = OpLoad %782 
                                Private f32* %789 = OpAccessChain %9 %13 
                                                      OpStore %789 %788 
                                Private f32* %790 = OpAccessChain %9 %13 
                                         f32 %791 = OpLoad %790 
                                Private f32* %792 = OpAccessChain %616 %189 
                                         f32 %793 = OpLoad %792 
                                         f32 %794 = OpFMul %791 %793 
                                                      OpStore %112 %794 
                               Private bool* %795 = OpAccessChain %279 %13 
                                        bool %796 = OpLoad %795 
                                         f32 %797 = OpSelect %796 %47 %20 
                                                      OpStore %693 %797 
                               Private bool* %798 = OpAccessChain %131 %13 
                                        bool %799 = OpLoad %798 
                                         f32 %800 = OpLoad %693 
                                         f32 %801 = OpSelect %799 %20 %800 
                                Private f32* %802 = OpAccessChain %44 %13 
                                                      OpStore %802 %801 
                                Private f32* %803 = OpAccessChain %44 %13 
                                         f32 %804 = OpLoad %803 
                                         f32 %805 = OpLoad %112 
                                         f32 %806 = OpFMul %804 %805 
                                                      OpStore %112 %806 
                         read_only Texture2D %808 = OpLoad %807 
                                     sampler %810 = OpLoad %809 
                  read_only Texture2DSampled %811 = OpSampledImage %808 %810 
                                       f32_2 %813 = OpLoad vs_TEXCOORD1 
                                       f32_4 %814 = OpImageSampleImplicitLod %811 %813 
                                         f32 %815 = OpCompositeExtract %814 3 
                                                      OpStore %693 %815 
                                         f32 %818 = OpLoad %693 
                                         f32 %819 = OpLoad %112 
                                         f32 %820 = OpFMul %818 %819 
                                 Output f32* %822 = OpAccessChain %817 %189 
                                                      OpStore %822 %820 
                                Uniform i32* %823 = OpAccessChain %75 %116 
                                         i32 %824 = OpLoad %823 
                                        bool %825 = OpINotEqual %824 %643 
                                                      OpStore %458 %825 
                                Private f32* %826 = OpAccessChain %44 %13 
                                         f32 %827 = OpLoad %826 
                                Private f32* %828 = OpAccessChain %9 %13 
                                         f32 %829 = OpLoad %828 
                                         f32 %830 = OpFMul %827 %829 
                                Private f32* %831 = OpAccessChain %9 %13 
                                                      OpStore %831 %830 
                                         f32 %832 = OpLoad %693 
                                Private f32* %833 = OpAccessChain %9 %13 
                                         f32 %834 = OpLoad %833 
                                         f32 %835 = OpFMul %832 %834 
                                Private f32* %836 = OpAccessChain %9 %13 
                                                      OpStore %836 %835 
                                       f32_4 %837 = OpLoad %9 
                                       f32_3 %838 = OpVectorShuffle %837 %837 0 0 0 
                                       f32_4 %839 = OpLoad %616 
                                       f32_3 %840 = OpVectorShuffle %839 %839 0 1 2 
                                       f32_3 %841 = OpFMul %838 %840 
                                       f32_4 %842 = OpLoad %9 
                                       f32_4 %843 = OpVectorShuffle %842 %841 4 5 2 6 
                                                      OpStore %9 %843 
                                        bool %844 = OpLoad %458 
                                                      OpSelectionMerge %847 None 
                                                      OpBranchConditional %844 %846 %850 
                                             %846 = OpLabel 
                                       f32_4 %848 = OpLoad %9 
                                       f32_3 %849 = OpVectorShuffle %848 %848 0 1 3 
                                                      OpStore %845 %849 
                                                      OpBranch %847 
                                             %850 = OpLabel 
                                       f32_4 %851 = OpLoad %616 
                                       f32_3 %852 = OpVectorShuffle %851 %851 0 1 2 
                                                      OpStore %845 %852 
                                                      OpBranch %847 
                                             %847 = OpLabel 
                                       f32_3 %853 = OpLoad %845 
                                       f32_4 %854 = OpLoad %817 
                                       f32_4 %855 = OpVectorShuffle %854 %853 4 5 6 3 
                                                      OpStore %817 %855 
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
 Pass {
  Blend Zero Zero, Zero Zero
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 98697
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
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
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	int _ManualTex2SRGB;
uniform 	int _SrcBlend;
uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
uniform 	vec4 _BorderColors[4];
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _GUIClipTexture;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
ivec3 u_xlati2;
bvec4 u_xlatb2;
vec4 u_xlat3;
bvec2 u_xlatb3;
vec4 u_xlat4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
bvec2 u_xlatb9;
float u_xlat11;
bvec3 u_xlatb11;
vec3 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
int u_xlati13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
float u_xlat20;
bool u_xlatb20;
bool u_xlatb21;
float u_xlat27;
int u_xlati27;
bool u_xlatb27;
float u_xlat28;
int u_xlati29;
bool u_xlatb29;
float u_xlat30;
int u_xlati30;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD2.x);
    u_xlat0.x = float(1.0) / abs(u_xlat0.x);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat9.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = (_ManualTex2SRGB != 0) ? u_xlat9.xyz : u_xlat1.xyz;
    u_xlat9.x = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat9.x = (-_Rect[2]) * 0.5 + u_xlat9.x;
    u_xlat18 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat9.y = (-_Rect[3]) * 0.5 + u_xlat18;
    u_xlatb9.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlati2.xyz = (u_xlatb9.y) ? ivec3(0, 1, 2) : ivec3(3, 2, 8);
    u_xlati27 = (u_xlatb9.x) ? u_xlati2.x : u_xlati2.y;
    u_xlati2.x = (u_xlatb9.x) ? 1 : 4;
    u_xlat3.y = _Rect[0] + _CornerRadiuses[u_xlati27];
    u_xlat4.y = _Rect[1] + _CornerRadiuses[u_xlati27];
    u_xlat3.w = _BorderWidths[0] + _Rect[0];
    u_xlat4.w = _BorderWidths[1] + _Rect[1];
    u_xlat5.x = _Rect[0] + _Rect[2];
    u_xlat5.y = u_xlat5.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat5.w = u_xlat5.x + (-_BorderWidths[2]);
    u_xlat3.x = _Rect[0];
    u_xlat3.z = _BorderWidths[0];
    u_xlat5.z = _BorderWidths[2];
    u_xlat5 = (u_xlatb9.x) ? u_xlat3 : u_xlat5;
    u_xlat6.x = _Rect[1] + _Rect[3];
    u_xlat6.y = u_xlat6.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat6.w = u_xlat6.x + (-_BorderWidths[3]);
    u_xlat4.x = _Rect[1];
    u_xlat4.z = _BorderWidths[1];
    u_xlat6.z = _BorderWidths[3];
    u_xlat6 = (u_xlatb9.y) ? u_xlat4.yxzw : u_xlat6.yxzw;
    u_xlatb11.xz = greaterThanEqual(u_xlat5.yyww, vs_TEXCOORD2.xxxx).xz;
    u_xlatb3.xy = greaterThanEqual(vs_TEXCOORD2.xxxx, u_xlat5.ywyy).xy;
    u_xlatb11.xz = (u_xlatb9.x) ? u_xlatb11.xz : u_xlatb3.xy;
    u_xlatb3.xy = greaterThanEqual(u_xlat6.xwxx, vs_TEXCOORD2.yyyy).xy;
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD2.yyyy, u_xlat6.xwxx).xy;
    u_xlatb9.xy = (u_xlatb9.y) ? u_xlatb3.xy : u_xlatb4.xy;
    u_xlatb9.x = u_xlatb9.x && u_xlatb11.x;
    u_xlat11 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat11 = (-u_xlat11) + _Rect[2];
    u_xlat3.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat3.x = (-u_xlat3.x) + _Rect[3];
    u_xlatb12 = vs_TEXCOORD2.x>=u_xlat3.w;
    u_xlat11 = u_xlat11 + u_xlat3.w;
    u_xlatb11.x = u_xlat11>=vs_TEXCOORD2.x;
    u_xlatb11.x = u_xlatb11.x && u_xlatb12;
    u_xlatb12 = vs_TEXCOORD2.y>=u_xlat4.w;
    u_xlatb11.x = u_xlatb11.x && u_xlatb12;
    u_xlat3.x = u_xlat3.x + u_xlat4.w;
    u_xlatb3.x = u_xlat3.x>=vs_TEXCOORD2.y;
    u_xlatb11.x = u_xlatb11.x && u_xlatb3.x;
    u_xlatb3.xy = equal(ivec4(u_xlati27), ivec4(0, 2, 0, 0)).xy;
    u_xlatb3.x = u_xlatb3.y || u_xlatb3.x;
    u_xlatb12 = 0.0<_CornerRadiuses[u_xlati27];
    u_xlatb12 = u_xlatb9.x && u_xlatb12;
    u_xlatb21 = 0.0<u_xlat5.z;
    u_xlati30 = u_xlatb21 ? 1 : int(0);
    u_xlatb4.x = 0.0<u_xlat6.z;
    u_xlati13 = u_xlatb4.x ? 1 : int(0);
    u_xlati13 = u_xlati2.z * u_xlati13;
    u_xlati30 = u_xlati30 * u_xlati2.x + u_xlati13;
    u_xlatb29 = u_xlatb11.z && u_xlatb21;
    u_xlatb18 = u_xlatb9.y && u_xlatb4.x;
    u_xlati29 = u_xlatb29 ? 1 : int(0);
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlati18 = u_xlati2.z * u_xlati18;
    u_xlati18 = u_xlati29 * u_xlati2.x + u_xlati18;
    u_xlati18 = (u_xlatb11.x) ? 0 : u_xlati18;
    u_xlati18 = (u_xlatb12) ? u_xlati30 : u_xlati18;
    u_xlati29 = u_xlati2.z + u_xlati2.x;
    u_xlat3.x = (u_xlatb3.x) ? 1.0 : -1.0;
    u_xlat7.xz = u_xlat5.wy;
    u_xlat7.yw = u_xlat6.wx;
    u_xlat6.x = u_xlat5.x;
    u_xlat12.xz = (-u_xlat7.yx) + u_xlat6.yx;
    u_xlat3.xy = u_xlat12.xz * u_xlat3.xx;
    u_xlat30 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.xy = vec2(u_xlat30) * u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(100.0, 100.0) + u_xlat6.yx;
    u_xlat13.xy = (-u_xlat3.yx) + u_xlat6.xy;
    u_xlat3.xy = (-u_xlat3.xy) + vs_TEXCOORD2.yx;
    u_xlat12.x = u_xlat3.y * u_xlat13.y;
    u_xlat3.x = u_xlat13.x * u_xlat3.x + (-u_xlat12.x);
    u_xlatb3.x = u_xlat3.x>=0.0;
    u_xlati2.x = (u_xlatb3.x) ? u_xlati2.x : u_xlati2.z;
    u_xlatb20 = u_xlati18!=u_xlati29;
    u_xlati18 = (u_xlatb20) ? u_xlati18 : u_xlati2.x;
    if(u_xlati18 == 0) {
        u_xlat8 = u_xlat1 * vs_COLOR0;
    } else {
        u_xlatb2.xzw = equal(ivec4(u_xlati18), ivec4(2, 0, 4, 8)).xzw;
        u_xlati18 = u_xlatb2.w ? 3 : int(0);
        u_xlati18 = (u_xlatb2.z) ? 2 : u_xlati18;
        u_xlati18 = (u_xlatb2.x) ? 1 : u_xlati18;
        u_xlat8 = u_xlat1 * _BorderColors[u_xlati18];
    }
    u_xlatb18 = u_xlatb21 || u_xlatb4.x;
    u_xlat1.xy = (-u_xlat7.zw) + vs_TEXCOORD2.xy;
    u_xlat28 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = u_xlat28 + (-_CornerRadiuses[u_xlati27]);
    u_xlat28 = u_xlat28 * u_xlat0.x + 0.5;
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlat28 = u_xlatb18 ? u_xlat28 : float(0.0);
    u_xlat2 = (-u_xlat5.z) + _CornerRadiuses[u_xlati27];
    u_xlat27 = (-u_xlat6.z) + _CornerRadiuses[u_xlati27];
    u_xlat20 = u_xlat2 / u_xlat27;
    u_xlat1.z = u_xlat1.y * u_xlat20;
    u_xlat1.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat2) + u_xlat1.x;
    u_xlat0.x = u_xlat1.x * u_xlat0.x + 0.5;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlatb1 = 0.0<u_xlat2;
    u_xlatb27 = 0.0<u_xlat27;
    u_xlatb27 = u_xlatb27 && u_xlatb1;
    u_xlat0.x = (u_xlatb27) ? u_xlat0.x : 1.0;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
    u_xlatb18 = u_xlat28==0.0;
    u_xlat27 = (-u_xlat28) + 1.0;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat27;
    u_xlat0.x = (u_xlatb9.x) ? u_xlat0.x : 1.0;
    u_xlat0.z = u_xlat0.x * u_xlat8.w;
    u_xlat27 = (u_xlatb11.x) ? 0.0 : 1.0;
    u_xlat9.x = (u_xlatb9.x) ? 1.0 : u_xlat27;
    u_xlat0.xz = u_xlat9.xx * u_xlat0.xz;
    u_xlat1 = texture(_GUIClipTexture, vs_TEXCOORD1.xy);
    SV_Target0.w = u_xlat0.z * u_xlat1.w;
    u_xlatb18 = _SrcBlend!=5;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat8.xyz;
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyw : u_xlat8.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 176
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %149 %156 %158 %168 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate vs_TEXCOORD1 Location 149 
                                                      OpDecorate vs_TEXCOORD0 Location 156 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate vs_TEXCOORD2 Location 168 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeStruct %16 %17 %18 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                              %87 = OpTypeVector %6 2 
                                             %129 = OpTypePointer Private %87 
                              Private f32_2* %130 = OpVariable Private 
                                         i32 %133 = OpConstant 4 
                                             %148 = OpTypePointer Output %87 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %157 = OpTypePointer Input %87 
                                Input f32_2* %158 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %170 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                                                      OpStore %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_2 %89 = OpVectorShuffle %88 %88 1 1 
                               Uniform f32_4* %90 = OpAccessChain %22 %25 %25 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_2 %93 = OpFMul %89 %92 
                                        f32_4 %94 = OpLoad %50 
                                        f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                      OpStore %50 %95 
                               Uniform f32_4* %96 = OpAccessChain %22 %25 %24 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                        f32_4 %99 = OpLoad %9 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 0 
                                       f32_2 %101 = OpFMul %98 %100 
                                       f32_4 %102 = OpLoad %50 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFAdd %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %22 %25 %37 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 2 
                                       f32_2 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %9 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
                                       f32_2 %115 = OpFAdd %112 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 2 3 
                                                      OpStore %9 %117 
                              Uniform f32_4* %118 = OpAccessChain %22 %25 %46 
                                       f32_4 %119 = OpLoad %118 
                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_2 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_2 %126 = OpFAdd %123 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                       f32_4 %131 = OpLoad %9 
                                       f32_2 %132 = OpVectorShuffle %131 %131 1 1 
                              Uniform f32_4* %134 = OpAccessChain %22 %133 %25 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFMul %132 %136 
                                                      OpStore %130 %137 
                              Uniform f32_4* %138 = OpAccessChain %22 %133 %24 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_4 %141 = OpLoad %9 
                                       f32_2 %142 = OpVectorShuffle %141 %141 0 0 
                                       f32_2 %143 = OpFMul %140 %142 
                                       f32_2 %144 = OpLoad %130 
                                       f32_2 %145 = OpFAdd %143 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 2 3 
                                                      OpStore %9 %147 
                                       f32_4 %150 = OpLoad %9 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                              Uniform f32_4* %152 = OpAccessChain %22 %133 %46 
                                       f32_4 %153 = OpLoad %152 
                                       f32_2 %154 = OpVectorShuffle %153 %153 0 1 
                                       f32_2 %155 = OpFAdd %151 %154 
                                                      OpStore vs_TEXCOORD1 %155 
                                       f32_2 %159 = OpLoad %158 
                              Uniform f32_4* %160 = OpAccessChain %22 %46 
                                       f32_4 %161 = OpLoad %160 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %163 = OpFMul %159 %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 2 3 
                                       f32_2 %167 = OpFAdd %163 %166 
                                                      OpStore vs_TEXCOORD0 %167 
                                       f32_4 %169 = OpLoad %11 
                                                      OpStore vs_TEXCOORD2 %169 
                                 Output f32* %171 = OpAccessChain %74 %24 %70 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFNegate %172 
                                 Output f32* %174 = OpAccessChain %74 %24 %70 
                                                      OpStore %174 %173 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 857
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %39 %618 %812 %817 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate vs_TEXCOORD2 Location 11 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate vs_TEXCOORD0 Location 39 
                                                      OpDecorate %69 ArrayStride 69 
                                                      OpDecorate %70 ArrayStride 70 
                                                      OpDecorate %71 ArrayStride 71 
                                                      OpDecorate %72 ArrayStride 72 
                                                      OpMemberDecorate %73 0 Offset 73 
                                                      OpMemberDecorate %73 1 Offset 73 
                                                      OpMemberDecorate %73 2 Offset 73 
                                                      OpMemberDecorate %73 3 Offset 73 
                                                      OpMemberDecorate %73 4 Offset 73 
                                                      OpMemberDecorate %73 5 Offset 73 
                                                      OpDecorate %73 Block 
                                                      OpDecorate %75 DescriptorSet 75 
                                                      OpDecorate %75 Binding 75 
                                                      OpDecorate %618 Location 618 
                                                      OpDecorate %807 DescriptorSet 807 
                                                      OpDecorate %807 Binding 807 
                                                      OpDecorate %809 DescriptorSet 809 
                                                      OpDecorate %809 Binding 809 
                                                      OpDecorate vs_TEXCOORD1 Location 812 
                                                      OpDecorate %817 Location 817 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %12 = OpTypeInt 32 0 
                                          u32 %13 = OpConstant 0 
                                              %14 = OpTypePointer Input %6 
                                              %18 = OpTypePointer Private %6 
                                          f32 %20 = OpConstant 3.674022E-40 
                               Private f32_4* %26 = OpVariable Private 
                                              %27 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %28 = OpTypePointer UniformConstant %27 
         UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
                                              %31 = OpTypeSampler 
                                              %32 = OpTypePointer UniformConstant %31 
                     UniformConstant sampler* %33 = OpVariable UniformConstant 
                                              %35 = OpTypeSampledImage %27 
                                              %37 = OpTypeVector %6 2 
                                              %38 = OpTypePointer Input %37 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %42 = OpTypeVector %6 3 
                                              %43 = OpTypePointer Private %42 
                               Private f32_3* %44 = OpVariable Private 
                                          f32 %47 = OpConstant 3.674022E-40 
                                        f32_3 %48 = OpConstantComposite %47 %47 %47 
                                          f32 %53 = OpConstant 3.674022E-40 
                                        f32_3 %54 = OpConstantComposite %53 %53 %53 
                                          f32 %59 = OpConstant 3.674022E-40 
                                        f32_3 %60 = OpConstantComposite %59 %59 %59 
                                          f32 %62 = OpConstant 3.674022E-40 
                                        f32_3 %63 = OpConstantComposite %62 %62 %62 
                                              %67 = OpTypeInt 32 1 
                                          u32 %68 = OpConstant 4 
                                              %69 = OpTypeArray %6 %68 
                                              %70 = OpTypeArray %6 %68 
                                              %71 = OpTypeArray %6 %68 
                                              %72 = OpTypeArray %7 %68 
                                              %73 = OpTypeStruct %67 %67 %69 %70 %71 %72 
                                              %74 = OpTypePointer Uniform %73 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4]; f32_4[4];}* %75 = OpVariable Uniform 
                                          i32 %76 = OpConstant 0 
                                              %77 = OpTypePointer Uniform %67 
                                              %80 = OpTypeBool 
                                              %82 = OpTypePointer Function %42 
                                          i32 %95 = OpConstant 4 
                                              %96 = OpTypePointer Uniform %6 
                                         i32 %102 = OpConstant 2 
                                         f32 %106 = OpConstant 3.674022E-40 
                                Private f32* %112 = OpVariable Private 
                                         u32 %113 = OpConstant 1 
                                         i32 %116 = OpConstant 1 
                                         i32 %121 = OpConstant 3 
                                             %129 = OpTypeVector %80 2 
                                             %130 = OpTypePointer Private %129 
                             Private bool_2* %131 = OpVariable Private 
                                       f32_4 %132 = OpConstantComposite %47 %47 %47 %47 
                                             %135 = OpTypeVector %80 4 
                                             %138 = OpTypeVector %67 3 
                                             %139 = OpTypePointer Private %138 
                              Private i32_3* %140 = OpVariable Private 
                                             %141 = OpTypePointer Private %80 
                                       i32_3 %144 = OpConstantComposite %76 %116 %102 
                                         i32 %145 = OpConstant 8 
                                       i32_3 %146 = OpConstantComposite %121 %102 %145 
                                             %147 = OpTypeVector %80 3 
                                             %150 = OpTypePointer Private %67 
                                Private i32* %151 = OpVariable Private 
                                             %154 = OpTypePointer Function %67 
                              Private f32_4* %168 = OpVariable Private 
                              Private f32_4* %176 = OpVariable Private 
                                         u32 %189 = OpConstant 3 
                              Private f32_4* %197 = OpVariable Private 
                                         u32 %224 = OpConstant 2 
                              Private f32_4* %235 = OpVariable Private 
                                             %268 = OpTypePointer Function %7 
                                             %278 = OpTypePointer Private %147 
                             Private bool_3* %279 = OpVariable Private 
                             Private bool_2* %288 = OpVariable Private 
                                             %297 = OpTypePointer Function %129 
                             Private bool_2* %314 = OpVariable Private 
                                Private f32* %336 = OpVariable Private 
                               Private bool* %360 = OpVariable Private 
                                             %409 = OpTypeVector %67 4 
                                       i32_4 %411 = OpConstantComposite %76 %102 %76 %76 
                               Private bool* %428 = OpVariable Private 
                                Private i32* %432 = OpVariable Private 
                                Private i32* %439 = OpVariable Private 
                               Private bool* %453 = OpVariable Private 
                               Private bool* %458 = OpVariable Private 
                                Private i32* %464 = OpVariable Private 
                                Private i32* %467 = OpVariable Private 
                                         f32 %495 = OpConstant 3.674022E-40 
                              Private f32_4* %498 = OpVariable Private 
                              Private f32_3* %510 = OpVariable Private 
                                Private f32* %526 = OpVariable Private 
                                         f32 %543 = OpConstant 3.674022E-40 
                                       f32_2 %544 = OpConstantComposite %543 %543 
                                             %551 = OpTypePointer Private %37 
                              Private f32_2* %552 = OpVariable Private 
                               Private bool* %599 = OpVariable Private 
                              Private f32_4* %616 = OpVariable Private 
                                Input f32_4* %618 = OpVariable Input 
                                             %622 = OpTypePointer Private %135 
                             Private bool_4* %623 = OpVariable Private 
                                       i32_4 %626 = OpConstantComposite %102 %76 %95 %145 
                                         i32 %643 = OpConstant 5 
                                             %645 = OpTypePointer Uniform %7 
                                Private f32* %661 = OpVariable Private 
                                Private f32* %685 = OpVariable Private 
                                Private f32* %693 = OpVariable Private 
                                Private f32* %701 = OpVariable Private 
                               Private bool* %737 = OpVariable Private 
                               Private bool* %740 = OpVariable Private 
                                             %747 = OpTypePointer Function %6 
        UniformConstant read_only Texture2D* %807 = OpVariable UniformConstant 
                    UniformConstant sampler* %809 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                             %816 = OpTypePointer Output %7 
                               Output f32_4* %817 = OpVariable Output 
                                             %821 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %83 = OpVariable Function 
                               Function i32* %155 = OpVariable Function 
                             Function f32_4* %269 = OpVariable Function 
                            Function bool_2* %298 = OpVariable Function 
                            Function bool_2* %323 = OpVariable Function 
                               Function i32* %589 = OpVariable Function 
                               Function i32* %604 = OpVariable Function 
                               Function f32* %748 = OpVariable Function 
                               Function f32* %757 = OpVariable Function 
                               Function f32* %771 = OpVariable Function 
                               Function f32* %782 = OpVariable Function 
                             Function f32_3* %845 = OpVariable Function 
                                   Input f32* %15 = OpAccessChain vs_TEXCOORD2 %13 
                                          f32 %16 = OpLoad %15 
                                          f32 %17 = OpDPdx %16 
                                 Private f32* %19 = OpAccessChain %9 %13 
                                                      OpStore %19 %17 
                                 Private f32* %21 = OpAccessChain %9 %13 
                                          f32 %22 = OpLoad %21 
                                          f32 %23 = OpExtInst %1 4 %22 
                                          f32 %24 = OpFDiv %20 %23 
                                 Private f32* %25 = OpAccessChain %9 %13 
                                                      OpStore %25 %24 
                          read_only Texture2D %30 = OpLoad %29 
                                      sampler %34 = OpLoad %33 
                   read_only Texture2DSampled %36 = OpSampledImage %30 %34 
                                        f32_2 %40 = OpLoad vs_TEXCOORD0 
                                        f32_4 %41 = OpImageSampleImplicitLod %36 %40 
                                                      OpStore %26 %41 
                                        f32_4 %45 = OpLoad %26 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_3 %49 = OpExtInst %1 40 %46 %48 
                                                      OpStore %44 %49 
                                        f32_3 %50 = OpLoad %44 
                                        f32_3 %51 = OpExtInst %1 30 %50 
                                                      OpStore %44 %51 
                                        f32_3 %52 = OpLoad %44 
                                        f32_3 %55 = OpFMul %52 %54 
                                                      OpStore %44 %55 
                                        f32_3 %56 = OpLoad %44 
                                        f32_3 %57 = OpExtInst %1 29 %56 
                                                      OpStore %44 %57 
                                        f32_3 %58 = OpLoad %44 
                                        f32_3 %61 = OpFMul %58 %60 
                                        f32_3 %64 = OpFAdd %61 %63 
                                                      OpStore %44 %64 
                                        f32_3 %65 = OpLoad %44 
                                        f32_3 %66 = OpExtInst %1 40 %65 %48 
                                                      OpStore %44 %66 
                                 Uniform i32* %78 = OpAccessChain %75 %76 
                                          i32 %79 = OpLoad %78 
                                         bool %81 = OpINotEqual %79 %76 
                                                      OpSelectionMerge %85 None 
                                                      OpBranchConditional %81 %84 %87 
                                              %84 = OpLabel 
                                        f32_3 %86 = OpLoad %44 
                                                      OpStore %83 %86 
                                                      OpBranch %85 
                                              %87 = OpLabel 
                                        f32_4 %88 = OpLoad %26 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                                      OpStore %83 %89 
                                                      OpBranch %85 
                                              %85 = OpLabel 
                                        f32_3 %90 = OpLoad %83 
                                        f32_4 %91 = OpLoad %26 
                                        f32_4 %92 = OpVectorShuffle %91 %90 4 5 6 3 
                                                      OpStore %26 %92 
                                   Input f32* %93 = OpAccessChain vs_TEXCOORD2 %13 
                                          f32 %94 = OpLoad %93 
                                 Uniform f32* %97 = OpAccessChain %75 %95 %76 
                                          f32 %98 = OpLoad %97 
                                          f32 %99 = OpFNegate %98 
                                         f32 %100 = OpFAdd %94 %99 
                                Private f32* %101 = OpAccessChain %44 %13 
                                                      OpStore %101 %100 
                                Uniform f32* %103 = OpAccessChain %75 %95 %102 
                                         f32 %104 = OpLoad %103 
                                         f32 %105 = OpFNegate %104 
                                         f32 %107 = OpFMul %105 %106 
                                Private f32* %108 = OpAccessChain %44 %13 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpFAdd %107 %109 
                                Private f32* %111 = OpAccessChain %44 %13 
                                                      OpStore %111 %110 
                                  Input f32* %114 = OpAccessChain vs_TEXCOORD2 %113 
                                         f32 %115 = OpLoad %114 
                                Uniform f32* %117 = OpAccessChain %75 %95 %116 
                                         f32 %118 = OpLoad %117 
                                         f32 %119 = OpFNegate %118 
                                         f32 %120 = OpFAdd %115 %119 
                                                      OpStore %112 %120 
                                Uniform f32* %122 = OpAccessChain %75 %95 %121 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFNegate %123 
                                         f32 %125 = OpFMul %124 %106 
                                         f32 %126 = OpLoad %112 
                                         f32 %127 = OpFAdd %125 %126 
                                Private f32* %128 = OpAccessChain %44 %113 
                                                      OpStore %128 %127 
                                       f32_3 %133 = OpLoad %44 
                                       f32_4 %134 = OpVectorShuffle %133 %133 0 1 0 0 
                                      bool_4 %136 = OpFOrdGreaterThanEqual %132 %134 
                                      bool_2 %137 = OpVectorShuffle %136 %136 0 1 
                                                      OpStore %131 %137 
                               Private bool* %142 = OpAccessChain %131 %113 
                                        bool %143 = OpLoad %142 
                                      bool_3 %148 = OpCompositeConstruct %143 %143 %143 
                                       i32_3 %149 = OpSelect %148 %144 %146 
                                                      OpStore %140 %149 
                               Private bool* %152 = OpAccessChain %131 %13 
                                        bool %153 = OpLoad %152 
                                                      OpSelectionMerge %157 None 
                                                      OpBranchConditional %153 %156 %160 
                                             %156 = OpLabel 
                                Private i32* %158 = OpAccessChain %140 %13 
                                         i32 %159 = OpLoad %158 
                                                      OpStore %155 %159 
                                                      OpBranch %157 
                                             %160 = OpLabel 
                                Private i32* %161 = OpAccessChain %140 %113 
                                         i32 %162 = OpLoad %161 
                                                      OpStore %155 %162 
                                                      OpBranch %157 
                                             %157 = OpLabel 
                                         i32 %163 = OpLoad %155 
                                                      OpStore %151 %163 
                               Private bool* %164 = OpAccessChain %131 %13 
                                        bool %165 = OpLoad %164 
                                         i32 %166 = OpSelect %165 %116 %95 
                                Private i32* %167 = OpAccessChain %140 %13 
                                                      OpStore %167 %166 
                                Uniform f32* %169 = OpAccessChain %75 %95 %76 
                                         f32 %170 = OpLoad %169 
                                         i32 %171 = OpLoad %151 
                                Uniform f32* %172 = OpAccessChain %75 %102 %171 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFAdd %170 %173 
                                Private f32* %175 = OpAccessChain %168 %113 
                                                      OpStore %175 %174 
                                Uniform f32* %177 = OpAccessChain %75 %95 %116 
                                         f32 %178 = OpLoad %177 
                                         i32 %179 = OpLoad %151 
                                Uniform f32* %180 = OpAccessChain %75 %102 %179 
                                         f32 %181 = OpLoad %180 
                                         f32 %182 = OpFAdd %178 %181 
                                Private f32* %183 = OpAccessChain %176 %113 
                                                      OpStore %183 %182 
                                Uniform f32* %184 = OpAccessChain %75 %121 %76 
                                         f32 %185 = OpLoad %184 
                                Uniform f32* %186 = OpAccessChain %75 %95 %76 
                                         f32 %187 = OpLoad %186 
                                         f32 %188 = OpFAdd %185 %187 
                                Private f32* %190 = OpAccessChain %168 %189 
                                                      OpStore %190 %188 
                                Uniform f32* %191 = OpAccessChain %75 %121 %116 
                                         f32 %192 = OpLoad %191 
                                Uniform f32* %193 = OpAccessChain %75 %95 %116 
                                         f32 %194 = OpLoad %193 
                                         f32 %195 = OpFAdd %192 %194 
                                Private f32* %196 = OpAccessChain %176 %189 
                                                      OpStore %196 %195 
                                Uniform f32* %198 = OpAccessChain %75 %95 %76 
                                         f32 %199 = OpLoad %198 
                                Uniform f32* %200 = OpAccessChain %75 %95 %102 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpFAdd %199 %201 
                                Private f32* %203 = OpAccessChain %197 %13 
                                                      OpStore %203 %202 
                                Private f32* %204 = OpAccessChain %197 %13 
                                         f32 %205 = OpLoad %204 
                                         i32 %206 = OpLoad %151 
                                Uniform f32* %207 = OpAccessChain %75 %102 %206 
                                         f32 %208 = OpLoad %207 
                                         f32 %209 = OpFNegate %208 
                                         f32 %210 = OpFAdd %205 %209 
                                Private f32* %211 = OpAccessChain %197 %113 
                                                      OpStore %211 %210 
                                Private f32* %212 = OpAccessChain %197 %13 
                                         f32 %213 = OpLoad %212 
                                Uniform f32* %214 = OpAccessChain %75 %121 %102 
                                         f32 %215 = OpLoad %214 
                                         f32 %216 = OpFNegate %215 
                                         f32 %217 = OpFAdd %213 %216 
                                Private f32* %218 = OpAccessChain %197 %189 
                                                      OpStore %218 %217 
                                Uniform f32* %219 = OpAccessChain %75 %95 %76 
                                         f32 %220 = OpLoad %219 
                                Private f32* %221 = OpAccessChain %168 %13 
                                                      OpStore %221 %220 
                                Uniform f32* %222 = OpAccessChain %75 %121 %76 
                                         f32 %223 = OpLoad %222 
                                Private f32* %225 = OpAccessChain %168 %224 
                                                      OpStore %225 %223 
                                Uniform f32* %226 = OpAccessChain %75 %121 %102 
                                         f32 %227 = OpLoad %226 
                                Private f32* %228 = OpAccessChain %197 %224 
                                                      OpStore %228 %227 
                               Private bool* %229 = OpAccessChain %131 %13 
                                        bool %230 = OpLoad %229 
                                       f32_4 %231 = OpLoad %168 
                                       f32_4 %232 = OpLoad %197 
                                      bool_4 %233 = OpCompositeConstruct %230 %230 %230 %230 
                                       f32_4 %234 = OpSelect %233 %231 %232 
                                                      OpStore %197 %234 
                                Uniform f32* %236 = OpAccessChain %75 %95 %116 
                                         f32 %237 = OpLoad %236 
                                Uniform f32* %238 = OpAccessChain %75 %95 %121 
                                         f32 %239 = OpLoad %238 
                                         f32 %240 = OpFAdd %237 %239 
                                Private f32* %241 = OpAccessChain %235 %13 
                                                      OpStore %241 %240 
                                Private f32* %242 = OpAccessChain %235 %13 
                                         f32 %243 = OpLoad %242 
                                         i32 %244 = OpLoad %151 
                                Uniform f32* %245 = OpAccessChain %75 %102 %244 
                                         f32 %246 = OpLoad %245 
                                         f32 %247 = OpFNegate %246 
                                         f32 %248 = OpFAdd %243 %247 
                                Private f32* %249 = OpAccessChain %235 %113 
                                                      OpStore %249 %248 
                                Private f32* %250 = OpAccessChain %235 %13 
                                         f32 %251 = OpLoad %250 
                                Uniform f32* %252 = OpAccessChain %75 %121 %121 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpFNegate %253 
                                         f32 %255 = OpFAdd %251 %254 
                                Private f32* %256 = OpAccessChain %235 %189 
                                                      OpStore %256 %255 
                                Uniform f32* %257 = OpAccessChain %75 %95 %116 
                                         f32 %258 = OpLoad %257 
                                Private f32* %259 = OpAccessChain %176 %13 
                                                      OpStore %259 %258 
                                Uniform f32* %260 = OpAccessChain %75 %121 %116 
                                         f32 %261 = OpLoad %260 
                                Private f32* %262 = OpAccessChain %176 %224 
                                                      OpStore %262 %261 
                                Uniform f32* %263 = OpAccessChain %75 %121 %121 
                                         f32 %264 = OpLoad %263 
                                Private f32* %265 = OpAccessChain %235 %224 
                                                      OpStore %265 %264 
                               Private bool* %266 = OpAccessChain %131 %113 
                                        bool %267 = OpLoad %266 
                                                      OpSelectionMerge %271 None 
                                                      OpBranchConditional %267 %270 %274 
                                             %270 = OpLabel 
                                       f32_4 %272 = OpLoad %176 
                                       f32_4 %273 = OpVectorShuffle %272 %272 1 0 2 3 
                                                      OpStore %269 %273 
                                                      OpBranch %271 
                                             %274 = OpLabel 
                                       f32_4 %275 = OpLoad %235 
                                       f32_4 %276 = OpVectorShuffle %275 %275 1 0 2 3 
                                                      OpStore %269 %276 
                                                      OpBranch %271 
                                             %271 = OpLabel 
                                       f32_4 %277 = OpLoad %269 
                                                      OpStore %235 %277 
                                       f32_4 %280 = OpLoad %197 
                                       f32_4 %281 = OpVectorShuffle %280 %280 1 1 3 3 
                                       f32_4 %282 = OpLoad vs_TEXCOORD2 
                                       f32_4 %283 = OpVectorShuffle %282 %282 0 0 0 0 
                                      bool_4 %284 = OpFOrdGreaterThanEqual %281 %283 
                                      bool_2 %285 = OpVectorShuffle %284 %284 0 2 
                                      bool_3 %286 = OpLoad %279 
                                      bool_3 %287 = OpVectorShuffle %286 %285 3 1 4 
                                                      OpStore %279 %287 
                                       f32_4 %289 = OpLoad vs_TEXCOORD2 
                                       f32_4 %290 = OpVectorShuffle %289 %289 0 0 0 0 
                                       f32_4 %291 = OpLoad %197 
                                       f32_4 %292 = OpVectorShuffle %291 %291 1 3 1 1 
                                      bool_4 %293 = OpFOrdGreaterThanEqual %290 %292 
                                      bool_2 %294 = OpVectorShuffle %293 %293 0 1 
                                                      OpStore %288 %294 
                               Private bool* %295 = OpAccessChain %131 %13 
                                        bool %296 = OpLoad %295 
                                                      OpSelectionMerge %300 None 
                                                      OpBranchConditional %296 %299 %303 
                                             %299 = OpLabel 
                                      bool_3 %301 = OpLoad %279 
                                      bool_2 %302 = OpVectorShuffle %301 %301 0 2 
                                                      OpStore %298 %302 
                                                      OpBranch %300 
                                             %303 = OpLabel 
                                      bool_2 %304 = OpLoad %288 
                                                      OpStore %298 %304 
                                                      OpBranch %300 
                                             %300 = OpLabel 
                                      bool_2 %305 = OpLoad %298 
                                      bool_3 %306 = OpLoad %279 
                                      bool_3 %307 = OpVectorShuffle %306 %305 3 1 4 
                                                      OpStore %279 %307 
                                       f32_4 %308 = OpLoad %235 
                                       f32_4 %309 = OpVectorShuffle %308 %308 0 3 0 0 
                                       f32_4 %310 = OpLoad vs_TEXCOORD2 
                                       f32_4 %311 = OpVectorShuffle %310 %310 1 1 1 1 
                                      bool_4 %312 = OpFOrdGreaterThanEqual %309 %311 
                                      bool_2 %313 = OpVectorShuffle %312 %312 0 1 
                                                      OpStore %288 %313 
                                       f32_4 %315 = OpLoad vs_TEXCOORD2 
                                       f32_4 %316 = OpVectorShuffle %315 %315 1 1 1 1 
                                       f32_4 %317 = OpLoad %235 
                                       f32_4 %318 = OpVectorShuffle %317 %317 0 3 0 0 
                                      bool_4 %319 = OpFOrdGreaterThanEqual %316 %318 
                                      bool_2 %320 = OpVectorShuffle %319 %319 0 1 
                                                      OpStore %314 %320 
                               Private bool* %321 = OpAccessChain %131 %113 
                                        bool %322 = OpLoad %321 
                                                      OpSelectionMerge %325 None 
                                                      OpBranchConditional %322 %324 %327 
                                             %324 = OpLabel 
                                      bool_2 %326 = OpLoad %288 
                                                      OpStore %323 %326 
                                                      OpBranch %325 
                                             %327 = OpLabel 
                                      bool_2 %328 = OpLoad %314 
                                                      OpStore %323 %328 
                                                      OpBranch %325 
                                             %325 = OpLabel 
                                      bool_2 %329 = OpLoad %323 
                                                      OpStore %131 %329 
                               Private bool* %330 = OpAccessChain %131 %13 
                                        bool %331 = OpLoad %330 
                               Private bool* %332 = OpAccessChain %279 %13 
                                        bool %333 = OpLoad %332 
                                        bool %334 = OpLogicalAnd %331 %333 
                               Private bool* %335 = OpAccessChain %131 %13 
                                                      OpStore %335 %334 
                                Uniform f32* %337 = OpAccessChain %75 %121 %76 
                                         f32 %338 = OpLoad %337 
                                Uniform f32* %339 = OpAccessChain %75 %121 %102 
                                         f32 %340 = OpLoad %339 
                                         f32 %341 = OpFAdd %338 %340 
                                                      OpStore %336 %341 
                                         f32 %342 = OpLoad %336 
                                         f32 %343 = OpFNegate %342 
                                Uniform f32* %344 = OpAccessChain %75 %95 %102 
                                         f32 %345 = OpLoad %344 
                                         f32 %346 = OpFAdd %343 %345 
                                                      OpStore %336 %346 
                                Uniform f32* %347 = OpAccessChain %75 %121 %116 
                                         f32 %348 = OpLoad %347 
                                Uniform f32* %349 = OpAccessChain %75 %121 %121 
                                         f32 %350 = OpLoad %349 
                                         f32 %351 = OpFAdd %348 %350 
                                Private f32* %352 = OpAccessChain %168 %13 
                                                      OpStore %352 %351 
                                Private f32* %353 = OpAccessChain %168 %13 
                                         f32 %354 = OpLoad %353 
                                         f32 %355 = OpFNegate %354 
                                Uniform f32* %356 = OpAccessChain %75 %95 %121 
                                         f32 %357 = OpLoad %356 
                                         f32 %358 = OpFAdd %355 %357 
                                Private f32* %359 = OpAccessChain %168 %13 
                                                      OpStore %359 %358 
                                  Input f32* %361 = OpAccessChain vs_TEXCOORD2 %13 
                                         f32 %362 = OpLoad %361 
                                Private f32* %363 = OpAccessChain %168 %189 
                                         f32 %364 = OpLoad %363 
                                        bool %365 = OpFOrdGreaterThanEqual %362 %364 
                                                      OpStore %360 %365 
                                         f32 %366 = OpLoad %336 
                                Private f32* %367 = OpAccessChain %168 %189 
                                         f32 %368 = OpLoad %367 
                                         f32 %369 = OpFAdd %366 %368 
                                                      OpStore %336 %369 
                                         f32 %370 = OpLoad %336 
                                  Input f32* %371 = OpAccessChain vs_TEXCOORD2 %13 
                                         f32 %372 = OpLoad %371 
                                        bool %373 = OpFOrdGreaterThanEqual %370 %372 
                               Private bool* %374 = OpAccessChain %279 %13 
                                                      OpStore %374 %373 
                               Private bool* %375 = OpAccessChain %279 %13 
                                        bool %376 = OpLoad %375 
                                        bool %377 = OpLoad %360 
                                        bool %378 = OpLogicalAnd %376 %377 
                               Private bool* %379 = OpAccessChain %279 %13 
                                                      OpStore %379 %378 
                                  Input f32* %380 = OpAccessChain vs_TEXCOORD2 %113 
                                         f32 %381 = OpLoad %380 
                                Private f32* %382 = OpAccessChain %176 %189 
                                         f32 %383 = OpLoad %382 
                                        bool %384 = OpFOrdGreaterThanEqual %381 %383 
                                                      OpStore %360 %384 
                               Private bool* %385 = OpAccessChain %279 %13 
                                        bool %386 = OpLoad %385 
                                        bool %387 = OpLoad %360 
                                        bool %388 = OpLogicalAnd %386 %387 
                               Private bool* %389 = OpAccessChain %279 %13 
                                                      OpStore %389 %388 
                                Private f32* %390 = OpAccessChain %168 %13 
                                         f32 %391 = OpLoad %390 
                                Private f32* %392 = OpAccessChain %176 %189 
                                         f32 %393 = OpLoad %392 
                                         f32 %394 = OpFAdd %391 %393 
                                Private f32* %395 = OpAccessChain %168 %13 
                                                      OpStore %395 %394 
                                Private f32* %396 = OpAccessChain %168 %13 
                                         f32 %397 = OpLoad %396 
                                  Input f32* %398 = OpAccessChain vs_TEXCOORD2 %113 
                                         f32 %399 = OpLoad %398 
                                        bool %400 = OpFOrdGreaterThanEqual %397 %399 
                               Private bool* %401 = OpAccessChain %288 %13 
                                                      OpStore %401 %400 
                               Private bool* %402 = OpAccessChain %279 %13 
                                        bool %403 = OpLoad %402 
                               Private bool* %404 = OpAccessChain %288 %13 
                                        bool %405 = OpLoad %404 
                                        bool %406 = OpLogicalAnd %403 %405 
                               Private bool* %407 = OpAccessChain %279 %13 
                                                      OpStore %407 %406 
                                         i32 %408 = OpLoad %151 
                                       i32_4 %410 = OpCompositeConstruct %408 %408 %408 %408 
                                      bool_4 %412 = OpIEqual %410 %411 
                                      bool_2 %413 = OpVectorShuffle %412 %412 0 1 
                                                      OpStore %288 %413 
                               Private bool* %414 = OpAccessChain %288 %113 
                                        bool %415 = OpLoad %414 
                               Private bool* %416 = OpAccessChain %288 %13 
                                        bool %417 = OpLoad %416 
                                        bool %418 = OpLogicalOr %415 %417 
                               Private bool* %419 = OpAccessChain %288 %13 
                                                      OpStore %419 %418 
                                         i32 %420 = OpLoad %151 
                                Uniform f32* %421 = OpAccessChain %75 %102 %420 
                                         f32 %422 = OpLoad %421 
                                        bool %423 = OpFOrdLessThan %47 %422 
                                                      OpStore %360 %423 
                               Private bool* %424 = OpAccessChain %131 %13 
                                        bool %425 = OpLoad %424 
                                        bool %426 = OpLoad %360 
                                        bool %427 = OpLogicalAnd %425 %426 
                                                      OpStore %360 %427 
                                Private f32* %429 = OpAccessChain %197 %224 
                                         f32 %430 = OpLoad %429 
                                        bool %431 = OpFOrdLessThan %47 %430 
                                                      OpStore %428 %431 
                                        bool %433 = OpLoad %428 
                                         i32 %434 = OpSelect %433 %116 %76 
                                                      OpStore %432 %434 
                                Private f32* %435 = OpAccessChain %235 %224 
                                         f32 %436 = OpLoad %435 
                                        bool %437 = OpFOrdLessThan %47 %436 
                               Private bool* %438 = OpAccessChain %314 %13 
                                                      OpStore %438 %437 
                               Private bool* %440 = OpAccessChain %314 %13 
                                        bool %441 = OpLoad %440 
                                         i32 %442 = OpSelect %441 %116 %76 
                                                      OpStore %439 %442 
                                Private i32* %443 = OpAccessChain %140 %224 
                                         i32 %444 = OpLoad %443 
                                         i32 %445 = OpLoad %439 
                                         i32 %446 = OpIMul %444 %445 
                                                      OpStore %439 %446 
                                         i32 %447 = OpLoad %432 
                                Private i32* %448 = OpAccessChain %140 %13 
                                         i32 %449 = OpLoad %448 
                                         i32 %450 = OpIMul %447 %449 
                                         i32 %451 = OpLoad %439 
                                         i32 %452 = OpIAdd %450 %451 
                                                      OpStore %432 %452 
                               Private bool* %454 = OpAccessChain %279 %224 
                                        bool %455 = OpLoad %454 
                                        bool %456 = OpLoad %428 
                                        bool %457 = OpLogicalAnd %455 %456 
                                                      OpStore %453 %457 
                               Private bool* %459 = OpAccessChain %131 %113 
                                        bool %460 = OpLoad %459 
                               Private bool* %461 = OpAccessChain %314 %13 
                                        bool %462 = OpLoad %461 
                                        bool %463 = OpLogicalAnd %460 %462 
                                                      OpStore %458 %463 
                                        bool %465 = OpLoad %453 
                                         i32 %466 = OpSelect %465 %116 %76 
                                                      OpStore %464 %466 
                                        bool %468 = OpLoad %458 
                                         i32 %469 = OpSelect %468 %116 %76 
                                                      OpStore %467 %469 
                                Private i32* %470 = OpAccessChain %140 %224 
                                         i32 %471 = OpLoad %470 
                                         i32 %472 = OpLoad %467 
                                         i32 %473 = OpIMul %471 %472 
                                                      OpStore %467 %473 
                                         i32 %474 = OpLoad %464 
                                Private i32* %475 = OpAccessChain %140 %13 
                                         i32 %476 = OpLoad %475 
                                         i32 %477 = OpIMul %474 %476 
                                         i32 %478 = OpLoad %467 
                                         i32 %479 = OpIAdd %477 %478 
                                                      OpStore %467 %479 
                               Private bool* %480 = OpAccessChain %279 %13 
                                        bool %481 = OpLoad %480 
                                         i32 %482 = OpLoad %467 
                                         i32 %483 = OpSelect %481 %76 %482 
                                                      OpStore %467 %483 
                                        bool %484 = OpLoad %360 
                                         i32 %485 = OpLoad %432 
                                         i32 %486 = OpLoad %467 
                                         i32 %487 = OpSelect %484 %485 %486 
                                                      OpStore %467 %487 
                                Private i32* %488 = OpAccessChain %140 %224 
                                         i32 %489 = OpLoad %488 
                                Private i32* %490 = OpAccessChain %140 %13 
                                         i32 %491 = OpLoad %490 
                                         i32 %492 = OpIAdd %489 %491 
                                                      OpStore %464 %492 
                               Private bool* %493 = OpAccessChain %288 %13 
                                        bool %494 = OpLoad %493 
                                         f32 %496 = OpSelect %494 %20 %495 
                                Private f32* %497 = OpAccessChain %168 %13 
                                                      OpStore %497 %496 
                                       f32_4 %499 = OpLoad %197 
                                       f32_2 %500 = OpVectorShuffle %499 %499 3 1 
                                       f32_4 %501 = OpLoad %498 
                                       f32_4 %502 = OpVectorShuffle %501 %500 4 1 5 3 
                                                      OpStore %498 %502 
                                       f32_4 %503 = OpLoad %235 
                                       f32_2 %504 = OpVectorShuffle %503 %503 3 0 
                                       f32_4 %505 = OpLoad %498 
                                       f32_4 %506 = OpVectorShuffle %505 %504 0 4 2 5 
                                                      OpStore %498 %506 
                                Private f32* %507 = OpAccessChain %197 %13 
                                         f32 %508 = OpLoad %507 
                                Private f32* %509 = OpAccessChain %235 %13 
                                                      OpStore %509 %508 
                                       f32_4 %511 = OpLoad %498 
                                       f32_2 %512 = OpVectorShuffle %511 %511 1 0 
                                       f32_2 %513 = OpFNegate %512 
                                       f32_4 %514 = OpLoad %235 
                                       f32_2 %515 = OpVectorShuffle %514 %514 1 0 
                                       f32_2 %516 = OpFAdd %513 %515 
                                       f32_3 %517 = OpLoad %510 
                                       f32_3 %518 = OpVectorShuffle %517 %516 3 1 4 
                                                      OpStore %510 %518 
                                       f32_3 %519 = OpLoad %510 
                                       f32_2 %520 = OpVectorShuffle %519 %519 0 2 
                                       f32_4 %521 = OpLoad %168 
                                       f32_2 %522 = OpVectorShuffle %521 %521 0 0 
                                       f32_2 %523 = OpFMul %520 %522 
                                       f32_4 %524 = OpLoad %168 
                                       f32_4 %525 = OpVectorShuffle %524 %523 4 5 2 3 
                                                      OpStore %168 %525 
                                       f32_4 %527 = OpLoad %168 
                                       f32_2 %528 = OpVectorShuffle %527 %527 0 1 
                                       f32_4 %529 = OpLoad %168 
                                       f32_2 %530 = OpVectorShuffle %529 %529 0 1 
                                         f32 %531 = OpDot %528 %530 
                                                      OpStore %526 %531 
                                         f32 %532 = OpLoad %526 
                                         f32 %533 = OpExtInst %1 32 %532 
                                                      OpStore %526 %533 
                                         f32 %534 = OpLoad %526 
                                       f32_2 %535 = OpCompositeConstruct %534 %534 
                                       f32_4 %536 = OpLoad %168 
                                       f32_2 %537 = OpVectorShuffle %536 %536 0 1 
                                       f32_2 %538 = OpFMul %535 %537 
                                       f32_4 %539 = OpLoad %168 
                                       f32_4 %540 = OpVectorShuffle %539 %538 4 5 2 3 
                                                      OpStore %168 %540 
                                       f32_4 %541 = OpLoad %168 
                                       f32_2 %542 = OpVectorShuffle %541 %541 0 1 
                                       f32_2 %545 = OpFMul %542 %544 
                                       f32_4 %546 = OpLoad %235 
                                       f32_2 %547 = OpVectorShuffle %546 %546 1 0 
                                       f32_2 %548 = OpFAdd %545 %547 
                                       f32_4 %549 = OpLoad %168 
                                       f32_4 %550 = OpVectorShuffle %549 %548 4 5 2 3 
                                                      OpStore %168 %550 
                                       f32_4 %553 = OpLoad %168 
                                       f32_2 %554 = OpVectorShuffle %553 %553 1 0 
                                       f32_2 %555 = OpFNegate %554 
                                       f32_4 %556 = OpLoad %235 
                                       f32_2 %557 = OpVectorShuffle %556 %556 0 1 
                                       f32_2 %558 = OpFAdd %555 %557 
                                                      OpStore %552 %558 
                                       f32_4 %559 = OpLoad %168 
                                       f32_2 %560 = OpVectorShuffle %559 %559 0 1 
                                       f32_2 %561 = OpFNegate %560 
                                       f32_4 %562 = OpLoad vs_TEXCOORD2 
                                       f32_2 %563 = OpVectorShuffle %562 %562 1 0 
                                       f32_2 %564 = OpFAdd %561 %563 
                                       f32_4 %565 = OpLoad %168 
                                       f32_4 %566 = OpVectorShuffle %565 %564 4 5 2 3 
                                                      OpStore %168 %566 
                                Private f32* %567 = OpAccessChain %168 %113 
                                         f32 %568 = OpLoad %567 
                                Private f32* %569 = OpAccessChain %552 %113 
                                         f32 %570 = OpLoad %569 
                                         f32 %571 = OpFMul %568 %570 
                                Private f32* %572 = OpAccessChain %510 %13 
                                                      OpStore %572 %571 
                                Private f32* %573 = OpAccessChain %552 %13 
                                         f32 %574 = OpLoad %573 
                                Private f32* %575 = OpAccessChain %168 %13 
                                         f32 %576 = OpLoad %575 
                                         f32 %577 = OpFMul %574 %576 
                                Private f32* %578 = OpAccessChain %510 %13 
                                         f32 %579 = OpLoad %578 
                                         f32 %580 = OpFNegate %579 
                                         f32 %581 = OpFAdd %577 %580 
                                Private f32* %582 = OpAccessChain %168 %13 
                                                      OpStore %582 %581 
                                Private f32* %583 = OpAccessChain %168 %13 
                                         f32 %584 = OpLoad %583 
                                        bool %585 = OpFOrdGreaterThanEqual %584 %47 
                               Private bool* %586 = OpAccessChain %288 %13 
                                                      OpStore %586 %585 
                               Private bool* %587 = OpAccessChain %288 %13 
                                        bool %588 = OpLoad %587 
                                                      OpSelectionMerge %591 None 
                                                      OpBranchConditional %588 %590 %594 
                                             %590 = OpLabel 
                                Private i32* %592 = OpAccessChain %140 %13 
                                         i32 %593 = OpLoad %592 
                                                      OpStore %589 %593 
                                                      OpBranch %591 
                                             %594 = OpLabel 
                                Private i32* %595 = OpAccessChain %140 %224 
                                         i32 %596 = OpLoad %595 
                                                      OpStore %589 %596 
                                                      OpBranch %591 
                                             %591 = OpLabel 
                                         i32 %597 = OpLoad %589 
                                Private i32* %598 = OpAccessChain %140 %13 
                                                      OpStore %598 %597 
                                         i32 %600 = OpLoad %467 
                                         i32 %601 = OpLoad %464 
                                        bool %602 = OpINotEqual %600 %601 
                                                      OpStore %599 %602 
                                        bool %603 = OpLoad %599 
                                                      OpSelectionMerge %606 None 
                                                      OpBranchConditional %603 %605 %608 
                                             %605 = OpLabel 
                                         i32 %607 = OpLoad %467 
                                                      OpStore %604 %607 
                                                      OpBranch %606 
                                             %608 = OpLabel 
                                Private i32* %609 = OpAccessChain %140 %13 
                                         i32 %610 = OpLoad %609 
                                                      OpStore %604 %610 
                                                      OpBranch %606 
                                             %606 = OpLabel 
                                         i32 %611 = OpLoad %604 
                                                      OpStore %467 %611 
                                         i32 %612 = OpLoad %467 
                                        bool %613 = OpIEqual %612 %76 
                                                      OpSelectionMerge %615 None 
                                                      OpBranchConditional %613 %614 %621 
                                             %614 = OpLabel 
                                       f32_4 %617 = OpLoad %26 
                                       f32_4 %619 = OpLoad %618 
                                       f32_4 %620 = OpFMul %617 %619 
                                                      OpStore %616 %620 
                                                      OpBranch %615 
                                             %621 = OpLabel 
                                         i32 %624 = OpLoad %467 
                                       i32_4 %625 = OpCompositeConstruct %624 %624 %624 %624 
                                      bool_4 %627 = OpIEqual %625 %626 
                                      bool_3 %628 = OpVectorShuffle %627 %627 0 2 3 
                                      bool_4 %629 = OpLoad %623 
                                      bool_4 %630 = OpVectorShuffle %629 %628 4 1 5 6 
                                                      OpStore %623 %630 
                               Private bool* %631 = OpAccessChain %623 %189 
                                        bool %632 = OpLoad %631 
                                         i32 %633 = OpSelect %632 %121 %76 
                                                      OpStore %467 %633 
                               Private bool* %634 = OpAccessChain %623 %224 
                                        bool %635 = OpLoad %634 
                                         i32 %636 = OpLoad %467 
                                         i32 %637 = OpSelect %635 %102 %636 
                                                      OpStore %467 %637 
                               Private bool* %638 = OpAccessChain %623 %13 
                                        bool %639 = OpLoad %638 
                                         i32 %640 = OpLoad %467 
                                         i32 %641 = OpSelect %639 %116 %640 
                                                      OpStore %467 %641 
                                       f32_4 %642 = OpLoad %26 
                                         i32 %644 = OpLoad %467 
                              Uniform f32_4* %646 = OpAccessChain %75 %643 %644 
                                       f32_4 %647 = OpLoad %646 
                                       f32_4 %648 = OpFMul %642 %647 
                                                      OpStore %616 %648 
                                                      OpBranch %615 
                                             %615 = OpLabel 
                                        bool %649 = OpLoad %428 
                               Private bool* %650 = OpAccessChain %314 %13 
                                        bool %651 = OpLoad %650 
                                        bool %652 = OpLogicalOr %649 %651 
                                                      OpStore %458 %652 
                                       f32_4 %653 = OpLoad %498 
                                       f32_2 %654 = OpVectorShuffle %653 %653 2 3 
                                       f32_2 %655 = OpFNegate %654 
                                       f32_4 %656 = OpLoad vs_TEXCOORD2 
                                       f32_2 %657 = OpVectorShuffle %656 %656 0 1 
                                       f32_2 %658 = OpFAdd %655 %657 
                                       f32_4 %659 = OpLoad %26 
                                       f32_4 %660 = OpVectorShuffle %659 %658 4 5 2 3 
                                                      OpStore %26 %660 
                                       f32_4 %662 = OpLoad %26 
                                       f32_2 %663 = OpVectorShuffle %662 %662 0 1 
                                       f32_4 %664 = OpLoad %26 
                                       f32_2 %665 = OpVectorShuffle %664 %664 0 1 
                                         f32 %666 = OpDot %663 %665 
                                                      OpStore %661 %666 
                                         f32 %667 = OpLoad %661 
                                         f32 %668 = OpExtInst %1 31 %667 
                                                      OpStore %661 %668 
                                         f32 %669 = OpLoad %661 
                                         i32 %670 = OpLoad %151 
                                Uniform f32* %671 = OpAccessChain %75 %102 %670 
                                         f32 %672 = OpLoad %671 
                                         f32 %673 = OpFNegate %672 
                                         f32 %674 = OpFAdd %669 %673 
                                                      OpStore %661 %674 
                                         f32 %675 = OpLoad %661 
                                Private f32* %676 = OpAccessChain %9 %13 
                                         f32 %677 = OpLoad %676 
                                         f32 %678 = OpFMul %675 %677 
                                         f32 %679 = OpFAdd %678 %106 
                                                      OpStore %661 %679 
                                         f32 %680 = OpLoad %661 
                                         f32 %681 = OpExtInst %1 43 %680 %47 %20 
                                                      OpStore %661 %681 
                                        bool %682 = OpLoad %458 
                                         f32 %683 = OpLoad %661 
                                         f32 %684 = OpSelect %682 %683 %47 
                                                      OpStore %661 %684 
                                Private f32* %686 = OpAccessChain %197 %224 
                                         f32 %687 = OpLoad %686 
                                         f32 %688 = OpFNegate %687 
                                         i32 %689 = OpLoad %151 
                                Uniform f32* %690 = OpAccessChain %75 %102 %689 
                                         f32 %691 = OpLoad %690 
                                         f32 %692 = OpFAdd %688 %691 
                                                      OpStore %685 %692 
                                Private f32* %694 = OpAccessChain %235 %224 
                                         f32 %695 = OpLoad %694 
                                         f32 %696 = OpFNegate %695 
                                         i32 %697 = OpLoad %151 
                                Uniform f32* %698 = OpAccessChain %75 %102 %697 
                                         f32 %699 = OpLoad %698 
                                         f32 %700 = OpFAdd %696 %699 
                                                      OpStore %693 %700 
                                         f32 %702 = OpLoad %685 
                                         f32 %703 = OpLoad %693 
                                         f32 %704 = OpFDiv %702 %703 
                                                      OpStore %701 %704 
                                Private f32* %705 = OpAccessChain %26 %113 
                                         f32 %706 = OpLoad %705 
                                         f32 %707 = OpLoad %701 
                                         f32 %708 = OpFMul %706 %707 
                                Private f32* %709 = OpAccessChain %26 %224 
                                                      OpStore %709 %708 
                                       f32_4 %710 = OpLoad %26 
                                       f32_2 %711 = OpVectorShuffle %710 %710 0 2 
                                       f32_4 %712 = OpLoad %26 
                                       f32_2 %713 = OpVectorShuffle %712 %712 0 2 
                                         f32 %714 = OpDot %711 %713 
                                Private f32* %715 = OpAccessChain %26 %13 
                                                      OpStore %715 %714 
                                Private f32* %716 = OpAccessChain %26 %13 
                                         f32 %717 = OpLoad %716 
                                         f32 %718 = OpExtInst %1 31 %717 
                                Private f32* %719 = OpAccessChain %26 %13 
                                                      OpStore %719 %718 
                                         f32 %720 = OpLoad %685 
                                         f32 %721 = OpFNegate %720 
                                Private f32* %722 = OpAccessChain %26 %13 
                                         f32 %723 = OpLoad %722 
                                         f32 %724 = OpFAdd %721 %723 
                                Private f32* %725 = OpAccessChain %26 %13 
                                                      OpStore %725 %724 
                                Private f32* %726 = OpAccessChain %26 %13 
                                         f32 %727 = OpLoad %726 
                                Private f32* %728 = OpAccessChain %9 %13 
                                         f32 %729 = OpLoad %728 
                                         f32 %730 = OpFMul %727 %729 
                                         f32 %731 = OpFAdd %730 %106 
                                Private f32* %732 = OpAccessChain %9 %13 
                                                      OpStore %732 %731 
                                Private f32* %733 = OpAccessChain %9 %13 
                                         f32 %734 = OpLoad %733 
                                         f32 %735 = OpExtInst %1 43 %734 %47 %20 
                                Private f32* %736 = OpAccessChain %9 %13 
                                                      OpStore %736 %735 
                                         f32 %738 = OpLoad %685 
                                        bool %739 = OpFOrdLessThan %47 %738 
                                                      OpStore %737 %739 
                                         f32 %741 = OpLoad %693 
                                        bool %742 = OpFOrdLessThan %47 %741 
                                                      OpStore %740 %742 
                                        bool %743 = OpLoad %740 
                                        bool %744 = OpLoad %737 
                                        bool %745 = OpLogicalAnd %743 %744 
                                                      OpStore %740 %745 
                                        bool %746 = OpLoad %740 
                                                      OpSelectionMerge %750 None 
                                                      OpBranchConditional %746 %749 %753 
                                             %749 = OpLabel 
                                Private f32* %751 = OpAccessChain %9 %13 
                                         f32 %752 = OpLoad %751 
                                                      OpStore %748 %752 
                                                      OpBranch %750 
                                             %753 = OpLabel 
                                                      OpStore %748 %20 
                                                      OpBranch %750 
                                             %750 = OpLabel 
                                         f32 %754 = OpLoad %748 
                                Private f32* %755 = OpAccessChain %9 %13 
                                                      OpStore %755 %754 
                                        bool %756 = OpLoad %458 
                                                      OpSelectionMerge %759 None 
                                                      OpBranchConditional %756 %758 %762 
                                             %758 = OpLabel 
                                Private f32* %760 = OpAccessChain %9 %13 
                                         f32 %761 = OpLoad %760 
                                                      OpStore %757 %761 
                                                      OpBranch %759 
                                             %762 = OpLabel 
                                                      OpStore %757 %47 
                                                      OpBranch %759 
                                             %759 = OpLabel 
                                         f32 %763 = OpLoad %757 
                                Private f32* %764 = OpAccessChain %9 %13 
                                                      OpStore %764 %763 
                                         f32 %765 = OpLoad %661 
                                        bool %766 = OpFOrdEqual %765 %47 
                                                      OpStore %458 %766 
                                         f32 %767 = OpLoad %661 
                                         f32 %768 = OpFNegate %767 
                                         f32 %769 = OpFAdd %768 %20 
                                                      OpStore %693 %769 
                                        bool %770 = OpLoad %458 
                                                      OpSelectionMerge %773 None 
                                                      OpBranchConditional %770 %772 %776 
                                             %772 = OpLabel 
                                Private f32* %774 = OpAccessChain %9 %13 
                                         f32 %775 = OpLoad %774 
                                                      OpStore %771 %775 
                                                      OpBranch %773 
                                             %776 = OpLabel 
                                         f32 %777 = OpLoad %693 
                                                      OpStore %771 %777 
                                                      OpBranch %773 
                                             %773 = OpLabel 
                                         f32 %778 = OpLoad %771 
                                Private f32* %779 = OpAccessChain %9 %13 
                                                      OpStore %779 %778 
                               Private bool* %780 = OpAccessChain %131 %13 
                                        bool %781 = OpLoad %780 
                                                      OpSelectionMerge %784 None 
                                                      OpBranchConditional %781 %783 %787 
                                             %783 = OpLabel 
                                Private f32* %785 = OpAccessChain %9 %13 
                                         f32 %786 = OpLoad %785 
                                                      OpStore %782 %786 
                                                      OpBranch %784 
                                             %787 = OpLabel 
                                                      OpStore %782 %20 
                                                      OpBranch %784 
                                             %784 = OpLabel 
                                         f32 %788 = OpLoad %782 
                                Private f32* %789 = OpAccessChain %9 %13 
                                                      OpStore %789 %788 
                                Private f32* %790 = OpAccessChain %9 %13 
                                         f32 %791 = OpLoad %790 
                                Private f32* %792 = OpAccessChain %616 %189 
                                         f32 %793 = OpLoad %792 
                                         f32 %794 = OpFMul %791 %793 
                                                      OpStore %112 %794 
                               Private bool* %795 = OpAccessChain %279 %13 
                                        bool %796 = OpLoad %795 
                                         f32 %797 = OpSelect %796 %47 %20 
                                                      OpStore %693 %797 
                               Private bool* %798 = OpAccessChain %131 %13 
                                        bool %799 = OpLoad %798 
                                         f32 %800 = OpLoad %693 
                                         f32 %801 = OpSelect %799 %20 %800 
                                Private f32* %802 = OpAccessChain %44 %13 
                                                      OpStore %802 %801 
                                Private f32* %803 = OpAccessChain %44 %13 
                                         f32 %804 = OpLoad %803 
                                         f32 %805 = OpLoad %112 
                                         f32 %806 = OpFMul %804 %805 
                                                      OpStore %112 %806 
                         read_only Texture2D %808 = OpLoad %807 
                                     sampler %810 = OpLoad %809 
                  read_only Texture2DSampled %811 = OpSampledImage %808 %810 
                                       f32_2 %813 = OpLoad vs_TEXCOORD1 
                                       f32_4 %814 = OpImageSampleImplicitLod %811 %813 
                                         f32 %815 = OpCompositeExtract %814 3 
                                                      OpStore %693 %815 
                                         f32 %818 = OpLoad %693 
                                         f32 %819 = OpLoad %112 
                                         f32 %820 = OpFMul %818 %819 
                                 Output f32* %822 = OpAccessChain %817 %189 
                                                      OpStore %822 %820 
                                Uniform i32* %823 = OpAccessChain %75 %116 
                                         i32 %824 = OpLoad %823 
                                        bool %825 = OpINotEqual %824 %643 
                                                      OpStore %458 %825 
                                Private f32* %826 = OpAccessChain %44 %13 
                                         f32 %827 = OpLoad %826 
                                Private f32* %828 = OpAccessChain %9 %13 
                                         f32 %829 = OpLoad %828 
                                         f32 %830 = OpFMul %827 %829 
                                Private f32* %831 = OpAccessChain %9 %13 
                                                      OpStore %831 %830 
                                         f32 %832 = OpLoad %693 
                                Private f32* %833 = OpAccessChain %9 %13 
                                         f32 %834 = OpLoad %833 
                                         f32 %835 = OpFMul %832 %834 
                                Private f32* %836 = OpAccessChain %9 %13 
                                                      OpStore %836 %835 
                                       f32_4 %837 = OpLoad %9 
                                       f32_3 %838 = OpVectorShuffle %837 %837 0 0 0 
                                       f32_4 %839 = OpLoad %616 
                                       f32_3 %840 = OpVectorShuffle %839 %839 0 1 2 
                                       f32_3 %841 = OpFMul %838 %840 
                                       f32_4 %842 = OpLoad %9 
                                       f32_4 %843 = OpVectorShuffle %842 %841 4 5 2 6 
                                                      OpStore %9 %843 
                                        bool %844 = OpLoad %458 
                                                      OpSelectionMerge %847 None 
                                                      OpBranchConditional %844 %846 %850 
                                             %846 = OpLabel 
                                       f32_4 %848 = OpLoad %9 
                                       f32_3 %849 = OpVectorShuffle %848 %848 0 1 3 
                                                      OpStore %845 %849 
                                                      OpBranch %847 
                                             %850 = OpLabel 
                                       f32_4 %851 = OpLoad %616 
                                       f32_3 %852 = OpVectorShuffle %851 %851 0 1 2 
                                                      OpStore %845 %852 
                                                      OpBranch %847 
                                             %847 = OpLabel 
                                       f32_3 %853 = OpLoad %845 
                                       f32_4 %854 = OpLoad %817 
                                       f32_4 %855 = OpVectorShuffle %854 %853 4 5 6 3 
                                                      OpStore %817 %855 
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
Fallback "Hidden/Internal-GUITextureClip"
}