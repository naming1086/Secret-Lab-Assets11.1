//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Drawing_CellShading2" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_EdgeSize ("_EdgeSize", Range(0, 1)) = 0
_ColorLevel ("_ColorLevel", Range(0, 10)) = 7
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 45011
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
uniform 	float _Distortion;
uniform 	vec4 _ScreenResolution;
uniform 	float _EdgeSize;
uniform 	float _ColorLevel;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
ivec2 u_xlati3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec4 u_xlat9;
vec4 u_xlat10;
vec4 u_xlat11;
vec4 u_xlat12;
vec4 u_xlat13;
vec4 u_xlat14;
vec4 u_xlat15;
int u_xlati33;
float u_xlat36;
ivec2 u_xlati36;
bool u_xlatb36;
float u_xlat49;
bool u_xlatb49;
float u_xlat50;
int u_xlati50;
vec4 TempArray0[6];
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    TempArray0[5].x = 0.0;
    TempArray0[2].x = 0.400000006;
    TempArray0[1].x = 0.400000006;
    TempArray0[3].x = 0.400000006;
    TempArray0[0].x = 0.400000006;
    TempArray0[4].x = 0.400000006;
    u_xlat1.xy = u_xlat0.zw * _ScreenResolution.xy;
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(0.0);
    u_xlati33 = int(0xFFFFFFFEu);
    while(true){
        u_xlatb49 = 2<u_xlati33;
        if(u_xlatb49){break;}
        u_xlati3.xy = ivec2(u_xlati33) + ivec2(2, 1);
        u_xlat49 = TempArray0[u_xlati3.x].x;
        u_xlat50 = float(u_xlati33);
        u_xlat4.x = dot(vec2(u_xlat50), vec2(vec2(_Distortion, _Distortion)));
        u_xlat3.xzw = u_xlat2.xyz;
        u_xlati50 = int(0xFFFFFFFEu);
        while(true){
            u_xlatb36 = 2<u_xlati50;
            if(u_xlatb36){break;}
            u_xlati36.xy = ivec2(u_xlati50) + ivec2(2, 1);
            u_xlat36 = TempArray0[u_xlati36.x].x;
            u_xlat36 = u_xlat49 * u_xlat36;
            u_xlat5.x = float(u_xlati50);
            u_xlat4.y = dot(u_xlat5.xx, vec2(vec2(_Distortion, _Distortion)));
            u_xlat5.xy = u_xlat0.zw * _ScreenResolution.xy + u_xlat4.xy;
            u_xlat5.xy = u_xlat5.xy / _ScreenResolution.xy;
            u_xlat5 = texture(_MainTex, u_xlat5.xy);
            u_xlat3.xzw = vec3(u_xlat36) * u_xlat5.xyz + u_xlat3.xzw;
            u_xlati50 = u_xlati36.y;
        }
        u_xlat2.xyz = u_xlat3.xzw;
        u_xlati33 = u_xlati3.y;
    }
    u_xlat3 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(1.0, 1.0, 1.0, 0.0);
    u_xlat3 = u_xlat3 / _ScreenResolution.xyxy;
    u_xlat4 = texture(_MainTex, u_xlat3.xy);
    u_xlat3 = texture(_MainTex, u_xlat3.zw);
    u_xlat5 = u_xlat3 + u_xlat4;
    u_xlat6 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(1.0, -1.0, 0.0, 1.0);
    u_xlat6 = u_xlat6 / _ScreenResolution.xyxy;
    u_xlat7 = texture(_MainTex, u_xlat6.xy);
    u_xlat5 = u_xlat5 + u_xlat7;
    u_xlat6 = texture(_MainTex, u_xlat6.zw);
    u_xlat5 = u_xlat5 + u_xlat6;
    u_xlat1.xy = u_xlat1.xy / _ScreenResolution.xy;
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat5 = u_xlat1 + u_xlat5;
    u_xlat8 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(0.0, -1.0, -1.0, 1.0);
    u_xlat8 = u_xlat8 / _ScreenResolution.xyxy;
    u_xlat9 = texture(_MainTex, u_xlat8.xy);
    u_xlat5 = u_xlat5 + u_xlat9;
    u_xlat8 = texture(_MainTex, u_xlat8.zw);
    u_xlat5 = u_xlat5 + u_xlat8;
    u_xlat10 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(-1.0, 0.0, -1.0, -1.0);
    u_xlat10 = u_xlat10 / _ScreenResolution.xyxy;
    u_xlat11 = texture(_MainTex, u_xlat10.xy);
    u_xlat5 = u_xlat5 + u_xlat11;
    u_xlat10 = texture(_MainTex, u_xlat10.zw);
    u_xlat5 = u_xlat5 + u_xlat10;
    u_xlat5 = u_xlat5 * vec4(0.777777791, 0.777777791, 0.777777791, 0.777777791);
    u_xlat5 = floor(u_xlat5);
    u_xlat5 = u_xlat5 / vec4(vec4(_ColorLevel, _ColorLevel, _ColorLevel, _ColorLevel));
    u_xlat12 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(1.0, 2.0, 0.0, 2.0);
    u_xlat12 = u_xlat12 / _ScreenResolution.xyxy;
    u_xlat13 = texture(_MainTex, u_xlat12.xy);
    u_xlat13 = u_xlat4 + u_xlat13;
    u_xlat13 = u_xlat3 + u_xlat13;
    u_xlat12 = texture(_MainTex, u_xlat12.zw);
    u_xlat12 = u_xlat12 + u_xlat13;
    u_xlat12 = u_xlat6 + u_xlat12;
    u_xlat12 = u_xlat1 + u_xlat12;
    u_xlat13 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(-1.0, 2.0, 1.0, -2.0);
    u_xlat13 = u_xlat13 / _ScreenResolution.xyxy;
    u_xlat14 = texture(_MainTex, u_xlat13.xy);
    u_xlat12 = u_xlat12 + u_xlat14;
    u_xlat12 = u_xlat8 + u_xlat12;
    u_xlat12 = u_xlat11 + u_xlat12;
    u_xlat14 = u_xlat3 + u_xlat7;
    u_xlat13 = texture(_MainTex, u_xlat13.zw);
    u_xlat13 = u_xlat13 + u_xlat14;
    u_xlat13 = u_xlat1 + u_xlat13;
    u_xlat13 = u_xlat9 + u_xlat13;
    u_xlat14 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(0.0, -2.0, -1.0, -2.0);
    u_xlat14 = u_xlat14 / _ScreenResolution.xyxy;
    u_xlat15 = texture(_MainTex, u_xlat14.xy);
    u_xlat13 = u_xlat13 + u_xlat15;
    u_xlat13 = u_xlat11 + u_xlat13;
    u_xlat13 = u_xlat10 + u_xlat13;
    u_xlat14 = texture(_MainTex, u_xlat14.zw);
    u_xlat13 = u_xlat13 + u_xlat14;
    u_xlat13 = u_xlat13 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112);
    u_xlat12 = u_xlat12 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112) + (-u_xlat13);
    u_xlat13 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(2.0, 1.0, 2.0, 0.0);
    u_xlat13 = u_xlat13 / _ScreenResolution.xyxy;
    u_xlat14 = texture(_MainTex, u_xlat13.xy);
    u_xlat13 = texture(_MainTex, u_xlat13.zw);
    u_xlat13 = u_xlat13 + u_xlat14;
    u_xlat14 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(2.0, -1.0, -2.0, 1.0);
    u_xlat14 = u_xlat14 / _ScreenResolution.xyxy;
    u_xlat15 = texture(_MainTex, u_xlat14.xy);
    u_xlat13 = u_xlat13 + u_xlat15;
    u_xlat4 = u_xlat4 + u_xlat13;
    u_xlat3 = u_xlat3 + u_xlat4;
    u_xlat3 = u_xlat7 + u_xlat3;
    u_xlat3 = u_xlat6 + u_xlat3;
    u_xlat3 = u_xlat1 + u_xlat3;
    u_xlat3 = u_xlat9 + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat6;
    u_xlat1 = u_xlat9 + u_xlat1;
    u_xlat1 = u_xlat8 + u_xlat1;
    u_xlat1 = u_xlat11 + u_xlat1;
    u_xlat1 = u_xlat10 + u_xlat1;
    u_xlat4 = texture(_MainTex, u_xlat14.zw);
    u_xlat1 = u_xlat1 + u_xlat4;
    u_xlat0 = u_xlat0 * _ScreenResolution.xyxy + vec4(-2.0, 0.0, -2.0, -1.0);
    u_xlat0 = u_xlat0 / _ScreenResolution.xyxy;
    u_xlat4 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = u_xlat1 + u_xlat4;
    u_xlat0 = texture(_MainTex, u_xlat0.zw);
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat0 = u_xlat0 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112);
    u_xlat0 = u_xlat3 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112) + (-u_xlat0);
    u_xlat0 = abs(u_xlat0) + abs(u_xlat12);
    u_xlat0 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat1.w = 2.0;
    u_xlat1 = (-u_xlat5) + u_xlat1;
    u_xlat1 = vec4(vec4(_Distortion, _Distortion, _Distortion, _Distortion)) * u_xlat1 + u_xlat5;
    u_xlat2.x = _EdgeSize + 0.0500000007;
    u_xlat0.x = dot(u_xlat0, u_xlat0);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb0 = u_xlat2.x<u_xlat0.x;
    SV_Target0.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
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
; Bound: 720
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %702 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %179 DescriptorSet 179 
                                                      OpDecorate %179 Binding 179 
                                                      OpDecorate %183 DescriptorSet 183 
                                                      OpDecorate %183 Binding 183 
                                                      OpDecorate %702 Location 702 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %15 = OpTypeStruct %6 %7 %6 %6 %7 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32; f32_4; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 4 
                                              %20 = OpTypePointer Uniform %7 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 6 
                                              %31 = OpTypeArray %7 %30 
                                              %32 = OpTypePointer Private %31 
                            Private f32_4[6]* %33 = OpVariable Private 
                                          i32 %34 = OpConstant 5 
                                          f32 %35 = OpConstant 3.674022E-40 
                                          u32 %36 = OpConstant 0 
                                              %37 = OpTypePointer Private %6 
                                          i32 %39 = OpConstant 2 
                                          f32 %40 = OpConstant 3.674022E-40 
                                          i32 %42 = OpConstant 1 
                                          i32 %44 = OpConstant 3 
                                          i32 %46 = OpConstant 0 
                               Private f32_4* %49 = OpVariable Private 
                                              %58 = OpTypeVector %6 3 
                                              %59 = OpTypePointer Private %58 
                               Private f32_3* %60 = OpVariable Private 
                                          u32 %62 = OpConstant 1 
                                          u32 %64 = OpConstant 2 
                                              %66 = OpTypePointer Private %18 
                                 Private i32* %67 = OpVariable Private 
                                          i32 %68 = OpConstant -2 
                                              %74 = OpTypeBool 
                                         bool %75 = OpConstantTrue 
                                              %76 = OpTypePointer Private %74 
                                Private bool* %77 = OpVariable Private 
                                              %84 = OpTypeVector %18 2 
                                              %85 = OpTypePointer Private %84 
                               Private i32_2* %86 = OpVariable Private 
                                        i32_2 %89 = OpConstantComposite %39 %42 
                                 Private f32* %91 = OpVariable Private 
                                 Private f32* %96 = OpVariable Private 
                               Private f32_4* %99 = OpVariable Private 
                                             %102 = OpTypePointer Uniform %6 
                              Private f32_4* %113 = OpVariable Private 
                                Private i32* %117 = OpVariable Private 
                               Private bool* %123 = OpVariable Private 
                              Private i32_2* %130 = OpVariable Private 
                                Private f32* %134 = OpVariable Private 
                              Private f32_4* %142 = OpVariable Private 
                                             %177 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %178 = OpTypePointer UniformConstant %177 
        UniformConstant read_only Texture2D* %179 = OpVariable UniformConstant 
                                             %181 = OpTypeSampler 
                                             %182 = OpTypePointer UniformConstant %181 
                    UniformConstant sampler* %183 = OpVariable UniformConstant 
                                             %185 = OpTypeSampledImage %177 
                                         f32 %215 = OpConstant 3.674022E-40 
                                       f32_4 %216 = OpConstantComposite %215 %215 %215 %35 
                              Private f32_4* %238 = OpVariable Private 
                                         f32 %245 = OpConstant 3.674022E-40 
                                       f32_4 %246 = OpConstantComposite %215 %245 %35 %215 
                              Private f32_4* %253 = OpVariable Private 
                              Private f32_4* %289 = OpVariable Private 
                                       f32_4 %296 = OpConstantComposite %35 %245 %245 %215 
                              Private f32_4* %303 = OpVariable Private 
                              Private f32_4* %322 = OpVariable Private 
                                       f32_4 %329 = OpConstantComposite %245 %35 %245 %245 
                              Private f32_4* %336 = OpVariable Private 
                                         f32 %356 = OpConstant 3.674022E-40 
                                       f32_4 %357 = OpConstantComposite %356 %356 %356 %356 
                              Private f32_4* %377 = OpVariable Private 
                                         f32 %384 = OpConstant 3.674022E-40 
                                       f32_4 %385 = OpConstantComposite %215 %384 %35 %384 
                              Private f32_4* %392 = OpVariable Private 
                                         f32 %426 = OpConstant 3.674022E-40 
                                       f32_4 %427 = OpConstantComposite %245 %384 %215 %426 
                              Private f32_4* %434 = OpVariable Private 
                                       f32_4 %474 = OpConstantComposite %35 %426 %245 %426 
                              Private f32_4* %481 = OpVariable Private 
                                         f32 %507 = OpConstant 3.674022E-40 
                                       f32_4 %508 = OpConstantComposite %507 %507 %507 %507 
                                       f32_4 %521 = OpConstantComposite %384 %215 %384 %35 
                                       f32_4 %549 = OpConstantComposite %384 %245 %426 %215 
                                       f32_4 %612 = OpConstantComposite %426 %35 %426 %245 
                                         f32 %650 = OpConstant 3.674022E-40 
                                       f32_4 %651 = OpConstantComposite %650 %650 %650 %650 
                                       f32_3 %654 = OpConstantComposite %650 %650 %650 
                                         u32 %658 = OpConstant 3 
                                         f32 %684 = OpConstant 3.674022E-40 
                               Private bool* %695 = OpVariable Private 
                                             %701 = OpTypePointer Output %7 
                               Output f32_4* %702 = OpVariable Output 
                                             %704 = OpTypePointer Function %58 
                                       f32_3 %708 = OpConstantComposite %35 %35 %35 
                                             %717 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %705 = OpVariable Function 
                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
                                        f32_4 %14 = OpVectorShuffle %13 %13 0 1 0 1 
                               Uniform f32_4* %21 = OpAccessChain %17 %19 
                                        f32_4 %22 = OpLoad %21 
                                        f32_4 %23 = OpVectorShuffle %22 %22 0 1 0 1 
                                        f32_4 %24 = OpFMul %14 %23 
                               Uniform f32_4* %25 = OpAccessChain %17 %19 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpVectorShuffle %26 %26 2 3 2 3 
                                        f32_4 %28 = OpFAdd %24 %27 
                                                      OpStore %9 %28 
                                 Private f32* %38 = OpAccessChain %33 %34 %36 
                                                      OpStore %38 %35 
                                 Private f32* %41 = OpAccessChain %33 %39 %36 
                                                      OpStore %41 %40 
                                 Private f32* %43 = OpAccessChain %33 %42 %36 
                                                      OpStore %43 %40 
                                 Private f32* %45 = OpAccessChain %33 %44 %36 
                                                      OpStore %45 %40 
                                 Private f32* %47 = OpAccessChain %33 %46 %36 
                                                      OpStore %47 %40 
                                 Private f32* %48 = OpAccessChain %33 %19 %36 
                                                      OpStore %48 %40 
                                        f32_4 %50 = OpLoad %9 
                                        f32_2 %51 = OpVectorShuffle %50 %50 2 3 
                               Uniform f32_4* %52 = OpAccessChain %17 %42 
                                        f32_4 %53 = OpLoad %52 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
                                        f32_2 %55 = OpFMul %51 %54 
                                        f32_4 %56 = OpLoad %49 
                                        f32_4 %57 = OpVectorShuffle %56 %55 4 5 2 3 
                                                      OpStore %49 %57 
                                 Private f32* %61 = OpAccessChain %60 %36 
                                                      OpStore %61 %35 
                                 Private f32* %63 = OpAccessChain %60 %62 
                                                      OpStore %63 %35 
                                 Private f32* %65 = OpAccessChain %60 %64 
                                                      OpStore %65 %35 
                                                      OpStore %67 %68 
                                                      OpBranch %69 
                                              %69 = OpLabel 
                                                      OpLoopMerge %71 %72 None 
                                                      OpBranch %73 
                                              %73 = OpLabel 
                                                      OpBranchConditional %75 %70 %71 
                                              %70 = OpLabel 
                                          i32 %78 = OpLoad %67 
                                         bool %79 = OpSLessThan %39 %78 
                                                      OpStore %77 %79 
                                         bool %80 = OpLoad %77 
                                                      OpSelectionMerge %82 None 
                                                      OpBranchConditional %80 %81 %82 
                                              %81 = OpLabel 
                                                      OpBranch %71 
                                              %82 = OpLabel 
                                          i32 %87 = OpLoad %67 
                                        i32_2 %88 = OpCompositeConstruct %87 %87 
                                        i32_2 %90 = OpIAdd %88 %89 
                                                      OpStore %86 %90 
                                 Private i32* %92 = OpAccessChain %86 %36 
                                          i32 %93 = OpLoad %92 
                                 Private f32* %94 = OpAccessChain %33 %93 %36 
                                          f32 %95 = OpLoad %94 
                                                      OpStore %91 %95 
                                          i32 %97 = OpLoad %67 
                                          f32 %98 = OpConvertSToF %97 
                                                      OpStore %96 %98 
                                         f32 %100 = OpLoad %96 
                                       f32_2 %101 = OpCompositeConstruct %100 %100 
                                Uniform f32* %103 = OpAccessChain %17 %46 
                                         f32 %104 = OpLoad %103 
                                Uniform f32* %105 = OpAccessChain %17 %46 
                                         f32 %106 = OpLoad %105 
                                       f32_2 %107 = OpCompositeConstruct %104 %106 
                                         f32 %108 = OpCompositeExtract %107 0 
                                         f32 %109 = OpCompositeExtract %107 1 
                                       f32_2 %110 = OpCompositeConstruct %108 %109 
                                         f32 %111 = OpDot %101 %110 
                                Private f32* %112 = OpAccessChain %99 %36 
                                                      OpStore %112 %111 
                                       f32_3 %114 = OpLoad %60 
                                       f32_4 %115 = OpLoad %113 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 1 5 6 
                                                      OpStore %113 %116 
                                                      OpStore %117 %68 
                                                      OpBranch %118 
                                             %118 = OpLabel 
                                                      OpLoopMerge %120 %121 None 
                                                      OpBranch %122 
                                             %122 = OpLabel 
                                                      OpBranchConditional %75 %119 %120 
                                             %119 = OpLabel 
                                         i32 %124 = OpLoad %117 
                                        bool %125 = OpSLessThan %39 %124 
                                                      OpStore %123 %125 
                                        bool %126 = OpLoad %123 
                                                      OpSelectionMerge %128 None 
                                                      OpBranchConditional %126 %127 %128 
                                             %127 = OpLabel 
                                                      OpBranch %120 
                                             %128 = OpLabel 
                                         i32 %131 = OpLoad %117 
                                       i32_2 %132 = OpCompositeConstruct %131 %131 
                                       i32_2 %133 = OpIAdd %132 %89 
                                                      OpStore %130 %133 
                                Private i32* %135 = OpAccessChain %130 %36 
                                         i32 %136 = OpLoad %135 
                                Private f32* %137 = OpAccessChain %33 %136 %36 
                                         f32 %138 = OpLoad %137 
                                                      OpStore %134 %138 
                                         f32 %139 = OpLoad %91 
                                         f32 %140 = OpLoad %134 
                                         f32 %141 = OpFMul %139 %140 
                                                      OpStore %134 %141 
                                         i32 %143 = OpLoad %117 
                                         f32 %144 = OpConvertSToF %143 
                                Private f32* %145 = OpAccessChain %142 %36 
                                                      OpStore %145 %144 
                                       f32_4 %146 = OpLoad %142 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 0 
                                Uniform f32* %148 = OpAccessChain %17 %46 
                                         f32 %149 = OpLoad %148 
                                Uniform f32* %150 = OpAccessChain %17 %46 
                                         f32 %151 = OpLoad %150 
                                       f32_2 %152 = OpCompositeConstruct %149 %151 
                                         f32 %153 = OpCompositeExtract %152 0 
                                         f32 %154 = OpCompositeExtract %152 1 
                                       f32_2 %155 = OpCompositeConstruct %153 %154 
                                         f32 %156 = OpDot %147 %155 
                                Private f32* %157 = OpAccessChain %99 %62 
                                                      OpStore %157 %156 
                                       f32_4 %158 = OpLoad %9 
                                       f32_2 %159 = OpVectorShuffle %158 %158 2 3 
                              Uniform f32_4* %160 = OpAccessChain %17 %42 
                                       f32_4 %161 = OpLoad %160 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %163 = OpFMul %159 %162 
                                       f32_4 %164 = OpLoad %99 
                                       f32_2 %165 = OpVectorShuffle %164 %164 0 1 
                                       f32_2 %166 = OpFAdd %163 %165 
                                       f32_4 %167 = OpLoad %142 
                                       f32_4 %168 = OpVectorShuffle %167 %166 4 5 2 3 
                                                      OpStore %142 %168 
                                       f32_4 %169 = OpLoad %142 
                                       f32_2 %170 = OpVectorShuffle %169 %169 0 1 
                              Uniform f32_4* %171 = OpAccessChain %17 %42 
                                       f32_4 %172 = OpLoad %171 
                                       f32_2 %173 = OpVectorShuffle %172 %172 0 1 
                                       f32_2 %174 = OpFDiv %170 %173 
                                       f32_4 %175 = OpLoad %142 
                                       f32_4 %176 = OpVectorShuffle %175 %174 4 5 2 3 
                                                      OpStore %142 %176 
                         read_only Texture2D %180 = OpLoad %179 
                                     sampler %184 = OpLoad %183 
                  read_only Texture2DSampled %186 = OpSampledImage %180 %184 
                                       f32_4 %187 = OpLoad %142 
                                       f32_2 %188 = OpVectorShuffle %187 %187 0 1 
                                       f32_4 %189 = OpImageSampleImplicitLod %186 %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                       f32_4 %191 = OpLoad %142 
                                       f32_4 %192 = OpVectorShuffle %191 %190 4 5 6 3 
                                                      OpStore %142 %192 
                                         f32 %193 = OpLoad %134 
                                       f32_3 %194 = OpCompositeConstruct %193 %193 %193 
                                       f32_4 %195 = OpLoad %142 
                                       f32_3 %196 = OpVectorShuffle %195 %195 0 1 2 
                                       f32_3 %197 = OpFMul %194 %196 
                                       f32_4 %198 = OpLoad %113 
                                       f32_3 %199 = OpVectorShuffle %198 %198 0 2 3 
                                       f32_3 %200 = OpFAdd %197 %199 
                                       f32_4 %201 = OpLoad %113 
                                       f32_4 %202 = OpVectorShuffle %201 %200 4 1 5 6 
                                                      OpStore %113 %202 
                                Private i32* %203 = OpAccessChain %130 %62 
                                         i32 %204 = OpLoad %203 
                                                      OpStore %117 %204 
                                                      OpBranch %121 
                                             %121 = OpLabel 
                                                      OpBranch %118 
                                             %120 = OpLabel 
                                       f32_4 %205 = OpLoad %113 
                                       f32_3 %206 = OpVectorShuffle %205 %205 0 2 3 
                                                      OpStore %60 %206 
                                Private i32* %207 = OpAccessChain %86 %62 
                                         i32 %208 = OpLoad %207 
                                                      OpStore %67 %208 
                                                      OpBranch %72 
                                              %72 = OpLabel 
                                                      OpBranch %69 
                                              %71 = OpLabel 
                                       f32_4 %209 = OpLoad %9 
                                       f32_4 %210 = OpVectorShuffle %209 %209 2 3 2 3 
                              Uniform f32_4* %211 = OpAccessChain %17 %42 
                                       f32_4 %212 = OpLoad %211 
                                       f32_4 %213 = OpVectorShuffle %212 %212 0 1 0 1 
                                       f32_4 %214 = OpFMul %210 %213 
                                       f32_4 %217 = OpFAdd %214 %216 
                                                      OpStore %113 %217 
                                       f32_4 %218 = OpLoad %113 
                              Uniform f32_4* %219 = OpAccessChain %17 %42 
                                       f32_4 %220 = OpLoad %219 
                                       f32_4 %221 = OpVectorShuffle %220 %220 0 1 0 1 
                                       f32_4 %222 = OpFDiv %218 %221 
                                                      OpStore %113 %222 
                         read_only Texture2D %223 = OpLoad %179 
                                     sampler %224 = OpLoad %183 
                  read_only Texture2DSampled %225 = OpSampledImage %223 %224 
                                       f32_4 %226 = OpLoad %113 
                                       f32_2 %227 = OpVectorShuffle %226 %226 0 1 
                                       f32_4 %228 = OpImageSampleImplicitLod %225 %227 
                                                      OpStore %99 %228 
                         read_only Texture2D %229 = OpLoad %179 
                                     sampler %230 = OpLoad %183 
                  read_only Texture2DSampled %231 = OpSampledImage %229 %230 
                                       f32_4 %232 = OpLoad %113 
                                       f32_2 %233 = OpVectorShuffle %232 %232 2 3 
                                       f32_4 %234 = OpImageSampleImplicitLod %231 %233 
                                                      OpStore %113 %234 
                                       f32_4 %235 = OpLoad %113 
                                       f32_4 %236 = OpLoad %99 
                                       f32_4 %237 = OpFAdd %235 %236 
                                                      OpStore %142 %237 
                                       f32_4 %239 = OpLoad %9 
                                       f32_4 %240 = OpVectorShuffle %239 %239 2 3 2 3 
                              Uniform f32_4* %241 = OpAccessChain %17 %42 
                                       f32_4 %242 = OpLoad %241 
                                       f32_4 %243 = OpVectorShuffle %242 %242 0 1 0 1 
                                       f32_4 %244 = OpFMul %240 %243 
                                       f32_4 %247 = OpFAdd %244 %246 
                                                      OpStore %238 %247 
                                       f32_4 %248 = OpLoad %238 
                              Uniform f32_4* %249 = OpAccessChain %17 %42 
                                       f32_4 %250 = OpLoad %249 
                                       f32_4 %251 = OpVectorShuffle %250 %250 0 1 0 1 
                                       f32_4 %252 = OpFDiv %248 %251 
                                                      OpStore %238 %252 
                         read_only Texture2D %254 = OpLoad %179 
                                     sampler %255 = OpLoad %183 
                  read_only Texture2DSampled %256 = OpSampledImage %254 %255 
                                       f32_4 %257 = OpLoad %238 
                                       f32_2 %258 = OpVectorShuffle %257 %257 0 1 
                                       f32_4 %259 = OpImageSampleImplicitLod %256 %258 
                                                      OpStore %253 %259 
                                       f32_4 %260 = OpLoad %142 
                                       f32_4 %261 = OpLoad %253 
                                       f32_4 %262 = OpFAdd %260 %261 
                                                      OpStore %142 %262 
                         read_only Texture2D %263 = OpLoad %179 
                                     sampler %264 = OpLoad %183 
                  read_only Texture2DSampled %265 = OpSampledImage %263 %264 
                                       f32_4 %266 = OpLoad %238 
                                       f32_2 %267 = OpVectorShuffle %266 %266 2 3 
                                       f32_4 %268 = OpImageSampleImplicitLod %265 %267 
                                                      OpStore %238 %268 
                                       f32_4 %269 = OpLoad %142 
                                       f32_4 %270 = OpLoad %238 
                                       f32_4 %271 = OpFAdd %269 %270 
                                                      OpStore %142 %271 
                                       f32_4 %272 = OpLoad %49 
                                       f32_2 %273 = OpVectorShuffle %272 %272 0 1 
                              Uniform f32_4* %274 = OpAccessChain %17 %42 
                                       f32_4 %275 = OpLoad %274 
                                       f32_2 %276 = OpVectorShuffle %275 %275 0 1 
                                       f32_2 %277 = OpFDiv %273 %276 
                                       f32_4 %278 = OpLoad %49 
                                       f32_4 %279 = OpVectorShuffle %278 %277 4 5 2 3 
                                                      OpStore %49 %279 
                         read_only Texture2D %280 = OpLoad %179 
                                     sampler %281 = OpLoad %183 
                  read_only Texture2DSampled %282 = OpSampledImage %280 %281 
                                       f32_4 %283 = OpLoad %49 
                                       f32_2 %284 = OpVectorShuffle %283 %283 0 1 
                                       f32_4 %285 = OpImageSampleImplicitLod %282 %284 
                                                      OpStore %49 %285 
                                       f32_4 %286 = OpLoad %49 
                                       f32_4 %287 = OpLoad %142 
                                       f32_4 %288 = OpFAdd %286 %287 
                                                      OpStore %142 %288 
                                       f32_4 %290 = OpLoad %9 
                                       f32_4 %291 = OpVectorShuffle %290 %290 2 3 2 3 
                              Uniform f32_4* %292 = OpAccessChain %17 %42 
                                       f32_4 %293 = OpLoad %292 
                                       f32_4 %294 = OpVectorShuffle %293 %293 0 1 0 1 
                                       f32_4 %295 = OpFMul %291 %294 
                                       f32_4 %297 = OpFAdd %295 %296 
                                                      OpStore %289 %297 
                                       f32_4 %298 = OpLoad %289 
                              Uniform f32_4* %299 = OpAccessChain %17 %42 
                                       f32_4 %300 = OpLoad %299 
                                       f32_4 %301 = OpVectorShuffle %300 %300 0 1 0 1 
                                       f32_4 %302 = OpFDiv %298 %301 
                                                      OpStore %289 %302 
                         read_only Texture2D %304 = OpLoad %179 
                                     sampler %305 = OpLoad %183 
                  read_only Texture2DSampled %306 = OpSampledImage %304 %305 
                                       f32_4 %307 = OpLoad %289 
                                       f32_2 %308 = OpVectorShuffle %307 %307 0 1 
                                       f32_4 %309 = OpImageSampleImplicitLod %306 %308 
                                                      OpStore %303 %309 
                                       f32_4 %310 = OpLoad %142 
                                       f32_4 %311 = OpLoad %303 
                                       f32_4 %312 = OpFAdd %310 %311 
                                                      OpStore %142 %312 
                         read_only Texture2D %313 = OpLoad %179 
                                     sampler %314 = OpLoad %183 
                  read_only Texture2DSampled %315 = OpSampledImage %313 %314 
                                       f32_4 %316 = OpLoad %289 
                                       f32_2 %317 = OpVectorShuffle %316 %316 2 3 
                                       f32_4 %318 = OpImageSampleImplicitLod %315 %317 
                                                      OpStore %289 %318 
                                       f32_4 %319 = OpLoad %142 
                                       f32_4 %320 = OpLoad %289 
                                       f32_4 %321 = OpFAdd %319 %320 
                                                      OpStore %142 %321 
                                       f32_4 %323 = OpLoad %9 
                                       f32_4 %324 = OpVectorShuffle %323 %323 2 3 2 3 
                              Uniform f32_4* %325 = OpAccessChain %17 %42 
                                       f32_4 %326 = OpLoad %325 
                                       f32_4 %327 = OpVectorShuffle %326 %326 0 1 0 1 
                                       f32_4 %328 = OpFMul %324 %327 
                                       f32_4 %330 = OpFAdd %328 %329 
                                                      OpStore %322 %330 
                                       f32_4 %331 = OpLoad %322 
                              Uniform f32_4* %332 = OpAccessChain %17 %42 
                                       f32_4 %333 = OpLoad %332 
                                       f32_4 %334 = OpVectorShuffle %333 %333 0 1 0 1 
                                       f32_4 %335 = OpFDiv %331 %334 
                                                      OpStore %322 %335 
                         read_only Texture2D %337 = OpLoad %179 
                                     sampler %338 = OpLoad %183 
                  read_only Texture2DSampled %339 = OpSampledImage %337 %338 
                                       f32_4 %340 = OpLoad %322 
                                       f32_2 %341 = OpVectorShuffle %340 %340 0 1 
                                       f32_4 %342 = OpImageSampleImplicitLod %339 %341 
                                                      OpStore %336 %342 
                                       f32_4 %343 = OpLoad %142 
                                       f32_4 %344 = OpLoad %336 
                                       f32_4 %345 = OpFAdd %343 %344 
                                                      OpStore %142 %345 
                         read_only Texture2D %346 = OpLoad %179 
                                     sampler %347 = OpLoad %183 
                  read_only Texture2DSampled %348 = OpSampledImage %346 %347 
                                       f32_4 %349 = OpLoad %322 
                                       f32_2 %350 = OpVectorShuffle %349 %349 2 3 
                                       f32_4 %351 = OpImageSampleImplicitLod %348 %350 
                                                      OpStore %322 %351 
                                       f32_4 %352 = OpLoad %142 
                                       f32_4 %353 = OpLoad %322 
                                       f32_4 %354 = OpFAdd %352 %353 
                                                      OpStore %142 %354 
                                       f32_4 %355 = OpLoad %142 
                                       f32_4 %358 = OpFMul %355 %357 
                                                      OpStore %142 %358 
                                       f32_4 %359 = OpLoad %142 
                                       f32_4 %360 = OpExtInst %1 8 %359 
                                                      OpStore %142 %360 
                                       f32_4 %361 = OpLoad %142 
                                Uniform f32* %362 = OpAccessChain %17 %44 
                                         f32 %363 = OpLoad %362 
                                Uniform f32* %364 = OpAccessChain %17 %44 
                                         f32 %365 = OpLoad %364 
                                Uniform f32* %366 = OpAccessChain %17 %44 
                                         f32 %367 = OpLoad %366 
                                Uniform f32* %368 = OpAccessChain %17 %44 
                                         f32 %369 = OpLoad %368 
                                       f32_4 %370 = OpCompositeConstruct %363 %365 %367 %369 
                                         f32 %371 = OpCompositeExtract %370 0 
                                         f32 %372 = OpCompositeExtract %370 1 
                                         f32 %373 = OpCompositeExtract %370 2 
                                         f32 %374 = OpCompositeExtract %370 3 
                                       f32_4 %375 = OpCompositeConstruct %371 %372 %373 %374 
                                       f32_4 %376 = OpFDiv %361 %375 
                                                      OpStore %142 %376 
                                       f32_4 %378 = OpLoad %9 
                                       f32_4 %379 = OpVectorShuffle %378 %378 2 3 2 3 
                              Uniform f32_4* %380 = OpAccessChain %17 %42 
                                       f32_4 %381 = OpLoad %380 
                                       f32_4 %382 = OpVectorShuffle %381 %381 0 1 0 1 
                                       f32_4 %383 = OpFMul %379 %382 
                                       f32_4 %386 = OpFAdd %383 %385 
                                                      OpStore %377 %386 
                                       f32_4 %387 = OpLoad %377 
                              Uniform f32_4* %388 = OpAccessChain %17 %42 
                                       f32_4 %389 = OpLoad %388 
                                       f32_4 %390 = OpVectorShuffle %389 %389 0 1 0 1 
                                       f32_4 %391 = OpFDiv %387 %390 
                                                      OpStore %377 %391 
                         read_only Texture2D %393 = OpLoad %179 
                                     sampler %394 = OpLoad %183 
                  read_only Texture2DSampled %395 = OpSampledImage %393 %394 
                                       f32_4 %396 = OpLoad %377 
                                       f32_2 %397 = OpVectorShuffle %396 %396 0 1 
                                       f32_4 %398 = OpImageSampleImplicitLod %395 %397 
                                                      OpStore %392 %398 
                                       f32_4 %399 = OpLoad %99 
                                       f32_4 %400 = OpLoad %392 
                                       f32_4 %401 = OpFAdd %399 %400 
                                                      OpStore %392 %401 
                                       f32_4 %402 = OpLoad %113 
                                       f32_4 %403 = OpLoad %392 
                                       f32_4 %404 = OpFAdd %402 %403 
                                                      OpStore %392 %404 
                         read_only Texture2D %405 = OpLoad %179 
                                     sampler %406 = OpLoad %183 
                  read_only Texture2DSampled %407 = OpSampledImage %405 %406 
                                       f32_4 %408 = OpLoad %377 
                                       f32_2 %409 = OpVectorShuffle %408 %408 2 3 
                                       f32_4 %410 = OpImageSampleImplicitLod %407 %409 
                                                      OpStore %377 %410 
                                       f32_4 %411 = OpLoad %377 
                                       f32_4 %412 = OpLoad %392 
                                       f32_4 %413 = OpFAdd %411 %412 
                                                      OpStore %377 %413 
                                       f32_4 %414 = OpLoad %238 
                                       f32_4 %415 = OpLoad %377 
                                       f32_4 %416 = OpFAdd %414 %415 
                                                      OpStore %377 %416 
                                       f32_4 %417 = OpLoad %49 
                                       f32_4 %418 = OpLoad %377 
                                       f32_4 %419 = OpFAdd %417 %418 
                                                      OpStore %377 %419 
                                       f32_4 %420 = OpLoad %9 
                                       f32_4 %421 = OpVectorShuffle %420 %420 2 3 2 3 
                              Uniform f32_4* %422 = OpAccessChain %17 %42 
                                       f32_4 %423 = OpLoad %422 
                                       f32_4 %424 = OpVectorShuffle %423 %423 0 1 0 1 
                                       f32_4 %425 = OpFMul %421 %424 
                                       f32_4 %428 = OpFAdd %425 %427 
                                                      OpStore %392 %428 
                                       f32_4 %429 = OpLoad %392 
                              Uniform f32_4* %430 = OpAccessChain %17 %42 
                                       f32_4 %431 = OpLoad %430 
                                       f32_4 %432 = OpVectorShuffle %431 %431 0 1 0 1 
                                       f32_4 %433 = OpFDiv %429 %432 
                                                      OpStore %392 %433 
                         read_only Texture2D %435 = OpLoad %179 
                                     sampler %436 = OpLoad %183 
                  read_only Texture2DSampled %437 = OpSampledImage %435 %436 
                                       f32_4 %438 = OpLoad %392 
                                       f32_2 %439 = OpVectorShuffle %438 %438 0 1 
                                       f32_4 %440 = OpImageSampleImplicitLod %437 %439 
                                                      OpStore %434 %440 
                                       f32_4 %441 = OpLoad %377 
                                       f32_4 %442 = OpLoad %434 
                                       f32_4 %443 = OpFAdd %441 %442 
                                                      OpStore %377 %443 
                                       f32_4 %444 = OpLoad %289 
                                       f32_4 %445 = OpLoad %377 
                                       f32_4 %446 = OpFAdd %444 %445 
                                                      OpStore %377 %446 
                                       f32_4 %447 = OpLoad %336 
                                       f32_4 %448 = OpLoad %377 
                                       f32_4 %449 = OpFAdd %447 %448 
                                                      OpStore %377 %449 
                                       f32_4 %450 = OpLoad %113 
                                       f32_4 %451 = OpLoad %253 
                                       f32_4 %452 = OpFAdd %450 %451 
                                                      OpStore %434 %452 
                         read_only Texture2D %453 = OpLoad %179 
                                     sampler %454 = OpLoad %183 
                  read_only Texture2DSampled %455 = OpSampledImage %453 %454 
                                       f32_4 %456 = OpLoad %392 
                                       f32_2 %457 = OpVectorShuffle %456 %456 2 3 
                                       f32_4 %458 = OpImageSampleImplicitLod %455 %457 
                                                      OpStore %392 %458 
                                       f32_4 %459 = OpLoad %392 
                                       f32_4 %460 = OpLoad %434 
                                       f32_4 %461 = OpFAdd %459 %460 
                                                      OpStore %392 %461 
                                       f32_4 %462 = OpLoad %49 
                                       f32_4 %463 = OpLoad %392 
                                       f32_4 %464 = OpFAdd %462 %463 
                                                      OpStore %392 %464 
                                       f32_4 %465 = OpLoad %303 
                                       f32_4 %466 = OpLoad %392 
                                       f32_4 %467 = OpFAdd %465 %466 
                                                      OpStore %392 %467 
                                       f32_4 %468 = OpLoad %9 
                                       f32_4 %469 = OpVectorShuffle %468 %468 2 3 2 3 
                              Uniform f32_4* %470 = OpAccessChain %17 %42 
                                       f32_4 %471 = OpLoad %470 
                                       f32_4 %472 = OpVectorShuffle %471 %471 0 1 0 1 
                                       f32_4 %473 = OpFMul %469 %472 
                                       f32_4 %475 = OpFAdd %473 %474 
                                                      OpStore %434 %475 
                                       f32_4 %476 = OpLoad %434 
                              Uniform f32_4* %477 = OpAccessChain %17 %42 
                                       f32_4 %478 = OpLoad %477 
                                       f32_4 %479 = OpVectorShuffle %478 %478 0 1 0 1 
                                       f32_4 %480 = OpFDiv %476 %479 
                                                      OpStore %434 %480 
                         read_only Texture2D %482 = OpLoad %179 
                                     sampler %483 = OpLoad %183 
                  read_only Texture2DSampled %484 = OpSampledImage %482 %483 
                                       f32_4 %485 = OpLoad %434 
                                       f32_2 %486 = OpVectorShuffle %485 %485 0 1 
                                       f32_4 %487 = OpImageSampleImplicitLod %484 %486 
                                                      OpStore %481 %487 
                                       f32_4 %488 = OpLoad %392 
                                       f32_4 %489 = OpLoad %481 
                                       f32_4 %490 = OpFAdd %488 %489 
                                                      OpStore %392 %490 
                                       f32_4 %491 = OpLoad %336 
                                       f32_4 %492 = OpLoad %392 
                                       f32_4 %493 = OpFAdd %491 %492 
                                                      OpStore %392 %493 
                                       f32_4 %494 = OpLoad %322 
                                       f32_4 %495 = OpLoad %392 
                                       f32_4 %496 = OpFAdd %494 %495 
                                                      OpStore %392 %496 
                         read_only Texture2D %497 = OpLoad %179 
                                     sampler %498 = OpLoad %183 
                  read_only Texture2DSampled %499 = OpSampledImage %497 %498 
                                       f32_4 %500 = OpLoad %434 
                                       f32_2 %501 = OpVectorShuffle %500 %500 2 3 
                                       f32_4 %502 = OpImageSampleImplicitLod %499 %501 
                                                      OpStore %434 %502 
                                       f32_4 %503 = OpLoad %392 
                                       f32_4 %504 = OpLoad %434 
                                       f32_4 %505 = OpFAdd %503 %504 
                                                      OpStore %392 %505 
                                       f32_4 %506 = OpLoad %392 
                                       f32_4 %509 = OpFMul %506 %508 
                                                      OpStore %392 %509 
                                       f32_4 %510 = OpLoad %377 
                                       f32_4 %511 = OpFMul %510 %508 
                                       f32_4 %512 = OpLoad %392 
                                       f32_4 %513 = OpFNegate %512 
                                       f32_4 %514 = OpFAdd %511 %513 
                                                      OpStore %377 %514 
                                       f32_4 %515 = OpLoad %9 
                                       f32_4 %516 = OpVectorShuffle %515 %515 2 3 2 3 
                              Uniform f32_4* %517 = OpAccessChain %17 %42 
                                       f32_4 %518 = OpLoad %517 
                                       f32_4 %519 = OpVectorShuffle %518 %518 0 1 0 1 
                                       f32_4 %520 = OpFMul %516 %519 
                                       f32_4 %522 = OpFAdd %520 %521 
                                                      OpStore %392 %522 
                                       f32_4 %523 = OpLoad %392 
                              Uniform f32_4* %524 = OpAccessChain %17 %42 
                                       f32_4 %525 = OpLoad %524 
                                       f32_4 %526 = OpVectorShuffle %525 %525 0 1 0 1 
                                       f32_4 %527 = OpFDiv %523 %526 
                                                      OpStore %392 %527 
                         read_only Texture2D %528 = OpLoad %179 
                                     sampler %529 = OpLoad %183 
                  read_only Texture2DSampled %530 = OpSampledImage %528 %529 
                                       f32_4 %531 = OpLoad %392 
                                       f32_2 %532 = OpVectorShuffle %531 %531 0 1 
                                       f32_4 %533 = OpImageSampleImplicitLod %530 %532 
                                                      OpStore %434 %533 
                         read_only Texture2D %534 = OpLoad %179 
                                     sampler %535 = OpLoad %183 
                  read_only Texture2DSampled %536 = OpSampledImage %534 %535 
                                       f32_4 %537 = OpLoad %392 
                                       f32_2 %538 = OpVectorShuffle %537 %537 2 3 
                                       f32_4 %539 = OpImageSampleImplicitLod %536 %538 
                                                      OpStore %392 %539 
                                       f32_4 %540 = OpLoad %392 
                                       f32_4 %541 = OpLoad %434 
                                       f32_4 %542 = OpFAdd %540 %541 
                                                      OpStore %392 %542 
                                       f32_4 %543 = OpLoad %9 
                                       f32_4 %544 = OpVectorShuffle %543 %543 2 3 2 3 
                              Uniform f32_4* %545 = OpAccessChain %17 %42 
                                       f32_4 %546 = OpLoad %545 
                                       f32_4 %547 = OpVectorShuffle %546 %546 0 1 0 1 
                                       f32_4 %548 = OpFMul %544 %547 
                                       f32_4 %550 = OpFAdd %548 %549 
                                                      OpStore %434 %550 
                                       f32_4 %551 = OpLoad %434 
                              Uniform f32_4* %552 = OpAccessChain %17 %42 
                                       f32_4 %553 = OpLoad %552 
                                       f32_4 %554 = OpVectorShuffle %553 %553 0 1 0 1 
                                       f32_4 %555 = OpFDiv %551 %554 
                                                      OpStore %434 %555 
                         read_only Texture2D %556 = OpLoad %179 
                                     sampler %557 = OpLoad %183 
                  read_only Texture2DSampled %558 = OpSampledImage %556 %557 
                                       f32_4 %559 = OpLoad %434 
                                       f32_2 %560 = OpVectorShuffle %559 %559 0 1 
                                       f32_4 %561 = OpImageSampleImplicitLod %558 %560 
                                                      OpStore %481 %561 
                                       f32_4 %562 = OpLoad %392 
                                       f32_4 %563 = OpLoad %481 
                                       f32_4 %564 = OpFAdd %562 %563 
                                                      OpStore %392 %564 
                                       f32_4 %565 = OpLoad %99 
                                       f32_4 %566 = OpLoad %392 
                                       f32_4 %567 = OpFAdd %565 %566 
                                                      OpStore %99 %567 
                                       f32_4 %568 = OpLoad %113 
                                       f32_4 %569 = OpLoad %99 
                                       f32_4 %570 = OpFAdd %568 %569 
                                                      OpStore %113 %570 
                                       f32_4 %571 = OpLoad %253 
                                       f32_4 %572 = OpLoad %113 
                                       f32_4 %573 = OpFAdd %571 %572 
                                                      OpStore %113 %573 
                                       f32_4 %574 = OpLoad %238 
                                       f32_4 %575 = OpLoad %113 
                                       f32_4 %576 = OpFAdd %574 %575 
                                                      OpStore %113 %576 
                                       f32_4 %577 = OpLoad %49 
                                       f32_4 %578 = OpLoad %113 
                                       f32_4 %579 = OpFAdd %577 %578 
                                                      OpStore %113 %579 
                                       f32_4 %580 = OpLoad %303 
                                       f32_4 %581 = OpLoad %113 
                                       f32_4 %582 = OpFAdd %580 %581 
                                                      OpStore %113 %582 
                                       f32_4 %583 = OpLoad %49 
                                       f32_4 %584 = OpLoad %238 
                                       f32_4 %585 = OpFAdd %583 %584 
                                                      OpStore %49 %585 
                                       f32_4 %586 = OpLoad %303 
                                       f32_4 %587 = OpLoad %49 
                                       f32_4 %588 = OpFAdd %586 %587 
                                                      OpStore %49 %588 
                                       f32_4 %589 = OpLoad %289 
                                       f32_4 %590 = OpLoad %49 
                                       f32_4 %591 = OpFAdd %589 %590 
                                                      OpStore %49 %591 
                                       f32_4 %592 = OpLoad %336 
                                       f32_4 %593 = OpLoad %49 
                                       f32_4 %594 = OpFAdd %592 %593 
                                                      OpStore %49 %594 
                                       f32_4 %595 = OpLoad %322 
                                       f32_4 %596 = OpLoad %49 
                                       f32_4 %597 = OpFAdd %595 %596 
                                                      OpStore %49 %597 
                         read_only Texture2D %598 = OpLoad %179 
                                     sampler %599 = OpLoad %183 
                  read_only Texture2DSampled %600 = OpSampledImage %598 %599 
                                       f32_4 %601 = OpLoad %434 
                                       f32_2 %602 = OpVectorShuffle %601 %601 2 3 
                                       f32_4 %603 = OpImageSampleImplicitLod %600 %602 
                                                      OpStore %99 %603 
                                       f32_4 %604 = OpLoad %49 
                                       f32_4 %605 = OpLoad %99 
                                       f32_4 %606 = OpFAdd %604 %605 
                                                      OpStore %49 %606 
                                       f32_4 %607 = OpLoad %9 
                              Uniform f32_4* %608 = OpAccessChain %17 %42 
                                       f32_4 %609 = OpLoad %608 
                                       f32_4 %610 = OpVectorShuffle %609 %609 0 1 0 1 
                                       f32_4 %611 = OpFMul %607 %610 
                                       f32_4 %613 = OpFAdd %611 %612 
                                                      OpStore %9 %613 
                                       f32_4 %614 = OpLoad %9 
                              Uniform f32_4* %615 = OpAccessChain %17 %42 
                                       f32_4 %616 = OpLoad %615 
                                       f32_4 %617 = OpVectorShuffle %616 %616 0 1 0 1 
                                       f32_4 %618 = OpFDiv %614 %617 
                                                      OpStore %9 %618 
                         read_only Texture2D %619 = OpLoad %179 
                                     sampler %620 = OpLoad %183 
                  read_only Texture2DSampled %621 = OpSampledImage %619 %620 
                                       f32_4 %622 = OpLoad %9 
                                       f32_2 %623 = OpVectorShuffle %622 %622 0 1 
                                       f32_4 %624 = OpImageSampleImplicitLod %621 %623 
                                                      OpStore %99 %624 
                                       f32_4 %625 = OpLoad %49 
                                       f32_4 %626 = OpLoad %99 
                                       f32_4 %627 = OpFAdd %625 %626 
                                                      OpStore %49 %627 
                         read_only Texture2D %628 = OpLoad %179 
                                     sampler %629 = OpLoad %183 
                  read_only Texture2DSampled %630 = OpSampledImage %628 %629 
                                       f32_4 %631 = OpLoad %9 
                                       f32_2 %632 = OpVectorShuffle %631 %631 2 3 
                                       f32_4 %633 = OpImageSampleImplicitLod %630 %632 
                                                      OpStore %9 %633 
                                       f32_4 %634 = OpLoad %9 
                                       f32_4 %635 = OpLoad %49 
                                       f32_4 %636 = OpFAdd %634 %635 
                                                      OpStore %9 %636 
                                       f32_4 %637 = OpLoad %9 
                                       f32_4 %638 = OpFMul %637 %508 
                                                      OpStore %9 %638 
                                       f32_4 %639 = OpLoad %113 
                                       f32_4 %640 = OpFMul %639 %508 
                                       f32_4 %641 = OpLoad %9 
                                       f32_4 %642 = OpFNegate %641 
                                       f32_4 %643 = OpFAdd %640 %642 
                                                      OpStore %9 %643 
                                       f32_4 %644 = OpLoad %9 
                                       f32_4 %645 = OpExtInst %1 4 %644 
                                       f32_4 %646 = OpLoad %377 
                                       f32_4 %647 = OpExtInst %1 4 %646 
                                       f32_4 %648 = OpFAdd %645 %647 
                                                      OpStore %9 %648 
                                       f32_4 %649 = OpLoad %9 
                                       f32_4 %652 = OpFMul %649 %651 
                                                      OpStore %9 %652 
                                       f32_3 %653 = OpLoad %60 
                                       f32_3 %655 = OpFMul %653 %654 
                                       f32_4 %656 = OpLoad %49 
                                       f32_4 %657 = OpVectorShuffle %656 %655 4 5 6 3 
                                                      OpStore %49 %657 
                                Private f32* %659 = OpAccessChain %49 %658 
                                                      OpStore %659 %384 
                                       f32_4 %660 = OpLoad %142 
                                       f32_4 %661 = OpFNegate %660 
                                       f32_4 %662 = OpLoad %49 
                                       f32_4 %663 = OpFAdd %661 %662 
                                                      OpStore %49 %663 
                                Uniform f32* %664 = OpAccessChain %17 %46 
                                         f32 %665 = OpLoad %664 
                                Uniform f32* %666 = OpAccessChain %17 %46 
                                         f32 %667 = OpLoad %666 
                                Uniform f32* %668 = OpAccessChain %17 %46 
                                         f32 %669 = OpLoad %668 
                                Uniform f32* %670 = OpAccessChain %17 %46 
                                         f32 %671 = OpLoad %670 
                                       f32_4 %672 = OpCompositeConstruct %665 %667 %669 %671 
                                         f32 %673 = OpCompositeExtract %672 0 
                                         f32 %674 = OpCompositeExtract %672 1 
                                         f32 %675 = OpCompositeExtract %672 2 
                                         f32 %676 = OpCompositeExtract %672 3 
                                       f32_4 %677 = OpCompositeConstruct %673 %674 %675 %676 
                                       f32_4 %678 = OpLoad %49 
                                       f32_4 %679 = OpFMul %677 %678 
                                       f32_4 %680 = OpLoad %142 
                                       f32_4 %681 = OpFAdd %679 %680 
                                                      OpStore %49 %681 
                                Uniform f32* %682 = OpAccessChain %17 %39 
                                         f32 %683 = OpLoad %682 
                                         f32 %685 = OpFAdd %683 %684 
                                Private f32* %686 = OpAccessChain %60 %36 
                                                      OpStore %686 %685 
                                       f32_4 %687 = OpLoad %9 
                                       f32_4 %688 = OpLoad %9 
                                         f32 %689 = OpDot %687 %688 
                                Private f32* %690 = OpAccessChain %9 %36 
                                                      OpStore %690 %689 
                                Private f32* %691 = OpAccessChain %9 %36 
                                         f32 %692 = OpLoad %691 
                                         f32 %693 = OpExtInst %1 31 %692 
                                Private f32* %694 = OpAccessChain %9 %36 
                                                      OpStore %694 %693 
                                Private f32* %696 = OpAccessChain %60 %36 
                                         f32 %697 = OpLoad %696 
                                Private f32* %698 = OpAccessChain %9 %36 
                                         f32 %699 = OpLoad %698 
                                        bool %700 = OpFOrdLessThan %697 %699 
                                                      OpStore %695 %700 
                                        bool %703 = OpLoad %695 
                                                      OpSelectionMerge %707 None 
                                                      OpBranchConditional %703 %706 %709 
                                             %706 = OpLabel 
                                                      OpStore %705 %708 
                                                      OpBranch %707 
                                             %709 = OpLabel 
                                       f32_4 %710 = OpLoad %49 
                                       f32_3 %711 = OpVectorShuffle %710 %710 0 1 2 
                                                      OpStore %705 %711 
                                                      OpBranch %707 
                                             %707 = OpLabel 
                                       f32_3 %712 = OpLoad %705 
                                       f32_4 %713 = OpLoad %702 
                                       f32_4 %714 = OpVectorShuffle %713 %712 4 5 6 3 
                                                      OpStore %702 %714 
                                Private f32* %715 = OpAccessChain %49 %658 
                                         f32 %716 = OpLoad %715 
                                 Output f32* %718 = OpAccessChain %702 %658 
                                                      OpStore %718 %716 
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