//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-GUIRoundedRect" {
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
  GpuProgramID 3629
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
uniform 	int _SmoothCorners;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _GUIClipTexture;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
bvec2 u_xlatb0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
ivec2 u_xlati2;
vec3 u_xlat3;
float u_xlat5;
bvec3 u_xlatb5;
float u_xlat10;
bool u_xlatb10;
float u_xlat11;
bool u_xlatb11;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
void main()
{
    u_xlat0.x = _BorderWidths[0];
    u_xlat1.x = _BorderWidths[2];
    u_xlat10 = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat10 = (-_Rect[2]) * 0.5 + u_xlat10;
    u_xlatb10 = 0.0>=u_xlat10;
    u_xlat15 = _Rect[0] + _Rect[2];
    u_xlat11 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat11 = (-_Rect[3]) * 0.5 + u_xlat11;
    u_xlatb11 = 0.0>=u_xlat11;
    u_xlati2.xy = (bool(u_xlatb11)) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati16 = (u_xlatb10) ? u_xlati2.x : u_xlati2.y;
    u_xlat1.y = u_xlat15 + (-_CornerRadiuses[u_xlati16]);
    u_xlat0.y = _Rect[0] + _CornerRadiuses[u_xlati16];
    u_xlat2.xy = (bool(u_xlatb10)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat13.x = _BorderWidths[1];
    u_xlat14.x = _BorderWidths[3];
    u_xlat0.x = _Rect[1] + _Rect[3];
    u_xlat14.y = u_xlat0.x + (-_CornerRadiuses[u_xlati16]);
    u_xlat13.y = _Rect[1] + _CornerRadiuses[u_xlati16];
    u_xlat2.zw = (bool(u_xlatb11)) ? u_xlat13.xy : u_xlat14.xy;
    u_xlat0.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati16]);
    u_xlat15 = u_xlat0.x / u_xlat0.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat15 * u_xlat3.y;
    u_xlat15 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_CornerRadiuses[u_xlati16]);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = (-u_xlat0.x) + u_xlat15;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat5 = dFdx(vs_TEXCOORD2.x);
    u_xlat5 = float(1.0) / abs(u_xlat5);
    u_xlat15 = u_xlat15 * u_xlat5 + 0.5;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat5 = u_xlat1.x * u_xlat5 + 0.5;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat0.x = (u_xlatb0.x) ? u_xlat15 : 1.0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxx).xy;
    u_xlatb15 = u_xlatb1.y || u_xlatb1.x;
    u_xlat0.x = u_xlatb15 ? u_xlat0.x : float(0.0);
    u_xlat5 = u_xlatb15 ? u_xlat5 : float(0.0);
    u_xlat15 = (-u_xlat5) + 1.0;
    u_xlatb5.x = u_xlat5==0.0;
    u_xlat15 = (_SmoothCorners != 0) ? u_xlat15 : 0.0;
    u_xlat0.x = (u_xlatb5.x) ? u_xlat0.x : u_xlat15;
    u_xlatb5.xz = greaterThanEqual(u_xlat2.yyww, vs_TEXCOORD2.xxyy).xz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, u_xlat2.ywyy).xy;
    u_xlatb5.x = (u_xlatb10) ? u_xlatb5.x : u_xlatb1.x;
    u_xlatb10 = (u_xlatb11) ? u_xlatb5.z : u_xlatb1.y;
    u_xlatb5.x = u_xlatb10 && u_xlatb5.x;
    u_xlat0.x = (u_xlatb5.x) ? u_xlat0.x : 1.0;
    u_xlat10 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat10 = (-u_xlat10) + _Rect[2];
    u_xlat15 = _BorderWidths[0] + _Rect[0];
    u_xlat10 = u_xlat10 + u_xlat15;
    u_xlatb15 = vs_TEXCOORD2.x>=u_xlat15;
    u_xlatb10 = u_xlat10>=vs_TEXCOORD2.x;
    u_xlatb10 = u_xlatb10 && u_xlatb15;
    u_xlat15 = _BorderWidths[1] + _Rect[1];
    u_xlatb1.x = vs_TEXCOORD2.y>=u_xlat15;
    u_xlatb10 = u_xlatb10 && u_xlatb1.x;
    u_xlat1.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat1.x = (-u_xlat1.x) + _Rect[3];
    u_xlat15 = u_xlat15 + u_xlat1.x;
    u_xlatb15 = u_xlat15>=vs_TEXCOORD2.y;
    u_xlatb10 = u_xlatb15 && u_xlatb10;
    u_xlat10 = (u_xlatb10) ? 0.0 : 1.0;
    u_xlat5 = (u_xlatb5.x) ? 1.0 : u_xlat10;
    u_xlatb10 = 0.0<_BorderWidths[0];
    u_xlatb15 = 0.0<_BorderWidths[1];
    u_xlatb10 = u_xlatb15 || u_xlatb10;
    u_xlatb15 = 0.0<_BorderWidths[2];
    u_xlatb10 = u_xlatb15 || u_xlatb10;
    u_xlatb15 = 0.0<_BorderWidths[3];
    u_xlatb10 = u_xlatb15 || u_xlatb10;
    u_xlat5 = (u_xlatb10) ? u_xlat5 : 1.0;
    u_xlat10 = u_xlat5 * u_xlat0.x;
    u_xlat1 = texture(_GUIClipTexture, vs_TEXCOORD1.xy);
    u_xlat10 = u_xlat10 * u_xlat1.w;
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = (_ManualTex2SRGB != 0) ? u_xlat1.xyz : u_xlat2.xyz;
    u_xlat2 = u_xlat2 * vs_COLOR0;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlatb10 = _SrcBlend!=5;
    SV_Target0.xyz = (bool(u_xlatb10)) ? u_xlat1.xyz : u_xlat2.xyz;
    u_xlat0.x = u_xlat0.x * u_xlat2.w;
    u_xlat0.x = u_xlat5 * u_xlat0.x;
    SV_Target0.w = u_xlat1.w * u_xlat0.x;
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
; Bound: 599
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %36 %484 %497 %554 %568 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate vs_TEXCOORD2 Location 36 
                                                      OpDecorate %475 DescriptorSet 475 
                                                      OpDecorate %475 Binding 475 
                                                      OpDecorate %479 DescriptorSet 479 
                                                      OpDecorate %479 Binding 479 
                                                      OpDecorate vs_TEXCOORD1 Location 484 
                                                      OpDecorate %492 DescriptorSet 492 
                                                      OpDecorate %492 Binding 492 
                                                      OpDecorate %494 DescriptorSet 494 
                                                      OpDecorate %494 Binding 494 
                                                      OpDecorate vs_TEXCOORD0 Location 497 
                                                      OpDecorate %554 Location 554 
                                                      OpDecorate %568 Location 568 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 2 
                                               %8 = OpTypePointer Private %7 
                                Private f32_2* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 1 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %6 %12 
                                              %14 = OpTypeArray %6 %12 
                                              %15 = OpTypeArray %6 %12 
                                              %16 = OpTypeStruct %10 %10 %13 %14 %15 %10 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4]; i32;}* %18 = OpVariable Uniform 
                                          i32 %19 = OpConstant 3 
                                          i32 %20 = OpConstant 0 
                                              %21 = OpTypePointer Uniform %6 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                              %27 = OpTypeVector %6 4 
                                              %28 = OpTypePointer Private %27 
                               Private f32_4* %29 = OpVariable Private 
                                          i32 %30 = OpConstant 2 
                                 Private f32* %34 = OpVariable Private 
                                              %35 = OpTypePointer Input %27 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %37 = OpTypePointer Input %6 
                                          i32 %40 = OpConstant 4 
                                          f32 %48 = OpConstant 3.674022E-40 
                                              %52 = OpTypeBool 
                                              %53 = OpTypePointer Private %52 
                                Private bool* %54 = OpVariable Private 
                                          f32 %55 = OpConstant 3.674022E-40 
                                 Private f32* %58 = OpVariable Private 
                                 Private f32* %64 = OpVariable Private 
                                          u32 %65 = OpConstant 1 
                                          i32 %68 = OpConstant 1 
                                Private bool* %79 = OpVariable Private 
                                              %82 = OpTypeVector %10 2 
                                              %83 = OpTypePointer Private %82 
                               Private i32_2* %84 = OpVariable Private 
                                        i32_2 %86 = OpConstantComposite %20 %68 
                                        i32_2 %87 = OpConstantComposite %19 %30 
                                              %88 = OpTypeVector %52 2 
                                              %91 = OpTypePointer Private %10 
                                 Private i32* %92 = OpVariable Private 
                                              %94 = OpTypePointer Function %10 
                              Private f32_4* %118 = OpVariable Private 
                                             %120 = OpTypePointer Function %7 
                              Private f32_2* %131 = OpVariable Private 
                              Private f32_2* %135 = OpVariable Private 
                                             %183 = OpTypeVector %6 3 
                                             %184 = OpTypePointer Private %183 
                              Private f32_3* %185 = OpVariable Private 
                                         u32 %198 = OpConstant 2 
                                             %230 = OpTypePointer Private %88 
                             Private bool_2* %231 = OpVariable Private 
                                       f32_4 %232 = OpConstantComposite %55 %55 %55 %55 
                                             %235 = OpTypeVector %52 4 
                                Private f32* %244 = OpVariable Private 
                                         f32 %248 = OpConstant 3.674022E-40 
                             Private bool_2* %270 = OpVariable Private 
                               Private bool* %275 = OpVariable Private 
                                             %282 = OpTypePointer Function %6 
                                             %297 = OpTypeVector %52 3 
                                             %298 = OpTypePointer Private %297 
                             Private bool_3* %299 = OpVariable Private 
                                         i32 %303 = OpConstant 5 
                                             %304 = OpTypePointer Uniform %10 
                                             %336 = OpTypePointer Function %52 
                                             %473 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %474 = OpTypePointer UniformConstant %473 
        UniformConstant read_only Texture2D* %475 = OpVariable UniformConstant 
                                             %477 = OpTypeSampler 
                                             %478 = OpTypePointer UniformConstant %477 
                    UniformConstant sampler* %479 = OpVariable UniformConstant 
                                             %481 = OpTypeSampledImage %473 
                                             %483 = OpTypePointer Input %7 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                         u32 %487 = OpConstant 3 
        UniformConstant read_only Texture2D* %492 = OpVariable UniformConstant 
                    UniformConstant sampler* %494 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                       f32_3 %502 = OpConstantComposite %55 %55 %55 
                                         f32 %513 = OpConstant 3.674022E-40 
                                       f32_3 %514 = OpConstantComposite %513 %513 %513 
                                         f32 %525 = OpConstant 3.674022E-40 
                                       f32_3 %526 = OpConstantComposite %525 %525 %525 
                                         f32 %528 = OpConstant 3.674022E-40 
                                       f32_3 %529 = OpConstantComposite %528 %528 %528 
                                             %541 = OpTypePointer Function %183 
                                Input f32_4* %554 = OpVariable Input 
                                             %567 = OpTypePointer Output %27 
                               Output f32_4* %568 = OpVariable Output 
                                             %596 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function i32* %95 = OpVariable Function 
                             Function f32_2* %121 = OpVariable Function 
                             Function f32_2* %161 = OpVariable Function 
                               Function f32* %283 = OpVariable Function 
                               Function f32* %312 = OpVariable Function 
                              Function bool* %337 = OpVariable Function 
                              Function bool* %348 = OpVariable Function 
                               Function f32* %364 = OpVariable Function 
                             Function f32_3* %542 = OpVariable Function 
                             Function f32_3* %570 = OpVariable Function 
                                 Uniform f32* %22 = OpAccessChain %18 %19 %20 
                                          f32 %23 = OpLoad %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                                 Uniform f32* %31 = OpAccessChain %18 %19 %30 
                                          f32 %32 = OpLoad %31 
                                 Private f32* %33 = OpAccessChain %29 %24 
                                                      OpStore %33 %32 
                                   Input f32* %38 = OpAccessChain vs_TEXCOORD2 %24 
                                          f32 %39 = OpLoad %38 
                                 Uniform f32* %41 = OpAccessChain %18 %40 %20 
                                          f32 %42 = OpLoad %41 
                                          f32 %43 = OpFNegate %42 
                                          f32 %44 = OpFAdd %39 %43 
                                                      OpStore %34 %44 
                                 Uniform f32* %45 = OpAccessChain %18 %40 %30 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpFNegate %46 
                                          f32 %49 = OpFMul %47 %48 
                                          f32 %50 = OpLoad %34 
                                          f32 %51 = OpFAdd %49 %50 
                                                      OpStore %34 %51 
                                          f32 %56 = OpLoad %34 
                                         bool %57 = OpFOrdGreaterThanEqual %55 %56 
                                                      OpStore %54 %57 
                                 Uniform f32* %59 = OpAccessChain %18 %40 %20 
                                          f32 %60 = OpLoad %59 
                                 Uniform f32* %61 = OpAccessChain %18 %40 %30 
                                          f32 %62 = OpLoad %61 
                                          f32 %63 = OpFAdd %60 %62 
                                                      OpStore %58 %63 
                                   Input f32* %66 = OpAccessChain vs_TEXCOORD2 %65 
                                          f32 %67 = OpLoad %66 
                                 Uniform f32* %69 = OpAccessChain %18 %40 %68 
                                          f32 %70 = OpLoad %69 
                                          f32 %71 = OpFNegate %70 
                                          f32 %72 = OpFAdd %67 %71 
                                                      OpStore %64 %72 
                                 Uniform f32* %73 = OpAccessChain %18 %40 %19 
                                          f32 %74 = OpLoad %73 
                                          f32 %75 = OpFNegate %74 
                                          f32 %76 = OpFMul %75 %48 
                                          f32 %77 = OpLoad %64 
                                          f32 %78 = OpFAdd %76 %77 
                                                      OpStore %64 %78 
                                          f32 %80 = OpLoad %64 
                                         bool %81 = OpFOrdGreaterThanEqual %55 %80 
                                                      OpStore %79 %81 
                                         bool %85 = OpLoad %79 
                                       bool_2 %89 = OpCompositeConstruct %85 %85 
                                        i32_2 %90 = OpSelect %89 %86 %87 
                                                      OpStore %84 %90 
                                         bool %93 = OpLoad %54 
                                                      OpSelectionMerge %97 None 
                                                      OpBranchConditional %93 %96 %100 
                                              %96 = OpLabel 
                                 Private i32* %98 = OpAccessChain %84 %24 
                                          i32 %99 = OpLoad %98 
                                                      OpStore %95 %99 
                                                      OpBranch %97 
                                             %100 = OpLabel 
                                Private i32* %101 = OpAccessChain %84 %65 
                                         i32 %102 = OpLoad %101 
                                                      OpStore %95 %102 
                                                      OpBranch %97 
                                              %97 = OpLabel 
                                         i32 %103 = OpLoad %95 
                                                      OpStore %92 %103 
                                         f32 %104 = OpLoad %58 
                                         i32 %105 = OpLoad %92 
                                Uniform f32* %106 = OpAccessChain %18 %30 %105 
                                         f32 %107 = OpLoad %106 
                                         f32 %108 = OpFNegate %107 
                                         f32 %109 = OpFAdd %104 %108 
                                Private f32* %110 = OpAccessChain %29 %65 
                                                      OpStore %110 %109 
                                Uniform f32* %111 = OpAccessChain %18 %40 %20 
                                         f32 %112 = OpLoad %111 
                                         i32 %113 = OpLoad %92 
                                Uniform f32* %114 = OpAccessChain %18 %30 %113 
                                         f32 %115 = OpLoad %114 
                                         f32 %116 = OpFAdd %112 %115 
                                Private f32* %117 = OpAccessChain %9 %65 
                                                      OpStore %117 %116 
                                        bool %119 = OpLoad %54 
                                                      OpSelectionMerge %123 None 
                                                      OpBranchConditional %119 %122 %125 
                                             %122 = OpLabel 
                                       f32_2 %124 = OpLoad %9 
                                                      OpStore %121 %124 
                                                      OpBranch %123 
                                             %125 = OpLabel 
                                       f32_4 %126 = OpLoad %29 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                                      OpStore %121 %127 
                                                      OpBranch %123 
                                             %123 = OpLabel 
                                       f32_2 %128 = OpLoad %121 
                                       f32_4 %129 = OpLoad %118 
                                       f32_4 %130 = OpVectorShuffle %129 %128 4 5 2 3 
                                                      OpStore %118 %130 
                                Uniform f32* %132 = OpAccessChain %18 %19 %68 
                                         f32 %133 = OpLoad %132 
                                Private f32* %134 = OpAccessChain %131 %24 
                                                      OpStore %134 %133 
                                Uniform f32* %136 = OpAccessChain %18 %19 %19 
                                         f32 %137 = OpLoad %136 
                                Private f32* %138 = OpAccessChain %135 %24 
                                                      OpStore %138 %137 
                                Uniform f32* %139 = OpAccessChain %18 %40 %68 
                                         f32 %140 = OpLoad %139 
                                Uniform f32* %141 = OpAccessChain %18 %40 %19 
                                         f32 %142 = OpLoad %141 
                                         f32 %143 = OpFAdd %140 %142 
                                Private f32* %144 = OpAccessChain %9 %24 
                                                      OpStore %144 %143 
                                Private f32* %145 = OpAccessChain %9 %24 
                                         f32 %146 = OpLoad %145 
                                         i32 %147 = OpLoad %92 
                                Uniform f32* %148 = OpAccessChain %18 %30 %147 
                                         f32 %149 = OpLoad %148 
                                         f32 %150 = OpFNegate %149 
                                         f32 %151 = OpFAdd %146 %150 
                                Private f32* %152 = OpAccessChain %135 %65 
                                                      OpStore %152 %151 
                                Uniform f32* %153 = OpAccessChain %18 %40 %68 
                                         f32 %154 = OpLoad %153 
                                         i32 %155 = OpLoad %92 
                                Uniform f32* %156 = OpAccessChain %18 %30 %155 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFAdd %154 %157 
                                Private f32* %159 = OpAccessChain %131 %65 
                                                      OpStore %159 %158 
                                        bool %160 = OpLoad %79 
                                                      OpSelectionMerge %163 None 
                                                      OpBranchConditional %160 %162 %165 
                                             %162 = OpLabel 
                                       f32_2 %164 = OpLoad %131 
                                                      OpStore %161 %164 
                                                      OpBranch %163 
                                             %165 = OpLabel 
                                       f32_2 %166 = OpLoad %135 
                                                      OpStore %161 %166 
                                                      OpBranch %163 
                                             %163 = OpLabel 
                                       f32_2 %167 = OpLoad %161 
                                       f32_4 %168 = OpLoad %118 
                                       f32_4 %169 = OpVectorShuffle %168 %167 0 1 4 5 
                                                      OpStore %118 %169 
                                       f32_4 %170 = OpLoad %118 
                                       f32_2 %171 = OpVectorShuffle %170 %170 0 2 
                                       f32_2 %172 = OpFNegate %171 
                                         i32 %173 = OpLoad %92 
                                Uniform f32* %174 = OpAccessChain %18 %30 %173 
                                         f32 %175 = OpLoad %174 
                                       f32_2 %176 = OpCompositeConstruct %175 %175 
                                       f32_2 %177 = OpFAdd %172 %176 
                                                      OpStore %9 %177 
                                Private f32* %178 = OpAccessChain %9 %24 
                                         f32 %179 = OpLoad %178 
                                Private f32* %180 = OpAccessChain %9 %65 
                                         f32 %181 = OpLoad %180 
                                         f32 %182 = OpFDiv %179 %181 
                                                      OpStore %58 %182 
                                       f32_4 %186 = OpLoad %118 
                                       f32_2 %187 = OpVectorShuffle %186 %186 1 3 
                                       f32_2 %188 = OpFNegate %187 
                                       f32_4 %189 = OpLoad vs_TEXCOORD2 
                                       f32_2 %190 = OpVectorShuffle %189 %189 0 1 
                                       f32_2 %191 = OpFAdd %188 %190 
                                       f32_3 %192 = OpLoad %185 
                                       f32_3 %193 = OpVectorShuffle %192 %191 3 4 2 
                                                      OpStore %185 %193 
                                         f32 %194 = OpLoad %58 
                                Private f32* %195 = OpAccessChain %185 %65 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpFMul %194 %196 
                                Private f32* %199 = OpAccessChain %185 %198 
                                                      OpStore %199 %197 
                                       f32_3 %200 = OpLoad %185 
                                       f32_2 %201 = OpVectorShuffle %200 %200 0 2 
                                       f32_3 %202 = OpLoad %185 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 2 
                                         f32 %204 = OpDot %201 %203 
                                                      OpStore %58 %204 
                                       f32_3 %205 = OpLoad %185 
                                       f32_2 %206 = OpVectorShuffle %205 %205 0 1 
                                       f32_3 %207 = OpLoad %185 
                                       f32_2 %208 = OpVectorShuffle %207 %207 0 1 
                                         f32 %209 = OpDot %206 %208 
                                Private f32* %210 = OpAccessChain %29 %24 
                                                      OpStore %210 %209 
                                Private f32* %211 = OpAccessChain %29 %24 
                                         f32 %212 = OpLoad %211 
                                         f32 %213 = OpExtInst %1 31 %212 
                                Private f32* %214 = OpAccessChain %29 %24 
                                                      OpStore %214 %213 
                                Private f32* %215 = OpAccessChain %29 %24 
                                         f32 %216 = OpLoad %215 
                                         i32 %217 = OpLoad %92 
                                Uniform f32* %218 = OpAccessChain %18 %30 %217 
                                         f32 %219 = OpLoad %218 
                                         f32 %220 = OpFNegate %219 
                                         f32 %221 = OpFAdd %216 %220 
                                Private f32* %222 = OpAccessChain %29 %24 
                                                      OpStore %222 %221 
                                         f32 %223 = OpLoad %58 
                                         f32 %224 = OpExtInst %1 31 %223 
                                                      OpStore %58 %224 
                                Private f32* %225 = OpAccessChain %9 %24 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpFNegate %226 
                                         f32 %228 = OpLoad %58 
                                         f32 %229 = OpFAdd %227 %228 
                                                      OpStore %58 %229 
                                       f32_2 %233 = OpLoad %9 
                                       f32_4 %234 = OpVectorShuffle %233 %233 0 1 0 0 
                                      bool_4 %236 = OpFOrdLessThan %232 %234 
                                      bool_2 %237 = OpVectorShuffle %236 %236 0 1 
                                                      OpStore %231 %237 
                               Private bool* %238 = OpAccessChain %231 %65 
                                        bool %239 = OpLoad %238 
                               Private bool* %240 = OpAccessChain %231 %24 
                                        bool %241 = OpLoad %240 
                                        bool %242 = OpLogicalAnd %239 %241 
                               Private bool* %243 = OpAccessChain %231 %24 
                                                      OpStore %243 %242 
                                  Input f32* %245 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %246 = OpLoad %245 
                                         f32 %247 = OpDPdx %246 
                                                      OpStore %244 %247 
                                         f32 %249 = OpLoad %244 
                                         f32 %250 = OpExtInst %1 4 %249 
                                         f32 %251 = OpFDiv %248 %250 
                                                      OpStore %244 %251 
                                         f32 %252 = OpLoad %58 
                                         f32 %253 = OpLoad %244 
                                         f32 %254 = OpFMul %252 %253 
                                         f32 %255 = OpFAdd %254 %48 
                                                      OpStore %58 %255 
                                         f32 %256 = OpLoad %58 
                                         f32 %257 = OpExtInst %1 43 %256 %55 %248 
                                                      OpStore %58 %257 
                                Private f32* %258 = OpAccessChain %29 %24 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpLoad %244 
                                         f32 %261 = OpFMul %259 %260 
                                         f32 %262 = OpFAdd %261 %48 
                                                      OpStore %244 %262 
                                         f32 %263 = OpLoad %244 
                                         f32 %264 = OpExtInst %1 43 %263 %55 %248 
                                                      OpStore %244 %264 
                               Private bool* %265 = OpAccessChain %231 %24 
                                        bool %266 = OpLoad %265 
                                         f32 %267 = OpLoad %58 
                                         f32 %268 = OpSelect %266 %267 %248 
                                Private f32* %269 = OpAccessChain %9 %24 
                                                      OpStore %269 %268 
                                       f32_4 %271 = OpLoad %118 
                                       f32_4 %272 = OpVectorShuffle %271 %271 0 2 0 0 
                                      bool_4 %273 = OpFOrdLessThan %232 %272 
                                      bool_2 %274 = OpVectorShuffle %273 %273 0 1 
                                                      OpStore %270 %274 
                               Private bool* %276 = OpAccessChain %270 %65 
                                        bool %277 = OpLoad %276 
                               Private bool* %278 = OpAccessChain %270 %24 
                                        bool %279 = OpLoad %278 
                                        bool %280 = OpLogicalOr %277 %279 
                                                      OpStore %275 %280 
                                        bool %281 = OpLoad %275 
                                                      OpSelectionMerge %285 None 
                                                      OpBranchConditional %281 %284 %288 
                                             %284 = OpLabel 
                                Private f32* %286 = OpAccessChain %9 %24 
                                         f32 %287 = OpLoad %286 
                                                      OpStore %283 %287 
                                                      OpBranch %285 
                                             %288 = OpLabel 
                                                      OpStore %283 %55 
                                                      OpBranch %285 
                                             %285 = OpLabel 
                                         f32 %289 = OpLoad %283 
                                Private f32* %290 = OpAccessChain %9 %24 
                                                      OpStore %290 %289 
                                        bool %291 = OpLoad %275 
                                         f32 %292 = OpLoad %244 
                                         f32 %293 = OpSelect %291 %292 %55 
                                                      OpStore %244 %293 
                                         f32 %294 = OpLoad %244 
                                         f32 %295 = OpFNegate %294 
                                         f32 %296 = OpFAdd %295 %248 
                                                      OpStore %58 %296 
                                         f32 %300 = OpLoad %244 
                                        bool %301 = OpFOrdEqual %300 %55 
                               Private bool* %302 = OpAccessChain %299 %24 
                                                      OpStore %302 %301 
                                Uniform i32* %305 = OpAccessChain %18 %303 
                                         i32 %306 = OpLoad %305 
                                        bool %307 = OpINotEqual %306 %20 
                                         f32 %308 = OpLoad %58 
                                         f32 %309 = OpSelect %307 %308 %55 
                                                      OpStore %58 %309 
                               Private bool* %310 = OpAccessChain %299 %24 
                                        bool %311 = OpLoad %310 
                                                      OpSelectionMerge %314 None 
                                                      OpBranchConditional %311 %313 %317 
                                             %313 = OpLabel 
                                Private f32* %315 = OpAccessChain %9 %24 
                                         f32 %316 = OpLoad %315 
                                                      OpStore %312 %316 
                                                      OpBranch %314 
                                             %317 = OpLabel 
                                         f32 %318 = OpLoad %58 
                                                      OpStore %312 %318 
                                                      OpBranch %314 
                                             %314 = OpLabel 
                                         f32 %319 = OpLoad %312 
                                Private f32* %320 = OpAccessChain %9 %24 
                                                      OpStore %320 %319 
                                       f32_4 %321 = OpLoad %118 
                                       f32_4 %322 = OpVectorShuffle %321 %321 1 1 3 3 
                                       f32_4 %323 = OpLoad vs_TEXCOORD2 
                                       f32_4 %324 = OpVectorShuffle %323 %323 0 0 1 1 
                                      bool_4 %325 = OpFOrdGreaterThanEqual %322 %324 
                                      bool_2 %326 = OpVectorShuffle %325 %325 0 2 
                                      bool_3 %327 = OpLoad %299 
                                      bool_3 %328 = OpVectorShuffle %327 %326 3 1 4 
                                                      OpStore %299 %328 
                                       f32_4 %329 = OpLoad vs_TEXCOORD2 
                                       f32_4 %330 = OpVectorShuffle %329 %329 0 1 0 0 
                                       f32_4 %331 = OpLoad %118 
                                       f32_4 %332 = OpVectorShuffle %331 %331 1 3 1 1 
                                      bool_4 %333 = OpFOrdGreaterThanEqual %330 %332 
                                      bool_2 %334 = OpVectorShuffle %333 %333 0 1 
                                                      OpStore %270 %334 
                                        bool %335 = OpLoad %54 
                                                      OpSelectionMerge %339 None 
                                                      OpBranchConditional %335 %338 %342 
                                             %338 = OpLabel 
                               Private bool* %340 = OpAccessChain %299 %24 
                                        bool %341 = OpLoad %340 
                                                      OpStore %337 %341 
                                                      OpBranch %339 
                                             %342 = OpLabel 
                               Private bool* %343 = OpAccessChain %270 %24 
                                        bool %344 = OpLoad %343 
                                                      OpStore %337 %344 
                                                      OpBranch %339 
                                             %339 = OpLabel 
                                        bool %345 = OpLoad %337 
                               Private bool* %346 = OpAccessChain %299 %24 
                                                      OpStore %346 %345 
                                        bool %347 = OpLoad %79 
                                                      OpSelectionMerge %350 None 
                                                      OpBranchConditional %347 %349 %353 
                                             %349 = OpLabel 
                               Private bool* %351 = OpAccessChain %299 %198 
                                        bool %352 = OpLoad %351 
                                                      OpStore %348 %352 
                                                      OpBranch %350 
                                             %353 = OpLabel 
                               Private bool* %354 = OpAccessChain %270 %65 
                                        bool %355 = OpLoad %354 
                                                      OpStore %348 %355 
                                                      OpBranch %350 
                                             %350 = OpLabel 
                                        bool %356 = OpLoad %348 
                                                      OpStore %54 %356 
                                        bool %357 = OpLoad %54 
                               Private bool* %358 = OpAccessChain %299 %24 
                                        bool %359 = OpLoad %358 
                                        bool %360 = OpLogicalAnd %357 %359 
                               Private bool* %361 = OpAccessChain %299 %24 
                                                      OpStore %361 %360 
                               Private bool* %362 = OpAccessChain %299 %24 
                                        bool %363 = OpLoad %362 
                                                      OpSelectionMerge %366 None 
                                                      OpBranchConditional %363 %365 %369 
                                             %365 = OpLabel 
                                Private f32* %367 = OpAccessChain %9 %24 
                                         f32 %368 = OpLoad %367 
                                                      OpStore %364 %368 
                                                      OpBranch %366 
                                             %369 = OpLabel 
                                                      OpStore %364 %248 
                                                      OpBranch %366 
                                             %366 = OpLabel 
                                         f32 %370 = OpLoad %364 
                                Private f32* %371 = OpAccessChain %9 %24 
                                                      OpStore %371 %370 
                                Uniform f32* %372 = OpAccessChain %18 %19 %20 
                                         f32 %373 = OpLoad %372 
                                Uniform f32* %374 = OpAccessChain %18 %19 %30 
                                         f32 %375 = OpLoad %374 
                                         f32 %376 = OpFAdd %373 %375 
                                                      OpStore %34 %376 
                                         f32 %377 = OpLoad %34 
                                         f32 %378 = OpFNegate %377 
                                Uniform f32* %379 = OpAccessChain %18 %40 %30 
                                         f32 %380 = OpLoad %379 
                                         f32 %381 = OpFAdd %378 %380 
                                                      OpStore %34 %381 
                                Uniform f32* %382 = OpAccessChain %18 %19 %20 
                                         f32 %383 = OpLoad %382 
                                Uniform f32* %384 = OpAccessChain %18 %40 %20 
                                         f32 %385 = OpLoad %384 
                                         f32 %386 = OpFAdd %383 %385 
                                                      OpStore %58 %386 
                                         f32 %387 = OpLoad %34 
                                         f32 %388 = OpLoad %58 
                                         f32 %389 = OpFAdd %387 %388 
                                                      OpStore %34 %389 
                                  Input f32* %390 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %391 = OpLoad %390 
                                         f32 %392 = OpLoad %58 
                                        bool %393 = OpFOrdGreaterThanEqual %391 %392 
                                                      OpStore %275 %393 
                                         f32 %394 = OpLoad %34 
                                  Input f32* %395 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %396 = OpLoad %395 
                                        bool %397 = OpFOrdGreaterThanEqual %394 %396 
                                                      OpStore %54 %397 
                                        bool %398 = OpLoad %54 
                                        bool %399 = OpLoad %275 
                                        bool %400 = OpLogicalAnd %398 %399 
                                                      OpStore %54 %400 
                                Uniform f32* %401 = OpAccessChain %18 %19 %68 
                                         f32 %402 = OpLoad %401 
                                Uniform f32* %403 = OpAccessChain %18 %40 %68 
                                         f32 %404 = OpLoad %403 
                                         f32 %405 = OpFAdd %402 %404 
                                                      OpStore %58 %405 
                                  Input f32* %406 = OpAccessChain vs_TEXCOORD2 %65 
                                         f32 %407 = OpLoad %406 
                                         f32 %408 = OpLoad %58 
                                        bool %409 = OpFOrdGreaterThanEqual %407 %408 
                               Private bool* %410 = OpAccessChain %270 %24 
                                                      OpStore %410 %409 
                                        bool %411 = OpLoad %54 
                               Private bool* %412 = OpAccessChain %270 %24 
                                        bool %413 = OpLoad %412 
                                        bool %414 = OpLogicalAnd %411 %413 
                                                      OpStore %54 %414 
                                Uniform f32* %415 = OpAccessChain %18 %19 %68 
                                         f32 %416 = OpLoad %415 
                                Uniform f32* %417 = OpAccessChain %18 %19 %19 
                                         f32 %418 = OpLoad %417 
                                         f32 %419 = OpFAdd %416 %418 
                                Private f32* %420 = OpAccessChain %29 %24 
                                                      OpStore %420 %419 
                                Private f32* %421 = OpAccessChain %29 %24 
                                         f32 %422 = OpLoad %421 
                                         f32 %423 = OpFNegate %422 
                                Uniform f32* %424 = OpAccessChain %18 %40 %19 
                                         f32 %425 = OpLoad %424 
                                         f32 %426 = OpFAdd %423 %425 
                                Private f32* %427 = OpAccessChain %29 %24 
                                                      OpStore %427 %426 
                                         f32 %428 = OpLoad %58 
                                Private f32* %429 = OpAccessChain %29 %24 
                                         f32 %430 = OpLoad %429 
                                         f32 %431 = OpFAdd %428 %430 
                                                      OpStore %58 %431 
                                         f32 %432 = OpLoad %58 
                                  Input f32* %433 = OpAccessChain vs_TEXCOORD2 %65 
                                         f32 %434 = OpLoad %433 
                                        bool %435 = OpFOrdGreaterThanEqual %432 %434 
                                                      OpStore %275 %435 
                                        bool %436 = OpLoad %275 
                                        bool %437 = OpLoad %54 
                                        bool %438 = OpLogicalAnd %436 %437 
                                                      OpStore %54 %438 
                                        bool %439 = OpLoad %54 
                                         f32 %440 = OpSelect %439 %55 %248 
                                                      OpStore %34 %440 
                               Private bool* %441 = OpAccessChain %299 %24 
                                        bool %442 = OpLoad %441 
                                         f32 %443 = OpLoad %34 
                                         f32 %444 = OpSelect %442 %248 %443 
                                                      OpStore %244 %444 
                                Uniform f32* %445 = OpAccessChain %18 %19 %20 
                                         f32 %446 = OpLoad %445 
                                        bool %447 = OpFOrdLessThan %55 %446 
                                                      OpStore %54 %447 
                                Uniform f32* %448 = OpAccessChain %18 %19 %68 
                                         f32 %449 = OpLoad %448 
                                        bool %450 = OpFOrdLessThan %55 %449 
                                                      OpStore %275 %450 
                                        bool %451 = OpLoad %275 
                                        bool %452 = OpLoad %54 
                                        bool %453 = OpLogicalOr %451 %452 
                                                      OpStore %54 %453 
                                Uniform f32* %454 = OpAccessChain %18 %19 %30 
                                         f32 %455 = OpLoad %454 
                                        bool %456 = OpFOrdLessThan %55 %455 
                                                      OpStore %275 %456 
                                        bool %457 = OpLoad %275 
                                        bool %458 = OpLoad %54 
                                        bool %459 = OpLogicalOr %457 %458 
                                                      OpStore %54 %459 
                                Uniform f32* %460 = OpAccessChain %18 %19 %19 
                                         f32 %461 = OpLoad %460 
                                        bool %462 = OpFOrdLessThan %55 %461 
                                                      OpStore %275 %462 
                                        bool %463 = OpLoad %275 
                                        bool %464 = OpLoad %54 
                                        bool %465 = OpLogicalOr %463 %464 
                                                      OpStore %54 %465 
                                        bool %466 = OpLoad %54 
                                         f32 %467 = OpLoad %244 
                                         f32 %468 = OpSelect %466 %467 %248 
                                                      OpStore %244 %468 
                                         f32 %469 = OpLoad %244 
                                Private f32* %470 = OpAccessChain %9 %24 
                                         f32 %471 = OpLoad %470 
                                         f32 %472 = OpFMul %469 %471 
                                                      OpStore %34 %472 
                         read_only Texture2D %476 = OpLoad %475 
                                     sampler %480 = OpLoad %479 
                  read_only Texture2DSampled %482 = OpSampledImage %476 %480 
                                       f32_2 %485 = OpLoad vs_TEXCOORD1 
                                       f32_4 %486 = OpImageSampleImplicitLod %482 %485 
                                         f32 %488 = OpCompositeExtract %486 3 
                                                      OpStore %58 %488 
                                         f32 %489 = OpLoad %58 
                                         f32 %490 = OpLoad %34 
                                         f32 %491 = OpFMul %489 %490 
                                                      OpStore %34 %491 
                         read_only Texture2D %493 = OpLoad %492 
                                     sampler %495 = OpLoad %494 
                  read_only Texture2DSampled %496 = OpSampledImage %493 %495 
                                       f32_2 %498 = OpLoad vs_TEXCOORD0 
                                       f32_4 %499 = OpImageSampleImplicitLod %496 %498 
                                                      OpStore %29 %499 
                                       f32_4 %500 = OpLoad %29 
                                       f32_3 %501 = OpVectorShuffle %500 %500 0 1 2 
                                       f32_3 %503 = OpExtInst %1 40 %501 %502 
                                       f32_4 %504 = OpLoad %118 
                                       f32_4 %505 = OpVectorShuffle %504 %503 4 5 6 3 
                                                      OpStore %118 %505 
                                       f32_4 %506 = OpLoad %118 
                                       f32_3 %507 = OpVectorShuffle %506 %506 0 1 2 
                                       f32_3 %508 = OpExtInst %1 30 %507 
                                       f32_4 %509 = OpLoad %118 
                                       f32_4 %510 = OpVectorShuffle %509 %508 4 5 6 3 
                                                      OpStore %118 %510 
                                       f32_4 %511 = OpLoad %118 
                                       f32_3 %512 = OpVectorShuffle %511 %511 0 1 2 
                                       f32_3 %515 = OpFMul %512 %514 
                                       f32_4 %516 = OpLoad %118 
                                       f32_4 %517 = OpVectorShuffle %516 %515 4 5 6 3 
                                                      OpStore %118 %517 
                                       f32_4 %518 = OpLoad %118 
                                       f32_3 %519 = OpVectorShuffle %518 %518 0 1 2 
                                       f32_3 %520 = OpExtInst %1 29 %519 
                                       f32_4 %521 = OpLoad %118 
                                       f32_4 %522 = OpVectorShuffle %521 %520 4 5 6 3 
                                                      OpStore %118 %522 
                                       f32_4 %523 = OpLoad %118 
                                       f32_3 %524 = OpVectorShuffle %523 %523 0 1 2 
                                       f32_3 %527 = OpFMul %524 %526 
                                       f32_3 %530 = OpFAdd %527 %529 
                                       f32_4 %531 = OpLoad %118 
                                       f32_4 %532 = OpVectorShuffle %531 %530 4 5 6 3 
                                                      OpStore %118 %532 
                                       f32_4 %533 = OpLoad %118 
                                       f32_3 %534 = OpVectorShuffle %533 %533 0 1 2 
                                       f32_3 %535 = OpExtInst %1 40 %534 %502 
                                       f32_4 %536 = OpLoad %118 
                                       f32_4 %537 = OpVectorShuffle %536 %535 4 5 6 3 
                                                      OpStore %118 %537 
                                Uniform i32* %538 = OpAccessChain %18 %20 
                                         i32 %539 = OpLoad %538 
                                        bool %540 = OpINotEqual %539 %20 
                                                      OpSelectionMerge %544 None 
                                                      OpBranchConditional %540 %543 %547 
                                             %543 = OpLabel 
                                       f32_4 %545 = OpLoad %118 
                                       f32_3 %546 = OpVectorShuffle %545 %545 0 1 2 
                                                      OpStore %542 %546 
                                                      OpBranch %544 
                                             %547 = OpLabel 
                                       f32_4 %548 = OpLoad %29 
                                       f32_3 %549 = OpVectorShuffle %548 %548 0 1 2 
                                                      OpStore %542 %549 
                                                      OpBranch %544 
                                             %544 = OpLabel 
                                       f32_3 %550 = OpLoad %542 
                                       f32_4 %551 = OpLoad %29 
                                       f32_4 %552 = OpVectorShuffle %551 %550 4 5 6 3 
                                                      OpStore %29 %552 
                                       f32_4 %553 = OpLoad %29 
                                       f32_4 %555 = OpLoad %554 
                                       f32_4 %556 = OpFMul %553 %555 
                                                      OpStore %29 %556 
                                         f32 %557 = OpLoad %34 
                                       f32_3 %558 = OpCompositeConstruct %557 %557 %557 
                                       f32_4 %559 = OpLoad %29 
                                       f32_3 %560 = OpVectorShuffle %559 %559 0 1 2 
                                       f32_3 %561 = OpFMul %558 %560 
                                       f32_4 %562 = OpLoad %118 
                                       f32_4 %563 = OpVectorShuffle %562 %561 4 5 6 3 
                                                      OpStore %118 %563 
                                Uniform i32* %564 = OpAccessChain %18 %68 
                                         i32 %565 = OpLoad %564 
                                        bool %566 = OpINotEqual %565 %303 
                                                      OpStore %54 %566 
                                        bool %569 = OpLoad %54 
                                                      OpSelectionMerge %572 None 
                                                      OpBranchConditional %569 %571 %575 
                                             %571 = OpLabel 
                                       f32_4 %573 = OpLoad %118 
                                       f32_3 %574 = OpVectorShuffle %573 %573 0 1 2 
                                                      OpStore %570 %574 
                                                      OpBranch %572 
                                             %575 = OpLabel 
                                       f32_4 %576 = OpLoad %29 
                                       f32_3 %577 = OpVectorShuffle %576 %576 0 1 2 
                                                      OpStore %570 %577 
                                                      OpBranch %572 
                                             %572 = OpLabel 
                                       f32_3 %578 = OpLoad %570 
                                       f32_4 %579 = OpLoad %568 
                                       f32_4 %580 = OpVectorShuffle %579 %578 4 5 6 3 
                                                      OpStore %568 %580 
                                Private f32* %581 = OpAccessChain %9 %24 
                                         f32 %582 = OpLoad %581 
                                Private f32* %583 = OpAccessChain %29 %487 
                                         f32 %584 = OpLoad %583 
                                         f32 %585 = OpFMul %582 %584 
                                Private f32* %586 = OpAccessChain %9 %24 
                                                      OpStore %586 %585 
                                         f32 %587 = OpLoad %244 
                                Private f32* %588 = OpAccessChain %9 %24 
                                         f32 %589 = OpLoad %588 
                                         f32 %590 = OpFMul %587 %589 
                                Private f32* %591 = OpAccessChain %9 %24 
                                                      OpStore %591 %590 
                                         f32 %592 = OpLoad %58 
                                Private f32* %593 = OpAccessChain %9 %24 
                                         f32 %594 = OpLoad %593 
                                         f32 %595 = OpFMul %592 %594 
                                 Output f32* %597 = OpAccessChain %568 %487 
                                                      OpStore %597 %595 
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
  GpuProgramID 83701
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
uniform 	int _SmoothCorners;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _GUIClipTexture;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
bvec2 u_xlatb0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
ivec2 u_xlati2;
vec3 u_xlat3;
float u_xlat5;
bvec3 u_xlatb5;
float u_xlat10;
bool u_xlatb10;
float u_xlat11;
bool u_xlatb11;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
void main()
{
    u_xlat0.x = _BorderWidths[0];
    u_xlat1.x = _BorderWidths[2];
    u_xlat10 = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat10 = (-_Rect[2]) * 0.5 + u_xlat10;
    u_xlatb10 = 0.0>=u_xlat10;
    u_xlat15 = _Rect[0] + _Rect[2];
    u_xlat11 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat11 = (-_Rect[3]) * 0.5 + u_xlat11;
    u_xlatb11 = 0.0>=u_xlat11;
    u_xlati2.xy = (bool(u_xlatb11)) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati16 = (u_xlatb10) ? u_xlati2.x : u_xlati2.y;
    u_xlat1.y = u_xlat15 + (-_CornerRadiuses[u_xlati16]);
    u_xlat0.y = _Rect[0] + _CornerRadiuses[u_xlati16];
    u_xlat2.xy = (bool(u_xlatb10)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat13.x = _BorderWidths[1];
    u_xlat14.x = _BorderWidths[3];
    u_xlat0.x = _Rect[1] + _Rect[3];
    u_xlat14.y = u_xlat0.x + (-_CornerRadiuses[u_xlati16]);
    u_xlat13.y = _Rect[1] + _CornerRadiuses[u_xlati16];
    u_xlat2.zw = (bool(u_xlatb11)) ? u_xlat13.xy : u_xlat14.xy;
    u_xlat0.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati16]);
    u_xlat15 = u_xlat0.x / u_xlat0.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat15 * u_xlat3.y;
    u_xlat15 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_CornerRadiuses[u_xlati16]);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = (-u_xlat0.x) + u_xlat15;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat5 = dFdx(vs_TEXCOORD2.x);
    u_xlat5 = float(1.0) / abs(u_xlat5);
    u_xlat15 = u_xlat15 * u_xlat5 + 0.5;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat5 = u_xlat1.x * u_xlat5 + 0.5;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat0.x = (u_xlatb0.x) ? u_xlat15 : 1.0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxx).xy;
    u_xlatb15 = u_xlatb1.y || u_xlatb1.x;
    u_xlat0.x = u_xlatb15 ? u_xlat0.x : float(0.0);
    u_xlat5 = u_xlatb15 ? u_xlat5 : float(0.0);
    u_xlat15 = (-u_xlat5) + 1.0;
    u_xlatb5.x = u_xlat5==0.0;
    u_xlat15 = (_SmoothCorners != 0) ? u_xlat15 : 0.0;
    u_xlat0.x = (u_xlatb5.x) ? u_xlat0.x : u_xlat15;
    u_xlatb5.xz = greaterThanEqual(u_xlat2.yyww, vs_TEXCOORD2.xxyy).xz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, u_xlat2.ywyy).xy;
    u_xlatb5.x = (u_xlatb10) ? u_xlatb5.x : u_xlatb1.x;
    u_xlatb10 = (u_xlatb11) ? u_xlatb5.z : u_xlatb1.y;
    u_xlatb5.x = u_xlatb10 && u_xlatb5.x;
    u_xlat0.x = (u_xlatb5.x) ? u_xlat0.x : 1.0;
    u_xlat10 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat10 = (-u_xlat10) + _Rect[2];
    u_xlat15 = _BorderWidths[0] + _Rect[0];
    u_xlat10 = u_xlat10 + u_xlat15;
    u_xlatb15 = vs_TEXCOORD2.x>=u_xlat15;
    u_xlatb10 = u_xlat10>=vs_TEXCOORD2.x;
    u_xlatb10 = u_xlatb10 && u_xlatb15;
    u_xlat15 = _BorderWidths[1] + _Rect[1];
    u_xlatb1.x = vs_TEXCOORD2.y>=u_xlat15;
    u_xlatb10 = u_xlatb10 && u_xlatb1.x;
    u_xlat1.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat1.x = (-u_xlat1.x) + _Rect[3];
    u_xlat15 = u_xlat15 + u_xlat1.x;
    u_xlatb15 = u_xlat15>=vs_TEXCOORD2.y;
    u_xlatb10 = u_xlatb15 && u_xlatb10;
    u_xlat10 = (u_xlatb10) ? 0.0 : 1.0;
    u_xlat5 = (u_xlatb5.x) ? 1.0 : u_xlat10;
    u_xlatb10 = 0.0<_BorderWidths[0];
    u_xlatb15 = 0.0<_BorderWidths[1];
    u_xlatb10 = u_xlatb15 || u_xlatb10;
    u_xlatb15 = 0.0<_BorderWidths[2];
    u_xlatb10 = u_xlatb15 || u_xlatb10;
    u_xlatb15 = 0.0<_BorderWidths[3];
    u_xlatb10 = u_xlatb15 || u_xlatb10;
    u_xlat5 = (u_xlatb10) ? u_xlat5 : 1.0;
    u_xlat10 = u_xlat5 * u_xlat0.x;
    u_xlat1 = texture(_GUIClipTexture, vs_TEXCOORD1.xy);
    u_xlat10 = u_xlat10 * u_xlat1.w;
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = (_ManualTex2SRGB != 0) ? u_xlat1.xyz : u_xlat2.xyz;
    u_xlat2 = u_xlat2 * vs_COLOR0;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlatb10 = _SrcBlend!=5;
    SV_Target0.xyz = (bool(u_xlatb10)) ? u_xlat1.xyz : u_xlat2.xyz;
    u_xlat0.x = u_xlat0.x * u_xlat2.w;
    u_xlat0.x = u_xlat5 * u_xlat0.x;
    SV_Target0.w = u_xlat1.w * u_xlat0.x;
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
; Bound: 599
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %36 %484 %497 %554 %568 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate vs_TEXCOORD2 Location 36 
                                                      OpDecorate %475 DescriptorSet 475 
                                                      OpDecorate %475 Binding 475 
                                                      OpDecorate %479 DescriptorSet 479 
                                                      OpDecorate %479 Binding 479 
                                                      OpDecorate vs_TEXCOORD1 Location 484 
                                                      OpDecorate %492 DescriptorSet 492 
                                                      OpDecorate %492 Binding 492 
                                                      OpDecorate %494 DescriptorSet 494 
                                                      OpDecorate %494 Binding 494 
                                                      OpDecorate vs_TEXCOORD0 Location 497 
                                                      OpDecorate %554 Location 554 
                                                      OpDecorate %568 Location 568 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 2 
                                               %8 = OpTypePointer Private %7 
                                Private f32_2* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 1 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %6 %12 
                                              %14 = OpTypeArray %6 %12 
                                              %15 = OpTypeArray %6 %12 
                                              %16 = OpTypeStruct %10 %10 %13 %14 %15 %10 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4]; i32;}* %18 = OpVariable Uniform 
                                          i32 %19 = OpConstant 3 
                                          i32 %20 = OpConstant 0 
                                              %21 = OpTypePointer Uniform %6 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                              %27 = OpTypeVector %6 4 
                                              %28 = OpTypePointer Private %27 
                               Private f32_4* %29 = OpVariable Private 
                                          i32 %30 = OpConstant 2 
                                 Private f32* %34 = OpVariable Private 
                                              %35 = OpTypePointer Input %27 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %37 = OpTypePointer Input %6 
                                          i32 %40 = OpConstant 4 
                                          f32 %48 = OpConstant 3.674022E-40 
                                              %52 = OpTypeBool 
                                              %53 = OpTypePointer Private %52 
                                Private bool* %54 = OpVariable Private 
                                          f32 %55 = OpConstant 3.674022E-40 
                                 Private f32* %58 = OpVariable Private 
                                 Private f32* %64 = OpVariable Private 
                                          u32 %65 = OpConstant 1 
                                          i32 %68 = OpConstant 1 
                                Private bool* %79 = OpVariable Private 
                                              %82 = OpTypeVector %10 2 
                                              %83 = OpTypePointer Private %82 
                               Private i32_2* %84 = OpVariable Private 
                                        i32_2 %86 = OpConstantComposite %20 %68 
                                        i32_2 %87 = OpConstantComposite %19 %30 
                                              %88 = OpTypeVector %52 2 
                                              %91 = OpTypePointer Private %10 
                                 Private i32* %92 = OpVariable Private 
                                              %94 = OpTypePointer Function %10 
                              Private f32_4* %118 = OpVariable Private 
                                             %120 = OpTypePointer Function %7 
                              Private f32_2* %131 = OpVariable Private 
                              Private f32_2* %135 = OpVariable Private 
                                             %183 = OpTypeVector %6 3 
                                             %184 = OpTypePointer Private %183 
                              Private f32_3* %185 = OpVariable Private 
                                         u32 %198 = OpConstant 2 
                                             %230 = OpTypePointer Private %88 
                             Private bool_2* %231 = OpVariable Private 
                                       f32_4 %232 = OpConstantComposite %55 %55 %55 %55 
                                             %235 = OpTypeVector %52 4 
                                Private f32* %244 = OpVariable Private 
                                         f32 %248 = OpConstant 3.674022E-40 
                             Private bool_2* %270 = OpVariable Private 
                               Private bool* %275 = OpVariable Private 
                                             %282 = OpTypePointer Function %6 
                                             %297 = OpTypeVector %52 3 
                                             %298 = OpTypePointer Private %297 
                             Private bool_3* %299 = OpVariable Private 
                                         i32 %303 = OpConstant 5 
                                             %304 = OpTypePointer Uniform %10 
                                             %336 = OpTypePointer Function %52 
                                             %473 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %474 = OpTypePointer UniformConstant %473 
        UniformConstant read_only Texture2D* %475 = OpVariable UniformConstant 
                                             %477 = OpTypeSampler 
                                             %478 = OpTypePointer UniformConstant %477 
                    UniformConstant sampler* %479 = OpVariable UniformConstant 
                                             %481 = OpTypeSampledImage %473 
                                             %483 = OpTypePointer Input %7 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                         u32 %487 = OpConstant 3 
        UniformConstant read_only Texture2D* %492 = OpVariable UniformConstant 
                    UniformConstant sampler* %494 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                       f32_3 %502 = OpConstantComposite %55 %55 %55 
                                         f32 %513 = OpConstant 3.674022E-40 
                                       f32_3 %514 = OpConstantComposite %513 %513 %513 
                                         f32 %525 = OpConstant 3.674022E-40 
                                       f32_3 %526 = OpConstantComposite %525 %525 %525 
                                         f32 %528 = OpConstant 3.674022E-40 
                                       f32_3 %529 = OpConstantComposite %528 %528 %528 
                                             %541 = OpTypePointer Function %183 
                                Input f32_4* %554 = OpVariable Input 
                                             %567 = OpTypePointer Output %27 
                               Output f32_4* %568 = OpVariable Output 
                                             %596 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function i32* %95 = OpVariable Function 
                             Function f32_2* %121 = OpVariable Function 
                             Function f32_2* %161 = OpVariable Function 
                               Function f32* %283 = OpVariable Function 
                               Function f32* %312 = OpVariable Function 
                              Function bool* %337 = OpVariable Function 
                              Function bool* %348 = OpVariable Function 
                               Function f32* %364 = OpVariable Function 
                             Function f32_3* %542 = OpVariable Function 
                             Function f32_3* %570 = OpVariable Function 
                                 Uniform f32* %22 = OpAccessChain %18 %19 %20 
                                          f32 %23 = OpLoad %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                                 Uniform f32* %31 = OpAccessChain %18 %19 %30 
                                          f32 %32 = OpLoad %31 
                                 Private f32* %33 = OpAccessChain %29 %24 
                                                      OpStore %33 %32 
                                   Input f32* %38 = OpAccessChain vs_TEXCOORD2 %24 
                                          f32 %39 = OpLoad %38 
                                 Uniform f32* %41 = OpAccessChain %18 %40 %20 
                                          f32 %42 = OpLoad %41 
                                          f32 %43 = OpFNegate %42 
                                          f32 %44 = OpFAdd %39 %43 
                                                      OpStore %34 %44 
                                 Uniform f32* %45 = OpAccessChain %18 %40 %30 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpFNegate %46 
                                          f32 %49 = OpFMul %47 %48 
                                          f32 %50 = OpLoad %34 
                                          f32 %51 = OpFAdd %49 %50 
                                                      OpStore %34 %51 
                                          f32 %56 = OpLoad %34 
                                         bool %57 = OpFOrdGreaterThanEqual %55 %56 
                                                      OpStore %54 %57 
                                 Uniform f32* %59 = OpAccessChain %18 %40 %20 
                                          f32 %60 = OpLoad %59 
                                 Uniform f32* %61 = OpAccessChain %18 %40 %30 
                                          f32 %62 = OpLoad %61 
                                          f32 %63 = OpFAdd %60 %62 
                                                      OpStore %58 %63 
                                   Input f32* %66 = OpAccessChain vs_TEXCOORD2 %65 
                                          f32 %67 = OpLoad %66 
                                 Uniform f32* %69 = OpAccessChain %18 %40 %68 
                                          f32 %70 = OpLoad %69 
                                          f32 %71 = OpFNegate %70 
                                          f32 %72 = OpFAdd %67 %71 
                                                      OpStore %64 %72 
                                 Uniform f32* %73 = OpAccessChain %18 %40 %19 
                                          f32 %74 = OpLoad %73 
                                          f32 %75 = OpFNegate %74 
                                          f32 %76 = OpFMul %75 %48 
                                          f32 %77 = OpLoad %64 
                                          f32 %78 = OpFAdd %76 %77 
                                                      OpStore %64 %78 
                                          f32 %80 = OpLoad %64 
                                         bool %81 = OpFOrdGreaterThanEqual %55 %80 
                                                      OpStore %79 %81 
                                         bool %85 = OpLoad %79 
                                       bool_2 %89 = OpCompositeConstruct %85 %85 
                                        i32_2 %90 = OpSelect %89 %86 %87 
                                                      OpStore %84 %90 
                                         bool %93 = OpLoad %54 
                                                      OpSelectionMerge %97 None 
                                                      OpBranchConditional %93 %96 %100 
                                              %96 = OpLabel 
                                 Private i32* %98 = OpAccessChain %84 %24 
                                          i32 %99 = OpLoad %98 
                                                      OpStore %95 %99 
                                                      OpBranch %97 
                                             %100 = OpLabel 
                                Private i32* %101 = OpAccessChain %84 %65 
                                         i32 %102 = OpLoad %101 
                                                      OpStore %95 %102 
                                                      OpBranch %97 
                                              %97 = OpLabel 
                                         i32 %103 = OpLoad %95 
                                                      OpStore %92 %103 
                                         f32 %104 = OpLoad %58 
                                         i32 %105 = OpLoad %92 
                                Uniform f32* %106 = OpAccessChain %18 %30 %105 
                                         f32 %107 = OpLoad %106 
                                         f32 %108 = OpFNegate %107 
                                         f32 %109 = OpFAdd %104 %108 
                                Private f32* %110 = OpAccessChain %29 %65 
                                                      OpStore %110 %109 
                                Uniform f32* %111 = OpAccessChain %18 %40 %20 
                                         f32 %112 = OpLoad %111 
                                         i32 %113 = OpLoad %92 
                                Uniform f32* %114 = OpAccessChain %18 %30 %113 
                                         f32 %115 = OpLoad %114 
                                         f32 %116 = OpFAdd %112 %115 
                                Private f32* %117 = OpAccessChain %9 %65 
                                                      OpStore %117 %116 
                                        bool %119 = OpLoad %54 
                                                      OpSelectionMerge %123 None 
                                                      OpBranchConditional %119 %122 %125 
                                             %122 = OpLabel 
                                       f32_2 %124 = OpLoad %9 
                                                      OpStore %121 %124 
                                                      OpBranch %123 
                                             %125 = OpLabel 
                                       f32_4 %126 = OpLoad %29 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                                      OpStore %121 %127 
                                                      OpBranch %123 
                                             %123 = OpLabel 
                                       f32_2 %128 = OpLoad %121 
                                       f32_4 %129 = OpLoad %118 
                                       f32_4 %130 = OpVectorShuffle %129 %128 4 5 2 3 
                                                      OpStore %118 %130 
                                Uniform f32* %132 = OpAccessChain %18 %19 %68 
                                         f32 %133 = OpLoad %132 
                                Private f32* %134 = OpAccessChain %131 %24 
                                                      OpStore %134 %133 
                                Uniform f32* %136 = OpAccessChain %18 %19 %19 
                                         f32 %137 = OpLoad %136 
                                Private f32* %138 = OpAccessChain %135 %24 
                                                      OpStore %138 %137 
                                Uniform f32* %139 = OpAccessChain %18 %40 %68 
                                         f32 %140 = OpLoad %139 
                                Uniform f32* %141 = OpAccessChain %18 %40 %19 
                                         f32 %142 = OpLoad %141 
                                         f32 %143 = OpFAdd %140 %142 
                                Private f32* %144 = OpAccessChain %9 %24 
                                                      OpStore %144 %143 
                                Private f32* %145 = OpAccessChain %9 %24 
                                         f32 %146 = OpLoad %145 
                                         i32 %147 = OpLoad %92 
                                Uniform f32* %148 = OpAccessChain %18 %30 %147 
                                         f32 %149 = OpLoad %148 
                                         f32 %150 = OpFNegate %149 
                                         f32 %151 = OpFAdd %146 %150 
                                Private f32* %152 = OpAccessChain %135 %65 
                                                      OpStore %152 %151 
                                Uniform f32* %153 = OpAccessChain %18 %40 %68 
                                         f32 %154 = OpLoad %153 
                                         i32 %155 = OpLoad %92 
                                Uniform f32* %156 = OpAccessChain %18 %30 %155 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFAdd %154 %157 
                                Private f32* %159 = OpAccessChain %131 %65 
                                                      OpStore %159 %158 
                                        bool %160 = OpLoad %79 
                                                      OpSelectionMerge %163 None 
                                                      OpBranchConditional %160 %162 %165 
                                             %162 = OpLabel 
                                       f32_2 %164 = OpLoad %131 
                                                      OpStore %161 %164 
                                                      OpBranch %163 
                                             %165 = OpLabel 
                                       f32_2 %166 = OpLoad %135 
                                                      OpStore %161 %166 
                                                      OpBranch %163 
                                             %163 = OpLabel 
                                       f32_2 %167 = OpLoad %161 
                                       f32_4 %168 = OpLoad %118 
                                       f32_4 %169 = OpVectorShuffle %168 %167 0 1 4 5 
                                                      OpStore %118 %169 
                                       f32_4 %170 = OpLoad %118 
                                       f32_2 %171 = OpVectorShuffle %170 %170 0 2 
                                       f32_2 %172 = OpFNegate %171 
                                         i32 %173 = OpLoad %92 
                                Uniform f32* %174 = OpAccessChain %18 %30 %173 
                                         f32 %175 = OpLoad %174 
                                       f32_2 %176 = OpCompositeConstruct %175 %175 
                                       f32_2 %177 = OpFAdd %172 %176 
                                                      OpStore %9 %177 
                                Private f32* %178 = OpAccessChain %9 %24 
                                         f32 %179 = OpLoad %178 
                                Private f32* %180 = OpAccessChain %9 %65 
                                         f32 %181 = OpLoad %180 
                                         f32 %182 = OpFDiv %179 %181 
                                                      OpStore %58 %182 
                                       f32_4 %186 = OpLoad %118 
                                       f32_2 %187 = OpVectorShuffle %186 %186 1 3 
                                       f32_2 %188 = OpFNegate %187 
                                       f32_4 %189 = OpLoad vs_TEXCOORD2 
                                       f32_2 %190 = OpVectorShuffle %189 %189 0 1 
                                       f32_2 %191 = OpFAdd %188 %190 
                                       f32_3 %192 = OpLoad %185 
                                       f32_3 %193 = OpVectorShuffle %192 %191 3 4 2 
                                                      OpStore %185 %193 
                                         f32 %194 = OpLoad %58 
                                Private f32* %195 = OpAccessChain %185 %65 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpFMul %194 %196 
                                Private f32* %199 = OpAccessChain %185 %198 
                                                      OpStore %199 %197 
                                       f32_3 %200 = OpLoad %185 
                                       f32_2 %201 = OpVectorShuffle %200 %200 0 2 
                                       f32_3 %202 = OpLoad %185 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 2 
                                         f32 %204 = OpDot %201 %203 
                                                      OpStore %58 %204 
                                       f32_3 %205 = OpLoad %185 
                                       f32_2 %206 = OpVectorShuffle %205 %205 0 1 
                                       f32_3 %207 = OpLoad %185 
                                       f32_2 %208 = OpVectorShuffle %207 %207 0 1 
                                         f32 %209 = OpDot %206 %208 
                                Private f32* %210 = OpAccessChain %29 %24 
                                                      OpStore %210 %209 
                                Private f32* %211 = OpAccessChain %29 %24 
                                         f32 %212 = OpLoad %211 
                                         f32 %213 = OpExtInst %1 31 %212 
                                Private f32* %214 = OpAccessChain %29 %24 
                                                      OpStore %214 %213 
                                Private f32* %215 = OpAccessChain %29 %24 
                                         f32 %216 = OpLoad %215 
                                         i32 %217 = OpLoad %92 
                                Uniform f32* %218 = OpAccessChain %18 %30 %217 
                                         f32 %219 = OpLoad %218 
                                         f32 %220 = OpFNegate %219 
                                         f32 %221 = OpFAdd %216 %220 
                                Private f32* %222 = OpAccessChain %29 %24 
                                                      OpStore %222 %221 
                                         f32 %223 = OpLoad %58 
                                         f32 %224 = OpExtInst %1 31 %223 
                                                      OpStore %58 %224 
                                Private f32* %225 = OpAccessChain %9 %24 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpFNegate %226 
                                         f32 %228 = OpLoad %58 
                                         f32 %229 = OpFAdd %227 %228 
                                                      OpStore %58 %229 
                                       f32_2 %233 = OpLoad %9 
                                       f32_4 %234 = OpVectorShuffle %233 %233 0 1 0 0 
                                      bool_4 %236 = OpFOrdLessThan %232 %234 
                                      bool_2 %237 = OpVectorShuffle %236 %236 0 1 
                                                      OpStore %231 %237 
                               Private bool* %238 = OpAccessChain %231 %65 
                                        bool %239 = OpLoad %238 
                               Private bool* %240 = OpAccessChain %231 %24 
                                        bool %241 = OpLoad %240 
                                        bool %242 = OpLogicalAnd %239 %241 
                               Private bool* %243 = OpAccessChain %231 %24 
                                                      OpStore %243 %242 
                                  Input f32* %245 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %246 = OpLoad %245 
                                         f32 %247 = OpDPdx %246 
                                                      OpStore %244 %247 
                                         f32 %249 = OpLoad %244 
                                         f32 %250 = OpExtInst %1 4 %249 
                                         f32 %251 = OpFDiv %248 %250 
                                                      OpStore %244 %251 
                                         f32 %252 = OpLoad %58 
                                         f32 %253 = OpLoad %244 
                                         f32 %254 = OpFMul %252 %253 
                                         f32 %255 = OpFAdd %254 %48 
                                                      OpStore %58 %255 
                                         f32 %256 = OpLoad %58 
                                         f32 %257 = OpExtInst %1 43 %256 %55 %248 
                                                      OpStore %58 %257 
                                Private f32* %258 = OpAccessChain %29 %24 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpLoad %244 
                                         f32 %261 = OpFMul %259 %260 
                                         f32 %262 = OpFAdd %261 %48 
                                                      OpStore %244 %262 
                                         f32 %263 = OpLoad %244 
                                         f32 %264 = OpExtInst %1 43 %263 %55 %248 
                                                      OpStore %244 %264 
                               Private bool* %265 = OpAccessChain %231 %24 
                                        bool %266 = OpLoad %265 
                                         f32 %267 = OpLoad %58 
                                         f32 %268 = OpSelect %266 %267 %248 
                                Private f32* %269 = OpAccessChain %9 %24 
                                                      OpStore %269 %268 
                                       f32_4 %271 = OpLoad %118 
                                       f32_4 %272 = OpVectorShuffle %271 %271 0 2 0 0 
                                      bool_4 %273 = OpFOrdLessThan %232 %272 
                                      bool_2 %274 = OpVectorShuffle %273 %273 0 1 
                                                      OpStore %270 %274 
                               Private bool* %276 = OpAccessChain %270 %65 
                                        bool %277 = OpLoad %276 
                               Private bool* %278 = OpAccessChain %270 %24 
                                        bool %279 = OpLoad %278 
                                        bool %280 = OpLogicalOr %277 %279 
                                                      OpStore %275 %280 
                                        bool %281 = OpLoad %275 
                                                      OpSelectionMerge %285 None 
                                                      OpBranchConditional %281 %284 %288 
                                             %284 = OpLabel 
                                Private f32* %286 = OpAccessChain %9 %24 
                                         f32 %287 = OpLoad %286 
                                                      OpStore %283 %287 
                                                      OpBranch %285 
                                             %288 = OpLabel 
                                                      OpStore %283 %55 
                                                      OpBranch %285 
                                             %285 = OpLabel 
                                         f32 %289 = OpLoad %283 
                                Private f32* %290 = OpAccessChain %9 %24 
                                                      OpStore %290 %289 
                                        bool %291 = OpLoad %275 
                                         f32 %292 = OpLoad %244 
                                         f32 %293 = OpSelect %291 %292 %55 
                                                      OpStore %244 %293 
                                         f32 %294 = OpLoad %244 
                                         f32 %295 = OpFNegate %294 
                                         f32 %296 = OpFAdd %295 %248 
                                                      OpStore %58 %296 
                                         f32 %300 = OpLoad %244 
                                        bool %301 = OpFOrdEqual %300 %55 
                               Private bool* %302 = OpAccessChain %299 %24 
                                                      OpStore %302 %301 
                                Uniform i32* %305 = OpAccessChain %18 %303 
                                         i32 %306 = OpLoad %305 
                                        bool %307 = OpINotEqual %306 %20 
                                         f32 %308 = OpLoad %58 
                                         f32 %309 = OpSelect %307 %308 %55 
                                                      OpStore %58 %309 
                               Private bool* %310 = OpAccessChain %299 %24 
                                        bool %311 = OpLoad %310 
                                                      OpSelectionMerge %314 None 
                                                      OpBranchConditional %311 %313 %317 
                                             %313 = OpLabel 
                                Private f32* %315 = OpAccessChain %9 %24 
                                         f32 %316 = OpLoad %315 
                                                      OpStore %312 %316 
                                                      OpBranch %314 
                                             %317 = OpLabel 
                                         f32 %318 = OpLoad %58 
                                                      OpStore %312 %318 
                                                      OpBranch %314 
                                             %314 = OpLabel 
                                         f32 %319 = OpLoad %312 
                                Private f32* %320 = OpAccessChain %9 %24 
                                                      OpStore %320 %319 
                                       f32_4 %321 = OpLoad %118 
                                       f32_4 %322 = OpVectorShuffle %321 %321 1 1 3 3 
                                       f32_4 %323 = OpLoad vs_TEXCOORD2 
                                       f32_4 %324 = OpVectorShuffle %323 %323 0 0 1 1 
                                      bool_4 %325 = OpFOrdGreaterThanEqual %322 %324 
                                      bool_2 %326 = OpVectorShuffle %325 %325 0 2 
                                      bool_3 %327 = OpLoad %299 
                                      bool_3 %328 = OpVectorShuffle %327 %326 3 1 4 
                                                      OpStore %299 %328 
                                       f32_4 %329 = OpLoad vs_TEXCOORD2 
                                       f32_4 %330 = OpVectorShuffle %329 %329 0 1 0 0 
                                       f32_4 %331 = OpLoad %118 
                                       f32_4 %332 = OpVectorShuffle %331 %331 1 3 1 1 
                                      bool_4 %333 = OpFOrdGreaterThanEqual %330 %332 
                                      bool_2 %334 = OpVectorShuffle %333 %333 0 1 
                                                      OpStore %270 %334 
                                        bool %335 = OpLoad %54 
                                                      OpSelectionMerge %339 None 
                                                      OpBranchConditional %335 %338 %342 
                                             %338 = OpLabel 
                               Private bool* %340 = OpAccessChain %299 %24 
                                        bool %341 = OpLoad %340 
                                                      OpStore %337 %341 
                                                      OpBranch %339 
                                             %342 = OpLabel 
                               Private bool* %343 = OpAccessChain %270 %24 
                                        bool %344 = OpLoad %343 
                                                      OpStore %337 %344 
                                                      OpBranch %339 
                                             %339 = OpLabel 
                                        bool %345 = OpLoad %337 
                               Private bool* %346 = OpAccessChain %299 %24 
                                                      OpStore %346 %345 
                                        bool %347 = OpLoad %79 
                                                      OpSelectionMerge %350 None 
                                                      OpBranchConditional %347 %349 %353 
                                             %349 = OpLabel 
                               Private bool* %351 = OpAccessChain %299 %198 
                                        bool %352 = OpLoad %351 
                                                      OpStore %348 %352 
                                                      OpBranch %350 
                                             %353 = OpLabel 
                               Private bool* %354 = OpAccessChain %270 %65 
                                        bool %355 = OpLoad %354 
                                                      OpStore %348 %355 
                                                      OpBranch %350 
                                             %350 = OpLabel 
                                        bool %356 = OpLoad %348 
                                                      OpStore %54 %356 
                                        bool %357 = OpLoad %54 
                               Private bool* %358 = OpAccessChain %299 %24 
                                        bool %359 = OpLoad %358 
                                        bool %360 = OpLogicalAnd %357 %359 
                               Private bool* %361 = OpAccessChain %299 %24 
                                                      OpStore %361 %360 
                               Private bool* %362 = OpAccessChain %299 %24 
                                        bool %363 = OpLoad %362 
                                                      OpSelectionMerge %366 None 
                                                      OpBranchConditional %363 %365 %369 
                                             %365 = OpLabel 
                                Private f32* %367 = OpAccessChain %9 %24 
                                         f32 %368 = OpLoad %367 
                                                      OpStore %364 %368 
                                                      OpBranch %366 
                                             %369 = OpLabel 
                                                      OpStore %364 %248 
                                                      OpBranch %366 
                                             %366 = OpLabel 
                                         f32 %370 = OpLoad %364 
                                Private f32* %371 = OpAccessChain %9 %24 
                                                      OpStore %371 %370 
                                Uniform f32* %372 = OpAccessChain %18 %19 %20 
                                         f32 %373 = OpLoad %372 
                                Uniform f32* %374 = OpAccessChain %18 %19 %30 
                                         f32 %375 = OpLoad %374 
                                         f32 %376 = OpFAdd %373 %375 
                                                      OpStore %34 %376 
                                         f32 %377 = OpLoad %34 
                                         f32 %378 = OpFNegate %377 
                                Uniform f32* %379 = OpAccessChain %18 %40 %30 
                                         f32 %380 = OpLoad %379 
                                         f32 %381 = OpFAdd %378 %380 
                                                      OpStore %34 %381 
                                Uniform f32* %382 = OpAccessChain %18 %19 %20 
                                         f32 %383 = OpLoad %382 
                                Uniform f32* %384 = OpAccessChain %18 %40 %20 
                                         f32 %385 = OpLoad %384 
                                         f32 %386 = OpFAdd %383 %385 
                                                      OpStore %58 %386 
                                         f32 %387 = OpLoad %34 
                                         f32 %388 = OpLoad %58 
                                         f32 %389 = OpFAdd %387 %388 
                                                      OpStore %34 %389 
                                  Input f32* %390 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %391 = OpLoad %390 
                                         f32 %392 = OpLoad %58 
                                        bool %393 = OpFOrdGreaterThanEqual %391 %392 
                                                      OpStore %275 %393 
                                         f32 %394 = OpLoad %34 
                                  Input f32* %395 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %396 = OpLoad %395 
                                        bool %397 = OpFOrdGreaterThanEqual %394 %396 
                                                      OpStore %54 %397 
                                        bool %398 = OpLoad %54 
                                        bool %399 = OpLoad %275 
                                        bool %400 = OpLogicalAnd %398 %399 
                                                      OpStore %54 %400 
                                Uniform f32* %401 = OpAccessChain %18 %19 %68 
                                         f32 %402 = OpLoad %401 
                                Uniform f32* %403 = OpAccessChain %18 %40 %68 
                                         f32 %404 = OpLoad %403 
                                         f32 %405 = OpFAdd %402 %404 
                                                      OpStore %58 %405 
                                  Input f32* %406 = OpAccessChain vs_TEXCOORD2 %65 
                                         f32 %407 = OpLoad %406 
                                         f32 %408 = OpLoad %58 
                                        bool %409 = OpFOrdGreaterThanEqual %407 %408 
                               Private bool* %410 = OpAccessChain %270 %24 
                                                      OpStore %410 %409 
                                        bool %411 = OpLoad %54 
                               Private bool* %412 = OpAccessChain %270 %24 
                                        bool %413 = OpLoad %412 
                                        bool %414 = OpLogicalAnd %411 %413 
                                                      OpStore %54 %414 
                                Uniform f32* %415 = OpAccessChain %18 %19 %68 
                                         f32 %416 = OpLoad %415 
                                Uniform f32* %417 = OpAccessChain %18 %19 %19 
                                         f32 %418 = OpLoad %417 
                                         f32 %419 = OpFAdd %416 %418 
                                Private f32* %420 = OpAccessChain %29 %24 
                                                      OpStore %420 %419 
                                Private f32* %421 = OpAccessChain %29 %24 
                                         f32 %422 = OpLoad %421 
                                         f32 %423 = OpFNegate %422 
                                Uniform f32* %424 = OpAccessChain %18 %40 %19 
                                         f32 %425 = OpLoad %424 
                                         f32 %426 = OpFAdd %423 %425 
                                Private f32* %427 = OpAccessChain %29 %24 
                                                      OpStore %427 %426 
                                         f32 %428 = OpLoad %58 
                                Private f32* %429 = OpAccessChain %29 %24 
                                         f32 %430 = OpLoad %429 
                                         f32 %431 = OpFAdd %428 %430 
                                                      OpStore %58 %431 
                                         f32 %432 = OpLoad %58 
                                  Input f32* %433 = OpAccessChain vs_TEXCOORD2 %65 
                                         f32 %434 = OpLoad %433 
                                        bool %435 = OpFOrdGreaterThanEqual %432 %434 
                                                      OpStore %275 %435 
                                        bool %436 = OpLoad %275 
                                        bool %437 = OpLoad %54 
                                        bool %438 = OpLogicalAnd %436 %437 
                                                      OpStore %54 %438 
                                        bool %439 = OpLoad %54 
                                         f32 %440 = OpSelect %439 %55 %248 
                                                      OpStore %34 %440 
                               Private bool* %441 = OpAccessChain %299 %24 
                                        bool %442 = OpLoad %441 
                                         f32 %443 = OpLoad %34 
                                         f32 %444 = OpSelect %442 %248 %443 
                                                      OpStore %244 %444 
                                Uniform f32* %445 = OpAccessChain %18 %19 %20 
                                         f32 %446 = OpLoad %445 
                                        bool %447 = OpFOrdLessThan %55 %446 
                                                      OpStore %54 %447 
                                Uniform f32* %448 = OpAccessChain %18 %19 %68 
                                         f32 %449 = OpLoad %448 
                                        bool %450 = OpFOrdLessThan %55 %449 
                                                      OpStore %275 %450 
                                        bool %451 = OpLoad %275 
                                        bool %452 = OpLoad %54 
                                        bool %453 = OpLogicalOr %451 %452 
                                                      OpStore %54 %453 
                                Uniform f32* %454 = OpAccessChain %18 %19 %30 
                                         f32 %455 = OpLoad %454 
                                        bool %456 = OpFOrdLessThan %55 %455 
                                                      OpStore %275 %456 
                                        bool %457 = OpLoad %275 
                                        bool %458 = OpLoad %54 
                                        bool %459 = OpLogicalOr %457 %458 
                                                      OpStore %54 %459 
                                Uniform f32* %460 = OpAccessChain %18 %19 %19 
                                         f32 %461 = OpLoad %460 
                                        bool %462 = OpFOrdLessThan %55 %461 
                                                      OpStore %275 %462 
                                        bool %463 = OpLoad %275 
                                        bool %464 = OpLoad %54 
                                        bool %465 = OpLogicalOr %463 %464 
                                                      OpStore %54 %465 
                                        bool %466 = OpLoad %54 
                                         f32 %467 = OpLoad %244 
                                         f32 %468 = OpSelect %466 %467 %248 
                                                      OpStore %244 %468 
                                         f32 %469 = OpLoad %244 
                                Private f32* %470 = OpAccessChain %9 %24 
                                         f32 %471 = OpLoad %470 
                                         f32 %472 = OpFMul %469 %471 
                                                      OpStore %34 %472 
                         read_only Texture2D %476 = OpLoad %475 
                                     sampler %480 = OpLoad %479 
                  read_only Texture2DSampled %482 = OpSampledImage %476 %480 
                                       f32_2 %485 = OpLoad vs_TEXCOORD1 
                                       f32_4 %486 = OpImageSampleImplicitLod %482 %485 
                                         f32 %488 = OpCompositeExtract %486 3 
                                                      OpStore %58 %488 
                                         f32 %489 = OpLoad %58 
                                         f32 %490 = OpLoad %34 
                                         f32 %491 = OpFMul %489 %490 
                                                      OpStore %34 %491 
                         read_only Texture2D %493 = OpLoad %492 
                                     sampler %495 = OpLoad %494 
                  read_only Texture2DSampled %496 = OpSampledImage %493 %495 
                                       f32_2 %498 = OpLoad vs_TEXCOORD0 
                                       f32_4 %499 = OpImageSampleImplicitLod %496 %498 
                                                      OpStore %29 %499 
                                       f32_4 %500 = OpLoad %29 
                                       f32_3 %501 = OpVectorShuffle %500 %500 0 1 2 
                                       f32_3 %503 = OpExtInst %1 40 %501 %502 
                                       f32_4 %504 = OpLoad %118 
                                       f32_4 %505 = OpVectorShuffle %504 %503 4 5 6 3 
                                                      OpStore %118 %505 
                                       f32_4 %506 = OpLoad %118 
                                       f32_3 %507 = OpVectorShuffle %506 %506 0 1 2 
                                       f32_3 %508 = OpExtInst %1 30 %507 
                                       f32_4 %509 = OpLoad %118 
                                       f32_4 %510 = OpVectorShuffle %509 %508 4 5 6 3 
                                                      OpStore %118 %510 
                                       f32_4 %511 = OpLoad %118 
                                       f32_3 %512 = OpVectorShuffle %511 %511 0 1 2 
                                       f32_3 %515 = OpFMul %512 %514 
                                       f32_4 %516 = OpLoad %118 
                                       f32_4 %517 = OpVectorShuffle %516 %515 4 5 6 3 
                                                      OpStore %118 %517 
                                       f32_4 %518 = OpLoad %118 
                                       f32_3 %519 = OpVectorShuffle %518 %518 0 1 2 
                                       f32_3 %520 = OpExtInst %1 29 %519 
                                       f32_4 %521 = OpLoad %118 
                                       f32_4 %522 = OpVectorShuffle %521 %520 4 5 6 3 
                                                      OpStore %118 %522 
                                       f32_4 %523 = OpLoad %118 
                                       f32_3 %524 = OpVectorShuffle %523 %523 0 1 2 
                                       f32_3 %527 = OpFMul %524 %526 
                                       f32_3 %530 = OpFAdd %527 %529 
                                       f32_4 %531 = OpLoad %118 
                                       f32_4 %532 = OpVectorShuffle %531 %530 4 5 6 3 
                                                      OpStore %118 %532 
                                       f32_4 %533 = OpLoad %118 
                                       f32_3 %534 = OpVectorShuffle %533 %533 0 1 2 
                                       f32_3 %535 = OpExtInst %1 40 %534 %502 
                                       f32_4 %536 = OpLoad %118 
                                       f32_4 %537 = OpVectorShuffle %536 %535 4 5 6 3 
                                                      OpStore %118 %537 
                                Uniform i32* %538 = OpAccessChain %18 %20 
                                         i32 %539 = OpLoad %538 
                                        bool %540 = OpINotEqual %539 %20 
                                                      OpSelectionMerge %544 None 
                                                      OpBranchConditional %540 %543 %547 
                                             %543 = OpLabel 
                                       f32_4 %545 = OpLoad %118 
                                       f32_3 %546 = OpVectorShuffle %545 %545 0 1 2 
                                                      OpStore %542 %546 
                                                      OpBranch %544 
                                             %547 = OpLabel 
                                       f32_4 %548 = OpLoad %29 
                                       f32_3 %549 = OpVectorShuffle %548 %548 0 1 2 
                                                      OpStore %542 %549 
                                                      OpBranch %544 
                                             %544 = OpLabel 
                                       f32_3 %550 = OpLoad %542 
                                       f32_4 %551 = OpLoad %29 
                                       f32_4 %552 = OpVectorShuffle %551 %550 4 5 6 3 
                                                      OpStore %29 %552 
                                       f32_4 %553 = OpLoad %29 
                                       f32_4 %555 = OpLoad %554 
                                       f32_4 %556 = OpFMul %553 %555 
                                                      OpStore %29 %556 
                                         f32 %557 = OpLoad %34 
                                       f32_3 %558 = OpCompositeConstruct %557 %557 %557 
                                       f32_4 %559 = OpLoad %29 
                                       f32_3 %560 = OpVectorShuffle %559 %559 0 1 2 
                                       f32_3 %561 = OpFMul %558 %560 
                                       f32_4 %562 = OpLoad %118 
                                       f32_4 %563 = OpVectorShuffle %562 %561 4 5 6 3 
                                                      OpStore %118 %563 
                                Uniform i32* %564 = OpAccessChain %18 %68 
                                         i32 %565 = OpLoad %564 
                                        bool %566 = OpINotEqual %565 %303 
                                                      OpStore %54 %566 
                                        bool %569 = OpLoad %54 
                                                      OpSelectionMerge %572 None 
                                                      OpBranchConditional %569 %571 %575 
                                             %571 = OpLabel 
                                       f32_4 %573 = OpLoad %118 
                                       f32_3 %574 = OpVectorShuffle %573 %573 0 1 2 
                                                      OpStore %570 %574 
                                                      OpBranch %572 
                                             %575 = OpLabel 
                                       f32_4 %576 = OpLoad %29 
                                       f32_3 %577 = OpVectorShuffle %576 %576 0 1 2 
                                                      OpStore %570 %577 
                                                      OpBranch %572 
                                             %572 = OpLabel 
                                       f32_3 %578 = OpLoad %570 
                                       f32_4 %579 = OpLoad %568 
                                       f32_4 %580 = OpVectorShuffle %579 %578 4 5 6 3 
                                                      OpStore %568 %580 
                                Private f32* %581 = OpAccessChain %9 %24 
                                         f32 %582 = OpLoad %581 
                                Private f32* %583 = OpAccessChain %29 %487 
                                         f32 %584 = OpLoad %583 
                                         f32 %585 = OpFMul %582 %584 
                                Private f32* %586 = OpAccessChain %9 %24 
                                                      OpStore %586 %585 
                                         f32 %587 = OpLoad %244 
                                Private f32* %588 = OpAccessChain %9 %24 
                                         f32 %589 = OpLoad %588 
                                         f32 %590 = OpFMul %587 %589 
                                Private f32* %591 = OpAccessChain %9 %24 
                                                      OpStore %591 %590 
                                         f32 %592 = OpLoad %58 
                                Private f32* %593 = OpAccessChain %9 %24 
                                         f32 %594 = OpLoad %593 
                                         f32 %595 = OpFMul %592 %594 
                                 Output f32* %597 = OpAccessChain %568 %487 
                                                      OpStore %597 %595 
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