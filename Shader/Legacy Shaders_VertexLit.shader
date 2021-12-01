//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Legacy Shaders/VertexLit" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_SpecColor ("Spec Color", Color) = (1,1,1,1)
_Emission ("Emissive Color", Color) = (0,0,0,0)
_Shininess ("Shininess", Range(0.01, 1)) = 0.7
_MainTex ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "LIGHTMODE" = "Vertex" "RenderType" = "Opaque" }
  Fog {
   Mode Off
  }
  GpuProgramID 111313
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
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Emission;
uniform 	float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec3 vs_COLOR1;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat21;
float u_xlat22;
int u_xlati23;
float u_xlat24;
bool u_xlatb24;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + _Emission.xyz;
    u_xlat22 = _Shininess * 128.0;
    u_xlat3.xyz = u_xlat2.xyz;
    u_xlat4.x = float(0.0);
    u_xlat4.y = float(0.0);
    u_xlat4.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat24 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat24 = max(u_xlat24, 0.0);
        u_xlat5.xyz = vec3(u_xlat24) * _Color.xyz;
        u_xlat5.xyz = u_xlat5.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb24 = 0.0<u_xlat24;
        if(u_xlatb24){
            u_xlat6.xyz = (-u_xlat0.xyz) * vec3(u_xlat21) + unity_LightPosition[u_xlati_loop_1].xyz;
            u_xlat24 = dot(u_xlat6.xyz, u_xlat6.xyz);
            u_xlat24 = inversesqrt(u_xlat24);
            u_xlat6.xyz = vec3(u_xlat24) * u_xlat6.xyz;
            u_xlat24 = dot(u_xlat1.xyz, u_xlat6.xyz);
            u_xlat24 = max(u_xlat24, 0.0);
            u_xlat24 = log2(u_xlat24);
            u_xlat24 = u_xlat22 * u_xlat24;
            u_xlat24 = exp2(u_xlat24);
            u_xlat24 = min(u_xlat24, 1.0);
            u_xlat24 = u_xlat24 * 0.5;
            u_xlat4.xyz = vec3(u_xlat24) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat4.xyz;
        }
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat5.xyz = min(u_xlat5.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat3.xyz = u_xlat3.xyz + u_xlat5.xyz;
    }
    vs_COLOR1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat3.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec3 vs_COLOR1;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vs_COLOR1.xyz;
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
; Bound: 611
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %303 %335 %502 %514 %536 %537 %595 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %22 0 Offset 22 
                                                      OpMemberDecorate %22 1 Offset 22 
                                                      OpMemberDecorate %22 2 Offset 22 
                                                      OpMemberDecorate %22 3 Offset 22 
                                                      OpMemberDecorate %22 4 Offset 22 
                                                      OpMemberDecorate %22 5 Offset 22 
                                                      OpMemberDecorate %22 6 Offset 22 
                                                      OpMemberDecorate %22 7 Offset 22 
                                                      OpMemberDecorate %22 8 Offset 22 
                                                      OpMemberDecorate %22 9 Offset 22 
                                                      OpMemberDecorate %22 10 Offset 22 
                                                      OpMemberDecorate %22 11 Offset 22 
                                                      OpMemberDecorate %22 12 Offset 22 
                                                      OpMemberDecorate %22 13 Offset 22 
                                                      OpDecorate %22 Block 
                                                      OpDecorate %24 DescriptorSet 24 
                                                      OpDecorate %24 Binding 24 
                                                      OpDecorate %303 Location 303 
                                                      OpDecorate %335 Location 335 
                                                      OpDecorate %502 Location 502 
                                                      OpDecorate %514 Location 514 
                                                      OpDecorate vs_TEXCOORD0 Location 536 
                                                      OpDecorate %537 Location 537 
                                                      OpMemberDecorate %593 0 BuiltIn 593 
                                                      OpMemberDecorate %593 1 BuiltIn 593 
                                                      OpMemberDecorate %593 2 BuiltIn 593 
                                                      OpDecorate %593 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                          u32 %14 = OpConstant 4 
                                              %15 = OpTypeArray %7 %14 
                                              %16 = OpTypeArray %7 %14 
                                              %17 = OpTypeArray %7 %14 
                                              %18 = OpTypeArray %7 %14 
                                              %19 = OpTypeArray %7 %14 
                                              %20 = OpTypeInt 32 1 
                                              %21 = OpTypeVector %20 4 
                                              %22 = OpTypeStruct %12 %13 %15 %16 %7 %17 %18 %19 %7 %7 %7 %6 %21 %7 
                                              %23 = OpTypePointer Uniform %22 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32; i32_4; f32_4;}* %24 = OpVariable Uniform 
                                          i32 %25 = OpConstant 2 
                                          i32 %26 = OpConstant 0 
                                              %27 = OpTypeVector %6 3 
                                              %28 = OpTypePointer Uniform %7 
                                          i32 %32 = OpConstant 5 
                                          i32 %33 = OpConstant 1 
                                          i32 %64 = OpConstant 3 
                               Private f32_4* %77 = OpVariable Private 
                                             %123 = OpTypePointer Private %27 
                              Private f32_3* %124 = OpVariable Private 
                              Private f32_3* %159 = OpVariable Private 
                              Private f32_3* %194 = OpVariable Private 
                                         i32 %198 = OpConstant 6 
                              Private f32_3* %230 = OpVariable Private 
                              Private f32_3* %265 = OpVariable Private 
                                             %302 = OpTypePointer Input %27 
                                Input f32_3* %303 = OpVariable Input 
                                Input f32_3* %335 = OpVariable Input 
                                         u32 %338 = OpConstant 0 
                                             %339 = OpTypePointer Private %6 
                                         u32 %344 = OpConstant 1 
                                         u32 %349 = OpConstant 2 
                                Private f32* %351 = OpVariable Private 
                                         i32 %373 = OpConstant 8 
                                         i32 %377 = OpConstant 4 
                                         i32 %382 = OpConstant 10 
                                Private f32* %387 = OpVariable Private 
                                         i32 %388 = OpConstant 11 
                                             %389 = OpTypePointer Uniform %6 
                                         f32 %392 = OpConstant 3.674022E-40 
                                         f32 %395 = OpConstant 3.674022E-40 
                                             %399 = OpTypePointer Function %20 
                                         i32 %407 = OpConstant 12 
                                             %408 = OpTypePointer Uniform %20 
                                             %411 = OpTypeBool 
                                Private f32* %413 = OpVariable Private 
                                             %435 = OpTypePointer Private %411 
                               Private bool* %436 = OpVariable Private 
                                         f32 %476 = OpConstant 3.674022E-40 
                                         f32 %479 = OpConstant 3.674022E-40 
                                       f32_3 %491 = OpConstantComposite %479 %479 %479 
                                       f32_3 %494 = OpConstantComposite %476 %476 %476 
                                             %501 = OpTypePointer Output %27 
                               Output f32_3* %502 = OpVariable Output 
                                         i32 %504 = OpConstant 9 
                                             %513 = OpTypePointer Output %7 
                               Output f32_4* %514 = OpVariable Output 
                                         u32 %525 = OpConstant 3 
                                             %528 = OpTypePointer Output %6 
                                             %534 = OpTypeVector %6 2 
                                             %535 = OpTypePointer Output %534 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_3* %537 = OpVariable Input 
                                         i32 %540 = OpConstant 13 
                                         i32 %574 = OpConstant 7 
                                             %592 = OpTypeArray %6 %344 
                                             %593 = OpTypeStruct %7 %6 %592 
                                             %594 = OpTypePointer Output %593 
        Output struct {f32_4; f32; f32[1];}* %595 = OpVariable Output 
                                             %609 = OpTypePointer Private %20 
                                Private i32* %610 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %400 = OpVariable Function 
                               Uniform f32_4* %29 = OpAccessChain %24 %25 %26 
                                        f32_4 %30 = OpLoad %29 
                                        f32_3 %31 = OpVectorShuffle %30 %30 1 1 1 
                               Uniform f32_4* %34 = OpAccessChain %24 %32 %33 
                                        f32_4 %35 = OpLoad %34 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 1 2 
                                        f32_3 %37 = OpFMul %31 %36 
                                        f32_4 %38 = OpLoad %9 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 6 3 
                                                      OpStore %9 %39 
                               Uniform f32_4* %40 = OpAccessChain %24 %32 %26 
                                        f32_4 %41 = OpLoad %40 
                                        f32_3 %42 = OpVectorShuffle %41 %41 0 1 2 
                               Uniform f32_4* %43 = OpAccessChain %24 %25 %26 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 0 0 
                                        f32_3 %46 = OpFMul %42 %45 
                                        f32_4 %47 = OpLoad %9 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                                        f32_3 %49 = OpFAdd %46 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %49 4 5 6 3 
                                                      OpStore %9 %51 
                               Uniform f32_4* %52 = OpAccessChain %24 %32 %25 
                                        f32_4 %53 = OpLoad %52 
                                        f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                               Uniform f32_4* %55 = OpAccessChain %24 %25 %26 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 2 2 2 
                                        f32_3 %58 = OpFMul %54 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
                                                      OpStore %9 %63 
                               Uniform f32_4* %65 = OpAccessChain %24 %32 %64 
                                        f32_4 %66 = OpLoad %65 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                               Uniform f32_4* %68 = OpAccessChain %24 %25 %26 
                                        f32_4 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 3 3 3 
                                        f32_3 %71 = OpFMul %67 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                        f32_3 %74 = OpFAdd %71 %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                                      OpStore %9 %76 
                               Uniform f32_4* %78 = OpAccessChain %24 %25 %33 
                                        f32_4 %79 = OpLoad %78 
                                        f32_3 %80 = OpVectorShuffle %79 %79 1 1 1 
                               Uniform f32_4* %81 = OpAccessChain %24 %32 %33 
                                        f32_4 %82 = OpLoad %81 
                                        f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
                                        f32_3 %84 = OpFMul %80 %83 
                                        f32_4 %85 = OpLoad %77 
                                        f32_4 %86 = OpVectorShuffle %85 %84 4 5 6 3 
                                                      OpStore %77 %86 
                               Uniform f32_4* %87 = OpAccessChain %24 %32 %26 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                               Uniform f32_4* %90 = OpAccessChain %24 %25 %33 
                                        f32_4 %91 = OpLoad %90 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 0 0 
                                        f32_3 %93 = OpFMul %89 %92 
                                        f32_4 %94 = OpLoad %77 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_3 %96 = OpFAdd %93 %95 
                                        f32_4 %97 = OpLoad %77 
                                        f32_4 %98 = OpVectorShuffle %97 %96 4 5 6 3 
                                                      OpStore %77 %98 
                               Uniform f32_4* %99 = OpAccessChain %24 %32 %25 
                                       f32_4 %100 = OpLoad %99 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                              Uniform f32_4* %102 = OpAccessChain %24 %25 %33 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 2 2 2 
                                       f32_3 %105 = OpFMul %101 %104 
                                       f32_4 %106 = OpLoad %77 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                       f32_3 %108 = OpFAdd %105 %107 
                                       f32_4 %109 = OpLoad %77 
                                       f32_4 %110 = OpVectorShuffle %109 %108 4 5 6 3 
                                                      OpStore %77 %110 
                              Uniform f32_4* %111 = OpAccessChain %24 %32 %64 
                                       f32_4 %112 = OpLoad %111 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                              Uniform f32_4* %114 = OpAccessChain %24 %25 %33 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 3 3 3 
                                       f32_3 %117 = OpFMul %113 %116 
                                       f32_4 %118 = OpLoad %77 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpFAdd %117 %119 
                                       f32_4 %121 = OpLoad %77 
                                       f32_4 %122 = OpVectorShuffle %121 %120 4 5 6 3 
                                                      OpStore %77 %122 
                              Uniform f32_4* %125 = OpAccessChain %24 %25 %25 
                                       f32_4 %126 = OpLoad %125 
                                       f32_3 %127 = OpVectorShuffle %126 %126 1 1 1 
                              Uniform f32_4* %128 = OpAccessChain %24 %32 %33 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32_3 %131 = OpFMul %127 %130 
                                                      OpStore %124 %131 
                              Uniform f32_4* %132 = OpAccessChain %24 %32 %26 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                              Uniform f32_4* %135 = OpAccessChain %24 %25 %25 
                                       f32_4 %136 = OpLoad %135 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 0 0 
                                       f32_3 %138 = OpFMul %134 %137 
                                       f32_3 %139 = OpLoad %124 
                                       f32_3 %140 = OpFAdd %138 %139 
                                                      OpStore %124 %140 
                              Uniform f32_4* %141 = OpAccessChain %24 %32 %25 
                                       f32_4 %142 = OpLoad %141 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                              Uniform f32_4* %144 = OpAccessChain %24 %25 %25 
                                       f32_4 %145 = OpLoad %144 
                                       f32_3 %146 = OpVectorShuffle %145 %145 2 2 2 
                                       f32_3 %147 = OpFMul %143 %146 
                                       f32_3 %148 = OpLoad %124 
                                       f32_3 %149 = OpFAdd %147 %148 
                                                      OpStore %124 %149 
                              Uniform f32_4* %150 = OpAccessChain %24 %32 %64 
                                       f32_4 %151 = OpLoad %150 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                              Uniform f32_4* %153 = OpAccessChain %24 %25 %25 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 3 3 3 
                                       f32_3 %156 = OpFMul %152 %155 
                                       f32_3 %157 = OpLoad %124 
                                       f32_3 %158 = OpFAdd %156 %157 
                                                      OpStore %124 %158 
                              Uniform f32_4* %160 = OpAccessChain %24 %25 %64 
                                       f32_4 %161 = OpLoad %160 
                                       f32_3 %162 = OpVectorShuffle %161 %161 1 1 1 
                              Uniform f32_4* %163 = OpAccessChain %24 %32 %33 
                                       f32_4 %164 = OpLoad %163 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_3 %166 = OpFMul %162 %165 
                                                      OpStore %159 %166 
                              Uniform f32_4* %167 = OpAccessChain %24 %32 %26 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                              Uniform f32_4* %170 = OpAccessChain %24 %25 %64 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 0 0 
                                       f32_3 %173 = OpFMul %169 %172 
                                       f32_3 %174 = OpLoad %159 
                                       f32_3 %175 = OpFAdd %173 %174 
                                                      OpStore %159 %175 
                              Uniform f32_4* %176 = OpAccessChain %24 %32 %25 
                                       f32_4 %177 = OpLoad %176 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                              Uniform f32_4* %179 = OpAccessChain %24 %25 %64 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 2 2 2 
                                       f32_3 %182 = OpFMul %178 %181 
                                       f32_3 %183 = OpLoad %159 
                                       f32_3 %184 = OpFAdd %182 %183 
                                                      OpStore %159 %184 
                              Uniform f32_4* %185 = OpAccessChain %24 %32 %64 
                                       f32_4 %186 = OpLoad %185 
                                       f32_3 %187 = OpVectorShuffle %186 %186 0 1 2 
                              Uniform f32_4* %188 = OpAccessChain %24 %25 %64 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 3 3 3 
                                       f32_3 %191 = OpFMul %187 %190 
                                       f32_3 %192 = OpLoad %159 
                                       f32_3 %193 = OpFAdd %191 %192 
                                                      OpStore %159 %193 
                              Uniform f32_4* %195 = OpAccessChain %24 %64 %33 
                                       f32_4 %196 = OpLoad %195 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
                              Uniform f32_4* %199 = OpAccessChain %24 %198 %26 
                                       f32_4 %200 = OpLoad %199 
                                       f32_3 %201 = OpVectorShuffle %200 %200 1 1 1 
                                       f32_3 %202 = OpFMul %197 %201 
                                                      OpStore %194 %202 
                              Uniform f32_4* %203 = OpAccessChain %24 %64 %26 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                              Uniform f32_4* %206 = OpAccessChain %24 %198 %26 
                                       f32_4 %207 = OpLoad %206 
                                       f32_3 %208 = OpVectorShuffle %207 %207 0 0 0 
                                       f32_3 %209 = OpFMul %205 %208 
                                       f32_3 %210 = OpLoad %194 
                                       f32_3 %211 = OpFAdd %209 %210 
                                                      OpStore %194 %211 
                              Uniform f32_4* %212 = OpAccessChain %24 %64 %25 
                                       f32_4 %213 = OpLoad %212 
                                       f32_3 %214 = OpVectorShuffle %213 %213 0 1 2 
                              Uniform f32_4* %215 = OpAccessChain %24 %198 %26 
                                       f32_4 %216 = OpLoad %215 
                                       f32_3 %217 = OpVectorShuffle %216 %216 2 2 2 
                                       f32_3 %218 = OpFMul %214 %217 
                                       f32_3 %219 = OpLoad %194 
                                       f32_3 %220 = OpFAdd %218 %219 
                                                      OpStore %194 %220 
                              Uniform f32_4* %221 = OpAccessChain %24 %64 %64 
                                       f32_4 %222 = OpLoad %221 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                              Uniform f32_4* %224 = OpAccessChain %24 %198 %26 
                                       f32_4 %225 = OpLoad %224 
                                       f32_3 %226 = OpVectorShuffle %225 %225 3 3 3 
                                       f32_3 %227 = OpFMul %223 %226 
                                       f32_3 %228 = OpLoad %194 
                                       f32_3 %229 = OpFAdd %227 %228 
                                                      OpStore %194 %229 
                              Uniform f32_4* %231 = OpAccessChain %24 %64 %33 
                                       f32_4 %232 = OpLoad %231 
                                       f32_3 %233 = OpVectorShuffle %232 %232 0 1 2 
                              Uniform f32_4* %234 = OpAccessChain %24 %198 %33 
                                       f32_4 %235 = OpLoad %234 
                                       f32_3 %236 = OpVectorShuffle %235 %235 1 1 1 
                                       f32_3 %237 = OpFMul %233 %236 
                                                      OpStore %230 %237 
                              Uniform f32_4* %238 = OpAccessChain %24 %64 %26 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 0 1 2 
                              Uniform f32_4* %241 = OpAccessChain %24 %198 %33 
                                       f32_4 %242 = OpLoad %241 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 0 0 
                                       f32_3 %244 = OpFMul %240 %243 
                                       f32_3 %245 = OpLoad %230 
                                       f32_3 %246 = OpFAdd %244 %245 
                                                      OpStore %230 %246 
                              Uniform f32_4* %247 = OpAccessChain %24 %64 %25 
                                       f32_4 %248 = OpLoad %247 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                              Uniform f32_4* %250 = OpAccessChain %24 %198 %33 
                                       f32_4 %251 = OpLoad %250 
                                       f32_3 %252 = OpVectorShuffle %251 %251 2 2 2 
                                       f32_3 %253 = OpFMul %249 %252 
                                       f32_3 %254 = OpLoad %230 
                                       f32_3 %255 = OpFAdd %253 %254 
                                                      OpStore %230 %255 
                              Uniform f32_4* %256 = OpAccessChain %24 %64 %64 
                                       f32_4 %257 = OpLoad %256 
                                       f32_3 %258 = OpVectorShuffle %257 %257 0 1 2 
                              Uniform f32_4* %259 = OpAccessChain %24 %198 %33 
                                       f32_4 %260 = OpLoad %259 
                                       f32_3 %261 = OpVectorShuffle %260 %260 3 3 3 
                                       f32_3 %262 = OpFMul %258 %261 
                                       f32_3 %263 = OpLoad %230 
                                       f32_3 %264 = OpFAdd %262 %263 
                                                      OpStore %230 %264 
                              Uniform f32_4* %266 = OpAccessChain %24 %64 %33 
                                       f32_4 %267 = OpLoad %266 
                                       f32_3 %268 = OpVectorShuffle %267 %267 0 1 2 
                              Uniform f32_4* %269 = OpAccessChain %24 %198 %25 
                                       f32_4 %270 = OpLoad %269 
                                       f32_3 %271 = OpVectorShuffle %270 %270 1 1 1 
                                       f32_3 %272 = OpFMul %268 %271 
                                                      OpStore %265 %272 
                              Uniform f32_4* %273 = OpAccessChain %24 %64 %26 
                                       f32_4 %274 = OpLoad %273 
                                       f32_3 %275 = OpVectorShuffle %274 %274 0 1 2 
                              Uniform f32_4* %276 = OpAccessChain %24 %198 %25 
                                       f32_4 %277 = OpLoad %276 
                                       f32_3 %278 = OpVectorShuffle %277 %277 0 0 0 
                                       f32_3 %279 = OpFMul %275 %278 
                                       f32_3 %280 = OpLoad %265 
                                       f32_3 %281 = OpFAdd %279 %280 
                                                      OpStore %265 %281 
                              Uniform f32_4* %282 = OpAccessChain %24 %64 %25 
                                       f32_4 %283 = OpLoad %282 
                                       f32_3 %284 = OpVectorShuffle %283 %283 0 1 2 
                              Uniform f32_4* %285 = OpAccessChain %24 %198 %25 
                                       f32_4 %286 = OpLoad %285 
                                       f32_3 %287 = OpVectorShuffle %286 %286 2 2 2 
                                       f32_3 %288 = OpFMul %284 %287 
                                       f32_3 %289 = OpLoad %265 
                                       f32_3 %290 = OpFAdd %288 %289 
                                                      OpStore %265 %290 
                              Uniform f32_4* %291 = OpAccessChain %24 %64 %64 
                                       f32_4 %292 = OpLoad %291 
                                       f32_3 %293 = OpVectorShuffle %292 %292 0 1 2 
                              Uniform f32_4* %294 = OpAccessChain %24 %198 %25 
                                       f32_4 %295 = OpLoad %294 
                                       f32_3 %296 = OpVectorShuffle %295 %295 3 3 3 
                                       f32_3 %297 = OpFMul %293 %296 
                                       f32_3 %298 = OpLoad %265 
                                       f32_3 %299 = OpFAdd %297 %298 
                                                      OpStore %265 %299 
                                       f32_4 %300 = OpLoad %77 
                                       f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
                                       f32_3 %304 = OpLoad %303 
                                       f32_3 %305 = OpVectorShuffle %304 %304 1 1 1 
                                       f32_3 %306 = OpFMul %301 %305 
                                       f32_4 %307 = OpLoad %77 
                                       f32_4 %308 = OpVectorShuffle %307 %306 4 5 6 3 
                                                      OpStore %77 %308 
                                       f32_4 %309 = OpLoad %9 
                                       f32_3 %310 = OpVectorShuffle %309 %309 0 1 2 
                                       f32_3 %311 = OpLoad %303 
                                       f32_3 %312 = OpVectorShuffle %311 %311 0 0 0 
                                       f32_3 %313 = OpFMul %310 %312 
                                       f32_4 %314 = OpLoad %77 
                                       f32_3 %315 = OpVectorShuffle %314 %314 0 1 2 
                                       f32_3 %316 = OpFAdd %313 %315 
                                       f32_4 %317 = OpLoad %9 
                                       f32_4 %318 = OpVectorShuffle %317 %316 4 5 6 3 
                                                      OpStore %9 %318 
                                       f32_3 %319 = OpLoad %124 
                                       f32_3 %320 = OpLoad %303 
                                       f32_3 %321 = OpVectorShuffle %320 %320 2 2 2 
                                       f32_3 %322 = OpFMul %319 %321 
                                       f32_4 %323 = OpLoad %9 
                                       f32_3 %324 = OpVectorShuffle %323 %323 0 1 2 
                                       f32_3 %325 = OpFAdd %322 %324 
                                       f32_4 %326 = OpLoad %9 
                                       f32_4 %327 = OpVectorShuffle %326 %325 4 5 6 3 
                                                      OpStore %9 %327 
                                       f32_3 %328 = OpLoad %159 
                                       f32_4 %329 = OpLoad %9 
                                       f32_3 %330 = OpVectorShuffle %329 %329 0 1 2 
                                       f32_3 %331 = OpFAdd %328 %330 
                                       f32_4 %332 = OpLoad %9 
                                       f32_4 %333 = OpVectorShuffle %332 %331 4 5 6 3 
                                                      OpStore %9 %333 
                                       f32_3 %334 = OpLoad %194 
                                       f32_3 %336 = OpLoad %335 
                                         f32 %337 = OpDot %334 %336 
                                Private f32* %340 = OpAccessChain %77 %338 
                                                      OpStore %340 %337 
                                       f32_3 %341 = OpLoad %230 
                                       f32_3 %342 = OpLoad %335 
                                         f32 %343 = OpDot %341 %342 
                                Private f32* %345 = OpAccessChain %77 %344 
                                                      OpStore %345 %343 
                                       f32_3 %346 = OpLoad %265 
                                       f32_3 %347 = OpLoad %335 
                                         f32 %348 = OpDot %346 %347 
                                Private f32* %350 = OpAccessChain %77 %349 
                                                      OpStore %350 %348 
                                       f32_4 %352 = OpLoad %77 
                                       f32_3 %353 = OpVectorShuffle %352 %352 0 1 2 
                                       f32_4 %354 = OpLoad %77 
                                       f32_3 %355 = OpVectorShuffle %354 %354 0 1 2 
                                         f32 %356 = OpDot %353 %355 
                                                      OpStore %351 %356 
                                         f32 %357 = OpLoad %351 
                                         f32 %358 = OpExtInst %1 32 %357 
                                                      OpStore %351 %358 
                                         f32 %359 = OpLoad %351 
                                       f32_3 %360 = OpCompositeConstruct %359 %359 %359 
                                       f32_4 %361 = OpLoad %77 
                                       f32_3 %362 = OpVectorShuffle %361 %361 0 1 2 
                                       f32_3 %363 = OpFMul %360 %362 
                                       f32_4 %364 = OpLoad %77 
                                       f32_4 %365 = OpVectorShuffle %364 %363 4 5 6 3 
                                                      OpStore %77 %365 
                                       f32_4 %366 = OpLoad %9 
                                       f32_3 %367 = OpVectorShuffle %366 %366 0 1 2 
                                       f32_4 %368 = OpLoad %9 
                                       f32_3 %369 = OpVectorShuffle %368 %368 0 1 2 
                                         f32 %370 = OpDot %367 %369 
                                                      OpStore %351 %370 
                                         f32 %371 = OpLoad %351 
                                         f32 %372 = OpExtInst %1 32 %371 
                                                      OpStore %351 %372 
                              Uniform f32_4* %374 = OpAccessChain %24 %373 
                                       f32_4 %375 = OpLoad %374 
                                       f32_3 %376 = OpVectorShuffle %375 %375 0 1 2 
                              Uniform f32_4* %378 = OpAccessChain %24 %377 
                                       f32_4 %379 = OpLoad %378 
                                       f32_3 %380 = OpVectorShuffle %379 %379 0 1 2 
                                       f32_3 %381 = OpFMul %376 %380 
                              Uniform f32_4* %383 = OpAccessChain %24 %382 
                                       f32_4 %384 = OpLoad %383 
                                       f32_3 %385 = OpVectorShuffle %384 %384 0 1 2 
                                       f32_3 %386 = OpFAdd %381 %385 
                                                      OpStore %124 %386 
                                Uniform f32* %390 = OpAccessChain %24 %388 
                                         f32 %391 = OpLoad %390 
                                         f32 %393 = OpFMul %391 %392 
                                                      OpStore %387 %393 
                                       f32_3 %394 = OpLoad %124 
                                                      OpStore %159 %394 
                                Private f32* %396 = OpAccessChain %194 %338 
                                                      OpStore %396 %395 
                                Private f32* %397 = OpAccessChain %194 %344 
                                                      OpStore %397 %395 
                                Private f32* %398 = OpAccessChain %194 %349 
                                                      OpStore %398 %395 
                                                      OpStore %400 %26 
                                                      OpBranch %401 
                                             %401 = OpLabel 
                                                      OpLoopMerge %403 %404 None 
                                                      OpBranch %405 
                                             %405 = OpLabel 
                                         i32 %406 = OpLoad %400 
                                Uniform i32* %409 = OpAccessChain %24 %407 %338 
                                         i32 %410 = OpLoad %409 
                                        bool %412 = OpSLessThan %406 %410 
                                                      OpBranchConditional %412 %402 %403 
                                             %402 = OpLabel 
                                       f32_4 %414 = OpLoad %77 
                                       f32_3 %415 = OpVectorShuffle %414 %414 0 1 2 
                                         i32 %416 = OpLoad %400 
                              Uniform f32_4* %417 = OpAccessChain %24 %33 %416 
                                       f32_4 %418 = OpLoad %417 
                                       f32_3 %419 = OpVectorShuffle %418 %418 0 1 2 
                                         f32 %420 = OpDot %415 %419 
                                                      OpStore %413 %420 
                                         f32 %421 = OpLoad %413 
                                         f32 %422 = OpExtInst %1 40 %421 %395 
                                                      OpStore %413 %422 
                                         f32 %423 = OpLoad %413 
                                       f32_3 %424 = OpCompositeConstruct %423 %423 %423 
                              Uniform f32_4* %425 = OpAccessChain %24 %373 
                                       f32_4 %426 = OpLoad %425 
                                       f32_3 %427 = OpVectorShuffle %426 %426 0 1 2 
                                       f32_3 %428 = OpFMul %424 %427 
                                                      OpStore %230 %428 
                                       f32_3 %429 = OpLoad %230 
                                         i32 %430 = OpLoad %400 
                              Uniform f32_4* %431 = OpAccessChain %24 %26 %430 
                                       f32_4 %432 = OpLoad %431 
                                       f32_3 %433 = OpVectorShuffle %432 %432 0 1 2 
                                       f32_3 %434 = OpFMul %429 %433 
                                                      OpStore %230 %434 
                                         f32 %437 = OpLoad %413 
                                        bool %438 = OpFOrdLessThan %395 %437 
                                                      OpStore %436 %438 
                                        bool %439 = OpLoad %436 
                                                      OpSelectionMerge %441 None 
                                                      OpBranchConditional %439 %440 %441 
                                             %440 = OpLabel 
                                       f32_4 %442 = OpLoad %9 
                                       f32_3 %443 = OpVectorShuffle %442 %442 0 1 2 
                                       f32_3 %444 = OpFNegate %443 
                                         f32 %445 = OpLoad %351 
                                       f32_3 %446 = OpCompositeConstruct %445 %445 %445 
                                       f32_3 %447 = OpFMul %444 %446 
                                         i32 %448 = OpLoad %400 
                              Uniform f32_4* %449 = OpAccessChain %24 %33 %448 
                                       f32_4 %450 = OpLoad %449 
                                       f32_3 %451 = OpVectorShuffle %450 %450 0 1 2 
                                       f32_3 %452 = OpFAdd %447 %451 
                                                      OpStore %265 %452 
                                       f32_3 %453 = OpLoad %265 
                                       f32_3 %454 = OpLoad %265 
                                         f32 %455 = OpDot %453 %454 
                                                      OpStore %413 %455 
                                         f32 %456 = OpLoad %413 
                                         f32 %457 = OpExtInst %1 32 %456 
                                                      OpStore %413 %457 
                                         f32 %458 = OpLoad %413 
                                       f32_3 %459 = OpCompositeConstruct %458 %458 %458 
                                       f32_3 %460 = OpLoad %265 
                                       f32_3 %461 = OpFMul %459 %460 
                                                      OpStore %265 %461 
                                       f32_4 %462 = OpLoad %77 
                                       f32_3 %463 = OpVectorShuffle %462 %462 0 1 2 
                                       f32_3 %464 = OpLoad %265 
                                         f32 %465 = OpDot %463 %464 
                                                      OpStore %413 %465 
                                         f32 %466 = OpLoad %413 
                                         f32 %467 = OpExtInst %1 40 %466 %395 
                                                      OpStore %413 %467 
                                         f32 %468 = OpLoad %413 
                                         f32 %469 = OpExtInst %1 30 %468 
                                                      OpStore %413 %469 
                                         f32 %470 = OpLoad %387 
                                         f32 %471 = OpLoad %413 
                                         f32 %472 = OpFMul %470 %471 
                                                      OpStore %413 %472 
                                         f32 %473 = OpLoad %413 
                                         f32 %474 = OpExtInst %1 29 %473 
                                                      OpStore %413 %474 
                                         f32 %475 = OpLoad %413 
                                         f32 %477 = OpExtInst %1 37 %475 %476 
                                                      OpStore %413 %477 
                                         f32 %478 = OpLoad %413 
                                         f32 %480 = OpFMul %478 %479 
                                                      OpStore %413 %480 
                                         f32 %481 = OpLoad %413 
                                       f32_3 %482 = OpCompositeConstruct %481 %481 %481 
                                         i32 %483 = OpLoad %400 
                              Uniform f32_4* %484 = OpAccessChain %24 %26 %483 
                                       f32_4 %485 = OpLoad %484 
                                       f32_3 %486 = OpVectorShuffle %485 %485 0 1 2 
                                       f32_3 %487 = OpFMul %482 %486 
                                       f32_3 %488 = OpLoad %194 
                                       f32_3 %489 = OpFAdd %487 %488 
                                                      OpStore %194 %489 
                                                      OpBranch %441 
                                             %441 = OpLabel 
                                       f32_3 %490 = OpLoad %230 
                                       f32_3 %492 = OpFMul %490 %491 
                                                      OpStore %230 %492 
                                       f32_3 %493 = OpLoad %230 
                                       f32_3 %495 = OpExtInst %1 37 %493 %494 
                                                      OpStore %230 %495 
                                       f32_3 %496 = OpLoad %159 
                                       f32_3 %497 = OpLoad %230 
                                       f32_3 %498 = OpFAdd %496 %497 
                                                      OpStore %159 %498 
                                                      OpBranch %404 
                                             %404 = OpLabel 
                                         i32 %499 = OpLoad %400 
                                         i32 %500 = OpIAdd %499 %33 
                                                      OpStore %400 %500 
                                                      OpBranch %401 
                                             %403 = OpLabel 
                                       f32_3 %503 = OpLoad %194 
                              Uniform f32_4* %505 = OpAccessChain %24 %504 
                                       f32_4 %506 = OpLoad %505 
                                       f32_3 %507 = OpVectorShuffle %506 %506 0 1 2 
                                       f32_3 %508 = OpFMul %503 %507 
                                                      OpStore %502 %508 
                                       f32_3 %509 = OpLoad %502 
                                       f32_3 %510 = OpCompositeConstruct %395 %395 %395 
                                       f32_3 %511 = OpCompositeConstruct %476 %476 %476 
                                       f32_3 %512 = OpExtInst %1 43 %509 %510 %511 
                                                      OpStore %502 %512 
                                       f32_3 %515 = OpLoad %159 
                                       f32_4 %516 = OpLoad %514 
                                       f32_4 %517 = OpVectorShuffle %516 %515 4 5 6 3 
                                                      OpStore %514 %517 
                                       f32_4 %518 = OpLoad %514 
                                       f32_3 %519 = OpVectorShuffle %518 %518 0 1 2 
                                       f32_3 %520 = OpCompositeConstruct %395 %395 %395 
                                       f32_3 %521 = OpCompositeConstruct %476 %476 %476 
                                       f32_3 %522 = OpExtInst %1 43 %519 %520 %521 
                                       f32_4 %523 = OpLoad %514 
                                       f32_4 %524 = OpVectorShuffle %523 %522 4 5 6 3 
                                                      OpStore %514 %524 
                                Uniform f32* %526 = OpAccessChain %24 %373 %525 
                                         f32 %527 = OpLoad %526 
                                 Output f32* %529 = OpAccessChain %514 %525 
                                                      OpStore %529 %527 
                                 Output f32* %530 = OpAccessChain %514 %525 
                                         f32 %531 = OpLoad %530 
                                         f32 %532 = OpExtInst %1 43 %531 %395 %476 
                                 Output f32* %533 = OpAccessChain %514 %525 
                                                      OpStore %533 %532 
                                       f32_3 %538 = OpLoad %537 
                                       f32_2 %539 = OpVectorShuffle %538 %538 0 1 
                              Uniform f32_4* %541 = OpAccessChain %24 %540 
                                       f32_4 %542 = OpLoad %541 
                                       f32_2 %543 = OpVectorShuffle %542 %542 0 1 
                                       f32_2 %544 = OpFMul %539 %543 
                              Uniform f32_4* %545 = OpAccessChain %24 %540 
                                       f32_4 %546 = OpLoad %545 
                                       f32_2 %547 = OpVectorShuffle %546 %546 2 3 
                                       f32_2 %548 = OpFAdd %544 %547 
                                                      OpStore vs_TEXCOORD0 %548 
                                       f32_3 %549 = OpLoad %303 
                                       f32_4 %550 = OpVectorShuffle %549 %549 1 1 1 1 
                              Uniform f32_4* %551 = OpAccessChain %24 %25 %33 
                                       f32_4 %552 = OpLoad %551 
                                       f32_4 %553 = OpFMul %550 %552 
                                                      OpStore %9 %553 
                              Uniform f32_4* %554 = OpAccessChain %24 %25 %26 
                                       f32_4 %555 = OpLoad %554 
                                       f32_3 %556 = OpLoad %303 
                                       f32_4 %557 = OpVectorShuffle %556 %556 0 0 0 0 
                                       f32_4 %558 = OpFMul %555 %557 
                                       f32_4 %559 = OpLoad %9 
                                       f32_4 %560 = OpFAdd %558 %559 
                                                      OpStore %9 %560 
                              Uniform f32_4* %561 = OpAccessChain %24 %25 %25 
                                       f32_4 %562 = OpLoad %561 
                                       f32_3 %563 = OpLoad %303 
                                       f32_4 %564 = OpVectorShuffle %563 %563 2 2 2 2 
                                       f32_4 %565 = OpFMul %562 %564 
                                       f32_4 %566 = OpLoad %9 
                                       f32_4 %567 = OpFAdd %565 %566 
                                                      OpStore %9 %567 
                                       f32_4 %568 = OpLoad %9 
                              Uniform f32_4* %569 = OpAccessChain %24 %25 %64 
                                       f32_4 %570 = OpLoad %569 
                                       f32_4 %571 = OpFAdd %568 %570 
                                                      OpStore %9 %571 
                                       f32_4 %572 = OpLoad %9 
                                       f32_4 %573 = OpVectorShuffle %572 %572 1 1 1 1 
                              Uniform f32_4* %575 = OpAccessChain %24 %574 %33 
                                       f32_4 %576 = OpLoad %575 
                                       f32_4 %577 = OpFMul %573 %576 
                                                      OpStore %77 %577 
                              Uniform f32_4* %578 = OpAccessChain %24 %574 %26 
                                       f32_4 %579 = OpLoad %578 
                                       f32_4 %580 = OpLoad %9 
                                       f32_4 %581 = OpVectorShuffle %580 %580 0 0 0 0 
                                       f32_4 %582 = OpFMul %579 %581 
                                       f32_4 %583 = OpLoad %77 
                                       f32_4 %584 = OpFAdd %582 %583 
                                                      OpStore %77 %584 
                              Uniform f32_4* %585 = OpAccessChain %24 %574 %25 
                                       f32_4 %586 = OpLoad %585 
                                       f32_4 %587 = OpLoad %9 
                                       f32_4 %588 = OpVectorShuffle %587 %587 2 2 2 2 
                                       f32_4 %589 = OpFMul %586 %588 
                                       f32_4 %590 = OpLoad %77 
                                       f32_4 %591 = OpFAdd %589 %590 
                                                      OpStore %77 %591 
                              Uniform f32_4* %596 = OpAccessChain %24 %574 %64 
                                       f32_4 %597 = OpLoad %596 
                                       f32_4 %598 = OpLoad %9 
                                       f32_4 %599 = OpVectorShuffle %598 %598 3 3 3 3 
                                       f32_4 %600 = OpFMul %597 %599 
                                       f32_4 %601 = OpLoad %77 
                                       f32_4 %602 = OpFAdd %600 %601 
                               Output f32_4* %603 = OpAccessChain %595 %26 
                                                      OpStore %603 %602 
                                 Output f32* %604 = OpAccessChain %595 %26 %344 
                                         f32 %605 = OpLoad %604 
                                         f32 %606 = OpFNegate %605 
                                 Output f32* %607 = OpAccessChain %595 %26 %344 
                                                      OpStore %607 %606 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 51
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %29 %34 %40 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %29 Location 29 
                                             OpDecorate %34 Location 34 
                                             OpDecorate %40 Location 40 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                                     %28 = OpTypePointer Input %24 
                        Input f32_4* %29 = OpVariable Input 
                                     %33 = OpTypePointer Output %24 
                       Output f32_4* %34 = OpVariable Output 
                                 f32 %36 = OpConstant 3.674022E-40 
                               f32_3 %37 = OpConstantComposite %36 %36 %36 
                                     %39 = OpTypePointer Input %7 
                        Input f32_3* %40 = OpVariable Input 
                                 f32 %45 = OpConstant 3.674022E-40 
                                     %46 = OpTypeInt 32 0 
                                 u32 %47 = OpConstant 3 
                                     %48 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %27 = OpLoad %9 
                               f32_4 %30 = OpLoad %29 
                               f32_3 %31 = OpVectorShuffle %30 %30 0 1 2 
                               f32_3 %32 = OpFMul %27 %31 
                                             OpStore %9 %32 
                               f32_3 %35 = OpLoad %9 
                               f32_3 %38 = OpFMul %35 %37 
                               f32_3 %41 = OpLoad %40 
                               f32_3 %42 = OpFAdd %38 %41 
                               f32_4 %43 = OpLoad %34 
                               f32_4 %44 = OpVectorShuffle %43 %42 4 5 6 3 
                                             OpStore %34 %44 
                         Output f32* %49 = OpAccessChain %34 %47 
                                             OpStore %49 %45 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" }
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
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Emission;
uniform 	float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec3 vs_COLOR1;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
bool u_xlatb6;
float u_xlat21;
float u_xlat22;
int u_xlati23;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
bool u_xlatb25;
bool u_xlatb26;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + _Emission.xyz;
    u_xlat22 = _Shininess * 128.0;
    u_xlat3.xyz = u_xlat2.xyz;
    u_xlat4.x = float(0.0);
    u_xlat4.y = float(0.0);
    u_xlat4.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat5.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat24 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat25 = unity_LightAtten[u_xlati_loop_1].z * u_xlat24 + 1.0;
        u_xlat25 = float(1.0) / u_xlat25;
        u_xlatb26 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb6 = unity_LightAtten[u_xlati_loop_1].w<u_xlat24;
        u_xlatb26 = u_xlatb26 && u_xlatb6;
        u_xlat24 = max(u_xlat24, 9.99999997e-07);
        u_xlat24 = inversesqrt(u_xlat24);
        u_xlat5.xyz = vec3(u_xlat24) * u_xlat5.xyz;
        u_xlat24 = u_xlat25 * 0.5;
        u_xlat24 = (u_xlatb26) ? 0.0 : u_xlat24;
        u_xlat25 = dot(u_xlat1.xyz, u_xlat5.xyz);
        u_xlat25 = max(u_xlat25, 0.0);
        u_xlat6.xyz = vec3(u_xlat25) * _Color.xyz;
        u_xlat6.xyz = u_xlat6.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb25 = 0.0<u_xlat25;
        if(u_xlatb25){
            u_xlat5.xyz = (-u_xlat0.xyz) * vec3(u_xlat21) + u_xlat5.xyz;
            u_xlat25 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat25 = inversesqrt(u_xlat25);
            u_xlat5.xyz = vec3(u_xlat25) * u_xlat5.xyz;
            u_xlat25 = dot(u_xlat1.xyz, u_xlat5.xyz);
            u_xlat25 = max(u_xlat25, 0.0);
            u_xlat25 = log2(u_xlat25);
            u_xlat25 = u_xlat22 * u_xlat25;
            u_xlat25 = exp2(u_xlat25);
            u_xlat25 = min(u_xlat25, 1.0);
            u_xlat25 = u_xlat24 * u_xlat25;
            u_xlat4.xyz = vec3(u_xlat25) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat4.xyz;
        }
        u_xlat5.xyz = vec3(u_xlat24) * u_xlat6.xyz;
        u_xlat5.xyz = min(u_xlat5.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat3.xyz = u_xlat3.xyz + u_xlat5.xyz;
    }
    vs_COLOR1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat3.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec3 vs_COLOR1;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vs_COLOR1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "POINT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 663
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %305 %337 %554 %566 %587 %588 %646 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %23 0 Offset 23 
                                                      OpMemberDecorate %23 1 Offset 23 
                                                      OpMemberDecorate %23 2 Offset 23 
                                                      OpMemberDecorate %23 3 Offset 23 
                                                      OpMemberDecorate %23 4 Offset 23 
                                                      OpMemberDecorate %23 5 Offset 23 
                                                      OpMemberDecorate %23 6 Offset 23 
                                                      OpMemberDecorate %23 7 Offset 23 
                                                      OpMemberDecorate %23 8 Offset 23 
                                                      OpMemberDecorate %23 9 Offset 23 
                                                      OpMemberDecorate %23 10 Offset 23 
                                                      OpMemberDecorate %23 11 Offset 23 
                                                      OpMemberDecorate %23 12 Offset 23 
                                                      OpMemberDecorate %23 13 Offset 23 
                                                      OpMemberDecorate %23 14 Offset 23 
                                                      OpDecorate %23 Block 
                                                      OpDecorate %25 DescriptorSet 25 
                                                      OpDecorate %25 Binding 25 
                                                      OpDecorate %305 Location 305 
                                                      OpDecorate %337 Location 337 
                                                      OpDecorate %554 Location 554 
                                                      OpDecorate %566 Location 566 
                                                      OpDecorate vs_TEXCOORD0 Location 587 
                                                      OpDecorate %588 Location 588 
                                                      OpMemberDecorate %644 0 BuiltIn 644 
                                                      OpMemberDecorate %644 1 BuiltIn 644 
                                                      OpMemberDecorate %644 2 BuiltIn 644 
                                                      OpDecorate %644 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeArray %7 %15 
                                              %21 = OpTypeInt 32 1 
                                              %22 = OpTypeVector %21 4 
                                              %23 = OpTypeStruct %12 %13 %14 %16 %17 %7 %18 %19 %20 %7 %7 %7 %6 %22 %7 
                                              %24 = OpTypePointer Uniform %23 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[8]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32; i32_4; f32_4;}* %25 = OpVariable Uniform 
                                          i32 %26 = OpConstant 3 
                                          i32 %27 = OpConstant 0 
                                              %28 = OpTypeVector %6 3 
                                              %29 = OpTypePointer Uniform %7 
                                          i32 %33 = OpConstant 6 
                                          i32 %34 = OpConstant 1 
                                          i32 %53 = OpConstant 2 
                               Private f32_4* %78 = OpVariable Private 
                                             %124 = OpTypePointer Private %28 
                              Private f32_3* %125 = OpVariable Private 
                              Private f32_3* %160 = OpVariable Private 
                              Private f32_3* %195 = OpVariable Private 
                                         i32 %196 = OpConstant 4 
                                         i32 %200 = OpConstant 7 
                              Private f32_3* %232 = OpVariable Private 
                              Private f32_3* %267 = OpVariable Private 
                                             %304 = OpTypePointer Input %28 
                                Input f32_3* %305 = OpVariable Input 
                                Input f32_3* %337 = OpVariable Input 
                                         u32 %340 = OpConstant 0 
                                             %341 = OpTypePointer Private %6 
                                         u32 %346 = OpConstant 1 
                                         u32 %351 = OpConstant 2 
                                Private f32* %353 = OpVariable Private 
                                         i32 %375 = OpConstant 9 
                                         i32 %379 = OpConstant 5 
                                         i32 %384 = OpConstant 11 
                                Private f32* %389 = OpVariable Private 
                                         i32 %390 = OpConstant 12 
                                             %391 = OpTypePointer Uniform %6 
                                         f32 %394 = OpConstant 3.674022E-40 
                                         f32 %397 = OpConstant 3.674022E-40 
                                             %401 = OpTypePointer Function %21 
                                         i32 %409 = OpConstant 13 
                                             %410 = OpTypePointer Uniform %21 
                                             %413 = OpTypeBool 
                                Private f32* %428 = OpVariable Private 
                                Private f32* %432 = OpVariable Private 
                                         f32 %438 = OpConstant 3.674022E-40 
                                             %442 = OpTypePointer Private %413 
                               Private bool* %443 = OpVariable Private 
                                         u32 %445 = OpConstant 3 
                               Private bool* %449 = OpVariable Private 
                                         f32 %459 = OpConstant 3.674022E-40 
                                         f32 %468 = OpConstant 3.674022E-40 
                               Private bool* %491 = OpVariable Private 
                                       f32_3 %546 = OpConstantComposite %438 %438 %438 
                                             %553 = OpTypePointer Output %28 
                               Output f32_3* %554 = OpVariable Output 
                                         i32 %556 = OpConstant 10 
                                             %565 = OpTypePointer Output %7 
                               Output f32_4* %566 = OpVariable Output 
                                             %579 = OpTypePointer Output %6 
                                             %585 = OpTypeVector %6 2 
                                             %586 = OpTypePointer Output %585 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_3* %588 = OpVariable Input 
                                         i32 %591 = OpConstant 14 
                                         i32 %625 = OpConstant 8 
                                             %643 = OpTypeArray %6 %346 
                                             %644 = OpTypeStruct %7 %6 %643 
                                             %645 = OpTypePointer Output %644 
        Output struct {f32_4; f32; f32[1];}* %646 = OpVariable Output 
                                             %660 = OpTypePointer Private %21 
                                Private i32* %661 = OpVariable Private 
                               Private bool* %662 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %402 = OpVariable Function 
                               Uniform f32_4* %30 = OpAccessChain %25 %26 %27 
                                        f32_4 %31 = OpLoad %30 
                                        f32_3 %32 = OpVectorShuffle %31 %31 1 1 1 
                               Uniform f32_4* %35 = OpAccessChain %25 %33 %34 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                        f32_3 %38 = OpFMul %32 %37 
                                        f32_4 %39 = OpLoad %9 
                                        f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                                      OpStore %9 %40 
                               Uniform f32_4* %41 = OpAccessChain %25 %33 %27 
                                        f32_4 %42 = OpLoad %41 
                                        f32_3 %43 = OpVectorShuffle %42 %42 0 1 2 
                               Uniform f32_4* %44 = OpAccessChain %25 %26 %27 
                                        f32_4 %45 = OpLoad %44 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 0 0 
                                        f32_3 %47 = OpFMul %43 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                        f32_3 %50 = OpFAdd %47 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %50 4 5 6 3 
                                                      OpStore %9 %52 
                               Uniform f32_4* %54 = OpAccessChain %25 %33 %53 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                               Uniform f32_4* %57 = OpAccessChain %25 %26 %27 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 2 2 2 
                                        f32_3 %60 = OpFMul %56 %59 
                                        f32_4 %61 = OpLoad %9 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFAdd %60 %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                                      OpStore %9 %65 
                               Uniform f32_4* %66 = OpAccessChain %25 %33 %26 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                               Uniform f32_4* %69 = OpAccessChain %25 %26 %27 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 3 3 3 
                                        f32_3 %72 = OpFMul %68 %71 
                                        f32_4 %73 = OpLoad %9 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %72 %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                                      OpStore %9 %77 
                               Uniform f32_4* %79 = OpAccessChain %25 %26 %34 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 1 1 1 
                               Uniform f32_4* %82 = OpAccessChain %25 %33 %34 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_3 %85 = OpFMul %81 %84 
                                        f32_4 %86 = OpLoad %78 
                                        f32_4 %87 = OpVectorShuffle %86 %85 4 5 6 3 
                                                      OpStore %78 %87 
                               Uniform f32_4* %88 = OpAccessChain %25 %33 %27 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                               Uniform f32_4* %91 = OpAccessChain %25 %26 %34 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 0 0 
                                        f32_3 %94 = OpFMul %90 %93 
                                        f32_4 %95 = OpLoad %78 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFAdd %94 %96 
                                        f32_4 %98 = OpLoad %78 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 6 3 
                                                      OpStore %78 %99 
                              Uniform f32_4* %100 = OpAccessChain %25 %33 %53 
                                       f32_4 %101 = OpLoad %100 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
                              Uniform f32_4* %103 = OpAccessChain %25 %26 %34 
                                       f32_4 %104 = OpLoad %103 
                                       f32_3 %105 = OpVectorShuffle %104 %104 2 2 2 
                                       f32_3 %106 = OpFMul %102 %105 
                                       f32_4 %107 = OpLoad %78 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpFAdd %106 %108 
                                       f32_4 %110 = OpLoad %78 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 6 3 
                                                      OpStore %78 %111 
                              Uniform f32_4* %112 = OpAccessChain %25 %33 %26 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                              Uniform f32_4* %115 = OpAccessChain %25 %26 %34 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 3 3 3 
                                       f32_3 %118 = OpFMul %114 %117 
                                       f32_4 %119 = OpLoad %78 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                       f32_3 %121 = OpFAdd %118 %120 
                                       f32_4 %122 = OpLoad %78 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %78 %123 
                              Uniform f32_4* %126 = OpAccessChain %25 %26 %53 
                                       f32_4 %127 = OpLoad %126 
                                       f32_3 %128 = OpVectorShuffle %127 %127 1 1 1 
                              Uniform f32_4* %129 = OpAccessChain %25 %33 %34 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpFMul %128 %131 
                                                      OpStore %125 %132 
                              Uniform f32_4* %133 = OpAccessChain %25 %33 %27 
                                       f32_4 %134 = OpLoad %133 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                              Uniform f32_4* %136 = OpAccessChain %25 %26 %53 
                                       f32_4 %137 = OpLoad %136 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 0 0 
                                       f32_3 %139 = OpFMul %135 %138 
                                       f32_3 %140 = OpLoad %125 
                                       f32_3 %141 = OpFAdd %139 %140 
                                                      OpStore %125 %141 
                              Uniform f32_4* %142 = OpAccessChain %25 %33 %53 
                                       f32_4 %143 = OpLoad %142 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                              Uniform f32_4* %145 = OpAccessChain %25 %26 %53 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 2 2 2 
                                       f32_3 %148 = OpFMul %144 %147 
                                       f32_3 %149 = OpLoad %125 
                                       f32_3 %150 = OpFAdd %148 %149 
                                                      OpStore %125 %150 
                              Uniform f32_4* %151 = OpAccessChain %25 %33 %26 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                              Uniform f32_4* %154 = OpAccessChain %25 %26 %53 
                                       f32_4 %155 = OpLoad %154 
                                       f32_3 %156 = OpVectorShuffle %155 %155 3 3 3 
                                       f32_3 %157 = OpFMul %153 %156 
                                       f32_3 %158 = OpLoad %125 
                                       f32_3 %159 = OpFAdd %157 %158 
                                                      OpStore %125 %159 
                              Uniform f32_4* %161 = OpAccessChain %25 %26 %26 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 1 1 1 
                              Uniform f32_4* %164 = OpAccessChain %25 %33 %34 
                                       f32_4 %165 = OpLoad %164 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_3 %167 = OpFMul %163 %166 
                                                      OpStore %160 %167 
                              Uniform f32_4* %168 = OpAccessChain %25 %33 %27 
                                       f32_4 %169 = OpLoad %168 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                              Uniform f32_4* %171 = OpAccessChain %25 %26 %26 
                                       f32_4 %172 = OpLoad %171 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 0 0 
                                       f32_3 %174 = OpFMul %170 %173 
                                       f32_3 %175 = OpLoad %160 
                                       f32_3 %176 = OpFAdd %174 %175 
                                                      OpStore %160 %176 
                              Uniform f32_4* %177 = OpAccessChain %25 %33 %53 
                                       f32_4 %178 = OpLoad %177 
                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
                              Uniform f32_4* %180 = OpAccessChain %25 %26 %26 
                                       f32_4 %181 = OpLoad %180 
                                       f32_3 %182 = OpVectorShuffle %181 %181 2 2 2 
                                       f32_3 %183 = OpFMul %179 %182 
                                       f32_3 %184 = OpLoad %160 
                                       f32_3 %185 = OpFAdd %183 %184 
                                                      OpStore %160 %185 
                              Uniform f32_4* %186 = OpAccessChain %25 %33 %26 
                                       f32_4 %187 = OpLoad %186 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                              Uniform f32_4* %189 = OpAccessChain %25 %26 %26 
                                       f32_4 %190 = OpLoad %189 
                                       f32_3 %191 = OpVectorShuffle %190 %190 3 3 3 
                                       f32_3 %192 = OpFMul %188 %191 
                                       f32_3 %193 = OpLoad %160 
                                       f32_3 %194 = OpFAdd %192 %193 
                                                      OpStore %160 %194 
                              Uniform f32_4* %197 = OpAccessChain %25 %196 %34 
                                       f32_4 %198 = OpLoad %197 
                                       f32_3 %199 = OpVectorShuffle %198 %198 0 1 2 
                              Uniform f32_4* %201 = OpAccessChain %25 %200 %27 
                                       f32_4 %202 = OpLoad %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 1 1 1 
                                       f32_3 %204 = OpFMul %199 %203 
                                                      OpStore %195 %204 
                              Uniform f32_4* %205 = OpAccessChain %25 %196 %27 
                                       f32_4 %206 = OpLoad %205 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                              Uniform f32_4* %208 = OpAccessChain %25 %200 %27 
                                       f32_4 %209 = OpLoad %208 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 0 0 
                                       f32_3 %211 = OpFMul %207 %210 
                                       f32_3 %212 = OpLoad %195 
                                       f32_3 %213 = OpFAdd %211 %212 
                                                      OpStore %195 %213 
                              Uniform f32_4* %214 = OpAccessChain %25 %196 %53 
                                       f32_4 %215 = OpLoad %214 
                                       f32_3 %216 = OpVectorShuffle %215 %215 0 1 2 
                              Uniform f32_4* %217 = OpAccessChain %25 %200 %27 
                                       f32_4 %218 = OpLoad %217 
                                       f32_3 %219 = OpVectorShuffle %218 %218 2 2 2 
                                       f32_3 %220 = OpFMul %216 %219 
                                       f32_3 %221 = OpLoad %195 
                                       f32_3 %222 = OpFAdd %220 %221 
                                                      OpStore %195 %222 
                              Uniform f32_4* %223 = OpAccessChain %25 %196 %26 
                                       f32_4 %224 = OpLoad %223 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                              Uniform f32_4* %226 = OpAccessChain %25 %200 %27 
                                       f32_4 %227 = OpLoad %226 
                                       f32_3 %228 = OpVectorShuffle %227 %227 3 3 3 
                                       f32_3 %229 = OpFMul %225 %228 
                                       f32_3 %230 = OpLoad %195 
                                       f32_3 %231 = OpFAdd %229 %230 
                                                      OpStore %195 %231 
                              Uniform f32_4* %233 = OpAccessChain %25 %196 %34 
                                       f32_4 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                              Uniform f32_4* %236 = OpAccessChain %25 %200 %34 
                                       f32_4 %237 = OpLoad %236 
                                       f32_3 %238 = OpVectorShuffle %237 %237 1 1 1 
                                       f32_3 %239 = OpFMul %235 %238 
                                                      OpStore %232 %239 
                              Uniform f32_4* %240 = OpAccessChain %25 %196 %27 
                                       f32_4 %241 = OpLoad %240 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                              Uniform f32_4* %243 = OpAccessChain %25 %200 %34 
                                       f32_4 %244 = OpLoad %243 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
                                       f32_3 %246 = OpFMul %242 %245 
                                       f32_3 %247 = OpLoad %232 
                                       f32_3 %248 = OpFAdd %246 %247 
                                                      OpStore %232 %248 
                              Uniform f32_4* %249 = OpAccessChain %25 %196 %53 
                                       f32_4 %250 = OpLoad %249 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                              Uniform f32_4* %252 = OpAccessChain %25 %200 %34 
                                       f32_4 %253 = OpLoad %252 
                                       f32_3 %254 = OpVectorShuffle %253 %253 2 2 2 
                                       f32_3 %255 = OpFMul %251 %254 
                                       f32_3 %256 = OpLoad %232 
                                       f32_3 %257 = OpFAdd %255 %256 
                                                      OpStore %232 %257 
                              Uniform f32_4* %258 = OpAccessChain %25 %196 %26 
                                       f32_4 %259 = OpLoad %258 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                              Uniform f32_4* %261 = OpAccessChain %25 %200 %34 
                                       f32_4 %262 = OpLoad %261 
                                       f32_3 %263 = OpVectorShuffle %262 %262 3 3 3 
                                       f32_3 %264 = OpFMul %260 %263 
                                       f32_3 %265 = OpLoad %232 
                                       f32_3 %266 = OpFAdd %264 %265 
                                                      OpStore %232 %266 
                              Uniform f32_4* %268 = OpAccessChain %25 %196 %34 
                                       f32_4 %269 = OpLoad %268 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                              Uniform f32_4* %271 = OpAccessChain %25 %200 %53 
                                       f32_4 %272 = OpLoad %271 
                                       f32_3 %273 = OpVectorShuffle %272 %272 1 1 1 
                                       f32_3 %274 = OpFMul %270 %273 
                                                      OpStore %267 %274 
                              Uniform f32_4* %275 = OpAccessChain %25 %196 %27 
                                       f32_4 %276 = OpLoad %275 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
                              Uniform f32_4* %278 = OpAccessChain %25 %200 %53 
                                       f32_4 %279 = OpLoad %278 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 0 0 
                                       f32_3 %281 = OpFMul %277 %280 
                                       f32_3 %282 = OpLoad %267 
                                       f32_3 %283 = OpFAdd %281 %282 
                                                      OpStore %267 %283 
                              Uniform f32_4* %284 = OpAccessChain %25 %196 %53 
                                       f32_4 %285 = OpLoad %284 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                              Uniform f32_4* %287 = OpAccessChain %25 %200 %53 
                                       f32_4 %288 = OpLoad %287 
                                       f32_3 %289 = OpVectorShuffle %288 %288 2 2 2 
                                       f32_3 %290 = OpFMul %286 %289 
                                       f32_3 %291 = OpLoad %267 
                                       f32_3 %292 = OpFAdd %290 %291 
                                                      OpStore %267 %292 
                              Uniform f32_4* %293 = OpAccessChain %25 %196 %26 
                                       f32_4 %294 = OpLoad %293 
                                       f32_3 %295 = OpVectorShuffle %294 %294 0 1 2 
                              Uniform f32_4* %296 = OpAccessChain %25 %200 %53 
                                       f32_4 %297 = OpLoad %296 
                                       f32_3 %298 = OpVectorShuffle %297 %297 3 3 3 
                                       f32_3 %299 = OpFMul %295 %298 
                                       f32_3 %300 = OpLoad %267 
                                       f32_3 %301 = OpFAdd %299 %300 
                                                      OpStore %267 %301 
                                       f32_4 %302 = OpLoad %78 
                                       f32_3 %303 = OpVectorShuffle %302 %302 0 1 2 
                                       f32_3 %306 = OpLoad %305 
                                       f32_3 %307 = OpVectorShuffle %306 %306 1 1 1 
                                       f32_3 %308 = OpFMul %303 %307 
                                       f32_4 %309 = OpLoad %78 
                                       f32_4 %310 = OpVectorShuffle %309 %308 4 5 6 3 
                                                      OpStore %78 %310 
                                       f32_4 %311 = OpLoad %9 
                                       f32_3 %312 = OpVectorShuffle %311 %311 0 1 2 
                                       f32_3 %313 = OpLoad %305 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 0 0 
                                       f32_3 %315 = OpFMul %312 %314 
                                       f32_4 %316 = OpLoad %78 
                                       f32_3 %317 = OpVectorShuffle %316 %316 0 1 2 
                                       f32_3 %318 = OpFAdd %315 %317 
                                       f32_4 %319 = OpLoad %9 
                                       f32_4 %320 = OpVectorShuffle %319 %318 4 5 6 3 
                                                      OpStore %9 %320 
                                       f32_3 %321 = OpLoad %125 
                                       f32_3 %322 = OpLoad %305 
                                       f32_3 %323 = OpVectorShuffle %322 %322 2 2 2 
                                       f32_3 %324 = OpFMul %321 %323 
                                       f32_4 %325 = OpLoad %9 
                                       f32_3 %326 = OpVectorShuffle %325 %325 0 1 2 
                                       f32_3 %327 = OpFAdd %324 %326 
                                       f32_4 %328 = OpLoad %9 
                                       f32_4 %329 = OpVectorShuffle %328 %327 4 5 6 3 
                                                      OpStore %9 %329 
                                       f32_3 %330 = OpLoad %160 
                                       f32_4 %331 = OpLoad %9 
                                       f32_3 %332 = OpVectorShuffle %331 %331 0 1 2 
                                       f32_3 %333 = OpFAdd %330 %332 
                                       f32_4 %334 = OpLoad %9 
                                       f32_4 %335 = OpVectorShuffle %334 %333 4 5 6 3 
                                                      OpStore %9 %335 
                                       f32_3 %336 = OpLoad %195 
                                       f32_3 %338 = OpLoad %337 
                                         f32 %339 = OpDot %336 %338 
                                Private f32* %342 = OpAccessChain %78 %340 
                                                      OpStore %342 %339 
                                       f32_3 %343 = OpLoad %232 
                                       f32_3 %344 = OpLoad %337 
                                         f32 %345 = OpDot %343 %344 
                                Private f32* %347 = OpAccessChain %78 %346 
                                                      OpStore %347 %345 
                                       f32_3 %348 = OpLoad %267 
                                       f32_3 %349 = OpLoad %337 
                                         f32 %350 = OpDot %348 %349 
                                Private f32* %352 = OpAccessChain %78 %351 
                                                      OpStore %352 %350 
                                       f32_4 %354 = OpLoad %78 
                                       f32_3 %355 = OpVectorShuffle %354 %354 0 1 2 
                                       f32_4 %356 = OpLoad %78 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                         f32 %358 = OpDot %355 %357 
                                                      OpStore %353 %358 
                                         f32 %359 = OpLoad %353 
                                         f32 %360 = OpExtInst %1 32 %359 
                                                      OpStore %353 %360 
                                         f32 %361 = OpLoad %353 
                                       f32_3 %362 = OpCompositeConstruct %361 %361 %361 
                                       f32_4 %363 = OpLoad %78 
                                       f32_3 %364 = OpVectorShuffle %363 %363 0 1 2 
                                       f32_3 %365 = OpFMul %362 %364 
                                       f32_4 %366 = OpLoad %78 
                                       f32_4 %367 = OpVectorShuffle %366 %365 4 5 6 3 
                                                      OpStore %78 %367 
                                       f32_4 %368 = OpLoad %9 
                                       f32_3 %369 = OpVectorShuffle %368 %368 0 1 2 
                                       f32_4 %370 = OpLoad %9 
                                       f32_3 %371 = OpVectorShuffle %370 %370 0 1 2 
                                         f32 %372 = OpDot %369 %371 
                                                      OpStore %353 %372 
                                         f32 %373 = OpLoad %353 
                                         f32 %374 = OpExtInst %1 32 %373 
                                                      OpStore %353 %374 
                              Uniform f32_4* %376 = OpAccessChain %25 %375 
                                       f32_4 %377 = OpLoad %376 
                                       f32_3 %378 = OpVectorShuffle %377 %377 0 1 2 
                              Uniform f32_4* %380 = OpAccessChain %25 %379 
                                       f32_4 %381 = OpLoad %380 
                                       f32_3 %382 = OpVectorShuffle %381 %381 0 1 2 
                                       f32_3 %383 = OpFMul %378 %382 
                              Uniform f32_4* %385 = OpAccessChain %25 %384 
                                       f32_4 %386 = OpLoad %385 
                                       f32_3 %387 = OpVectorShuffle %386 %386 0 1 2 
                                       f32_3 %388 = OpFAdd %383 %387 
                                                      OpStore %125 %388 
                                Uniform f32* %392 = OpAccessChain %25 %390 
                                         f32 %393 = OpLoad %392 
                                         f32 %395 = OpFMul %393 %394 
                                                      OpStore %389 %395 
                                       f32_3 %396 = OpLoad %125 
                                                      OpStore %160 %396 
                                Private f32* %398 = OpAccessChain %195 %340 
                                                      OpStore %398 %397 
                                Private f32* %399 = OpAccessChain %195 %346 
                                                      OpStore %399 %397 
                                Private f32* %400 = OpAccessChain %195 %351 
                                                      OpStore %400 %397 
                                                      OpStore %402 %27 
                                                      OpBranch %403 
                                             %403 = OpLabel 
                                                      OpLoopMerge %405 %406 None 
                                                      OpBranch %407 
                                             %407 = OpLabel 
                                         i32 %408 = OpLoad %402 
                                Uniform i32* %411 = OpAccessChain %25 %409 %340 
                                         i32 %412 = OpLoad %411 
                                        bool %414 = OpSLessThan %408 %412 
                                                      OpBranchConditional %414 %404 %405 
                                             %404 = OpLabel 
                                       f32_4 %415 = OpLoad %9 
                                       f32_3 %416 = OpVectorShuffle %415 %415 0 1 2 
                                       f32_3 %417 = OpFNegate %416 
                                         i32 %418 = OpLoad %402 
                              Uniform f32_4* %419 = OpAccessChain %25 %34 %418 
                                       f32_4 %420 = OpLoad %419 
                                       f32_3 %421 = OpVectorShuffle %420 %420 3 3 3 
                                       f32_3 %422 = OpFMul %417 %421 
                                         i32 %423 = OpLoad %402 
                              Uniform f32_4* %424 = OpAccessChain %25 %34 %423 
                                       f32_4 %425 = OpLoad %424 
                                       f32_3 %426 = OpVectorShuffle %425 %425 0 1 2 
                                       f32_3 %427 = OpFAdd %422 %426 
                                                      OpStore %232 %427 
                                       f32_3 %429 = OpLoad %232 
                                       f32_3 %430 = OpLoad %232 
                                         f32 %431 = OpDot %429 %430 
                                                      OpStore %428 %431 
                                         i32 %433 = OpLoad %402 
                                Uniform f32* %434 = OpAccessChain %25 %53 %433 %351 
                                         f32 %435 = OpLoad %434 
                                         f32 %436 = OpLoad %428 
                                         f32 %437 = OpFMul %435 %436 
                                         f32 %439 = OpFAdd %437 %438 
                                                      OpStore %432 %439 
                                         f32 %440 = OpLoad %432 
                                         f32 %441 = OpFDiv %438 %440 
                                                      OpStore %432 %441 
                                         i32 %444 = OpLoad %402 
                                Uniform f32* %446 = OpAccessChain %25 %34 %444 %445 
                                         f32 %447 = OpLoad %446 
                                        bool %448 = OpFOrdNotEqual %397 %447 
                                                      OpStore %443 %448 
                                         i32 %450 = OpLoad %402 
                                Uniform f32* %451 = OpAccessChain %25 %53 %450 %445 
                                         f32 %452 = OpLoad %451 
                                         f32 %453 = OpLoad %428 
                                        bool %454 = OpFOrdLessThan %452 %453 
                                                      OpStore %449 %454 
                                        bool %455 = OpLoad %443 
                                        bool %456 = OpLoad %449 
                                        bool %457 = OpLogicalAnd %455 %456 
                                                      OpStore %443 %457 
                                         f32 %458 = OpLoad %428 
                                         f32 %460 = OpExtInst %1 40 %458 %459 
                                                      OpStore %428 %460 
                                         f32 %461 = OpLoad %428 
                                         f32 %462 = OpExtInst %1 32 %461 
                                                      OpStore %428 %462 
                                         f32 %463 = OpLoad %428 
                                       f32_3 %464 = OpCompositeConstruct %463 %463 %463 
                                       f32_3 %465 = OpLoad %232 
                                       f32_3 %466 = OpFMul %464 %465 
                                                      OpStore %232 %466 
                                         f32 %467 = OpLoad %432 
                                         f32 %469 = OpFMul %467 %468 
                                                      OpStore %428 %469 
                                        bool %470 = OpLoad %443 
                                         f32 %471 = OpLoad %428 
                                         f32 %472 = OpSelect %470 %397 %471 
                                                      OpStore %428 %472 
                                       f32_4 %473 = OpLoad %78 
                                       f32_3 %474 = OpVectorShuffle %473 %473 0 1 2 
                                       f32_3 %475 = OpLoad %232 
                                         f32 %476 = OpDot %474 %475 
                                                      OpStore %432 %476 
                                         f32 %477 = OpLoad %432 
                                         f32 %478 = OpExtInst %1 40 %477 %397 
                                                      OpStore %432 %478 
                                         f32 %479 = OpLoad %432 
                                       f32_3 %480 = OpCompositeConstruct %479 %479 %479 
                              Uniform f32_4* %481 = OpAccessChain %25 %375 
                                       f32_4 %482 = OpLoad %481 
                                       f32_3 %483 = OpVectorShuffle %482 %482 0 1 2 
                                       f32_3 %484 = OpFMul %480 %483 
                                                      OpStore %267 %484 
                                       f32_3 %485 = OpLoad %267 
                                         i32 %486 = OpLoad %402 
                              Uniform f32_4* %487 = OpAccessChain %25 %27 %486 
                                       f32_4 %488 = OpLoad %487 
                                       f32_3 %489 = OpVectorShuffle %488 %488 0 1 2 
                                       f32_3 %490 = OpFMul %485 %489 
                                                      OpStore %267 %490 
                                         f32 %492 = OpLoad %432 
                                        bool %493 = OpFOrdLessThan %397 %492 
                                                      OpStore %491 %493 
                                        bool %494 = OpLoad %491 
                                                      OpSelectionMerge %496 None 
                                                      OpBranchConditional %494 %495 %496 
                                             %495 = OpLabel 
                                       f32_4 %497 = OpLoad %9 
                                       f32_3 %498 = OpVectorShuffle %497 %497 0 1 2 
                                       f32_3 %499 = OpFNegate %498 
                                         f32 %500 = OpLoad %353 
                                       f32_3 %501 = OpCompositeConstruct %500 %500 %500 
                                       f32_3 %502 = OpFMul %499 %501 
                                       f32_3 %503 = OpLoad %232 
                                       f32_3 %504 = OpFAdd %502 %503 
                                                      OpStore %232 %504 
                                       f32_3 %505 = OpLoad %232 
                                       f32_3 %506 = OpLoad %232 
                                         f32 %507 = OpDot %505 %506 
                                                      OpStore %432 %507 
                                         f32 %508 = OpLoad %432 
                                         f32 %509 = OpExtInst %1 32 %508 
                                                      OpStore %432 %509 
                                         f32 %510 = OpLoad %432 
                                       f32_3 %511 = OpCompositeConstruct %510 %510 %510 
                                       f32_3 %512 = OpLoad %232 
                                       f32_3 %513 = OpFMul %511 %512 
                                                      OpStore %232 %513 
                                       f32_4 %514 = OpLoad %78 
                                       f32_3 %515 = OpVectorShuffle %514 %514 0 1 2 
                                       f32_3 %516 = OpLoad %232 
                                         f32 %517 = OpDot %515 %516 
                                                      OpStore %432 %517 
                                         f32 %518 = OpLoad %432 
                                         f32 %519 = OpExtInst %1 40 %518 %397 
                                                      OpStore %432 %519 
                                         f32 %520 = OpLoad %432 
                                         f32 %521 = OpExtInst %1 30 %520 
                                                      OpStore %432 %521 
                                         f32 %522 = OpLoad %389 
                                         f32 %523 = OpLoad %432 
                                         f32 %524 = OpFMul %522 %523 
                                                      OpStore %432 %524 
                                         f32 %525 = OpLoad %432 
                                         f32 %526 = OpExtInst %1 29 %525 
                                                      OpStore %432 %526 
                                         f32 %527 = OpLoad %432 
                                         f32 %528 = OpExtInst %1 37 %527 %438 
                                                      OpStore %432 %528 
                                         f32 %529 = OpLoad %428 
                                         f32 %530 = OpLoad %432 
                                         f32 %531 = OpFMul %529 %530 
                                                      OpStore %432 %531 
                                         f32 %532 = OpLoad %432 
                                       f32_3 %533 = OpCompositeConstruct %532 %532 %532 
                                         i32 %534 = OpLoad %402 
                              Uniform f32_4* %535 = OpAccessChain %25 %27 %534 
                                       f32_4 %536 = OpLoad %535 
                                       f32_3 %537 = OpVectorShuffle %536 %536 0 1 2 
                                       f32_3 %538 = OpFMul %533 %537 
                                       f32_3 %539 = OpLoad %195 
                                       f32_3 %540 = OpFAdd %538 %539 
                                                      OpStore %195 %540 
                                                      OpBranch %496 
                                             %496 = OpLabel 
                                         f32 %541 = OpLoad %428 
                                       f32_3 %542 = OpCompositeConstruct %541 %541 %541 
                                       f32_3 %543 = OpLoad %267 
                                       f32_3 %544 = OpFMul %542 %543 
                                                      OpStore %232 %544 
                                       f32_3 %545 = OpLoad %232 
                                       f32_3 %547 = OpExtInst %1 37 %545 %546 
                                                      OpStore %232 %547 
                                       f32_3 %548 = OpLoad %160 
                                       f32_3 %549 = OpLoad %232 
                                       f32_3 %550 = OpFAdd %548 %549 
                                                      OpStore %160 %550 
                                                      OpBranch %406 
                                             %406 = OpLabel 
                                         i32 %551 = OpLoad %402 
                                         i32 %552 = OpIAdd %551 %34 
                                                      OpStore %402 %552 
                                                      OpBranch %403 
                                             %405 = OpLabel 
                                       f32_3 %555 = OpLoad %195 
                              Uniform f32_4* %557 = OpAccessChain %25 %556 
                                       f32_4 %558 = OpLoad %557 
                                       f32_3 %559 = OpVectorShuffle %558 %558 0 1 2 
                                       f32_3 %560 = OpFMul %555 %559 
                                                      OpStore %554 %560 
                                       f32_3 %561 = OpLoad %554 
                                       f32_3 %562 = OpCompositeConstruct %397 %397 %397 
                                       f32_3 %563 = OpCompositeConstruct %438 %438 %438 
                                       f32_3 %564 = OpExtInst %1 43 %561 %562 %563 
                                                      OpStore %554 %564 
                                       f32_3 %567 = OpLoad %160 
                                       f32_4 %568 = OpLoad %566 
                                       f32_4 %569 = OpVectorShuffle %568 %567 4 5 6 3 
                                                      OpStore %566 %569 
                                       f32_4 %570 = OpLoad %566 
                                       f32_3 %571 = OpVectorShuffle %570 %570 0 1 2 
                                       f32_3 %572 = OpCompositeConstruct %397 %397 %397 
                                       f32_3 %573 = OpCompositeConstruct %438 %438 %438 
                                       f32_3 %574 = OpExtInst %1 43 %571 %572 %573 
                                       f32_4 %575 = OpLoad %566 
                                       f32_4 %576 = OpVectorShuffle %575 %574 4 5 6 3 
                                                      OpStore %566 %576 
                                Uniform f32* %577 = OpAccessChain %25 %375 %445 
                                         f32 %578 = OpLoad %577 
                                 Output f32* %580 = OpAccessChain %566 %445 
                                                      OpStore %580 %578 
                                 Output f32* %581 = OpAccessChain %566 %445 
                                         f32 %582 = OpLoad %581 
                                         f32 %583 = OpExtInst %1 43 %582 %397 %438 
                                 Output f32* %584 = OpAccessChain %566 %445 
                                                      OpStore %584 %583 
                                       f32_3 %589 = OpLoad %588 
                                       f32_2 %590 = OpVectorShuffle %589 %589 0 1 
                              Uniform f32_4* %592 = OpAccessChain %25 %591 
                                       f32_4 %593 = OpLoad %592 
                                       f32_2 %594 = OpVectorShuffle %593 %593 0 1 
                                       f32_2 %595 = OpFMul %590 %594 
                              Uniform f32_4* %596 = OpAccessChain %25 %591 
                                       f32_4 %597 = OpLoad %596 
                                       f32_2 %598 = OpVectorShuffle %597 %597 2 3 
                                       f32_2 %599 = OpFAdd %595 %598 
                                                      OpStore vs_TEXCOORD0 %599 
                                       f32_3 %600 = OpLoad %305 
                                       f32_4 %601 = OpVectorShuffle %600 %600 1 1 1 1 
                              Uniform f32_4* %602 = OpAccessChain %25 %26 %34 
                                       f32_4 %603 = OpLoad %602 
                                       f32_4 %604 = OpFMul %601 %603 
                                                      OpStore %9 %604 
                              Uniform f32_4* %605 = OpAccessChain %25 %26 %27 
                                       f32_4 %606 = OpLoad %605 
                                       f32_3 %607 = OpLoad %305 
                                       f32_4 %608 = OpVectorShuffle %607 %607 0 0 0 0 
                                       f32_4 %609 = OpFMul %606 %608 
                                       f32_4 %610 = OpLoad %9 
                                       f32_4 %611 = OpFAdd %609 %610 
                                                      OpStore %9 %611 
                              Uniform f32_4* %612 = OpAccessChain %25 %26 %53 
                                       f32_4 %613 = OpLoad %612 
                                       f32_3 %614 = OpLoad %305 
                                       f32_4 %615 = OpVectorShuffle %614 %614 2 2 2 2 
                                       f32_4 %616 = OpFMul %613 %615 
                                       f32_4 %617 = OpLoad %9 
                                       f32_4 %618 = OpFAdd %616 %617 
                                                      OpStore %9 %618 
                                       f32_4 %619 = OpLoad %9 
                              Uniform f32_4* %620 = OpAccessChain %25 %26 %26 
                                       f32_4 %621 = OpLoad %620 
                                       f32_4 %622 = OpFAdd %619 %621 
                                                      OpStore %9 %622 
                                       f32_4 %623 = OpLoad %9 
                                       f32_4 %624 = OpVectorShuffle %623 %623 1 1 1 1 
                              Uniform f32_4* %626 = OpAccessChain %25 %625 %34 
                                       f32_4 %627 = OpLoad %626 
                                       f32_4 %628 = OpFMul %624 %627 
                                                      OpStore %78 %628 
                              Uniform f32_4* %629 = OpAccessChain %25 %625 %27 
                                       f32_4 %630 = OpLoad %629 
                                       f32_4 %631 = OpLoad %9 
                                       f32_4 %632 = OpVectorShuffle %631 %631 0 0 0 0 
                                       f32_4 %633 = OpFMul %630 %632 
                                       f32_4 %634 = OpLoad %78 
                                       f32_4 %635 = OpFAdd %633 %634 
                                                      OpStore %78 %635 
                              Uniform f32_4* %636 = OpAccessChain %25 %625 %53 
                                       f32_4 %637 = OpLoad %636 
                                       f32_4 %638 = OpLoad %9 
                                       f32_4 %639 = OpVectorShuffle %638 %638 2 2 2 2 
                                       f32_4 %640 = OpFMul %637 %639 
                                       f32_4 %641 = OpLoad %78 
                                       f32_4 %642 = OpFAdd %640 %641 
                                                      OpStore %78 %642 
                              Uniform f32_4* %647 = OpAccessChain %25 %625 %26 
                                       f32_4 %648 = OpLoad %647 
                                       f32_4 %649 = OpLoad %9 
                                       f32_4 %650 = OpVectorShuffle %649 %649 3 3 3 3 
                                       f32_4 %651 = OpFMul %648 %650 
                                       f32_4 %652 = OpLoad %78 
                                       f32_4 %653 = OpFAdd %651 %652 
                               Output f32_4* %654 = OpAccessChain %646 %27 
                                                      OpStore %654 %653 
                                 Output f32* %655 = OpAccessChain %646 %27 %346 
                                         f32 %656 = OpLoad %655 
                                         f32 %657 = OpFNegate %656 
                                 Output f32* %658 = OpAccessChain %646 %27 %346 
                                                      OpStore %658 %657 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 51
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %29 %34 %40 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %29 Location 29 
                                             OpDecorate %34 Location 34 
                                             OpDecorate %40 Location 40 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                                     %28 = OpTypePointer Input %24 
                        Input f32_4* %29 = OpVariable Input 
                                     %33 = OpTypePointer Output %24 
                       Output f32_4* %34 = OpVariable Output 
                                 f32 %36 = OpConstant 3.674022E-40 
                               f32_3 %37 = OpConstantComposite %36 %36 %36 
                                     %39 = OpTypePointer Input %7 
                        Input f32_3* %40 = OpVariable Input 
                                 f32 %45 = OpConstant 3.674022E-40 
                                     %46 = OpTypeInt 32 0 
                                 u32 %47 = OpConstant 3 
                                     %48 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %27 = OpLoad %9 
                               f32_4 %30 = OpLoad %29 
                               f32_3 %31 = OpVectorShuffle %30 %30 0 1 2 
                               f32_3 %32 = OpFMul %27 %31 
                                             OpStore %9 %32 
                               f32_3 %35 = OpLoad %9 
                               f32_3 %38 = OpFMul %35 %37 
                               f32_3 %41 = OpLoad %40 
                               f32_3 %42 = OpFAdd %38 %41 
                               f32_4 %43 = OpLoad %34 
                               f32_4 %44 = OpVectorShuffle %43 %42 4 5 6 3 
                                             OpStore %34 %44 
                         Output f32* %49 = OpAccessChain %34 %47 
                                             OpStore %49 %45 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" }
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
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Emission;
uniform 	float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec3 vs_COLOR1;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
bool u_xlatb6;
float u_xlat21;
float u_xlat22;
int u_xlati23;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
bool u_xlatb25;
bool u_xlatb26;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + _Emission.xyz;
    u_xlat22 = _Shininess * 128.0;
    u_xlat3.xyz = u_xlat2.xyz;
    u_xlat4.x = float(0.0);
    u_xlat4.y = float(0.0);
    u_xlat4.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat5.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat24 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat25 = unity_LightAtten[u_xlati_loop_1].z * u_xlat24 + 1.0;
        u_xlat25 = float(1.0) / u_xlat25;
        u_xlatb26 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb6 = unity_LightAtten[u_xlati_loop_1].w<u_xlat24;
        u_xlatb26 = u_xlatb26 && u_xlatb6;
        u_xlat25 = (u_xlatb26) ? 0.0 : u_xlat25;
        u_xlat24 = max(u_xlat24, 9.99999997e-07);
        u_xlat24 = inversesqrt(u_xlat24);
        u_xlat5.xyz = vec3(u_xlat24) * u_xlat5.xyz;
        u_xlat24 = dot(u_xlat5.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat24 = max(u_xlat24, 0.0);
        u_xlat24 = u_xlat24 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat24 = u_xlat24 * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
        u_xlat24 = u_xlat24 * u_xlat25;
        u_xlat24 = u_xlat24 * 0.5;
        u_xlat25 = dot(u_xlat1.xyz, u_xlat5.xyz);
        u_xlat25 = max(u_xlat25, 0.0);
        u_xlat6.xyz = vec3(u_xlat25) * _Color.xyz;
        u_xlat6.xyz = u_xlat6.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb25 = 0.0<u_xlat25;
        if(u_xlatb25){
            u_xlat5.xyz = (-u_xlat0.xyz) * vec3(u_xlat21) + u_xlat5.xyz;
            u_xlat25 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat25 = inversesqrt(u_xlat25);
            u_xlat5.xyz = vec3(u_xlat25) * u_xlat5.xyz;
            u_xlat25 = dot(u_xlat1.xyz, u_xlat5.xyz);
            u_xlat25 = max(u_xlat25, 0.0);
            u_xlat25 = log2(u_xlat25);
            u_xlat25 = u_xlat22 * u_xlat25;
            u_xlat25 = exp2(u_xlat25);
            u_xlat25 = min(u_xlat25, 1.0);
            u_xlat25 = u_xlat24 * u_xlat25;
            u_xlat4.xyz = vec3(u_xlat25) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat4.xyz;
        }
        u_xlat5.xyz = vec3(u_xlat24) * u_xlat6.xyz;
        u_xlat5.xyz = min(u_xlat5.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat3.xyz = u_xlat3.xyz + u_xlat5.xyz;
    }
    vs_COLOR1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat3.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec3 vs_COLOR1;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vs_COLOR1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SPOT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 689
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %307 %339 %580 %592 %613 %614 %672 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpMemberDecorate %24 0 Offset 24 
                                                      OpMemberDecorate %24 1 Offset 24 
                                                      OpMemberDecorate %24 2 Offset 24 
                                                      OpMemberDecorate %24 3 Offset 24 
                                                      OpMemberDecorate %24 4 Offset 24 
                                                      OpMemberDecorate %24 5 Offset 24 
                                                      OpMemberDecorate %24 6 Offset 24 
                                                      OpMemberDecorate %24 7 Offset 24 
                                                      OpMemberDecorate %24 8 Offset 24 
                                                      OpMemberDecorate %24 9 Offset 24 
                                                      OpMemberDecorate %24 10 Offset 24 
                                                      OpMemberDecorate %24 11 Offset 24 
                                                      OpMemberDecorate %24 12 Offset 24 
                                                      OpMemberDecorate %24 13 Offset 24 
                                                      OpMemberDecorate %24 14 Offset 24 
                                                      OpMemberDecorate %24 15 Offset 24 
                                                      OpDecorate %24 Block 
                                                      OpDecorate %26 DescriptorSet 26 
                                                      OpDecorate %26 Binding 26 
                                                      OpDecorate %307 Location 307 
                                                      OpDecorate %339 Location 339 
                                                      OpDecorate %580 Location 580 
                                                      OpDecorate %592 Location 592 
                                                      OpDecorate vs_TEXCOORD0 Location 613 
                                                      OpDecorate %614 Location 614 
                                                      OpMemberDecorate %670 0 BuiltIn 670 
                                                      OpMemberDecorate %670 1 BuiltIn 670 
                                                      OpMemberDecorate %670 2 BuiltIn 670 
                                                      OpDecorate %670 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                              %15 = OpTypeArray %7 %11 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeArray %7 %16 
                                              %20 = OpTypeArray %7 %16 
                                              %21 = OpTypeArray %7 %16 
                                              %22 = OpTypeInt 32 1 
                                              %23 = OpTypeVector %22 4 
                                              %24 = OpTypeStruct %12 %13 %14 %15 %17 %18 %7 %19 %20 %21 %7 %7 %7 %6 %23 %7 
                                              %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32; i32_4; f32_4;}* %26 = OpVariable Uniform 
                                          i32 %27 = OpConstant 4 
                                          i32 %28 = OpConstant 0 
                                              %29 = OpTypeVector %6 3 
                                              %30 = OpTypePointer Uniform %7 
                                          i32 %34 = OpConstant 7 
                                          i32 %35 = OpConstant 1 
                                          i32 %54 = OpConstant 2 
                                          i32 %67 = OpConstant 3 
                               Private f32_4* %80 = OpVariable Private 
                                             %126 = OpTypePointer Private %29 
                              Private f32_3* %127 = OpVariable Private 
                              Private f32_3* %162 = OpVariable Private 
                              Private f32_3* %197 = OpVariable Private 
                                         i32 %198 = OpConstant 5 
                                         i32 %202 = OpConstant 8 
                              Private f32_3* %234 = OpVariable Private 
                              Private f32_3* %269 = OpVariable Private 
                                             %306 = OpTypePointer Input %29 
                                Input f32_3* %307 = OpVariable Input 
                                Input f32_3* %339 = OpVariable Input 
                                         u32 %342 = OpConstant 0 
                                             %343 = OpTypePointer Private %6 
                                         u32 %348 = OpConstant 1 
                                         u32 %353 = OpConstant 2 
                                Private f32* %355 = OpVariable Private 
                                         i32 %377 = OpConstant 10 
                                         i32 %381 = OpConstant 6 
                                         i32 %386 = OpConstant 12 
                                Private f32* %391 = OpVariable Private 
                                         i32 %392 = OpConstant 13 
                                             %393 = OpTypePointer Uniform %6 
                                         f32 %396 = OpConstant 3.674022E-40 
                                         f32 %399 = OpConstant 3.674022E-40 
                                             %403 = OpTypePointer Function %22 
                                         i32 %411 = OpConstant 14 
                                             %412 = OpTypePointer Uniform %22 
                                             %415 = OpTypeBool 
                                Private f32* %430 = OpVariable Private 
                                Private f32* %434 = OpVariable Private 
                                         f32 %440 = OpConstant 3.674022E-40 
                                             %444 = OpTypePointer Private %415 
                               Private bool* %445 = OpVariable Private 
                                         u32 %447 = OpConstant 3 
                               Private bool* %451 = OpVariable Private 
                                         f32 %464 = OpConstant 3.674022E-40 
                                         f32 %497 = OpConstant 3.674022E-40 
                               Private bool* %517 = OpVariable Private 
                                       f32_3 %572 = OpConstantComposite %440 %440 %440 
                                             %579 = OpTypePointer Output %29 
                               Output f32_3* %580 = OpVariable Output 
                                         i32 %582 = OpConstant 11 
                                             %591 = OpTypePointer Output %7 
                               Output f32_4* %592 = OpVariable Output 
                                             %605 = OpTypePointer Output %6 
                                             %611 = OpTypeVector %6 2 
                                             %612 = OpTypePointer Output %611 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_3* %614 = OpVariable Input 
                                         i32 %617 = OpConstant 15 
                                         i32 %651 = OpConstant 9 
                                             %669 = OpTypeArray %6 %348 
                                             %670 = OpTypeStruct %7 %6 %669 
                                             %671 = OpTypePointer Output %670 
        Output struct {f32_4; f32; f32[1];}* %672 = OpVariable Output 
                                             %686 = OpTypePointer Private %22 
                                Private i32* %687 = OpVariable Private 
                               Private bool* %688 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %404 = OpVariable Function 
                               Uniform f32_4* %31 = OpAccessChain %26 %27 %28 
                                        f32_4 %32 = OpLoad %31 
                                        f32_3 %33 = OpVectorShuffle %32 %32 1 1 1 
                               Uniform f32_4* %36 = OpAccessChain %26 %34 %35 
                                        f32_4 %37 = OpLoad %36 
                                        f32_3 %38 = OpVectorShuffle %37 %37 0 1 2 
                                        f32_3 %39 = OpFMul %33 %38 
                                        f32_4 %40 = OpLoad %9 
                                        f32_4 %41 = OpVectorShuffle %40 %39 4 5 6 3 
                                                      OpStore %9 %41 
                               Uniform f32_4* %42 = OpAccessChain %26 %34 %28 
                                        f32_4 %43 = OpLoad %42 
                                        f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                               Uniform f32_4* %45 = OpAccessChain %26 %27 %28 
                                        f32_4 %46 = OpLoad %45 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 0 0 
                                        f32_3 %48 = OpFMul %44 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %51 = OpFAdd %48 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpVectorShuffle %52 %51 4 5 6 3 
                                                      OpStore %9 %53 
                               Uniform f32_4* %55 = OpAccessChain %26 %34 %54 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                               Uniform f32_4* %58 = OpAccessChain %26 %27 %28 
                                        f32_4 %59 = OpLoad %58 
                                        f32_3 %60 = OpVectorShuffle %59 %59 2 2 2 
                                        f32_3 %61 = OpFMul %57 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                                        f32_3 %64 = OpFAdd %61 %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %64 4 5 6 3 
                                                      OpStore %9 %66 
                               Uniform f32_4* %68 = OpAccessChain %26 %34 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                               Uniform f32_4* %71 = OpAccessChain %26 %27 %28 
                                        f32_4 %72 = OpLoad %71 
                                        f32_3 %73 = OpVectorShuffle %72 %72 3 3 3 
                                        f32_3 %74 = OpFMul %70 %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                                        f32_3 %77 = OpFAdd %74 %76 
                                        f32_4 %78 = OpLoad %9 
                                        f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
                                                      OpStore %9 %79 
                               Uniform f32_4* %81 = OpAccessChain %26 %27 %35 
                                        f32_4 %82 = OpLoad %81 
                                        f32_3 %83 = OpVectorShuffle %82 %82 1 1 1 
                               Uniform f32_4* %84 = OpAccessChain %26 %34 %35 
                                        f32_4 %85 = OpLoad %84 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFMul %83 %86 
                                        f32_4 %88 = OpLoad %80 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %80 %89 
                               Uniform f32_4* %90 = OpAccessChain %26 %34 %28 
                                        f32_4 %91 = OpLoad %90 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                               Uniform f32_4* %93 = OpAccessChain %26 %27 %35 
                                        f32_4 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 0 0 
                                        f32_3 %96 = OpFMul %92 %95 
                                        f32_4 %97 = OpLoad %80 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                        f32_3 %99 = OpFAdd %96 %98 
                                       f32_4 %100 = OpLoad %80 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 5 6 3 
                                                      OpStore %80 %101 
                              Uniform f32_4* %102 = OpAccessChain %26 %34 %54 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                              Uniform f32_4* %105 = OpAccessChain %26 %27 %35 
                                       f32_4 %106 = OpLoad %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 2 2 2 
                                       f32_3 %108 = OpFMul %104 %107 
                                       f32_4 %109 = OpLoad %80 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                       f32_3 %111 = OpFAdd %108 %110 
                                       f32_4 %112 = OpLoad %80 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %80 %113 
                              Uniform f32_4* %114 = OpAccessChain %26 %34 %67 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                              Uniform f32_4* %117 = OpAccessChain %26 %27 %35 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 3 3 3 
                                       f32_3 %120 = OpFMul %116 %119 
                                       f32_4 %121 = OpLoad %80 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFAdd %120 %122 
                                       f32_4 %124 = OpLoad %80 
                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 6 3 
                                                      OpStore %80 %125 
                              Uniform f32_4* %128 = OpAccessChain %26 %27 %54 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 1 1 1 
                              Uniform f32_4* %131 = OpAccessChain %26 %34 %35 
                                       f32_4 %132 = OpLoad %131 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpFMul %130 %133 
                                                      OpStore %127 %134 
                              Uniform f32_4* %135 = OpAccessChain %26 %34 %28 
                                       f32_4 %136 = OpLoad %135 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                              Uniform f32_4* %138 = OpAccessChain %26 %27 %54 
                                       f32_4 %139 = OpLoad %138 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 0 0 
                                       f32_3 %141 = OpFMul %137 %140 
                                       f32_3 %142 = OpLoad %127 
                                       f32_3 %143 = OpFAdd %141 %142 
                                                      OpStore %127 %143 
                              Uniform f32_4* %144 = OpAccessChain %26 %34 %54 
                                       f32_4 %145 = OpLoad %144 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                              Uniform f32_4* %147 = OpAccessChain %26 %27 %54 
                                       f32_4 %148 = OpLoad %147 
                                       f32_3 %149 = OpVectorShuffle %148 %148 2 2 2 
                                       f32_3 %150 = OpFMul %146 %149 
                                       f32_3 %151 = OpLoad %127 
                                       f32_3 %152 = OpFAdd %150 %151 
                                                      OpStore %127 %152 
                              Uniform f32_4* %153 = OpAccessChain %26 %34 %67 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                              Uniform f32_4* %156 = OpAccessChain %26 %27 %54 
                                       f32_4 %157 = OpLoad %156 
                                       f32_3 %158 = OpVectorShuffle %157 %157 3 3 3 
                                       f32_3 %159 = OpFMul %155 %158 
                                       f32_3 %160 = OpLoad %127 
                                       f32_3 %161 = OpFAdd %159 %160 
                                                      OpStore %127 %161 
                              Uniform f32_4* %163 = OpAccessChain %26 %27 %67 
                                       f32_4 %164 = OpLoad %163 
                                       f32_3 %165 = OpVectorShuffle %164 %164 1 1 1 
                              Uniform f32_4* %166 = OpAccessChain %26 %34 %35 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpFMul %165 %168 
                                                      OpStore %162 %169 
                              Uniform f32_4* %170 = OpAccessChain %26 %34 %28 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                              Uniform f32_4* %173 = OpAccessChain %26 %27 %67 
                                       f32_4 %174 = OpLoad %173 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 0 0 
                                       f32_3 %176 = OpFMul %172 %175 
                                       f32_3 %177 = OpLoad %162 
                                       f32_3 %178 = OpFAdd %176 %177 
                                                      OpStore %162 %178 
                              Uniform f32_4* %179 = OpAccessChain %26 %34 %54 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                              Uniform f32_4* %182 = OpAccessChain %26 %27 %67 
                                       f32_4 %183 = OpLoad %182 
                                       f32_3 %184 = OpVectorShuffle %183 %183 2 2 2 
                                       f32_3 %185 = OpFMul %181 %184 
                                       f32_3 %186 = OpLoad %162 
                                       f32_3 %187 = OpFAdd %185 %186 
                                                      OpStore %162 %187 
                              Uniform f32_4* %188 = OpAccessChain %26 %34 %67 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                              Uniform f32_4* %191 = OpAccessChain %26 %27 %67 
                                       f32_4 %192 = OpLoad %191 
                                       f32_3 %193 = OpVectorShuffle %192 %192 3 3 3 
                                       f32_3 %194 = OpFMul %190 %193 
                                       f32_3 %195 = OpLoad %162 
                                       f32_3 %196 = OpFAdd %194 %195 
                                                      OpStore %162 %196 
                              Uniform f32_4* %199 = OpAccessChain %26 %198 %35 
                                       f32_4 %200 = OpLoad %199 
                                       f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
                              Uniform f32_4* %203 = OpAccessChain %26 %202 %28 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 1 1 1 
                                       f32_3 %206 = OpFMul %201 %205 
                                                      OpStore %197 %206 
                              Uniform f32_4* %207 = OpAccessChain %26 %198 %28 
                                       f32_4 %208 = OpLoad %207 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                              Uniform f32_4* %210 = OpAccessChain %26 %202 %28 
                                       f32_4 %211 = OpLoad %210 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 0 0 
                                       f32_3 %213 = OpFMul %209 %212 
                                       f32_3 %214 = OpLoad %197 
                                       f32_3 %215 = OpFAdd %213 %214 
                                                      OpStore %197 %215 
                              Uniform f32_4* %216 = OpAccessChain %26 %198 %54 
                                       f32_4 %217 = OpLoad %216 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                              Uniform f32_4* %219 = OpAccessChain %26 %202 %28 
                                       f32_4 %220 = OpLoad %219 
                                       f32_3 %221 = OpVectorShuffle %220 %220 2 2 2 
                                       f32_3 %222 = OpFMul %218 %221 
                                       f32_3 %223 = OpLoad %197 
                                       f32_3 %224 = OpFAdd %222 %223 
                                                      OpStore %197 %224 
                              Uniform f32_4* %225 = OpAccessChain %26 %198 %67 
                                       f32_4 %226 = OpLoad %225 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
                              Uniform f32_4* %228 = OpAccessChain %26 %202 %28 
                                       f32_4 %229 = OpLoad %228 
                                       f32_3 %230 = OpVectorShuffle %229 %229 3 3 3 
                                       f32_3 %231 = OpFMul %227 %230 
                                       f32_3 %232 = OpLoad %197 
                                       f32_3 %233 = OpFAdd %231 %232 
                                                      OpStore %197 %233 
                              Uniform f32_4* %235 = OpAccessChain %26 %198 %35 
                                       f32_4 %236 = OpLoad %235 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
                              Uniform f32_4* %238 = OpAccessChain %26 %202 %35 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 1 1 1 
                                       f32_3 %241 = OpFMul %237 %240 
                                                      OpStore %234 %241 
                              Uniform f32_4* %242 = OpAccessChain %26 %198 %28 
                                       f32_4 %243 = OpLoad %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                              Uniform f32_4* %245 = OpAccessChain %26 %202 %35 
                                       f32_4 %246 = OpLoad %245 
                                       f32_3 %247 = OpVectorShuffle %246 %246 0 0 0 
                                       f32_3 %248 = OpFMul %244 %247 
                                       f32_3 %249 = OpLoad %234 
                                       f32_3 %250 = OpFAdd %248 %249 
                                                      OpStore %234 %250 
                              Uniform f32_4* %251 = OpAccessChain %26 %198 %54 
                                       f32_4 %252 = OpLoad %251 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                              Uniform f32_4* %254 = OpAccessChain %26 %202 %35 
                                       f32_4 %255 = OpLoad %254 
                                       f32_3 %256 = OpVectorShuffle %255 %255 2 2 2 
                                       f32_3 %257 = OpFMul %253 %256 
                                       f32_3 %258 = OpLoad %234 
                                       f32_3 %259 = OpFAdd %257 %258 
                                                      OpStore %234 %259 
                              Uniform f32_4* %260 = OpAccessChain %26 %198 %67 
                                       f32_4 %261 = OpLoad %260 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                              Uniform f32_4* %263 = OpAccessChain %26 %202 %35 
                                       f32_4 %264 = OpLoad %263 
                                       f32_3 %265 = OpVectorShuffle %264 %264 3 3 3 
                                       f32_3 %266 = OpFMul %262 %265 
                                       f32_3 %267 = OpLoad %234 
                                       f32_3 %268 = OpFAdd %266 %267 
                                                      OpStore %234 %268 
                              Uniform f32_4* %270 = OpAccessChain %26 %198 %35 
                                       f32_4 %271 = OpLoad %270 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                              Uniform f32_4* %273 = OpAccessChain %26 %202 %54 
                                       f32_4 %274 = OpLoad %273 
                                       f32_3 %275 = OpVectorShuffle %274 %274 1 1 1 
                                       f32_3 %276 = OpFMul %272 %275 
                                                      OpStore %269 %276 
                              Uniform f32_4* %277 = OpAccessChain %26 %198 %28 
                                       f32_4 %278 = OpLoad %277 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                              Uniform f32_4* %280 = OpAccessChain %26 %202 %54 
                                       f32_4 %281 = OpLoad %280 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 0 0 
                                       f32_3 %283 = OpFMul %279 %282 
                                       f32_3 %284 = OpLoad %269 
                                       f32_3 %285 = OpFAdd %283 %284 
                                                      OpStore %269 %285 
                              Uniform f32_4* %286 = OpAccessChain %26 %198 %54 
                                       f32_4 %287 = OpLoad %286 
                                       f32_3 %288 = OpVectorShuffle %287 %287 0 1 2 
                              Uniform f32_4* %289 = OpAccessChain %26 %202 %54 
                                       f32_4 %290 = OpLoad %289 
                                       f32_3 %291 = OpVectorShuffle %290 %290 2 2 2 
                                       f32_3 %292 = OpFMul %288 %291 
                                       f32_3 %293 = OpLoad %269 
                                       f32_3 %294 = OpFAdd %292 %293 
                                                      OpStore %269 %294 
                              Uniform f32_4* %295 = OpAccessChain %26 %198 %67 
                                       f32_4 %296 = OpLoad %295 
                                       f32_3 %297 = OpVectorShuffle %296 %296 0 1 2 
                              Uniform f32_4* %298 = OpAccessChain %26 %202 %54 
                                       f32_4 %299 = OpLoad %298 
                                       f32_3 %300 = OpVectorShuffle %299 %299 3 3 3 
                                       f32_3 %301 = OpFMul %297 %300 
                                       f32_3 %302 = OpLoad %269 
                                       f32_3 %303 = OpFAdd %301 %302 
                                                      OpStore %269 %303 
                                       f32_4 %304 = OpLoad %80 
                                       f32_3 %305 = OpVectorShuffle %304 %304 0 1 2 
                                       f32_3 %308 = OpLoad %307 
                                       f32_3 %309 = OpVectorShuffle %308 %308 1 1 1 
                                       f32_3 %310 = OpFMul %305 %309 
                                       f32_4 %311 = OpLoad %80 
                                       f32_4 %312 = OpVectorShuffle %311 %310 4 5 6 3 
                                                      OpStore %80 %312 
                                       f32_4 %313 = OpLoad %9 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 1 2 
                                       f32_3 %315 = OpLoad %307 
                                       f32_3 %316 = OpVectorShuffle %315 %315 0 0 0 
                                       f32_3 %317 = OpFMul %314 %316 
                                       f32_4 %318 = OpLoad %80 
                                       f32_3 %319 = OpVectorShuffle %318 %318 0 1 2 
                                       f32_3 %320 = OpFAdd %317 %319 
                                       f32_4 %321 = OpLoad %9 
                                       f32_4 %322 = OpVectorShuffle %321 %320 4 5 6 3 
                                                      OpStore %9 %322 
                                       f32_3 %323 = OpLoad %127 
                                       f32_3 %324 = OpLoad %307 
                                       f32_3 %325 = OpVectorShuffle %324 %324 2 2 2 
                                       f32_3 %326 = OpFMul %323 %325 
                                       f32_4 %327 = OpLoad %9 
                                       f32_3 %328 = OpVectorShuffle %327 %327 0 1 2 
                                       f32_3 %329 = OpFAdd %326 %328 
                                       f32_4 %330 = OpLoad %9 
                                       f32_4 %331 = OpVectorShuffle %330 %329 4 5 6 3 
                                                      OpStore %9 %331 
                                       f32_3 %332 = OpLoad %162 
                                       f32_4 %333 = OpLoad %9 
                                       f32_3 %334 = OpVectorShuffle %333 %333 0 1 2 
                                       f32_3 %335 = OpFAdd %332 %334 
                                       f32_4 %336 = OpLoad %9 
                                       f32_4 %337 = OpVectorShuffle %336 %335 4 5 6 3 
                                                      OpStore %9 %337 
                                       f32_3 %338 = OpLoad %197 
                                       f32_3 %340 = OpLoad %339 
                                         f32 %341 = OpDot %338 %340 
                                Private f32* %344 = OpAccessChain %80 %342 
                                                      OpStore %344 %341 
                                       f32_3 %345 = OpLoad %234 
                                       f32_3 %346 = OpLoad %339 
                                         f32 %347 = OpDot %345 %346 
                                Private f32* %349 = OpAccessChain %80 %348 
                                                      OpStore %349 %347 
                                       f32_3 %350 = OpLoad %269 
                                       f32_3 %351 = OpLoad %339 
                                         f32 %352 = OpDot %350 %351 
                                Private f32* %354 = OpAccessChain %80 %353 
                                                      OpStore %354 %352 
                                       f32_4 %356 = OpLoad %80 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                       f32_4 %358 = OpLoad %80 
                                       f32_3 %359 = OpVectorShuffle %358 %358 0 1 2 
                                         f32 %360 = OpDot %357 %359 
                                                      OpStore %355 %360 
                                         f32 %361 = OpLoad %355 
                                         f32 %362 = OpExtInst %1 32 %361 
                                                      OpStore %355 %362 
                                         f32 %363 = OpLoad %355 
                                       f32_3 %364 = OpCompositeConstruct %363 %363 %363 
                                       f32_4 %365 = OpLoad %80 
                                       f32_3 %366 = OpVectorShuffle %365 %365 0 1 2 
                                       f32_3 %367 = OpFMul %364 %366 
                                       f32_4 %368 = OpLoad %80 
                                       f32_4 %369 = OpVectorShuffle %368 %367 4 5 6 3 
                                                      OpStore %80 %369 
                                       f32_4 %370 = OpLoad %9 
                                       f32_3 %371 = OpVectorShuffle %370 %370 0 1 2 
                                       f32_4 %372 = OpLoad %9 
                                       f32_3 %373 = OpVectorShuffle %372 %372 0 1 2 
                                         f32 %374 = OpDot %371 %373 
                                                      OpStore %355 %374 
                                         f32 %375 = OpLoad %355 
                                         f32 %376 = OpExtInst %1 32 %375 
                                                      OpStore %355 %376 
                              Uniform f32_4* %378 = OpAccessChain %26 %377 
                                       f32_4 %379 = OpLoad %378 
                                       f32_3 %380 = OpVectorShuffle %379 %379 0 1 2 
                              Uniform f32_4* %382 = OpAccessChain %26 %381 
                                       f32_4 %383 = OpLoad %382 
                                       f32_3 %384 = OpVectorShuffle %383 %383 0 1 2 
                                       f32_3 %385 = OpFMul %380 %384 
                              Uniform f32_4* %387 = OpAccessChain %26 %386 
                                       f32_4 %388 = OpLoad %387 
                                       f32_3 %389 = OpVectorShuffle %388 %388 0 1 2 
                                       f32_3 %390 = OpFAdd %385 %389 
                                                      OpStore %127 %390 
                                Uniform f32* %394 = OpAccessChain %26 %392 
                                         f32 %395 = OpLoad %394 
                                         f32 %397 = OpFMul %395 %396 
                                                      OpStore %391 %397 
                                       f32_3 %398 = OpLoad %127 
                                                      OpStore %162 %398 
                                Private f32* %400 = OpAccessChain %197 %342 
                                                      OpStore %400 %399 
                                Private f32* %401 = OpAccessChain %197 %348 
                                                      OpStore %401 %399 
                                Private f32* %402 = OpAccessChain %197 %353 
                                                      OpStore %402 %399 
                                                      OpStore %404 %28 
                                                      OpBranch %405 
                                             %405 = OpLabel 
                                                      OpLoopMerge %407 %408 None 
                                                      OpBranch %409 
                                             %409 = OpLabel 
                                         i32 %410 = OpLoad %404 
                                Uniform i32* %413 = OpAccessChain %26 %411 %342 
                                         i32 %414 = OpLoad %413 
                                        bool %416 = OpSLessThan %410 %414 
                                                      OpBranchConditional %416 %406 %407 
                                             %406 = OpLabel 
                                       f32_4 %417 = OpLoad %9 
                                       f32_3 %418 = OpVectorShuffle %417 %417 0 1 2 
                                       f32_3 %419 = OpFNegate %418 
                                         i32 %420 = OpLoad %404 
                              Uniform f32_4* %421 = OpAccessChain %26 %35 %420 
                                       f32_4 %422 = OpLoad %421 
                                       f32_3 %423 = OpVectorShuffle %422 %422 3 3 3 
                                       f32_3 %424 = OpFMul %419 %423 
                                         i32 %425 = OpLoad %404 
                              Uniform f32_4* %426 = OpAccessChain %26 %35 %425 
                                       f32_4 %427 = OpLoad %426 
                                       f32_3 %428 = OpVectorShuffle %427 %427 0 1 2 
                                       f32_3 %429 = OpFAdd %424 %428 
                                                      OpStore %234 %429 
                                       f32_3 %431 = OpLoad %234 
                                       f32_3 %432 = OpLoad %234 
                                         f32 %433 = OpDot %431 %432 
                                                      OpStore %430 %433 
                                         i32 %435 = OpLoad %404 
                                Uniform f32* %436 = OpAccessChain %26 %54 %435 %353 
                                         f32 %437 = OpLoad %436 
                                         f32 %438 = OpLoad %430 
                                         f32 %439 = OpFMul %437 %438 
                                         f32 %441 = OpFAdd %439 %440 
                                                      OpStore %434 %441 
                                         f32 %442 = OpLoad %434 
                                         f32 %443 = OpFDiv %440 %442 
                                                      OpStore %434 %443 
                                         i32 %446 = OpLoad %404 
                                Uniform f32* %448 = OpAccessChain %26 %35 %446 %447 
                                         f32 %449 = OpLoad %448 
                                        bool %450 = OpFOrdNotEqual %399 %449 
                                                      OpStore %445 %450 
                                         i32 %452 = OpLoad %404 
                                Uniform f32* %453 = OpAccessChain %26 %54 %452 %447 
                                         f32 %454 = OpLoad %453 
                                         f32 %455 = OpLoad %430 
                                        bool %456 = OpFOrdLessThan %454 %455 
                                                      OpStore %451 %456 
                                        bool %457 = OpLoad %445 
                                        bool %458 = OpLoad %451 
                                        bool %459 = OpLogicalAnd %457 %458 
                                                      OpStore %445 %459 
                                        bool %460 = OpLoad %445 
                                         f32 %461 = OpLoad %434 
                                         f32 %462 = OpSelect %460 %399 %461 
                                                      OpStore %434 %462 
                                         f32 %463 = OpLoad %430 
                                         f32 %465 = OpExtInst %1 40 %463 %464 
                                                      OpStore %430 %465 
                                         f32 %466 = OpLoad %430 
                                         f32 %467 = OpExtInst %1 32 %466 
                                                      OpStore %430 %467 
                                         f32 %468 = OpLoad %430 
                                       f32_3 %469 = OpCompositeConstruct %468 %468 %468 
                                       f32_3 %470 = OpLoad %234 
                                       f32_3 %471 = OpFMul %469 %470 
                                                      OpStore %234 %471 
                                       f32_3 %472 = OpLoad %234 
                                         i32 %473 = OpLoad %404 
                              Uniform f32_4* %474 = OpAccessChain %26 %67 %473 
                                       f32_4 %475 = OpLoad %474 
                                       f32_3 %476 = OpVectorShuffle %475 %475 0 1 2 
                                         f32 %477 = OpDot %472 %476 
                                                      OpStore %430 %477 
                                         f32 %478 = OpLoad %430 
                                         f32 %479 = OpExtInst %1 40 %478 %399 
                                                      OpStore %430 %479 
                                         f32 %480 = OpLoad %430 
                                         i32 %481 = OpLoad %404 
                                Uniform f32* %482 = OpAccessChain %26 %54 %481 %342 
                                         f32 %483 = OpLoad %482 
                                         f32 %484 = OpFNegate %483 
                                         f32 %485 = OpFAdd %480 %484 
                                                      OpStore %430 %485 
                                         f32 %486 = OpLoad %430 
                                         i32 %487 = OpLoad %404 
                                Uniform f32* %488 = OpAccessChain %26 %54 %487 %348 
                                         f32 %489 = OpLoad %488 
                                         f32 %490 = OpFMul %486 %489 
                                                      OpStore %430 %490 
                                         f32 %491 = OpLoad %430 
                                         f32 %492 = OpExtInst %1 43 %491 %399 %440 
                                                      OpStore %430 %492 
                                         f32 %493 = OpLoad %430 
                                         f32 %494 = OpLoad %434 
                                         f32 %495 = OpFMul %493 %494 
                                                      OpStore %430 %495 
                                         f32 %496 = OpLoad %430 
                                         f32 %498 = OpFMul %496 %497 
                                                      OpStore %430 %498 
                                       f32_4 %499 = OpLoad %80 
                                       f32_3 %500 = OpVectorShuffle %499 %499 0 1 2 
                                       f32_3 %501 = OpLoad %234 
                                         f32 %502 = OpDot %500 %501 
                                                      OpStore %434 %502 
                                         f32 %503 = OpLoad %434 
                                         f32 %504 = OpExtInst %1 40 %503 %399 
                                                      OpStore %434 %504 
                                         f32 %505 = OpLoad %434 
                                       f32_3 %506 = OpCompositeConstruct %505 %505 %505 
                              Uniform f32_4* %507 = OpAccessChain %26 %377 
                                       f32_4 %508 = OpLoad %507 
                                       f32_3 %509 = OpVectorShuffle %508 %508 0 1 2 
                                       f32_3 %510 = OpFMul %506 %509 
                                                      OpStore %269 %510 
                                       f32_3 %511 = OpLoad %269 
                                         i32 %512 = OpLoad %404 
                              Uniform f32_4* %513 = OpAccessChain %26 %28 %512 
                                       f32_4 %514 = OpLoad %513 
                                       f32_3 %515 = OpVectorShuffle %514 %514 0 1 2 
                                       f32_3 %516 = OpFMul %511 %515 
                                                      OpStore %269 %516 
                                         f32 %518 = OpLoad %434 
                                        bool %519 = OpFOrdLessThan %399 %518 
                                                      OpStore %517 %519 
                                        bool %520 = OpLoad %517 
                                                      OpSelectionMerge %522 None 
                                                      OpBranchConditional %520 %521 %522 
                                             %521 = OpLabel 
                                       f32_4 %523 = OpLoad %9 
                                       f32_3 %524 = OpVectorShuffle %523 %523 0 1 2 
                                       f32_3 %525 = OpFNegate %524 
                                         f32 %526 = OpLoad %355 
                                       f32_3 %527 = OpCompositeConstruct %526 %526 %526 
                                       f32_3 %528 = OpFMul %525 %527 
                                       f32_3 %529 = OpLoad %234 
                                       f32_3 %530 = OpFAdd %528 %529 
                                                      OpStore %234 %530 
                                       f32_3 %531 = OpLoad %234 
                                       f32_3 %532 = OpLoad %234 
                                         f32 %533 = OpDot %531 %532 
                                                      OpStore %434 %533 
                                         f32 %534 = OpLoad %434 
                                         f32 %535 = OpExtInst %1 32 %534 
                                                      OpStore %434 %535 
                                         f32 %536 = OpLoad %434 
                                       f32_3 %537 = OpCompositeConstruct %536 %536 %536 
                                       f32_3 %538 = OpLoad %234 
                                       f32_3 %539 = OpFMul %537 %538 
                                                      OpStore %234 %539 
                                       f32_4 %540 = OpLoad %80 
                                       f32_3 %541 = OpVectorShuffle %540 %540 0 1 2 
                                       f32_3 %542 = OpLoad %234 
                                         f32 %543 = OpDot %541 %542 
                                                      OpStore %434 %543 
                                         f32 %544 = OpLoad %434 
                                         f32 %545 = OpExtInst %1 40 %544 %399 
                                                      OpStore %434 %545 
                                         f32 %546 = OpLoad %434 
                                         f32 %547 = OpExtInst %1 30 %546 
                                                      OpStore %434 %547 
                                         f32 %548 = OpLoad %391 
                                         f32 %549 = OpLoad %434 
                                         f32 %550 = OpFMul %548 %549 
                                                      OpStore %434 %550 
                                         f32 %551 = OpLoad %434 
                                         f32 %552 = OpExtInst %1 29 %551 
                                                      OpStore %434 %552 
                                         f32 %553 = OpLoad %434 
                                         f32 %554 = OpExtInst %1 37 %553 %440 
                                                      OpStore %434 %554 
                                         f32 %555 = OpLoad %430 
                                         f32 %556 = OpLoad %434 
                                         f32 %557 = OpFMul %555 %556 
                                                      OpStore %434 %557 
                                         f32 %558 = OpLoad %434 
                                       f32_3 %559 = OpCompositeConstruct %558 %558 %558 
                                         i32 %560 = OpLoad %404 
                              Uniform f32_4* %561 = OpAccessChain %26 %28 %560 
                                       f32_4 %562 = OpLoad %561 
                                       f32_3 %563 = OpVectorShuffle %562 %562 0 1 2 
                                       f32_3 %564 = OpFMul %559 %563 
                                       f32_3 %565 = OpLoad %197 
                                       f32_3 %566 = OpFAdd %564 %565 
                                                      OpStore %197 %566 
                                                      OpBranch %522 
                                             %522 = OpLabel 
                                         f32 %567 = OpLoad %430 
                                       f32_3 %568 = OpCompositeConstruct %567 %567 %567 
                                       f32_3 %569 = OpLoad %269 
                                       f32_3 %570 = OpFMul %568 %569 
                                                      OpStore %234 %570 
                                       f32_3 %571 = OpLoad %234 
                                       f32_3 %573 = OpExtInst %1 37 %571 %572 
                                                      OpStore %234 %573 
                                       f32_3 %574 = OpLoad %162 
                                       f32_3 %575 = OpLoad %234 
                                       f32_3 %576 = OpFAdd %574 %575 
                                                      OpStore %162 %576 
                                                      OpBranch %408 
                                             %408 = OpLabel 
                                         i32 %577 = OpLoad %404 
                                         i32 %578 = OpIAdd %577 %35 
                                                      OpStore %404 %578 
                                                      OpBranch %405 
                                             %407 = OpLabel 
                                       f32_3 %581 = OpLoad %197 
                              Uniform f32_4* %583 = OpAccessChain %26 %582 
                                       f32_4 %584 = OpLoad %583 
                                       f32_3 %585 = OpVectorShuffle %584 %584 0 1 2 
                                       f32_3 %586 = OpFMul %581 %585 
                                                      OpStore %580 %586 
                                       f32_3 %587 = OpLoad %580 
                                       f32_3 %588 = OpCompositeConstruct %399 %399 %399 
                                       f32_3 %589 = OpCompositeConstruct %440 %440 %440 
                                       f32_3 %590 = OpExtInst %1 43 %587 %588 %589 
                                                      OpStore %580 %590 
                                       f32_3 %593 = OpLoad %162 
                                       f32_4 %594 = OpLoad %592 
                                       f32_4 %595 = OpVectorShuffle %594 %593 4 5 6 3 
                                                      OpStore %592 %595 
                                       f32_4 %596 = OpLoad %592 
                                       f32_3 %597 = OpVectorShuffle %596 %596 0 1 2 
                                       f32_3 %598 = OpCompositeConstruct %399 %399 %399 
                                       f32_3 %599 = OpCompositeConstruct %440 %440 %440 
                                       f32_3 %600 = OpExtInst %1 43 %597 %598 %599 
                                       f32_4 %601 = OpLoad %592 
                                       f32_4 %602 = OpVectorShuffle %601 %600 4 5 6 3 
                                                      OpStore %592 %602 
                                Uniform f32* %603 = OpAccessChain %26 %377 %447 
                                         f32 %604 = OpLoad %603 
                                 Output f32* %606 = OpAccessChain %592 %447 
                                                      OpStore %606 %604 
                                 Output f32* %607 = OpAccessChain %592 %447 
                                         f32 %608 = OpLoad %607 
                                         f32 %609 = OpExtInst %1 43 %608 %399 %440 
                                 Output f32* %610 = OpAccessChain %592 %447 
                                                      OpStore %610 %609 
                                       f32_3 %615 = OpLoad %614 
                                       f32_2 %616 = OpVectorShuffle %615 %615 0 1 
                              Uniform f32_4* %618 = OpAccessChain %26 %617 
                                       f32_4 %619 = OpLoad %618 
                                       f32_2 %620 = OpVectorShuffle %619 %619 0 1 
                                       f32_2 %621 = OpFMul %616 %620 
                              Uniform f32_4* %622 = OpAccessChain %26 %617 
                                       f32_4 %623 = OpLoad %622 
                                       f32_2 %624 = OpVectorShuffle %623 %623 2 3 
                                       f32_2 %625 = OpFAdd %621 %624 
                                                      OpStore vs_TEXCOORD0 %625 
                                       f32_3 %626 = OpLoad %307 
                                       f32_4 %627 = OpVectorShuffle %626 %626 1 1 1 1 
                              Uniform f32_4* %628 = OpAccessChain %26 %27 %35 
                                       f32_4 %629 = OpLoad %628 
                                       f32_4 %630 = OpFMul %627 %629 
                                                      OpStore %9 %630 
                              Uniform f32_4* %631 = OpAccessChain %26 %27 %28 
                                       f32_4 %632 = OpLoad %631 
                                       f32_3 %633 = OpLoad %307 
                                       f32_4 %634 = OpVectorShuffle %633 %633 0 0 0 0 
                                       f32_4 %635 = OpFMul %632 %634 
                                       f32_4 %636 = OpLoad %9 
                                       f32_4 %637 = OpFAdd %635 %636 
                                                      OpStore %9 %637 
                              Uniform f32_4* %638 = OpAccessChain %26 %27 %54 
                                       f32_4 %639 = OpLoad %638 
                                       f32_3 %640 = OpLoad %307 
                                       f32_4 %641 = OpVectorShuffle %640 %640 2 2 2 2 
                                       f32_4 %642 = OpFMul %639 %641 
                                       f32_4 %643 = OpLoad %9 
                                       f32_4 %644 = OpFAdd %642 %643 
                                                      OpStore %9 %644 
                                       f32_4 %645 = OpLoad %9 
                              Uniform f32_4* %646 = OpAccessChain %26 %27 %67 
                                       f32_4 %647 = OpLoad %646 
                                       f32_4 %648 = OpFAdd %645 %647 
                                                      OpStore %9 %648 
                                       f32_4 %649 = OpLoad %9 
                                       f32_4 %650 = OpVectorShuffle %649 %649 1 1 1 1 
                              Uniform f32_4* %652 = OpAccessChain %26 %651 %35 
                                       f32_4 %653 = OpLoad %652 
                                       f32_4 %654 = OpFMul %650 %653 
                                                      OpStore %80 %654 
                              Uniform f32_4* %655 = OpAccessChain %26 %651 %28 
                                       f32_4 %656 = OpLoad %655 
                                       f32_4 %657 = OpLoad %9 
                                       f32_4 %658 = OpVectorShuffle %657 %657 0 0 0 0 
                                       f32_4 %659 = OpFMul %656 %658 
                                       f32_4 %660 = OpLoad %80 
                                       f32_4 %661 = OpFAdd %659 %660 
                                                      OpStore %80 %661 
                              Uniform f32_4* %662 = OpAccessChain %26 %651 %54 
                                       f32_4 %663 = OpLoad %662 
                                       f32_4 %664 = OpLoad %9 
                                       f32_4 %665 = OpVectorShuffle %664 %664 2 2 2 2 
                                       f32_4 %666 = OpFMul %663 %665 
                                       f32_4 %667 = OpLoad %80 
                                       f32_4 %668 = OpFAdd %666 %667 
                                                      OpStore %80 %668 
                              Uniform f32_4* %673 = OpAccessChain %26 %651 %67 
                                       f32_4 %674 = OpLoad %673 
                                       f32_4 %675 = OpLoad %9 
                                       f32_4 %676 = OpVectorShuffle %675 %675 3 3 3 3 
                                       f32_4 %677 = OpFMul %674 %676 
                                       f32_4 %678 = OpLoad %80 
                                       f32_4 %679 = OpFAdd %677 %678 
                               Output f32_4* %680 = OpAccessChain %672 %28 
                                                      OpStore %680 %679 
                                 Output f32* %681 = OpAccessChain %672 %28 %348 
                                         f32 %682 = OpLoad %681 
                                         f32 %683 = OpFNegate %682 
                                 Output f32* %684 = OpAccessChain %672 %28 %348 
                                                      OpStore %684 %683 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 51
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %29 %34 %40 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %29 Location 29 
                                             OpDecorate %34 Location 34 
                                             OpDecorate %40 Location 40 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                                     %28 = OpTypePointer Input %24 
                        Input f32_4* %29 = OpVariable Input 
                                     %33 = OpTypePointer Output %24 
                       Output f32_4* %34 = OpVariable Output 
                                 f32 %36 = OpConstant 3.674022E-40 
                               f32_3 %37 = OpConstantComposite %36 %36 %36 
                                     %39 = OpTypePointer Input %7 
                        Input f32_3* %40 = OpVariable Input 
                                 f32 %45 = OpConstant 3.674022E-40 
                                     %46 = OpTypeInt 32 0 
                                 u32 %47 = OpConstant 3 
                                     %48 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %27 = OpLoad %9 
                               f32_4 %30 = OpLoad %29 
                               f32_3 %31 = OpVectorShuffle %30 %30 0 1 2 
                               f32_3 %32 = OpFMul %27 %31 
                                             OpStore %9 %32 
                               f32_3 %35 = OpLoad %9 
                               f32_3 %38 = OpFMul %35 %37 
                               f32_3 %41 = OpLoad %40 
                               f32_3 %42 = OpFAdd %38 %41 
                               f32_4 %43 = OpLoad %34 
                               f32_4 %44 = OpVectorShuffle %43 %42 4 5 6 3 
                                             OpStore %34 %44 
                         Output f32* %49 = OpAccessChain %34 %47 
                                             OpStore %49 %45 
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
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _Color;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Emission;
uniform 	float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec3 vs_COLOR1;
out vec2 vs_TEXCOORD0;
out float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat21;
float u_xlat22;
float u_xlat23;
int u_xlati24;
float u_xlat25;
bool u_xlatb25;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat21);
    u_xlat2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + _Emission.xyz;
    u_xlat23 = _Shininess * 128.0;
    u_xlat3.xyz = u_xlat2.xyz;
    u_xlat4.x = float(0.0);
    u_xlat4.y = float(0.0);
    u_xlat4.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat25 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat25 = max(u_xlat25, 0.0);
        u_xlat5.xyz = vec3(u_xlat25) * _Color.xyz;
        u_xlat5.xyz = u_xlat5.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb25 = 0.0<u_xlat25;
        if(u_xlatb25){
            u_xlat6.xyz = (-u_xlat0.xyz) * vec3(u_xlat22) + unity_LightPosition[u_xlati_loop_1].xyz;
            u_xlat25 = dot(u_xlat6.xyz, u_xlat6.xyz);
            u_xlat25 = inversesqrt(u_xlat25);
            u_xlat6.xyz = vec3(u_xlat25) * u_xlat6.xyz;
            u_xlat25 = dot(u_xlat1.xyz, u_xlat6.xyz);
            u_xlat25 = max(u_xlat25, 0.0);
            u_xlat25 = log2(u_xlat25);
            u_xlat25 = u_xlat23 * u_xlat25;
            u_xlat25 = exp2(u_xlat25);
            u_xlat25 = min(u_xlat25, 1.0);
            u_xlat25 = u_xlat25 * 0.5;
            u_xlat4.xyz = vec3(u_xlat25) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat4.xyz;
        }
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat5.xyz = min(u_xlat5.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat3.xyz = u_xlat3.xyz + u_xlat5.xyz;
    }
    vs_COLOR1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat3.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat21);
    vs_TEXCOORD1 = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD1 = clamp(vs_TEXCOORD1, 0.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 unity_FogColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec3 vs_COLOR1;
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vs_COLOR1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 627
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %303 %335 %503 %515 %537 %538 %553 %611 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %22 0 Offset 22 
                                                      OpMemberDecorate %22 1 Offset 22 
                                                      OpMemberDecorate %22 2 Offset 22 
                                                      OpMemberDecorate %22 3 Offset 22 
                                                      OpMemberDecorate %22 4 Offset 22 
                                                      OpMemberDecorate %22 5 Offset 22 
                                                      OpMemberDecorate %22 6 Offset 22 
                                                      OpMemberDecorate %22 7 Offset 22 
                                                      OpMemberDecorate %22 8 Offset 22 
                                                      OpMemberDecorate %22 9 Offset 22 
                                                      OpMemberDecorate %22 10 Offset 22 
                                                      OpMemberDecorate %22 11 Offset 22 
                                                      OpMemberDecorate %22 12 Offset 22 
                                                      OpMemberDecorate %22 13 Offset 22 
                                                      OpMemberDecorate %22 14 Offset 22 
                                                      OpDecorate %22 Block 
                                                      OpDecorate %24 DescriptorSet 24 
                                                      OpDecorate %24 Binding 24 
                                                      OpDecorate %303 Location 303 
                                                      OpDecorate %335 Location 335 
                                                      OpDecorate %503 Location 503 
                                                      OpDecorate %515 Location 515 
                                                      OpDecorate vs_TEXCOORD0 Location 537 
                                                      OpDecorate %538 Location 538 
                                                      OpDecorate vs_TEXCOORD1 Location 553 
                                                      OpMemberDecorate %609 0 BuiltIn 609 
                                                      OpMemberDecorate %609 1 BuiltIn 609 
                                                      OpMemberDecorate %609 2 BuiltIn 609 
                                                      OpDecorate %609 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                          u32 %14 = OpConstant 4 
                                              %15 = OpTypeArray %7 %14 
                                              %16 = OpTypeArray %7 %14 
                                              %17 = OpTypeArray %7 %14 
                                              %18 = OpTypeArray %7 %14 
                                              %19 = OpTypeArray %7 %14 
                                              %20 = OpTypeInt 32 1 
                                              %21 = OpTypeVector %20 4 
                                              %22 = OpTypeStruct %12 %13 %15 %16 %7 %17 %18 %19 %7 %7 %7 %7 %6 %21 %7 
                                              %23 = OpTypePointer Uniform %22 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32; i32_4; f32_4;}* %24 = OpVariable Uniform 
                                          i32 %25 = OpConstant 2 
                                          i32 %26 = OpConstant 0 
                                              %27 = OpTypeVector %6 3 
                                              %28 = OpTypePointer Uniform %7 
                                          i32 %32 = OpConstant 5 
                                          i32 %33 = OpConstant 1 
                                          i32 %64 = OpConstant 3 
                               Private f32_4* %77 = OpVariable Private 
                                             %123 = OpTypePointer Private %27 
                              Private f32_3* %124 = OpVariable Private 
                              Private f32_3* %159 = OpVariable Private 
                              Private f32_3* %194 = OpVariable Private 
                                         i32 %198 = OpConstant 6 
                              Private f32_3* %230 = OpVariable Private 
                              Private f32_3* %265 = OpVariable Private 
                                             %302 = OpTypePointer Input %27 
                                Input f32_3* %303 = OpVariable Input 
                                Input f32_3* %335 = OpVariable Input 
                                         u32 %338 = OpConstant 0 
                                             %339 = OpTypePointer Private %6 
                                         u32 %344 = OpConstant 1 
                                         u32 %349 = OpConstant 2 
                                Private f32* %351 = OpVariable Private 
                                Private f32* %371 = OpVariable Private 
                                         i32 %374 = OpConstant 9 
                                         i32 %378 = OpConstant 4 
                                         i32 %383 = OpConstant 11 
                                Private f32* %388 = OpVariable Private 
                                         i32 %389 = OpConstant 12 
                                             %390 = OpTypePointer Uniform %6 
                                         f32 %393 = OpConstant 3.674022E-40 
                                         f32 %396 = OpConstant 3.674022E-40 
                                             %400 = OpTypePointer Function %20 
                                         i32 %408 = OpConstant 13 
                                             %409 = OpTypePointer Uniform %20 
                                             %412 = OpTypeBool 
                                Private f32* %414 = OpVariable Private 
                                             %436 = OpTypePointer Private %412 
                               Private bool* %437 = OpVariable Private 
                                         f32 %477 = OpConstant 3.674022E-40 
                                         f32 %480 = OpConstant 3.674022E-40 
                                       f32_3 %492 = OpConstantComposite %480 %480 %480 
                                       f32_3 %495 = OpConstantComposite %477 %477 %477 
                                             %502 = OpTypePointer Output %27 
                               Output f32_3* %503 = OpVariable Output 
                                         i32 %505 = OpConstant 10 
                                             %514 = OpTypePointer Output %7 
                               Output f32_4* %515 = OpVariable Output 
                                         u32 %526 = OpConstant 3 
                                             %529 = OpTypePointer Output %6 
                                             %535 = OpTypeVector %6 2 
                                             %536 = OpTypePointer Output %535 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_3* %538 = OpVariable Input 
                                         i32 %541 = OpConstant 14 
                         Output f32* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %556 = OpConstant 8 
                                         i32 %590 = OpConstant 7 
                                             %608 = OpTypeArray %6 %344 
                                             %609 = OpTypeStruct %7 %6 %608 
                                             %610 = OpTypePointer Output %609 
        Output struct {f32_4; f32; f32[1];}* %611 = OpVariable Output 
                                             %625 = OpTypePointer Private %20 
                                Private i32* %626 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %401 = OpVariable Function 
                               Uniform f32_4* %29 = OpAccessChain %24 %25 %26 
                                        f32_4 %30 = OpLoad %29 
                                        f32_3 %31 = OpVectorShuffle %30 %30 1 1 1 
                               Uniform f32_4* %34 = OpAccessChain %24 %32 %33 
                                        f32_4 %35 = OpLoad %34 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 1 2 
                                        f32_3 %37 = OpFMul %31 %36 
                                        f32_4 %38 = OpLoad %9 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 6 3 
                                                      OpStore %9 %39 
                               Uniform f32_4* %40 = OpAccessChain %24 %32 %26 
                                        f32_4 %41 = OpLoad %40 
                                        f32_3 %42 = OpVectorShuffle %41 %41 0 1 2 
                               Uniform f32_4* %43 = OpAccessChain %24 %25 %26 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 0 0 
                                        f32_3 %46 = OpFMul %42 %45 
                                        f32_4 %47 = OpLoad %9 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                                        f32_3 %49 = OpFAdd %46 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %49 4 5 6 3 
                                                      OpStore %9 %51 
                               Uniform f32_4* %52 = OpAccessChain %24 %32 %25 
                                        f32_4 %53 = OpLoad %52 
                                        f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                               Uniform f32_4* %55 = OpAccessChain %24 %25 %26 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 2 2 2 
                                        f32_3 %58 = OpFMul %54 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
                                                      OpStore %9 %63 
                               Uniform f32_4* %65 = OpAccessChain %24 %32 %64 
                                        f32_4 %66 = OpLoad %65 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                               Uniform f32_4* %68 = OpAccessChain %24 %25 %26 
                                        f32_4 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 3 3 3 
                                        f32_3 %71 = OpFMul %67 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                        f32_3 %74 = OpFAdd %71 %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                                      OpStore %9 %76 
                               Uniform f32_4* %78 = OpAccessChain %24 %25 %33 
                                        f32_4 %79 = OpLoad %78 
                                        f32_3 %80 = OpVectorShuffle %79 %79 1 1 1 
                               Uniform f32_4* %81 = OpAccessChain %24 %32 %33 
                                        f32_4 %82 = OpLoad %81 
                                        f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
                                        f32_3 %84 = OpFMul %80 %83 
                                        f32_4 %85 = OpLoad %77 
                                        f32_4 %86 = OpVectorShuffle %85 %84 4 5 6 3 
                                                      OpStore %77 %86 
                               Uniform f32_4* %87 = OpAccessChain %24 %32 %26 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                               Uniform f32_4* %90 = OpAccessChain %24 %25 %33 
                                        f32_4 %91 = OpLoad %90 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 0 0 
                                        f32_3 %93 = OpFMul %89 %92 
                                        f32_4 %94 = OpLoad %77 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_3 %96 = OpFAdd %93 %95 
                                        f32_4 %97 = OpLoad %77 
                                        f32_4 %98 = OpVectorShuffle %97 %96 4 5 6 3 
                                                      OpStore %77 %98 
                               Uniform f32_4* %99 = OpAccessChain %24 %32 %25 
                                       f32_4 %100 = OpLoad %99 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                              Uniform f32_4* %102 = OpAccessChain %24 %25 %33 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 2 2 2 
                                       f32_3 %105 = OpFMul %101 %104 
                                       f32_4 %106 = OpLoad %77 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                       f32_3 %108 = OpFAdd %105 %107 
                                       f32_4 %109 = OpLoad %77 
                                       f32_4 %110 = OpVectorShuffle %109 %108 4 5 6 3 
                                                      OpStore %77 %110 
                              Uniform f32_4* %111 = OpAccessChain %24 %32 %64 
                                       f32_4 %112 = OpLoad %111 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                              Uniform f32_4* %114 = OpAccessChain %24 %25 %33 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 3 3 3 
                                       f32_3 %117 = OpFMul %113 %116 
                                       f32_4 %118 = OpLoad %77 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpFAdd %117 %119 
                                       f32_4 %121 = OpLoad %77 
                                       f32_4 %122 = OpVectorShuffle %121 %120 4 5 6 3 
                                                      OpStore %77 %122 
                              Uniform f32_4* %125 = OpAccessChain %24 %25 %25 
                                       f32_4 %126 = OpLoad %125 
                                       f32_3 %127 = OpVectorShuffle %126 %126 1 1 1 
                              Uniform f32_4* %128 = OpAccessChain %24 %32 %33 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32_3 %131 = OpFMul %127 %130 
                                                      OpStore %124 %131 
                              Uniform f32_4* %132 = OpAccessChain %24 %32 %26 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                              Uniform f32_4* %135 = OpAccessChain %24 %25 %25 
                                       f32_4 %136 = OpLoad %135 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 0 0 
                                       f32_3 %138 = OpFMul %134 %137 
                                       f32_3 %139 = OpLoad %124 
                                       f32_3 %140 = OpFAdd %138 %139 
                                                      OpStore %124 %140 
                              Uniform f32_4* %141 = OpAccessChain %24 %32 %25 
                                       f32_4 %142 = OpLoad %141 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                              Uniform f32_4* %144 = OpAccessChain %24 %25 %25 
                                       f32_4 %145 = OpLoad %144 
                                       f32_3 %146 = OpVectorShuffle %145 %145 2 2 2 
                                       f32_3 %147 = OpFMul %143 %146 
                                       f32_3 %148 = OpLoad %124 
                                       f32_3 %149 = OpFAdd %147 %148 
                                                      OpStore %124 %149 
                              Uniform f32_4* %150 = OpAccessChain %24 %32 %64 
                                       f32_4 %151 = OpLoad %150 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                              Uniform f32_4* %153 = OpAccessChain %24 %25 %25 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 3 3 3 
                                       f32_3 %156 = OpFMul %152 %155 
                                       f32_3 %157 = OpLoad %124 
                                       f32_3 %158 = OpFAdd %156 %157 
                                                      OpStore %124 %158 
                              Uniform f32_4* %160 = OpAccessChain %24 %25 %64 
                                       f32_4 %161 = OpLoad %160 
                                       f32_3 %162 = OpVectorShuffle %161 %161 1 1 1 
                              Uniform f32_4* %163 = OpAccessChain %24 %32 %33 
                                       f32_4 %164 = OpLoad %163 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_3 %166 = OpFMul %162 %165 
                                                      OpStore %159 %166 
                              Uniform f32_4* %167 = OpAccessChain %24 %32 %26 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                              Uniform f32_4* %170 = OpAccessChain %24 %25 %64 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 0 0 
                                       f32_3 %173 = OpFMul %169 %172 
                                       f32_3 %174 = OpLoad %159 
                                       f32_3 %175 = OpFAdd %173 %174 
                                                      OpStore %159 %175 
                              Uniform f32_4* %176 = OpAccessChain %24 %32 %25 
                                       f32_4 %177 = OpLoad %176 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                              Uniform f32_4* %179 = OpAccessChain %24 %25 %64 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 2 2 2 
                                       f32_3 %182 = OpFMul %178 %181 
                                       f32_3 %183 = OpLoad %159 
                                       f32_3 %184 = OpFAdd %182 %183 
                                                      OpStore %159 %184 
                              Uniform f32_4* %185 = OpAccessChain %24 %32 %64 
                                       f32_4 %186 = OpLoad %185 
                                       f32_3 %187 = OpVectorShuffle %186 %186 0 1 2 
                              Uniform f32_4* %188 = OpAccessChain %24 %25 %64 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 3 3 3 
                                       f32_3 %191 = OpFMul %187 %190 
                                       f32_3 %192 = OpLoad %159 
                                       f32_3 %193 = OpFAdd %191 %192 
                                                      OpStore %159 %193 
                              Uniform f32_4* %195 = OpAccessChain %24 %64 %33 
                                       f32_4 %196 = OpLoad %195 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
                              Uniform f32_4* %199 = OpAccessChain %24 %198 %26 
                                       f32_4 %200 = OpLoad %199 
                                       f32_3 %201 = OpVectorShuffle %200 %200 1 1 1 
                                       f32_3 %202 = OpFMul %197 %201 
                                                      OpStore %194 %202 
                              Uniform f32_4* %203 = OpAccessChain %24 %64 %26 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                              Uniform f32_4* %206 = OpAccessChain %24 %198 %26 
                                       f32_4 %207 = OpLoad %206 
                                       f32_3 %208 = OpVectorShuffle %207 %207 0 0 0 
                                       f32_3 %209 = OpFMul %205 %208 
                                       f32_3 %210 = OpLoad %194 
                                       f32_3 %211 = OpFAdd %209 %210 
                                                      OpStore %194 %211 
                              Uniform f32_4* %212 = OpAccessChain %24 %64 %25 
                                       f32_4 %213 = OpLoad %212 
                                       f32_3 %214 = OpVectorShuffle %213 %213 0 1 2 
                              Uniform f32_4* %215 = OpAccessChain %24 %198 %26 
                                       f32_4 %216 = OpLoad %215 
                                       f32_3 %217 = OpVectorShuffle %216 %216 2 2 2 
                                       f32_3 %218 = OpFMul %214 %217 
                                       f32_3 %219 = OpLoad %194 
                                       f32_3 %220 = OpFAdd %218 %219 
                                                      OpStore %194 %220 
                              Uniform f32_4* %221 = OpAccessChain %24 %64 %64 
                                       f32_4 %222 = OpLoad %221 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                              Uniform f32_4* %224 = OpAccessChain %24 %198 %26 
                                       f32_4 %225 = OpLoad %224 
                                       f32_3 %226 = OpVectorShuffle %225 %225 3 3 3 
                                       f32_3 %227 = OpFMul %223 %226 
                                       f32_3 %228 = OpLoad %194 
                                       f32_3 %229 = OpFAdd %227 %228 
                                                      OpStore %194 %229 
                              Uniform f32_4* %231 = OpAccessChain %24 %64 %33 
                                       f32_4 %232 = OpLoad %231 
                                       f32_3 %233 = OpVectorShuffle %232 %232 0 1 2 
                              Uniform f32_4* %234 = OpAccessChain %24 %198 %33 
                                       f32_4 %235 = OpLoad %234 
                                       f32_3 %236 = OpVectorShuffle %235 %235 1 1 1 
                                       f32_3 %237 = OpFMul %233 %236 
                                                      OpStore %230 %237 
                              Uniform f32_4* %238 = OpAccessChain %24 %64 %26 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 0 1 2 
                              Uniform f32_4* %241 = OpAccessChain %24 %198 %33 
                                       f32_4 %242 = OpLoad %241 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 0 0 
                                       f32_3 %244 = OpFMul %240 %243 
                                       f32_3 %245 = OpLoad %230 
                                       f32_3 %246 = OpFAdd %244 %245 
                                                      OpStore %230 %246 
                              Uniform f32_4* %247 = OpAccessChain %24 %64 %25 
                                       f32_4 %248 = OpLoad %247 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                              Uniform f32_4* %250 = OpAccessChain %24 %198 %33 
                                       f32_4 %251 = OpLoad %250 
                                       f32_3 %252 = OpVectorShuffle %251 %251 2 2 2 
                                       f32_3 %253 = OpFMul %249 %252 
                                       f32_3 %254 = OpLoad %230 
                                       f32_3 %255 = OpFAdd %253 %254 
                                                      OpStore %230 %255 
                              Uniform f32_4* %256 = OpAccessChain %24 %64 %64 
                                       f32_4 %257 = OpLoad %256 
                                       f32_3 %258 = OpVectorShuffle %257 %257 0 1 2 
                              Uniform f32_4* %259 = OpAccessChain %24 %198 %33 
                                       f32_4 %260 = OpLoad %259 
                                       f32_3 %261 = OpVectorShuffle %260 %260 3 3 3 
                                       f32_3 %262 = OpFMul %258 %261 
                                       f32_3 %263 = OpLoad %230 
                                       f32_3 %264 = OpFAdd %262 %263 
                                                      OpStore %230 %264 
                              Uniform f32_4* %266 = OpAccessChain %24 %64 %33 
                                       f32_4 %267 = OpLoad %266 
                                       f32_3 %268 = OpVectorShuffle %267 %267 0 1 2 
                              Uniform f32_4* %269 = OpAccessChain %24 %198 %25 
                                       f32_4 %270 = OpLoad %269 
                                       f32_3 %271 = OpVectorShuffle %270 %270 1 1 1 
                                       f32_3 %272 = OpFMul %268 %271 
                                                      OpStore %265 %272 
                              Uniform f32_4* %273 = OpAccessChain %24 %64 %26 
                                       f32_4 %274 = OpLoad %273 
                                       f32_3 %275 = OpVectorShuffle %274 %274 0 1 2 
                              Uniform f32_4* %276 = OpAccessChain %24 %198 %25 
                                       f32_4 %277 = OpLoad %276 
                                       f32_3 %278 = OpVectorShuffle %277 %277 0 0 0 
                                       f32_3 %279 = OpFMul %275 %278 
                                       f32_3 %280 = OpLoad %265 
                                       f32_3 %281 = OpFAdd %279 %280 
                                                      OpStore %265 %281 
                              Uniform f32_4* %282 = OpAccessChain %24 %64 %25 
                                       f32_4 %283 = OpLoad %282 
                                       f32_3 %284 = OpVectorShuffle %283 %283 0 1 2 
                              Uniform f32_4* %285 = OpAccessChain %24 %198 %25 
                                       f32_4 %286 = OpLoad %285 
                                       f32_3 %287 = OpVectorShuffle %286 %286 2 2 2 
                                       f32_3 %288 = OpFMul %284 %287 
                                       f32_3 %289 = OpLoad %265 
                                       f32_3 %290 = OpFAdd %288 %289 
                                                      OpStore %265 %290 
                              Uniform f32_4* %291 = OpAccessChain %24 %64 %64 
                                       f32_4 %292 = OpLoad %291 
                                       f32_3 %293 = OpVectorShuffle %292 %292 0 1 2 
                              Uniform f32_4* %294 = OpAccessChain %24 %198 %25 
                                       f32_4 %295 = OpLoad %294 
                                       f32_3 %296 = OpVectorShuffle %295 %295 3 3 3 
                                       f32_3 %297 = OpFMul %293 %296 
                                       f32_3 %298 = OpLoad %265 
                                       f32_3 %299 = OpFAdd %297 %298 
                                                      OpStore %265 %299 
                                       f32_4 %300 = OpLoad %77 
                                       f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
                                       f32_3 %304 = OpLoad %303 
                                       f32_3 %305 = OpVectorShuffle %304 %304 1 1 1 
                                       f32_3 %306 = OpFMul %301 %305 
                                       f32_4 %307 = OpLoad %77 
                                       f32_4 %308 = OpVectorShuffle %307 %306 4 5 6 3 
                                                      OpStore %77 %308 
                                       f32_4 %309 = OpLoad %9 
                                       f32_3 %310 = OpVectorShuffle %309 %309 0 1 2 
                                       f32_3 %311 = OpLoad %303 
                                       f32_3 %312 = OpVectorShuffle %311 %311 0 0 0 
                                       f32_3 %313 = OpFMul %310 %312 
                                       f32_4 %314 = OpLoad %77 
                                       f32_3 %315 = OpVectorShuffle %314 %314 0 1 2 
                                       f32_3 %316 = OpFAdd %313 %315 
                                       f32_4 %317 = OpLoad %9 
                                       f32_4 %318 = OpVectorShuffle %317 %316 4 5 6 3 
                                                      OpStore %9 %318 
                                       f32_3 %319 = OpLoad %124 
                                       f32_3 %320 = OpLoad %303 
                                       f32_3 %321 = OpVectorShuffle %320 %320 2 2 2 
                                       f32_3 %322 = OpFMul %319 %321 
                                       f32_4 %323 = OpLoad %9 
                                       f32_3 %324 = OpVectorShuffle %323 %323 0 1 2 
                                       f32_3 %325 = OpFAdd %322 %324 
                                       f32_4 %326 = OpLoad %9 
                                       f32_4 %327 = OpVectorShuffle %326 %325 4 5 6 3 
                                                      OpStore %9 %327 
                                       f32_3 %328 = OpLoad %159 
                                       f32_4 %329 = OpLoad %9 
                                       f32_3 %330 = OpVectorShuffle %329 %329 0 1 2 
                                       f32_3 %331 = OpFAdd %328 %330 
                                       f32_4 %332 = OpLoad %9 
                                       f32_4 %333 = OpVectorShuffle %332 %331 4 5 6 3 
                                                      OpStore %9 %333 
                                       f32_3 %334 = OpLoad %194 
                                       f32_3 %336 = OpLoad %335 
                                         f32 %337 = OpDot %334 %336 
                                Private f32* %340 = OpAccessChain %77 %338 
                                                      OpStore %340 %337 
                                       f32_3 %341 = OpLoad %230 
                                       f32_3 %342 = OpLoad %335 
                                         f32 %343 = OpDot %341 %342 
                                Private f32* %345 = OpAccessChain %77 %344 
                                                      OpStore %345 %343 
                                       f32_3 %346 = OpLoad %265 
                                       f32_3 %347 = OpLoad %335 
                                         f32 %348 = OpDot %346 %347 
                                Private f32* %350 = OpAccessChain %77 %349 
                                                      OpStore %350 %348 
                                       f32_4 %352 = OpLoad %77 
                                       f32_3 %353 = OpVectorShuffle %352 %352 0 1 2 
                                       f32_4 %354 = OpLoad %77 
                                       f32_3 %355 = OpVectorShuffle %354 %354 0 1 2 
                                         f32 %356 = OpDot %353 %355 
                                                      OpStore %351 %356 
                                         f32 %357 = OpLoad %351 
                                         f32 %358 = OpExtInst %1 32 %357 
                                                      OpStore %351 %358 
                                         f32 %359 = OpLoad %351 
                                       f32_3 %360 = OpCompositeConstruct %359 %359 %359 
                                       f32_4 %361 = OpLoad %77 
                                       f32_3 %362 = OpVectorShuffle %361 %361 0 1 2 
                                       f32_3 %363 = OpFMul %360 %362 
                                       f32_4 %364 = OpLoad %77 
                                       f32_4 %365 = OpVectorShuffle %364 %363 4 5 6 3 
                                                      OpStore %77 %365 
                                       f32_4 %366 = OpLoad %9 
                                       f32_3 %367 = OpVectorShuffle %366 %366 0 1 2 
                                       f32_4 %368 = OpLoad %9 
                                       f32_3 %369 = OpVectorShuffle %368 %368 0 1 2 
                                         f32 %370 = OpDot %367 %369 
                                                      OpStore %351 %370 
                                         f32 %372 = OpLoad %351 
                                         f32 %373 = OpExtInst %1 32 %372 
                                                      OpStore %371 %373 
                              Uniform f32_4* %375 = OpAccessChain %24 %374 
                                       f32_4 %376 = OpLoad %375 
                                       f32_3 %377 = OpVectorShuffle %376 %376 0 1 2 
                              Uniform f32_4* %379 = OpAccessChain %24 %378 
                                       f32_4 %380 = OpLoad %379 
                                       f32_3 %381 = OpVectorShuffle %380 %380 0 1 2 
                                       f32_3 %382 = OpFMul %377 %381 
                              Uniform f32_4* %384 = OpAccessChain %24 %383 
                                       f32_4 %385 = OpLoad %384 
                                       f32_3 %386 = OpVectorShuffle %385 %385 0 1 2 
                                       f32_3 %387 = OpFAdd %382 %386 
                                                      OpStore %124 %387 
                                Uniform f32* %391 = OpAccessChain %24 %389 
                                         f32 %392 = OpLoad %391 
                                         f32 %394 = OpFMul %392 %393 
                                                      OpStore %388 %394 
                                       f32_3 %395 = OpLoad %124 
                                                      OpStore %159 %395 
                                Private f32* %397 = OpAccessChain %194 %338 
                                                      OpStore %397 %396 
                                Private f32* %398 = OpAccessChain %194 %344 
                                                      OpStore %398 %396 
                                Private f32* %399 = OpAccessChain %194 %349 
                                                      OpStore %399 %396 
                                                      OpStore %401 %26 
                                                      OpBranch %402 
                                             %402 = OpLabel 
                                                      OpLoopMerge %404 %405 None 
                                                      OpBranch %406 
                                             %406 = OpLabel 
                                         i32 %407 = OpLoad %401 
                                Uniform i32* %410 = OpAccessChain %24 %408 %338 
                                         i32 %411 = OpLoad %410 
                                        bool %413 = OpSLessThan %407 %411 
                                                      OpBranchConditional %413 %403 %404 
                                             %403 = OpLabel 
                                       f32_4 %415 = OpLoad %77 
                                       f32_3 %416 = OpVectorShuffle %415 %415 0 1 2 
                                         i32 %417 = OpLoad %401 
                              Uniform f32_4* %418 = OpAccessChain %24 %33 %417 
                                       f32_4 %419 = OpLoad %418 
                                       f32_3 %420 = OpVectorShuffle %419 %419 0 1 2 
                                         f32 %421 = OpDot %416 %420 
                                                      OpStore %414 %421 
                                         f32 %422 = OpLoad %414 
                                         f32 %423 = OpExtInst %1 40 %422 %396 
                                                      OpStore %414 %423 
                                         f32 %424 = OpLoad %414 
                                       f32_3 %425 = OpCompositeConstruct %424 %424 %424 
                              Uniform f32_4* %426 = OpAccessChain %24 %374 
                                       f32_4 %427 = OpLoad %426 
                                       f32_3 %428 = OpVectorShuffle %427 %427 0 1 2 
                                       f32_3 %429 = OpFMul %425 %428 
                                                      OpStore %230 %429 
                                       f32_3 %430 = OpLoad %230 
                                         i32 %431 = OpLoad %401 
                              Uniform f32_4* %432 = OpAccessChain %24 %26 %431 
                                       f32_4 %433 = OpLoad %432 
                                       f32_3 %434 = OpVectorShuffle %433 %433 0 1 2 
                                       f32_3 %435 = OpFMul %430 %434 
                                                      OpStore %230 %435 
                                         f32 %438 = OpLoad %414 
                                        bool %439 = OpFOrdLessThan %396 %438 
                                                      OpStore %437 %439 
                                        bool %440 = OpLoad %437 
                                                      OpSelectionMerge %442 None 
                                                      OpBranchConditional %440 %441 %442 
                                             %441 = OpLabel 
                                       f32_4 %443 = OpLoad %9 
                                       f32_3 %444 = OpVectorShuffle %443 %443 0 1 2 
                                       f32_3 %445 = OpFNegate %444 
                                         f32 %446 = OpLoad %371 
                                       f32_3 %447 = OpCompositeConstruct %446 %446 %446 
                                       f32_3 %448 = OpFMul %445 %447 
                                         i32 %449 = OpLoad %401 
                              Uniform f32_4* %450 = OpAccessChain %24 %33 %449 
                                       f32_4 %451 = OpLoad %450 
                                       f32_3 %452 = OpVectorShuffle %451 %451 0 1 2 
                                       f32_3 %453 = OpFAdd %448 %452 
                                                      OpStore %265 %453 
                                       f32_3 %454 = OpLoad %265 
                                       f32_3 %455 = OpLoad %265 
                                         f32 %456 = OpDot %454 %455 
                                                      OpStore %414 %456 
                                         f32 %457 = OpLoad %414 
                                         f32 %458 = OpExtInst %1 32 %457 
                                                      OpStore %414 %458 
                                         f32 %459 = OpLoad %414 
                                       f32_3 %460 = OpCompositeConstruct %459 %459 %459 
                                       f32_3 %461 = OpLoad %265 
                                       f32_3 %462 = OpFMul %460 %461 
                                                      OpStore %265 %462 
                                       f32_4 %463 = OpLoad %77 
                                       f32_3 %464 = OpVectorShuffle %463 %463 0 1 2 
                                       f32_3 %465 = OpLoad %265 
                                         f32 %466 = OpDot %464 %465 
                                                      OpStore %414 %466 
                                         f32 %467 = OpLoad %414 
                                         f32 %468 = OpExtInst %1 40 %467 %396 
                                                      OpStore %414 %468 
                                         f32 %469 = OpLoad %414 
                                         f32 %470 = OpExtInst %1 30 %469 
                                                      OpStore %414 %470 
                                         f32 %471 = OpLoad %388 
                                         f32 %472 = OpLoad %414 
                                         f32 %473 = OpFMul %471 %472 
                                                      OpStore %414 %473 
                                         f32 %474 = OpLoad %414 
                                         f32 %475 = OpExtInst %1 29 %474 
                                                      OpStore %414 %475 
                                         f32 %476 = OpLoad %414 
                                         f32 %478 = OpExtInst %1 37 %476 %477 
                                                      OpStore %414 %478 
                                         f32 %479 = OpLoad %414 
                                         f32 %481 = OpFMul %479 %480 
                                                      OpStore %414 %481 
                                         f32 %482 = OpLoad %414 
                                       f32_3 %483 = OpCompositeConstruct %482 %482 %482 
                                         i32 %484 = OpLoad %401 
                              Uniform f32_4* %485 = OpAccessChain %24 %26 %484 
                                       f32_4 %486 = OpLoad %485 
                                       f32_3 %487 = OpVectorShuffle %486 %486 0 1 2 
                                       f32_3 %488 = OpFMul %483 %487 
                                       f32_3 %489 = OpLoad %194 
                                       f32_3 %490 = OpFAdd %488 %489 
                                                      OpStore %194 %490 
                                                      OpBranch %442 
                                             %442 = OpLabel 
                                       f32_3 %491 = OpLoad %230 
                                       f32_3 %493 = OpFMul %491 %492 
                                                      OpStore %230 %493 
                                       f32_3 %494 = OpLoad %230 
                                       f32_3 %496 = OpExtInst %1 37 %494 %495 
                                                      OpStore %230 %496 
                                       f32_3 %497 = OpLoad %159 
                                       f32_3 %498 = OpLoad %230 
                                       f32_3 %499 = OpFAdd %497 %498 
                                                      OpStore %159 %499 
                                                      OpBranch %405 
                                             %405 = OpLabel 
                                         i32 %500 = OpLoad %401 
                                         i32 %501 = OpIAdd %500 %33 
                                                      OpStore %401 %501 
                                                      OpBranch %402 
                                             %404 = OpLabel 
                                       f32_3 %504 = OpLoad %194 
                              Uniform f32_4* %506 = OpAccessChain %24 %505 
                                       f32_4 %507 = OpLoad %506 
                                       f32_3 %508 = OpVectorShuffle %507 %507 0 1 2 
                                       f32_3 %509 = OpFMul %504 %508 
                                                      OpStore %503 %509 
                                       f32_3 %510 = OpLoad %503 
                                       f32_3 %511 = OpCompositeConstruct %396 %396 %396 
                                       f32_3 %512 = OpCompositeConstruct %477 %477 %477 
                                       f32_3 %513 = OpExtInst %1 43 %510 %511 %512 
                                                      OpStore %503 %513 
                                       f32_3 %516 = OpLoad %159 
                                       f32_4 %517 = OpLoad %515 
                                       f32_4 %518 = OpVectorShuffle %517 %516 4 5 6 3 
                                                      OpStore %515 %518 
                                       f32_4 %519 = OpLoad %515 
                                       f32_3 %520 = OpVectorShuffle %519 %519 0 1 2 
                                       f32_3 %521 = OpCompositeConstruct %396 %396 %396 
                                       f32_3 %522 = OpCompositeConstruct %477 %477 %477 
                                       f32_3 %523 = OpExtInst %1 43 %520 %521 %522 
                                       f32_4 %524 = OpLoad %515 
                                       f32_4 %525 = OpVectorShuffle %524 %523 4 5 6 3 
                                                      OpStore %515 %525 
                                Uniform f32* %527 = OpAccessChain %24 %374 %526 
                                         f32 %528 = OpLoad %527 
                                 Output f32* %530 = OpAccessChain %515 %526 
                                                      OpStore %530 %528 
                                 Output f32* %531 = OpAccessChain %515 %526 
                                         f32 %532 = OpLoad %531 
                                         f32 %533 = OpExtInst %1 43 %532 %396 %477 
                                 Output f32* %534 = OpAccessChain %515 %526 
                                                      OpStore %534 %533 
                                       f32_3 %539 = OpLoad %538 
                                       f32_2 %540 = OpVectorShuffle %539 %539 0 1 
                              Uniform f32_4* %542 = OpAccessChain %24 %541 
                                       f32_4 %543 = OpLoad %542 
                                       f32_2 %544 = OpVectorShuffle %543 %543 0 1 
                                       f32_2 %545 = OpFMul %540 %544 
                              Uniform f32_4* %546 = OpAccessChain %24 %541 
                                       f32_4 %547 = OpLoad %546 
                                       f32_2 %548 = OpVectorShuffle %547 %547 2 3 
                                       f32_2 %549 = OpFAdd %545 %548 
                                                      OpStore vs_TEXCOORD0 %549 
                                         f32 %550 = OpLoad %351 
                                         f32 %551 = OpExtInst %1 31 %550 
                                Private f32* %552 = OpAccessChain %9 %338 
                                                      OpStore %552 %551 
                                Private f32* %554 = OpAccessChain %9 %338 
                                         f32 %555 = OpLoad %554 
                                Uniform f32* %557 = OpAccessChain %24 %556 %349 
                                         f32 %558 = OpLoad %557 
                                         f32 %559 = OpFMul %555 %558 
                                Uniform f32* %560 = OpAccessChain %24 %556 %526 
                                         f32 %561 = OpLoad %560 
                                         f32 %562 = OpFAdd %559 %561 
                                                      OpStore vs_TEXCOORD1 %562 
                                         f32 %563 = OpLoad vs_TEXCOORD1 
                                         f32 %564 = OpExtInst %1 43 %563 %396 %477 
                                                      OpStore vs_TEXCOORD1 %564 
                                       f32_3 %565 = OpLoad %303 
                                       f32_4 %566 = OpVectorShuffle %565 %565 1 1 1 1 
                              Uniform f32_4* %567 = OpAccessChain %24 %25 %33 
                                       f32_4 %568 = OpLoad %567 
                                       f32_4 %569 = OpFMul %566 %568 
                                                      OpStore %9 %569 
                              Uniform f32_4* %570 = OpAccessChain %24 %25 %26 
                                       f32_4 %571 = OpLoad %570 
                                       f32_3 %572 = OpLoad %303 
                                       f32_4 %573 = OpVectorShuffle %572 %572 0 0 0 0 
                                       f32_4 %574 = OpFMul %571 %573 
                                       f32_4 %575 = OpLoad %9 
                                       f32_4 %576 = OpFAdd %574 %575 
                                                      OpStore %9 %576 
                              Uniform f32_4* %577 = OpAccessChain %24 %25 %25 
                                       f32_4 %578 = OpLoad %577 
                                       f32_3 %579 = OpLoad %303 
                                       f32_4 %580 = OpVectorShuffle %579 %579 2 2 2 2 
                                       f32_4 %581 = OpFMul %578 %580 
                                       f32_4 %582 = OpLoad %9 
                                       f32_4 %583 = OpFAdd %581 %582 
                                                      OpStore %9 %583 
                                       f32_4 %584 = OpLoad %9 
                              Uniform f32_4* %585 = OpAccessChain %24 %25 %64 
                                       f32_4 %586 = OpLoad %585 
                                       f32_4 %587 = OpFAdd %584 %586 
                                                      OpStore %9 %587 
                                       f32_4 %588 = OpLoad %9 
                                       f32_4 %589 = OpVectorShuffle %588 %588 1 1 1 1 
                              Uniform f32_4* %591 = OpAccessChain %24 %590 %33 
                                       f32_4 %592 = OpLoad %591 
                                       f32_4 %593 = OpFMul %589 %592 
                                                      OpStore %77 %593 
                              Uniform f32_4* %594 = OpAccessChain %24 %590 %26 
                                       f32_4 %595 = OpLoad %594 
                                       f32_4 %596 = OpLoad %9 
                                       f32_4 %597 = OpVectorShuffle %596 %596 0 0 0 0 
                                       f32_4 %598 = OpFMul %595 %597 
                                       f32_4 %599 = OpLoad %77 
                                       f32_4 %600 = OpFAdd %598 %599 
                                                      OpStore %77 %600 
                              Uniform f32_4* %601 = OpAccessChain %24 %590 %25 
                                       f32_4 %602 = OpLoad %601 
                                       f32_4 %603 = OpLoad %9 
                                       f32_4 %604 = OpVectorShuffle %603 %603 2 2 2 2 
                                       f32_4 %605 = OpFMul %602 %604 
                                       f32_4 %606 = OpLoad %77 
                                       f32_4 %607 = OpFAdd %605 %606 
                                                      OpStore %77 %607 
                              Uniform f32_4* %612 = OpAccessChain %24 %590 %64 
                                       f32_4 %613 = OpLoad %612 
                                       f32_4 %614 = OpLoad %9 
                                       f32_4 %615 = OpVectorShuffle %614 %614 3 3 3 3 
                                       f32_4 %616 = OpFMul %613 %615 
                                       f32_4 %617 = OpLoad %77 
                                       f32_4 %618 = OpFAdd %616 %617 
                               Output f32_4* %619 = OpAccessChain %611 %26 
                                                      OpStore %619 %618 
                                 Output f32* %620 = OpAccessChain %611 %26 %344 
                                         f32 %621 = OpLoad %620 
                                         f32 %622 = OpFNegate %621 
                                 Output f32* %623 = OpAccessChain %611 %26 %344 
                                                      OpStore %623 %622 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 73
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %29 %38 %54 %56 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %29 Location 29 
                                             OpDecorate %38 Location 38 
                                             OpMemberDecorate %42 0 Offset 42 
                                             OpDecorate %42 Block 
                                             OpDecorate %44 DescriptorSet 44 
                                             OpDecorate %44 Binding 44 
                                             OpDecorate %54 Location 54 
                                             OpDecorate vs_TEXCOORD1 Location 56 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                                     %28 = OpTypePointer Input %24 
                        Input f32_4* %29 = OpVariable Input 
                                 f32 %34 = OpConstant 3.674022E-40 
                               f32_3 %35 = OpConstantComposite %34 %34 %34 
                                     %37 = OpTypePointer Input %7 
                        Input f32_3* %38 = OpVariable Input 
                                     %42 = OpTypeStruct %24 
                                     %43 = OpTypePointer Uniform %42 
            Uniform struct {f32_4;}* %44 = OpVariable Uniform 
                                     %45 = OpTypeInt 32 1 
                                 i32 %46 = OpConstant 0 
                                     %47 = OpTypePointer Uniform %24 
                                     %53 = OpTypePointer Output %24 
                       Output f32_4* %54 = OpVariable Output 
                                     %55 = OpTypePointer Input %6 
                 Input f32* vs_TEXCOORD1 = OpVariable Input 
                                 f32 %67 = OpConstant 3.674022E-40 
                                     %68 = OpTypeInt 32 0 
                                 u32 %69 = OpConstant 3 
                                     %70 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %27 = OpLoad %9 
                               f32_4 %30 = OpLoad %29 
                               f32_3 %31 = OpVectorShuffle %30 %30 0 1 2 
                               f32_3 %32 = OpFMul %27 %31 
                                             OpStore %9 %32 
                               f32_3 %33 = OpLoad %9 
                               f32_3 %36 = OpFMul %33 %35 
                               f32_3 %39 = OpLoad %38 
                               f32_3 %40 = OpFAdd %36 %39 
                                             OpStore %9 %40 
                               f32_3 %41 = OpLoad %9 
                      Uniform f32_4* %48 = OpAccessChain %44 %46 
                               f32_4 %49 = OpLoad %48 
                               f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                               f32_3 %51 = OpFNegate %50 
                               f32_3 %52 = OpFAdd %41 %51 
                                             OpStore %9 %52 
                                 f32 %57 = OpLoad vs_TEXCOORD1 
                               f32_3 %58 = OpCompositeConstruct %57 %57 %57 
                               f32_3 %59 = OpLoad %9 
                               f32_3 %60 = OpFMul %58 %59 
                      Uniform f32_4* %61 = OpAccessChain %44 %46 
                               f32_4 %62 = OpLoad %61 
                               f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                               f32_3 %64 = OpFAdd %60 %63 
                               f32_4 %65 = OpLoad %54 
                               f32_4 %66 = OpVectorShuffle %65 %64 4 5 6 3 
                                             OpStore %54 %66 
                         Output f32* %71 = OpAccessChain %54 %69 
                                             OpStore %71 %67 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" "POINT" }
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
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _Color;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Emission;
uniform 	float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec3 vs_COLOR1;
out vec2 vs_TEXCOORD0;
out float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
bool u_xlatb6;
bool u_xlatb13;
float u_xlat21;
float u_xlat22;
float u_xlat23;
int u_xlati24;
float u_xlat25;
bool u_xlatb25;
float u_xlat26;
bool u_xlatb26;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat21);
    u_xlat2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + _Emission.xyz;
    u_xlat23 = _Shininess * 128.0;
    u_xlat3.xyz = u_xlat2.xyz;
    u_xlat4.x = float(0.0);
    u_xlat4.y = float(0.0);
    u_xlat4.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat5.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat25 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat26 = unity_LightAtten[u_xlati_loop_1].z * u_xlat25 + 1.0;
        u_xlat26 = float(1.0) / u_xlat26;
        u_xlatb6 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat25;
        u_xlatb6 = u_xlatb13 && u_xlatb6;
        u_xlat25 = max(u_xlat25, 9.99999997e-07);
        u_xlat25 = inversesqrt(u_xlat25);
        u_xlat5.xyz = vec3(u_xlat25) * u_xlat5.xyz;
        u_xlat25 = u_xlat26 * 0.5;
        u_xlat25 = (u_xlatb6) ? 0.0 : u_xlat25;
        u_xlat26 = dot(u_xlat1.xyz, u_xlat5.xyz);
        u_xlat26 = max(u_xlat26, 0.0);
        u_xlat6.xyz = vec3(u_xlat26) * _Color.xyz;
        u_xlat6.xyz = u_xlat6.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb26 = 0.0<u_xlat26;
        if(u_xlatb26){
            u_xlat5.xyz = (-u_xlat0.xyz) * vec3(u_xlat22) + u_xlat5.xyz;
            u_xlat26 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat26 = inversesqrt(u_xlat26);
            u_xlat5.xyz = vec3(u_xlat26) * u_xlat5.xyz;
            u_xlat5.x = dot(u_xlat1.xyz, u_xlat5.xyz);
            u_xlat5.x = max(u_xlat5.x, 0.0);
            u_xlat5.x = log2(u_xlat5.x);
            u_xlat5.x = u_xlat23 * u_xlat5.x;
            u_xlat5.x = exp2(u_xlat5.x);
            u_xlat5.x = min(u_xlat5.x, 1.0);
            u_xlat5.x = u_xlat25 * u_xlat5.x;
            u_xlat4.xyz = u_xlat5.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat4.xyz;
        }
        u_xlat5.xyz = vec3(u_xlat25) * u_xlat6.xyz;
        u_xlat5.xyz = min(u_xlat5.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat3.xyz = u_xlat3.xyz + u_xlat5.xyz;
    }
    vs_COLOR1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat3.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat21);
    vs_TEXCOORD1 = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD1 = clamp(vs_TEXCOORD1, 0.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 unity_FogColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec3 vs_COLOR1;
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vs_COLOR1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" "POINT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 692
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %305 %337 %568 %580 %601 %602 %617 %675 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %23 0 Offset 23 
                                                      OpMemberDecorate %23 1 Offset 23 
                                                      OpMemberDecorate %23 2 Offset 23 
                                                      OpMemberDecorate %23 3 Offset 23 
                                                      OpMemberDecorate %23 4 Offset 23 
                                                      OpMemberDecorate %23 5 Offset 23 
                                                      OpMemberDecorate %23 6 Offset 23 
                                                      OpMemberDecorate %23 7 Offset 23 
                                                      OpMemberDecorate %23 8 Offset 23 
                                                      OpMemberDecorate %23 9 Offset 23 
                                                      OpMemberDecorate %23 10 Offset 23 
                                                      OpMemberDecorate %23 11 Offset 23 
                                                      OpMemberDecorate %23 12 Offset 23 
                                                      OpMemberDecorate %23 13 Offset 23 
                                                      OpMemberDecorate %23 14 Offset 23 
                                                      OpMemberDecorate %23 15 Offset 23 
                                                      OpDecorate %23 Block 
                                                      OpDecorate %25 DescriptorSet 25 
                                                      OpDecorate %25 Binding 25 
                                                      OpDecorate %305 Location 305 
                                                      OpDecorate %337 Location 337 
                                                      OpDecorate %568 Location 568 
                                                      OpDecorate %580 Location 580 
                                                      OpDecorate vs_TEXCOORD0 Location 601 
                                                      OpDecorate %602 Location 602 
                                                      OpDecorate vs_TEXCOORD1 Location 617 
                                                      OpMemberDecorate %673 0 BuiltIn 673 
                                                      OpMemberDecorate %673 1 BuiltIn 673 
                                                      OpMemberDecorate %673 2 BuiltIn 673 
                                                      OpDecorate %673 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeArray %7 %15 
                                              %21 = OpTypeInt 32 1 
                                              %22 = OpTypeVector %21 4 
                                              %23 = OpTypeStruct %12 %13 %14 %16 %17 %7 %18 %19 %20 %7 %7 %7 %7 %6 %22 %7 
                                              %24 = OpTypePointer Uniform %23 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[8]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32; i32_4; f32_4;}* %25 = OpVariable Uniform 
                                          i32 %26 = OpConstant 3 
                                          i32 %27 = OpConstant 0 
                                              %28 = OpTypeVector %6 3 
                                              %29 = OpTypePointer Uniform %7 
                                          i32 %33 = OpConstant 6 
                                          i32 %34 = OpConstant 1 
                                          i32 %53 = OpConstant 2 
                               Private f32_4* %78 = OpVariable Private 
                                             %124 = OpTypePointer Private %28 
                              Private f32_3* %125 = OpVariable Private 
                              Private f32_3* %160 = OpVariable Private 
                              Private f32_3* %195 = OpVariable Private 
                                         i32 %196 = OpConstant 4 
                                         i32 %200 = OpConstant 7 
                              Private f32_3* %232 = OpVariable Private 
                              Private f32_3* %267 = OpVariable Private 
                                             %304 = OpTypePointer Input %28 
                                Input f32_3* %305 = OpVariable Input 
                                Input f32_3* %337 = OpVariable Input 
                                         u32 %340 = OpConstant 0 
                                             %341 = OpTypePointer Private %6 
                                         u32 %346 = OpConstant 1 
                                         u32 %351 = OpConstant 2 
                                Private f32* %353 = OpVariable Private 
                                Private f32* %373 = OpVariable Private 
                                         i32 %376 = OpConstant 10 
                                         i32 %380 = OpConstant 5 
                                         i32 %385 = OpConstant 12 
                                Private f32* %390 = OpVariable Private 
                                         i32 %391 = OpConstant 13 
                                             %392 = OpTypePointer Uniform %6 
                                         f32 %395 = OpConstant 3.674022E-40 
                                         f32 %398 = OpConstant 3.674022E-40 
                                             %402 = OpTypePointer Function %21 
                                         i32 %410 = OpConstant 14 
                                             %411 = OpTypePointer Uniform %21 
                                             %414 = OpTypeBool 
                                Private f32* %429 = OpVariable Private 
                                Private f32* %433 = OpVariable Private 
                                         f32 %439 = OpConstant 3.674022E-40 
                                             %443 = OpTypePointer Private %414 
                               Private bool* %444 = OpVariable Private 
                                         u32 %446 = OpConstant 3 
                               Private bool* %450 = OpVariable Private 
                                         f32 %460 = OpConstant 3.674022E-40 
                                         f32 %469 = OpConstant 3.674022E-40 
                               Private bool* %492 = OpVariable Private 
                                       f32_3 %560 = OpConstantComposite %439 %439 %439 
                                             %567 = OpTypePointer Output %28 
                               Output f32_3* %568 = OpVariable Output 
                                         i32 %570 = OpConstant 11 
                                             %579 = OpTypePointer Output %7 
                               Output f32_4* %580 = OpVariable Output 
                                             %593 = OpTypePointer Output %6 
                                             %599 = OpTypeVector %6 2 
                                             %600 = OpTypePointer Output %599 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_3* %602 = OpVariable Input 
                                         i32 %605 = OpConstant 15 
                         Output f32* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %620 = OpConstant 9 
                                         i32 %654 = OpConstant 8 
                                             %672 = OpTypeArray %6 %346 
                                             %673 = OpTypeStruct %7 %6 %672 
                                             %674 = OpTypePointer Output %673 
        Output struct {f32_4; f32; f32[1];}* %675 = OpVariable Output 
                                             %689 = OpTypePointer Private %21 
                                Private i32* %690 = OpVariable Private 
                               Private bool* %691 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %403 = OpVariable Function 
                               Uniform f32_4* %30 = OpAccessChain %25 %26 %27 
                                        f32_4 %31 = OpLoad %30 
                                        f32_3 %32 = OpVectorShuffle %31 %31 1 1 1 
                               Uniform f32_4* %35 = OpAccessChain %25 %33 %34 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                        f32_3 %38 = OpFMul %32 %37 
                                        f32_4 %39 = OpLoad %9 
                                        f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                                      OpStore %9 %40 
                               Uniform f32_4* %41 = OpAccessChain %25 %33 %27 
                                        f32_4 %42 = OpLoad %41 
                                        f32_3 %43 = OpVectorShuffle %42 %42 0 1 2 
                               Uniform f32_4* %44 = OpAccessChain %25 %26 %27 
                                        f32_4 %45 = OpLoad %44 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 0 0 
                                        f32_3 %47 = OpFMul %43 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                        f32_3 %50 = OpFAdd %47 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %50 4 5 6 3 
                                                      OpStore %9 %52 
                               Uniform f32_4* %54 = OpAccessChain %25 %33 %53 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                               Uniform f32_4* %57 = OpAccessChain %25 %26 %27 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 2 2 2 
                                        f32_3 %60 = OpFMul %56 %59 
                                        f32_4 %61 = OpLoad %9 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFAdd %60 %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                                      OpStore %9 %65 
                               Uniform f32_4* %66 = OpAccessChain %25 %33 %26 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                               Uniform f32_4* %69 = OpAccessChain %25 %26 %27 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 3 3 3 
                                        f32_3 %72 = OpFMul %68 %71 
                                        f32_4 %73 = OpLoad %9 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %72 %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                                      OpStore %9 %77 
                               Uniform f32_4* %79 = OpAccessChain %25 %26 %34 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 1 1 1 
                               Uniform f32_4* %82 = OpAccessChain %25 %33 %34 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_3 %85 = OpFMul %81 %84 
                                        f32_4 %86 = OpLoad %78 
                                        f32_4 %87 = OpVectorShuffle %86 %85 4 5 6 3 
                                                      OpStore %78 %87 
                               Uniform f32_4* %88 = OpAccessChain %25 %33 %27 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                               Uniform f32_4* %91 = OpAccessChain %25 %26 %34 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 0 0 
                                        f32_3 %94 = OpFMul %90 %93 
                                        f32_4 %95 = OpLoad %78 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFAdd %94 %96 
                                        f32_4 %98 = OpLoad %78 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 6 3 
                                                      OpStore %78 %99 
                              Uniform f32_4* %100 = OpAccessChain %25 %33 %53 
                                       f32_4 %101 = OpLoad %100 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
                              Uniform f32_4* %103 = OpAccessChain %25 %26 %34 
                                       f32_4 %104 = OpLoad %103 
                                       f32_3 %105 = OpVectorShuffle %104 %104 2 2 2 
                                       f32_3 %106 = OpFMul %102 %105 
                                       f32_4 %107 = OpLoad %78 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpFAdd %106 %108 
                                       f32_4 %110 = OpLoad %78 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 6 3 
                                                      OpStore %78 %111 
                              Uniform f32_4* %112 = OpAccessChain %25 %33 %26 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                              Uniform f32_4* %115 = OpAccessChain %25 %26 %34 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 3 3 3 
                                       f32_3 %118 = OpFMul %114 %117 
                                       f32_4 %119 = OpLoad %78 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                       f32_3 %121 = OpFAdd %118 %120 
                                       f32_4 %122 = OpLoad %78 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %78 %123 
                              Uniform f32_4* %126 = OpAccessChain %25 %26 %53 
                                       f32_4 %127 = OpLoad %126 
                                       f32_3 %128 = OpVectorShuffle %127 %127 1 1 1 
                              Uniform f32_4* %129 = OpAccessChain %25 %33 %34 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpFMul %128 %131 
                                                      OpStore %125 %132 
                              Uniform f32_4* %133 = OpAccessChain %25 %33 %27 
                                       f32_4 %134 = OpLoad %133 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                              Uniform f32_4* %136 = OpAccessChain %25 %26 %53 
                                       f32_4 %137 = OpLoad %136 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 0 0 
                                       f32_3 %139 = OpFMul %135 %138 
                                       f32_3 %140 = OpLoad %125 
                                       f32_3 %141 = OpFAdd %139 %140 
                                                      OpStore %125 %141 
                              Uniform f32_4* %142 = OpAccessChain %25 %33 %53 
                                       f32_4 %143 = OpLoad %142 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                              Uniform f32_4* %145 = OpAccessChain %25 %26 %53 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 2 2 2 
                                       f32_3 %148 = OpFMul %144 %147 
                                       f32_3 %149 = OpLoad %125 
                                       f32_3 %150 = OpFAdd %148 %149 
                                                      OpStore %125 %150 
                              Uniform f32_4* %151 = OpAccessChain %25 %33 %26 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                              Uniform f32_4* %154 = OpAccessChain %25 %26 %53 
                                       f32_4 %155 = OpLoad %154 
                                       f32_3 %156 = OpVectorShuffle %155 %155 3 3 3 
                                       f32_3 %157 = OpFMul %153 %156 
                                       f32_3 %158 = OpLoad %125 
                                       f32_3 %159 = OpFAdd %157 %158 
                                                      OpStore %125 %159 
                              Uniform f32_4* %161 = OpAccessChain %25 %26 %26 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 1 1 1 
                              Uniform f32_4* %164 = OpAccessChain %25 %33 %34 
                                       f32_4 %165 = OpLoad %164 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_3 %167 = OpFMul %163 %166 
                                                      OpStore %160 %167 
                              Uniform f32_4* %168 = OpAccessChain %25 %33 %27 
                                       f32_4 %169 = OpLoad %168 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                              Uniform f32_4* %171 = OpAccessChain %25 %26 %26 
                                       f32_4 %172 = OpLoad %171 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 0 0 
                                       f32_3 %174 = OpFMul %170 %173 
                                       f32_3 %175 = OpLoad %160 
                                       f32_3 %176 = OpFAdd %174 %175 
                                                      OpStore %160 %176 
                              Uniform f32_4* %177 = OpAccessChain %25 %33 %53 
                                       f32_4 %178 = OpLoad %177 
                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
                              Uniform f32_4* %180 = OpAccessChain %25 %26 %26 
                                       f32_4 %181 = OpLoad %180 
                                       f32_3 %182 = OpVectorShuffle %181 %181 2 2 2 
                                       f32_3 %183 = OpFMul %179 %182 
                                       f32_3 %184 = OpLoad %160 
                                       f32_3 %185 = OpFAdd %183 %184 
                                                      OpStore %160 %185 
                              Uniform f32_4* %186 = OpAccessChain %25 %33 %26 
                                       f32_4 %187 = OpLoad %186 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                              Uniform f32_4* %189 = OpAccessChain %25 %26 %26 
                                       f32_4 %190 = OpLoad %189 
                                       f32_3 %191 = OpVectorShuffle %190 %190 3 3 3 
                                       f32_3 %192 = OpFMul %188 %191 
                                       f32_3 %193 = OpLoad %160 
                                       f32_3 %194 = OpFAdd %192 %193 
                                                      OpStore %160 %194 
                              Uniform f32_4* %197 = OpAccessChain %25 %196 %34 
                                       f32_4 %198 = OpLoad %197 
                                       f32_3 %199 = OpVectorShuffle %198 %198 0 1 2 
                              Uniform f32_4* %201 = OpAccessChain %25 %200 %27 
                                       f32_4 %202 = OpLoad %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 1 1 1 
                                       f32_3 %204 = OpFMul %199 %203 
                                                      OpStore %195 %204 
                              Uniform f32_4* %205 = OpAccessChain %25 %196 %27 
                                       f32_4 %206 = OpLoad %205 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                              Uniform f32_4* %208 = OpAccessChain %25 %200 %27 
                                       f32_4 %209 = OpLoad %208 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 0 0 
                                       f32_3 %211 = OpFMul %207 %210 
                                       f32_3 %212 = OpLoad %195 
                                       f32_3 %213 = OpFAdd %211 %212 
                                                      OpStore %195 %213 
                              Uniform f32_4* %214 = OpAccessChain %25 %196 %53 
                                       f32_4 %215 = OpLoad %214 
                                       f32_3 %216 = OpVectorShuffle %215 %215 0 1 2 
                              Uniform f32_4* %217 = OpAccessChain %25 %200 %27 
                                       f32_4 %218 = OpLoad %217 
                                       f32_3 %219 = OpVectorShuffle %218 %218 2 2 2 
                                       f32_3 %220 = OpFMul %216 %219 
                                       f32_3 %221 = OpLoad %195 
                                       f32_3 %222 = OpFAdd %220 %221 
                                                      OpStore %195 %222 
                              Uniform f32_4* %223 = OpAccessChain %25 %196 %26 
                                       f32_4 %224 = OpLoad %223 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                              Uniform f32_4* %226 = OpAccessChain %25 %200 %27 
                                       f32_4 %227 = OpLoad %226 
                                       f32_3 %228 = OpVectorShuffle %227 %227 3 3 3 
                                       f32_3 %229 = OpFMul %225 %228 
                                       f32_3 %230 = OpLoad %195 
                                       f32_3 %231 = OpFAdd %229 %230 
                                                      OpStore %195 %231 
                              Uniform f32_4* %233 = OpAccessChain %25 %196 %34 
                                       f32_4 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                              Uniform f32_4* %236 = OpAccessChain %25 %200 %34 
                                       f32_4 %237 = OpLoad %236 
                                       f32_3 %238 = OpVectorShuffle %237 %237 1 1 1 
                                       f32_3 %239 = OpFMul %235 %238 
                                                      OpStore %232 %239 
                              Uniform f32_4* %240 = OpAccessChain %25 %196 %27 
                                       f32_4 %241 = OpLoad %240 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                              Uniform f32_4* %243 = OpAccessChain %25 %200 %34 
                                       f32_4 %244 = OpLoad %243 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
                                       f32_3 %246 = OpFMul %242 %245 
                                       f32_3 %247 = OpLoad %232 
                                       f32_3 %248 = OpFAdd %246 %247 
                                                      OpStore %232 %248 
                              Uniform f32_4* %249 = OpAccessChain %25 %196 %53 
                                       f32_4 %250 = OpLoad %249 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                              Uniform f32_4* %252 = OpAccessChain %25 %200 %34 
                                       f32_4 %253 = OpLoad %252 
                                       f32_3 %254 = OpVectorShuffle %253 %253 2 2 2 
                                       f32_3 %255 = OpFMul %251 %254 
                                       f32_3 %256 = OpLoad %232 
                                       f32_3 %257 = OpFAdd %255 %256 
                                                      OpStore %232 %257 
                              Uniform f32_4* %258 = OpAccessChain %25 %196 %26 
                                       f32_4 %259 = OpLoad %258 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                              Uniform f32_4* %261 = OpAccessChain %25 %200 %34 
                                       f32_4 %262 = OpLoad %261 
                                       f32_3 %263 = OpVectorShuffle %262 %262 3 3 3 
                                       f32_3 %264 = OpFMul %260 %263 
                                       f32_3 %265 = OpLoad %232 
                                       f32_3 %266 = OpFAdd %264 %265 
                                                      OpStore %232 %266 
                              Uniform f32_4* %268 = OpAccessChain %25 %196 %34 
                                       f32_4 %269 = OpLoad %268 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                              Uniform f32_4* %271 = OpAccessChain %25 %200 %53 
                                       f32_4 %272 = OpLoad %271 
                                       f32_3 %273 = OpVectorShuffle %272 %272 1 1 1 
                                       f32_3 %274 = OpFMul %270 %273 
                                                      OpStore %267 %274 
                              Uniform f32_4* %275 = OpAccessChain %25 %196 %27 
                                       f32_4 %276 = OpLoad %275 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
                              Uniform f32_4* %278 = OpAccessChain %25 %200 %53 
                                       f32_4 %279 = OpLoad %278 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 0 0 
                                       f32_3 %281 = OpFMul %277 %280 
                                       f32_3 %282 = OpLoad %267 
                                       f32_3 %283 = OpFAdd %281 %282 
                                                      OpStore %267 %283 
                              Uniform f32_4* %284 = OpAccessChain %25 %196 %53 
                                       f32_4 %285 = OpLoad %284 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                              Uniform f32_4* %287 = OpAccessChain %25 %200 %53 
                                       f32_4 %288 = OpLoad %287 
                                       f32_3 %289 = OpVectorShuffle %288 %288 2 2 2 
                                       f32_3 %290 = OpFMul %286 %289 
                                       f32_3 %291 = OpLoad %267 
                                       f32_3 %292 = OpFAdd %290 %291 
                                                      OpStore %267 %292 
                              Uniform f32_4* %293 = OpAccessChain %25 %196 %26 
                                       f32_4 %294 = OpLoad %293 
                                       f32_3 %295 = OpVectorShuffle %294 %294 0 1 2 
                              Uniform f32_4* %296 = OpAccessChain %25 %200 %53 
                                       f32_4 %297 = OpLoad %296 
                                       f32_3 %298 = OpVectorShuffle %297 %297 3 3 3 
                                       f32_3 %299 = OpFMul %295 %298 
                                       f32_3 %300 = OpLoad %267 
                                       f32_3 %301 = OpFAdd %299 %300 
                                                      OpStore %267 %301 
                                       f32_4 %302 = OpLoad %78 
                                       f32_3 %303 = OpVectorShuffle %302 %302 0 1 2 
                                       f32_3 %306 = OpLoad %305 
                                       f32_3 %307 = OpVectorShuffle %306 %306 1 1 1 
                                       f32_3 %308 = OpFMul %303 %307 
                                       f32_4 %309 = OpLoad %78 
                                       f32_4 %310 = OpVectorShuffle %309 %308 4 5 6 3 
                                                      OpStore %78 %310 
                                       f32_4 %311 = OpLoad %9 
                                       f32_3 %312 = OpVectorShuffle %311 %311 0 1 2 
                                       f32_3 %313 = OpLoad %305 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 0 0 
                                       f32_3 %315 = OpFMul %312 %314 
                                       f32_4 %316 = OpLoad %78 
                                       f32_3 %317 = OpVectorShuffle %316 %316 0 1 2 
                                       f32_3 %318 = OpFAdd %315 %317 
                                       f32_4 %319 = OpLoad %9 
                                       f32_4 %320 = OpVectorShuffle %319 %318 4 5 6 3 
                                                      OpStore %9 %320 
                                       f32_3 %321 = OpLoad %125 
                                       f32_3 %322 = OpLoad %305 
                                       f32_3 %323 = OpVectorShuffle %322 %322 2 2 2 
                                       f32_3 %324 = OpFMul %321 %323 
                                       f32_4 %325 = OpLoad %9 
                                       f32_3 %326 = OpVectorShuffle %325 %325 0 1 2 
                                       f32_3 %327 = OpFAdd %324 %326 
                                       f32_4 %328 = OpLoad %9 
                                       f32_4 %329 = OpVectorShuffle %328 %327 4 5 6 3 
                                                      OpStore %9 %329 
                                       f32_3 %330 = OpLoad %160 
                                       f32_4 %331 = OpLoad %9 
                                       f32_3 %332 = OpVectorShuffle %331 %331 0 1 2 
                                       f32_3 %333 = OpFAdd %330 %332 
                                       f32_4 %334 = OpLoad %9 
                                       f32_4 %335 = OpVectorShuffle %334 %333 4 5 6 3 
                                                      OpStore %9 %335 
                                       f32_3 %336 = OpLoad %195 
                                       f32_3 %338 = OpLoad %337 
                                         f32 %339 = OpDot %336 %338 
                                Private f32* %342 = OpAccessChain %78 %340 
                                                      OpStore %342 %339 
                                       f32_3 %343 = OpLoad %232 
                                       f32_3 %344 = OpLoad %337 
                                         f32 %345 = OpDot %343 %344 
                                Private f32* %347 = OpAccessChain %78 %346 
                                                      OpStore %347 %345 
                                       f32_3 %348 = OpLoad %267 
                                       f32_3 %349 = OpLoad %337 
                                         f32 %350 = OpDot %348 %349 
                                Private f32* %352 = OpAccessChain %78 %351 
                                                      OpStore %352 %350 
                                       f32_4 %354 = OpLoad %78 
                                       f32_3 %355 = OpVectorShuffle %354 %354 0 1 2 
                                       f32_4 %356 = OpLoad %78 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                         f32 %358 = OpDot %355 %357 
                                                      OpStore %353 %358 
                                         f32 %359 = OpLoad %353 
                                         f32 %360 = OpExtInst %1 32 %359 
                                                      OpStore %353 %360 
                                         f32 %361 = OpLoad %353 
                                       f32_3 %362 = OpCompositeConstruct %361 %361 %361 
                                       f32_4 %363 = OpLoad %78 
                                       f32_3 %364 = OpVectorShuffle %363 %363 0 1 2 
                                       f32_3 %365 = OpFMul %362 %364 
                                       f32_4 %366 = OpLoad %78 
                                       f32_4 %367 = OpVectorShuffle %366 %365 4 5 6 3 
                                                      OpStore %78 %367 
                                       f32_4 %368 = OpLoad %9 
                                       f32_3 %369 = OpVectorShuffle %368 %368 0 1 2 
                                       f32_4 %370 = OpLoad %9 
                                       f32_3 %371 = OpVectorShuffle %370 %370 0 1 2 
                                         f32 %372 = OpDot %369 %371 
                                                      OpStore %353 %372 
                                         f32 %374 = OpLoad %353 
                                         f32 %375 = OpExtInst %1 32 %374 
                                                      OpStore %373 %375 
                              Uniform f32_4* %377 = OpAccessChain %25 %376 
                                       f32_4 %378 = OpLoad %377 
                                       f32_3 %379 = OpVectorShuffle %378 %378 0 1 2 
                              Uniform f32_4* %381 = OpAccessChain %25 %380 
                                       f32_4 %382 = OpLoad %381 
                                       f32_3 %383 = OpVectorShuffle %382 %382 0 1 2 
                                       f32_3 %384 = OpFMul %379 %383 
                              Uniform f32_4* %386 = OpAccessChain %25 %385 
                                       f32_4 %387 = OpLoad %386 
                                       f32_3 %388 = OpVectorShuffle %387 %387 0 1 2 
                                       f32_3 %389 = OpFAdd %384 %388 
                                                      OpStore %125 %389 
                                Uniform f32* %393 = OpAccessChain %25 %391 
                                         f32 %394 = OpLoad %393 
                                         f32 %396 = OpFMul %394 %395 
                                                      OpStore %390 %396 
                                       f32_3 %397 = OpLoad %125 
                                                      OpStore %160 %397 
                                Private f32* %399 = OpAccessChain %195 %340 
                                                      OpStore %399 %398 
                                Private f32* %400 = OpAccessChain %195 %346 
                                                      OpStore %400 %398 
                                Private f32* %401 = OpAccessChain %195 %351 
                                                      OpStore %401 %398 
                                                      OpStore %403 %27 
                                                      OpBranch %404 
                                             %404 = OpLabel 
                                                      OpLoopMerge %406 %407 None 
                                                      OpBranch %408 
                                             %408 = OpLabel 
                                         i32 %409 = OpLoad %403 
                                Uniform i32* %412 = OpAccessChain %25 %410 %340 
                                         i32 %413 = OpLoad %412 
                                        bool %415 = OpSLessThan %409 %413 
                                                      OpBranchConditional %415 %405 %406 
                                             %405 = OpLabel 
                                       f32_4 %416 = OpLoad %9 
                                       f32_3 %417 = OpVectorShuffle %416 %416 0 1 2 
                                       f32_3 %418 = OpFNegate %417 
                                         i32 %419 = OpLoad %403 
                              Uniform f32_4* %420 = OpAccessChain %25 %34 %419 
                                       f32_4 %421 = OpLoad %420 
                                       f32_3 %422 = OpVectorShuffle %421 %421 3 3 3 
                                       f32_3 %423 = OpFMul %418 %422 
                                         i32 %424 = OpLoad %403 
                              Uniform f32_4* %425 = OpAccessChain %25 %34 %424 
                                       f32_4 %426 = OpLoad %425 
                                       f32_3 %427 = OpVectorShuffle %426 %426 0 1 2 
                                       f32_3 %428 = OpFAdd %423 %427 
                                                      OpStore %232 %428 
                                       f32_3 %430 = OpLoad %232 
                                       f32_3 %431 = OpLoad %232 
                                         f32 %432 = OpDot %430 %431 
                                                      OpStore %429 %432 
                                         i32 %434 = OpLoad %403 
                                Uniform f32* %435 = OpAccessChain %25 %53 %434 %351 
                                         f32 %436 = OpLoad %435 
                                         f32 %437 = OpLoad %429 
                                         f32 %438 = OpFMul %436 %437 
                                         f32 %440 = OpFAdd %438 %439 
                                                      OpStore %433 %440 
                                         f32 %441 = OpLoad %433 
                                         f32 %442 = OpFDiv %439 %441 
                                                      OpStore %433 %442 
                                         i32 %445 = OpLoad %403 
                                Uniform f32* %447 = OpAccessChain %25 %34 %445 %446 
                                         f32 %448 = OpLoad %447 
                                        bool %449 = OpFOrdNotEqual %398 %448 
                                                      OpStore %444 %449 
                                         i32 %451 = OpLoad %403 
                                Uniform f32* %452 = OpAccessChain %25 %53 %451 %446 
                                         f32 %453 = OpLoad %452 
                                         f32 %454 = OpLoad %429 
                                        bool %455 = OpFOrdLessThan %453 %454 
                                                      OpStore %450 %455 
                                        bool %456 = OpLoad %450 
                                        bool %457 = OpLoad %444 
                                        bool %458 = OpLogicalAnd %456 %457 
                                                      OpStore %444 %458 
                                         f32 %459 = OpLoad %429 
                                         f32 %461 = OpExtInst %1 40 %459 %460 
                                                      OpStore %429 %461 
                                         f32 %462 = OpLoad %429 
                                         f32 %463 = OpExtInst %1 32 %462 
                                                      OpStore %429 %463 
                                         f32 %464 = OpLoad %429 
                                       f32_3 %465 = OpCompositeConstruct %464 %464 %464 
                                       f32_3 %466 = OpLoad %232 
                                       f32_3 %467 = OpFMul %465 %466 
                                                      OpStore %232 %467 
                                         f32 %468 = OpLoad %433 
                                         f32 %470 = OpFMul %468 %469 
                                                      OpStore %429 %470 
                                        bool %471 = OpLoad %444 
                                         f32 %472 = OpLoad %429 
                                         f32 %473 = OpSelect %471 %398 %472 
                                                      OpStore %429 %473 
                                       f32_4 %474 = OpLoad %78 
                                       f32_3 %475 = OpVectorShuffle %474 %474 0 1 2 
                                       f32_3 %476 = OpLoad %232 
                                         f32 %477 = OpDot %475 %476 
                                                      OpStore %433 %477 
                                         f32 %478 = OpLoad %433 
                                         f32 %479 = OpExtInst %1 40 %478 %398 
                                                      OpStore %433 %479 
                                         f32 %480 = OpLoad %433 
                                       f32_3 %481 = OpCompositeConstruct %480 %480 %480 
                              Uniform f32_4* %482 = OpAccessChain %25 %376 
                                       f32_4 %483 = OpLoad %482 
                                       f32_3 %484 = OpVectorShuffle %483 %483 0 1 2 
                                       f32_3 %485 = OpFMul %481 %484 
                                                      OpStore %267 %485 
                                       f32_3 %486 = OpLoad %267 
                                         i32 %487 = OpLoad %403 
                              Uniform f32_4* %488 = OpAccessChain %25 %27 %487 
                                       f32_4 %489 = OpLoad %488 
                                       f32_3 %490 = OpVectorShuffle %489 %489 0 1 2 
                                       f32_3 %491 = OpFMul %486 %490 
                                                      OpStore %267 %491 
                                         f32 %493 = OpLoad %433 
                                        bool %494 = OpFOrdLessThan %398 %493 
                                                      OpStore %492 %494 
                                        bool %495 = OpLoad %492 
                                                      OpSelectionMerge %497 None 
                                                      OpBranchConditional %495 %496 %497 
                                             %496 = OpLabel 
                                       f32_4 %498 = OpLoad %9 
                                       f32_3 %499 = OpVectorShuffle %498 %498 0 1 2 
                                       f32_3 %500 = OpFNegate %499 
                                         f32 %501 = OpLoad %373 
                                       f32_3 %502 = OpCompositeConstruct %501 %501 %501 
                                       f32_3 %503 = OpFMul %500 %502 
                                       f32_3 %504 = OpLoad %232 
                                       f32_3 %505 = OpFAdd %503 %504 
                                                      OpStore %232 %505 
                                       f32_3 %506 = OpLoad %232 
                                       f32_3 %507 = OpLoad %232 
                                         f32 %508 = OpDot %506 %507 
                                                      OpStore %433 %508 
                                         f32 %509 = OpLoad %433 
                                         f32 %510 = OpExtInst %1 32 %509 
                                                      OpStore %433 %510 
                                         f32 %511 = OpLoad %433 
                                       f32_3 %512 = OpCompositeConstruct %511 %511 %511 
                                       f32_3 %513 = OpLoad %232 
                                       f32_3 %514 = OpFMul %512 %513 
                                                      OpStore %232 %514 
                                       f32_4 %515 = OpLoad %78 
                                       f32_3 %516 = OpVectorShuffle %515 %515 0 1 2 
                                       f32_3 %517 = OpLoad %232 
                                         f32 %518 = OpDot %516 %517 
                                Private f32* %519 = OpAccessChain %232 %340 
                                                      OpStore %519 %518 
                                Private f32* %520 = OpAccessChain %232 %340 
                                         f32 %521 = OpLoad %520 
                                         f32 %522 = OpExtInst %1 40 %521 %398 
                                Private f32* %523 = OpAccessChain %232 %340 
                                                      OpStore %523 %522 
                                Private f32* %524 = OpAccessChain %232 %340 
                                         f32 %525 = OpLoad %524 
                                         f32 %526 = OpExtInst %1 30 %525 
                                Private f32* %527 = OpAccessChain %232 %340 
                                                      OpStore %527 %526 
                                         f32 %528 = OpLoad %390 
                                Private f32* %529 = OpAccessChain %232 %340 
                                         f32 %530 = OpLoad %529 
                                         f32 %531 = OpFMul %528 %530 
                                Private f32* %532 = OpAccessChain %232 %340 
                                                      OpStore %532 %531 
                                Private f32* %533 = OpAccessChain %232 %340 
                                         f32 %534 = OpLoad %533 
                                         f32 %535 = OpExtInst %1 29 %534 
                                Private f32* %536 = OpAccessChain %232 %340 
                                                      OpStore %536 %535 
                                Private f32* %537 = OpAccessChain %232 %340 
                                         f32 %538 = OpLoad %537 
                                         f32 %539 = OpExtInst %1 37 %538 %439 
                                Private f32* %540 = OpAccessChain %232 %340 
                                                      OpStore %540 %539 
                                         f32 %541 = OpLoad %429 
                                Private f32* %542 = OpAccessChain %232 %340 
                                         f32 %543 = OpLoad %542 
                                         f32 %544 = OpFMul %541 %543 
                                Private f32* %545 = OpAccessChain %232 %340 
                                                      OpStore %545 %544 
                                       f32_3 %546 = OpLoad %232 
                                       f32_3 %547 = OpVectorShuffle %546 %546 0 0 0 
                                         i32 %548 = OpLoad %403 
                              Uniform f32_4* %549 = OpAccessChain %25 %27 %548 
                                       f32_4 %550 = OpLoad %549 
                                       f32_3 %551 = OpVectorShuffle %550 %550 0 1 2 
                                       f32_3 %552 = OpFMul %547 %551 
                                       f32_3 %553 = OpLoad %195 
                                       f32_3 %554 = OpFAdd %552 %553 
                                                      OpStore %195 %554 
                                                      OpBranch %497 
                                             %497 = OpLabel 
                                         f32 %555 = OpLoad %429 
                                       f32_3 %556 = OpCompositeConstruct %555 %555 %555 
                                       f32_3 %557 = OpLoad %267 
                                       f32_3 %558 = OpFMul %556 %557 
                                                      OpStore %232 %558 
                                       f32_3 %559 = OpLoad %232 
                                       f32_3 %561 = OpExtInst %1 37 %559 %560 
                                                      OpStore %232 %561 
                                       f32_3 %562 = OpLoad %160 
                                       f32_3 %563 = OpLoad %232 
                                       f32_3 %564 = OpFAdd %562 %563 
                                                      OpStore %160 %564 
                                                      OpBranch %407 
                                             %407 = OpLabel 
                                         i32 %565 = OpLoad %403 
                                         i32 %566 = OpIAdd %565 %34 
                                                      OpStore %403 %566 
                                                      OpBranch %404 
                                             %406 = OpLabel 
                                       f32_3 %569 = OpLoad %195 
                              Uniform f32_4* %571 = OpAccessChain %25 %570 
                                       f32_4 %572 = OpLoad %571 
                                       f32_3 %573 = OpVectorShuffle %572 %572 0 1 2 
                                       f32_3 %574 = OpFMul %569 %573 
                                                      OpStore %568 %574 
                                       f32_3 %575 = OpLoad %568 
                                       f32_3 %576 = OpCompositeConstruct %398 %398 %398 
                                       f32_3 %577 = OpCompositeConstruct %439 %439 %439 
                                       f32_3 %578 = OpExtInst %1 43 %575 %576 %577 
                                                      OpStore %568 %578 
                                       f32_3 %581 = OpLoad %160 
                                       f32_4 %582 = OpLoad %580 
                                       f32_4 %583 = OpVectorShuffle %582 %581 4 5 6 3 
                                                      OpStore %580 %583 
                                       f32_4 %584 = OpLoad %580 
                                       f32_3 %585 = OpVectorShuffle %584 %584 0 1 2 
                                       f32_3 %586 = OpCompositeConstruct %398 %398 %398 
                                       f32_3 %587 = OpCompositeConstruct %439 %439 %439 
                                       f32_3 %588 = OpExtInst %1 43 %585 %586 %587 
                                       f32_4 %589 = OpLoad %580 
                                       f32_4 %590 = OpVectorShuffle %589 %588 4 5 6 3 
                                                      OpStore %580 %590 
                                Uniform f32* %591 = OpAccessChain %25 %376 %446 
                                         f32 %592 = OpLoad %591 
                                 Output f32* %594 = OpAccessChain %580 %446 
                                                      OpStore %594 %592 
                                 Output f32* %595 = OpAccessChain %580 %446 
                                         f32 %596 = OpLoad %595 
                                         f32 %597 = OpExtInst %1 43 %596 %398 %439 
                                 Output f32* %598 = OpAccessChain %580 %446 
                                                      OpStore %598 %597 
                                       f32_3 %603 = OpLoad %602 
                                       f32_2 %604 = OpVectorShuffle %603 %603 0 1 
                              Uniform f32_4* %606 = OpAccessChain %25 %605 
                                       f32_4 %607 = OpLoad %606 
                                       f32_2 %608 = OpVectorShuffle %607 %607 0 1 
                                       f32_2 %609 = OpFMul %604 %608 
                              Uniform f32_4* %610 = OpAccessChain %25 %605 
                                       f32_4 %611 = OpLoad %610 
                                       f32_2 %612 = OpVectorShuffle %611 %611 2 3 
                                       f32_2 %613 = OpFAdd %609 %612 
                                                      OpStore vs_TEXCOORD0 %613 
                                         f32 %614 = OpLoad %353 
                                         f32 %615 = OpExtInst %1 31 %614 
                                Private f32* %616 = OpAccessChain %9 %340 
                                                      OpStore %616 %615 
                                Private f32* %618 = OpAccessChain %9 %340 
                                         f32 %619 = OpLoad %618 
                                Uniform f32* %621 = OpAccessChain %25 %620 %351 
                                         f32 %622 = OpLoad %621 
                                         f32 %623 = OpFMul %619 %622 
                                Uniform f32* %624 = OpAccessChain %25 %620 %446 
                                         f32 %625 = OpLoad %624 
                                         f32 %626 = OpFAdd %623 %625 
                                                      OpStore vs_TEXCOORD1 %626 
                                         f32 %627 = OpLoad vs_TEXCOORD1 
                                         f32 %628 = OpExtInst %1 43 %627 %398 %439 
                                                      OpStore vs_TEXCOORD1 %628 
                                       f32_3 %629 = OpLoad %305 
                                       f32_4 %630 = OpVectorShuffle %629 %629 1 1 1 1 
                              Uniform f32_4* %631 = OpAccessChain %25 %26 %34 
                                       f32_4 %632 = OpLoad %631 
                                       f32_4 %633 = OpFMul %630 %632 
                                                      OpStore %9 %633 
                              Uniform f32_4* %634 = OpAccessChain %25 %26 %27 
                                       f32_4 %635 = OpLoad %634 
                                       f32_3 %636 = OpLoad %305 
                                       f32_4 %637 = OpVectorShuffle %636 %636 0 0 0 0 
                                       f32_4 %638 = OpFMul %635 %637 
                                       f32_4 %639 = OpLoad %9 
                                       f32_4 %640 = OpFAdd %638 %639 
                                                      OpStore %9 %640 
                              Uniform f32_4* %641 = OpAccessChain %25 %26 %53 
                                       f32_4 %642 = OpLoad %641 
                                       f32_3 %643 = OpLoad %305 
                                       f32_4 %644 = OpVectorShuffle %643 %643 2 2 2 2 
                                       f32_4 %645 = OpFMul %642 %644 
                                       f32_4 %646 = OpLoad %9 
                                       f32_4 %647 = OpFAdd %645 %646 
                                                      OpStore %9 %647 
                                       f32_4 %648 = OpLoad %9 
                              Uniform f32_4* %649 = OpAccessChain %25 %26 %26 
                                       f32_4 %650 = OpLoad %649 
                                       f32_4 %651 = OpFAdd %648 %650 
                                                      OpStore %9 %651 
                                       f32_4 %652 = OpLoad %9 
                                       f32_4 %653 = OpVectorShuffle %652 %652 1 1 1 1 
                              Uniform f32_4* %655 = OpAccessChain %25 %654 %34 
                                       f32_4 %656 = OpLoad %655 
                                       f32_4 %657 = OpFMul %653 %656 
                                                      OpStore %78 %657 
                              Uniform f32_4* %658 = OpAccessChain %25 %654 %27 
                                       f32_4 %659 = OpLoad %658 
                                       f32_4 %660 = OpLoad %9 
                                       f32_4 %661 = OpVectorShuffle %660 %660 0 0 0 0 
                                       f32_4 %662 = OpFMul %659 %661 
                                       f32_4 %663 = OpLoad %78 
                                       f32_4 %664 = OpFAdd %662 %663 
                                                      OpStore %78 %664 
                              Uniform f32_4* %665 = OpAccessChain %25 %654 %53 
                                       f32_4 %666 = OpLoad %665 
                                       f32_4 %667 = OpLoad %9 
                                       f32_4 %668 = OpVectorShuffle %667 %667 2 2 2 2 
                                       f32_4 %669 = OpFMul %666 %668 
                                       f32_4 %670 = OpLoad %78 
                                       f32_4 %671 = OpFAdd %669 %670 
                                                      OpStore %78 %671 
                              Uniform f32_4* %676 = OpAccessChain %25 %654 %26 
                                       f32_4 %677 = OpLoad %676 
                                       f32_4 %678 = OpLoad %9 
                                       f32_4 %679 = OpVectorShuffle %678 %678 3 3 3 3 
                                       f32_4 %680 = OpFMul %677 %679 
                                       f32_4 %681 = OpLoad %78 
                                       f32_4 %682 = OpFAdd %680 %681 
                               Output f32_4* %683 = OpAccessChain %675 %27 
                                                      OpStore %683 %682 
                                 Output f32* %684 = OpAccessChain %675 %27 %346 
                                         f32 %685 = OpLoad %684 
                                         f32 %686 = OpFNegate %685 
                                 Output f32* %687 = OpAccessChain %675 %27 %346 
                                                      OpStore %687 %686 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 73
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %29 %38 %54 %56 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %29 Location 29 
                                             OpDecorate %38 Location 38 
                                             OpMemberDecorate %42 0 Offset 42 
                                             OpDecorate %42 Block 
                                             OpDecorate %44 DescriptorSet 44 
                                             OpDecorate %44 Binding 44 
                                             OpDecorate %54 Location 54 
                                             OpDecorate vs_TEXCOORD1 Location 56 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                                     %28 = OpTypePointer Input %24 
                        Input f32_4* %29 = OpVariable Input 
                                 f32 %34 = OpConstant 3.674022E-40 
                               f32_3 %35 = OpConstantComposite %34 %34 %34 
                                     %37 = OpTypePointer Input %7 
                        Input f32_3* %38 = OpVariable Input 
                                     %42 = OpTypeStruct %24 
                                     %43 = OpTypePointer Uniform %42 
            Uniform struct {f32_4;}* %44 = OpVariable Uniform 
                                     %45 = OpTypeInt 32 1 
                                 i32 %46 = OpConstant 0 
                                     %47 = OpTypePointer Uniform %24 
                                     %53 = OpTypePointer Output %24 
                       Output f32_4* %54 = OpVariable Output 
                                     %55 = OpTypePointer Input %6 
                 Input f32* vs_TEXCOORD1 = OpVariable Input 
                                 f32 %67 = OpConstant 3.674022E-40 
                                     %68 = OpTypeInt 32 0 
                                 u32 %69 = OpConstant 3 
                                     %70 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %27 = OpLoad %9 
                               f32_4 %30 = OpLoad %29 
                               f32_3 %31 = OpVectorShuffle %30 %30 0 1 2 
                               f32_3 %32 = OpFMul %27 %31 
                                             OpStore %9 %32 
                               f32_3 %33 = OpLoad %9 
                               f32_3 %36 = OpFMul %33 %35 
                               f32_3 %39 = OpLoad %38 
                               f32_3 %40 = OpFAdd %36 %39 
                                             OpStore %9 %40 
                               f32_3 %41 = OpLoad %9 
                      Uniform f32_4* %48 = OpAccessChain %44 %46 
                               f32_4 %49 = OpLoad %48 
                               f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                               f32_3 %51 = OpFNegate %50 
                               f32_3 %52 = OpFAdd %41 %51 
                                             OpStore %9 %52 
                                 f32 %57 = OpLoad vs_TEXCOORD1 
                               f32_3 %58 = OpCompositeConstruct %57 %57 %57 
                               f32_3 %59 = OpLoad %9 
                               f32_3 %60 = OpFMul %58 %59 
                      Uniform f32_4* %61 = OpAccessChain %44 %46 
                               f32_4 %62 = OpLoad %61 
                               f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                               f32_3 %64 = OpFAdd %60 %63 
                               f32_4 %65 = OpLoad %54 
                               f32_4 %66 = OpVectorShuffle %65 %64 4 5 6 3 
                                             OpStore %54 %66 
                         Output f32* %71 = OpAccessChain %54 %69 
                                             OpStore %71 %67 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" "SPOT" }
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
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _Color;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Emission;
uniform 	float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec3 vs_COLOR1;
out vec2 vs_TEXCOORD0;
out float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
bool u_xlatb6;
bool u_xlatb13;
float u_xlat21;
float u_xlat22;
float u_xlat23;
int u_xlati24;
float u_xlat25;
bool u_xlatb25;
float u_xlat26;
bool u_xlatb26;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat21);
    u_xlat2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + _Emission.xyz;
    u_xlat23 = _Shininess * 128.0;
    u_xlat3.xyz = u_xlat2.xyz;
    u_xlat4.x = float(0.0);
    u_xlat4.y = float(0.0);
    u_xlat4.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat5.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat25 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat26 = unity_LightAtten[u_xlati_loop_1].z * u_xlat25 + 1.0;
        u_xlat26 = float(1.0) / u_xlat26;
        u_xlatb6 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat25;
        u_xlatb6 = u_xlatb13 && u_xlatb6;
        u_xlat26 = (u_xlatb6) ? 0.0 : u_xlat26;
        u_xlat25 = max(u_xlat25, 9.99999997e-07);
        u_xlat25 = inversesqrt(u_xlat25);
        u_xlat5.xyz = vec3(u_xlat25) * u_xlat5.xyz;
        u_xlat25 = dot(u_xlat5.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat25 = max(u_xlat25, 0.0);
        u_xlat25 = u_xlat25 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat25 = u_xlat25 * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
        u_xlat25 = u_xlat25 * u_xlat26;
        u_xlat25 = u_xlat25 * 0.5;
        u_xlat26 = dot(u_xlat1.xyz, u_xlat5.xyz);
        u_xlat26 = max(u_xlat26, 0.0);
        u_xlat6.xyz = vec3(u_xlat26) * _Color.xyz;
        u_xlat6.xyz = u_xlat6.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb26 = 0.0<u_xlat26;
        if(u_xlatb26){
            u_xlat5.xyz = (-u_xlat0.xyz) * vec3(u_xlat22) + u_xlat5.xyz;
            u_xlat26 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat26 = inversesqrt(u_xlat26);
            u_xlat5.xyz = vec3(u_xlat26) * u_xlat5.xyz;
            u_xlat5.x = dot(u_xlat1.xyz, u_xlat5.xyz);
            u_xlat5.x = max(u_xlat5.x, 0.0);
            u_xlat5.x = log2(u_xlat5.x);
            u_xlat5.x = u_xlat23 * u_xlat5.x;
            u_xlat5.x = exp2(u_xlat5.x);
            u_xlat5.x = min(u_xlat5.x, 1.0);
            u_xlat5.x = u_xlat25 * u_xlat5.x;
            u_xlat4.xyz = u_xlat5.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat4.xyz;
        }
        u_xlat5.xyz = vec3(u_xlat25) * u_xlat6.xyz;
        u_xlat5.xyz = min(u_xlat5.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat3.xyz = u_xlat3.xyz + u_xlat5.xyz;
    }
    vs_COLOR1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat3.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat21);
    vs_TEXCOORD1 = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD1 = clamp(vs_TEXCOORD1, 0.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 unity_FogColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec3 vs_COLOR1;
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vs_COLOR1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" "SPOT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 718
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %307 %339 %594 %606 %627 %628 %643 %701 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpMemberDecorate %24 0 Offset 24 
                                                      OpMemberDecorate %24 1 Offset 24 
                                                      OpMemberDecorate %24 2 Offset 24 
                                                      OpMemberDecorate %24 3 Offset 24 
                                                      OpMemberDecorate %24 4 Offset 24 
                                                      OpMemberDecorate %24 5 Offset 24 
                                                      OpMemberDecorate %24 6 Offset 24 
                                                      OpMemberDecorate %24 7 Offset 24 
                                                      OpMemberDecorate %24 8 Offset 24 
                                                      OpMemberDecorate %24 9 Offset 24 
                                                      OpMemberDecorate %24 10 Offset 24 
                                                      OpMemberDecorate %24 11 Offset 24 
                                                      OpMemberDecorate %24 12 Offset 24 
                                                      OpMemberDecorate %24 13 Offset 24 
                                                      OpMemberDecorate %24 14 Offset 24 
                                                      OpMemberDecorate %24 15 Offset 24 
                                                      OpMemberDecorate %24 16 Offset 24 
                                                      OpDecorate %24 Block 
                                                      OpDecorate %26 DescriptorSet 26 
                                                      OpDecorate %26 Binding 26 
                                                      OpDecorate %307 Location 307 
                                                      OpDecorate %339 Location 339 
                                                      OpDecorate %594 Location 594 
                                                      OpDecorate %606 Location 606 
                                                      OpDecorate vs_TEXCOORD0 Location 627 
                                                      OpDecorate %628 Location 628 
                                                      OpDecorate vs_TEXCOORD1 Location 643 
                                                      OpMemberDecorate %699 0 BuiltIn 699 
                                                      OpMemberDecorate %699 1 BuiltIn 699 
                                                      OpMemberDecorate %699 2 BuiltIn 699 
                                                      OpDecorate %699 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                              %15 = OpTypeArray %7 %11 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeArray %7 %16 
                                              %20 = OpTypeArray %7 %16 
                                              %21 = OpTypeArray %7 %16 
                                              %22 = OpTypeInt 32 1 
                                              %23 = OpTypeVector %22 4 
                                              %24 = OpTypeStruct %12 %13 %14 %15 %17 %18 %7 %19 %20 %21 %7 %7 %7 %7 %6 %23 %7 
                                              %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32; i32_4; f32_4;}* %26 = OpVariable Uniform 
                                          i32 %27 = OpConstant 4 
                                          i32 %28 = OpConstant 0 
                                              %29 = OpTypeVector %6 3 
                                              %30 = OpTypePointer Uniform %7 
                                          i32 %34 = OpConstant 7 
                                          i32 %35 = OpConstant 1 
                                          i32 %54 = OpConstant 2 
                                          i32 %67 = OpConstant 3 
                               Private f32_4* %80 = OpVariable Private 
                                             %126 = OpTypePointer Private %29 
                              Private f32_3* %127 = OpVariable Private 
                              Private f32_3* %162 = OpVariable Private 
                              Private f32_3* %197 = OpVariable Private 
                                         i32 %198 = OpConstant 5 
                                         i32 %202 = OpConstant 8 
                              Private f32_3* %234 = OpVariable Private 
                              Private f32_3* %269 = OpVariable Private 
                                             %306 = OpTypePointer Input %29 
                                Input f32_3* %307 = OpVariable Input 
                                Input f32_3* %339 = OpVariable Input 
                                         u32 %342 = OpConstant 0 
                                             %343 = OpTypePointer Private %6 
                                         u32 %348 = OpConstant 1 
                                         u32 %353 = OpConstant 2 
                                Private f32* %355 = OpVariable Private 
                                Private f32* %375 = OpVariable Private 
                                         i32 %378 = OpConstant 11 
                                         i32 %382 = OpConstant 6 
                                         i32 %387 = OpConstant 13 
                                Private f32* %392 = OpVariable Private 
                                         i32 %393 = OpConstant 14 
                                             %394 = OpTypePointer Uniform %6 
                                         f32 %397 = OpConstant 3.674022E-40 
                                         f32 %400 = OpConstant 3.674022E-40 
                                             %404 = OpTypePointer Function %22 
                                         i32 %412 = OpConstant 15 
                                             %413 = OpTypePointer Uniform %22 
                                             %416 = OpTypeBool 
                                Private f32* %431 = OpVariable Private 
                                Private f32* %435 = OpVariable Private 
                                         f32 %441 = OpConstant 3.674022E-40 
                                             %445 = OpTypePointer Private %416 
                               Private bool* %446 = OpVariable Private 
                                         u32 %448 = OpConstant 3 
                               Private bool* %452 = OpVariable Private 
                                         f32 %465 = OpConstant 3.674022E-40 
                                         f32 %498 = OpConstant 3.674022E-40 
                               Private bool* %518 = OpVariable Private 
                                       f32_3 %586 = OpConstantComposite %441 %441 %441 
                                             %593 = OpTypePointer Output %29 
                               Output f32_3* %594 = OpVariable Output 
                                         i32 %596 = OpConstant 12 
                                             %605 = OpTypePointer Output %7 
                               Output f32_4* %606 = OpVariable Output 
                                             %619 = OpTypePointer Output %6 
                                             %625 = OpTypeVector %6 2 
                                             %626 = OpTypePointer Output %625 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_3* %628 = OpVariable Input 
                                         i32 %631 = OpConstant 16 
                         Output f32* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %646 = OpConstant 10 
                                         i32 %680 = OpConstant 9 
                                             %698 = OpTypeArray %6 %348 
                                             %699 = OpTypeStruct %7 %6 %698 
                                             %700 = OpTypePointer Output %699 
        Output struct {f32_4; f32; f32[1];}* %701 = OpVariable Output 
                                             %715 = OpTypePointer Private %22 
                                Private i32* %716 = OpVariable Private 
                               Private bool* %717 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %405 = OpVariable Function 
                               Uniform f32_4* %31 = OpAccessChain %26 %27 %28 
                                        f32_4 %32 = OpLoad %31 
                                        f32_3 %33 = OpVectorShuffle %32 %32 1 1 1 
                               Uniform f32_4* %36 = OpAccessChain %26 %34 %35 
                                        f32_4 %37 = OpLoad %36 
                                        f32_3 %38 = OpVectorShuffle %37 %37 0 1 2 
                                        f32_3 %39 = OpFMul %33 %38 
                                        f32_4 %40 = OpLoad %9 
                                        f32_4 %41 = OpVectorShuffle %40 %39 4 5 6 3 
                                                      OpStore %9 %41 
                               Uniform f32_4* %42 = OpAccessChain %26 %34 %28 
                                        f32_4 %43 = OpLoad %42 
                                        f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                               Uniform f32_4* %45 = OpAccessChain %26 %27 %28 
                                        f32_4 %46 = OpLoad %45 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 0 0 
                                        f32_3 %48 = OpFMul %44 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %51 = OpFAdd %48 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpVectorShuffle %52 %51 4 5 6 3 
                                                      OpStore %9 %53 
                               Uniform f32_4* %55 = OpAccessChain %26 %34 %54 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                               Uniform f32_4* %58 = OpAccessChain %26 %27 %28 
                                        f32_4 %59 = OpLoad %58 
                                        f32_3 %60 = OpVectorShuffle %59 %59 2 2 2 
                                        f32_3 %61 = OpFMul %57 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                                        f32_3 %64 = OpFAdd %61 %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %64 4 5 6 3 
                                                      OpStore %9 %66 
                               Uniform f32_4* %68 = OpAccessChain %26 %34 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                               Uniform f32_4* %71 = OpAccessChain %26 %27 %28 
                                        f32_4 %72 = OpLoad %71 
                                        f32_3 %73 = OpVectorShuffle %72 %72 3 3 3 
                                        f32_3 %74 = OpFMul %70 %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                                        f32_3 %77 = OpFAdd %74 %76 
                                        f32_4 %78 = OpLoad %9 
                                        f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
                                                      OpStore %9 %79 
                               Uniform f32_4* %81 = OpAccessChain %26 %27 %35 
                                        f32_4 %82 = OpLoad %81 
                                        f32_3 %83 = OpVectorShuffle %82 %82 1 1 1 
                               Uniform f32_4* %84 = OpAccessChain %26 %34 %35 
                                        f32_4 %85 = OpLoad %84 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFMul %83 %86 
                                        f32_4 %88 = OpLoad %80 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %80 %89 
                               Uniform f32_4* %90 = OpAccessChain %26 %34 %28 
                                        f32_4 %91 = OpLoad %90 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                               Uniform f32_4* %93 = OpAccessChain %26 %27 %35 
                                        f32_4 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 0 0 
                                        f32_3 %96 = OpFMul %92 %95 
                                        f32_4 %97 = OpLoad %80 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                        f32_3 %99 = OpFAdd %96 %98 
                                       f32_4 %100 = OpLoad %80 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 5 6 3 
                                                      OpStore %80 %101 
                              Uniform f32_4* %102 = OpAccessChain %26 %34 %54 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                              Uniform f32_4* %105 = OpAccessChain %26 %27 %35 
                                       f32_4 %106 = OpLoad %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 2 2 2 
                                       f32_3 %108 = OpFMul %104 %107 
                                       f32_4 %109 = OpLoad %80 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                       f32_3 %111 = OpFAdd %108 %110 
                                       f32_4 %112 = OpLoad %80 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %80 %113 
                              Uniform f32_4* %114 = OpAccessChain %26 %34 %67 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                              Uniform f32_4* %117 = OpAccessChain %26 %27 %35 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 3 3 3 
                                       f32_3 %120 = OpFMul %116 %119 
                                       f32_4 %121 = OpLoad %80 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFAdd %120 %122 
                                       f32_4 %124 = OpLoad %80 
                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 6 3 
                                                      OpStore %80 %125 
                              Uniform f32_4* %128 = OpAccessChain %26 %27 %54 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 1 1 1 
                              Uniform f32_4* %131 = OpAccessChain %26 %34 %35 
                                       f32_4 %132 = OpLoad %131 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpFMul %130 %133 
                                                      OpStore %127 %134 
                              Uniform f32_4* %135 = OpAccessChain %26 %34 %28 
                                       f32_4 %136 = OpLoad %135 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                              Uniform f32_4* %138 = OpAccessChain %26 %27 %54 
                                       f32_4 %139 = OpLoad %138 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 0 0 
                                       f32_3 %141 = OpFMul %137 %140 
                                       f32_3 %142 = OpLoad %127 
                                       f32_3 %143 = OpFAdd %141 %142 
                                                      OpStore %127 %143 
                              Uniform f32_4* %144 = OpAccessChain %26 %34 %54 
                                       f32_4 %145 = OpLoad %144 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                              Uniform f32_4* %147 = OpAccessChain %26 %27 %54 
                                       f32_4 %148 = OpLoad %147 
                                       f32_3 %149 = OpVectorShuffle %148 %148 2 2 2 
                                       f32_3 %150 = OpFMul %146 %149 
                                       f32_3 %151 = OpLoad %127 
                                       f32_3 %152 = OpFAdd %150 %151 
                                                      OpStore %127 %152 
                              Uniform f32_4* %153 = OpAccessChain %26 %34 %67 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                              Uniform f32_4* %156 = OpAccessChain %26 %27 %54 
                                       f32_4 %157 = OpLoad %156 
                                       f32_3 %158 = OpVectorShuffle %157 %157 3 3 3 
                                       f32_3 %159 = OpFMul %155 %158 
                                       f32_3 %160 = OpLoad %127 
                                       f32_3 %161 = OpFAdd %159 %160 
                                                      OpStore %127 %161 
                              Uniform f32_4* %163 = OpAccessChain %26 %27 %67 
                                       f32_4 %164 = OpLoad %163 
                                       f32_3 %165 = OpVectorShuffle %164 %164 1 1 1 
                              Uniform f32_4* %166 = OpAccessChain %26 %34 %35 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpFMul %165 %168 
                                                      OpStore %162 %169 
                              Uniform f32_4* %170 = OpAccessChain %26 %34 %28 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                              Uniform f32_4* %173 = OpAccessChain %26 %27 %67 
                                       f32_4 %174 = OpLoad %173 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 0 0 
                                       f32_3 %176 = OpFMul %172 %175 
                                       f32_3 %177 = OpLoad %162 
                                       f32_3 %178 = OpFAdd %176 %177 
                                                      OpStore %162 %178 
                              Uniform f32_4* %179 = OpAccessChain %26 %34 %54 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                              Uniform f32_4* %182 = OpAccessChain %26 %27 %67 
                                       f32_4 %183 = OpLoad %182 
                                       f32_3 %184 = OpVectorShuffle %183 %183 2 2 2 
                                       f32_3 %185 = OpFMul %181 %184 
                                       f32_3 %186 = OpLoad %162 
                                       f32_3 %187 = OpFAdd %185 %186 
                                                      OpStore %162 %187 
                              Uniform f32_4* %188 = OpAccessChain %26 %34 %67 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                              Uniform f32_4* %191 = OpAccessChain %26 %27 %67 
                                       f32_4 %192 = OpLoad %191 
                                       f32_3 %193 = OpVectorShuffle %192 %192 3 3 3 
                                       f32_3 %194 = OpFMul %190 %193 
                                       f32_3 %195 = OpLoad %162 
                                       f32_3 %196 = OpFAdd %194 %195 
                                                      OpStore %162 %196 
                              Uniform f32_4* %199 = OpAccessChain %26 %198 %35 
                                       f32_4 %200 = OpLoad %199 
                                       f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
                              Uniform f32_4* %203 = OpAccessChain %26 %202 %28 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 1 1 1 
                                       f32_3 %206 = OpFMul %201 %205 
                                                      OpStore %197 %206 
                              Uniform f32_4* %207 = OpAccessChain %26 %198 %28 
                                       f32_4 %208 = OpLoad %207 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                              Uniform f32_4* %210 = OpAccessChain %26 %202 %28 
                                       f32_4 %211 = OpLoad %210 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 0 0 
                                       f32_3 %213 = OpFMul %209 %212 
                                       f32_3 %214 = OpLoad %197 
                                       f32_3 %215 = OpFAdd %213 %214 
                                                      OpStore %197 %215 
                              Uniform f32_4* %216 = OpAccessChain %26 %198 %54 
                                       f32_4 %217 = OpLoad %216 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                              Uniform f32_4* %219 = OpAccessChain %26 %202 %28 
                                       f32_4 %220 = OpLoad %219 
                                       f32_3 %221 = OpVectorShuffle %220 %220 2 2 2 
                                       f32_3 %222 = OpFMul %218 %221 
                                       f32_3 %223 = OpLoad %197 
                                       f32_3 %224 = OpFAdd %222 %223 
                                                      OpStore %197 %224 
                              Uniform f32_4* %225 = OpAccessChain %26 %198 %67 
                                       f32_4 %226 = OpLoad %225 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
                              Uniform f32_4* %228 = OpAccessChain %26 %202 %28 
                                       f32_4 %229 = OpLoad %228 
                                       f32_3 %230 = OpVectorShuffle %229 %229 3 3 3 
                                       f32_3 %231 = OpFMul %227 %230 
                                       f32_3 %232 = OpLoad %197 
                                       f32_3 %233 = OpFAdd %231 %232 
                                                      OpStore %197 %233 
                              Uniform f32_4* %235 = OpAccessChain %26 %198 %35 
                                       f32_4 %236 = OpLoad %235 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
                              Uniform f32_4* %238 = OpAccessChain %26 %202 %35 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 1 1 1 
                                       f32_3 %241 = OpFMul %237 %240 
                                                      OpStore %234 %241 
                              Uniform f32_4* %242 = OpAccessChain %26 %198 %28 
                                       f32_4 %243 = OpLoad %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                              Uniform f32_4* %245 = OpAccessChain %26 %202 %35 
                                       f32_4 %246 = OpLoad %245 
                                       f32_3 %247 = OpVectorShuffle %246 %246 0 0 0 
                                       f32_3 %248 = OpFMul %244 %247 
                                       f32_3 %249 = OpLoad %234 
                                       f32_3 %250 = OpFAdd %248 %249 
                                                      OpStore %234 %250 
                              Uniform f32_4* %251 = OpAccessChain %26 %198 %54 
                                       f32_4 %252 = OpLoad %251 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                              Uniform f32_4* %254 = OpAccessChain %26 %202 %35 
                                       f32_4 %255 = OpLoad %254 
                                       f32_3 %256 = OpVectorShuffle %255 %255 2 2 2 
                                       f32_3 %257 = OpFMul %253 %256 
                                       f32_3 %258 = OpLoad %234 
                                       f32_3 %259 = OpFAdd %257 %258 
                                                      OpStore %234 %259 
                              Uniform f32_4* %260 = OpAccessChain %26 %198 %67 
                                       f32_4 %261 = OpLoad %260 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                              Uniform f32_4* %263 = OpAccessChain %26 %202 %35 
                                       f32_4 %264 = OpLoad %263 
                                       f32_3 %265 = OpVectorShuffle %264 %264 3 3 3 
                                       f32_3 %266 = OpFMul %262 %265 
                                       f32_3 %267 = OpLoad %234 
                                       f32_3 %268 = OpFAdd %266 %267 
                                                      OpStore %234 %268 
                              Uniform f32_4* %270 = OpAccessChain %26 %198 %35 
                                       f32_4 %271 = OpLoad %270 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                              Uniform f32_4* %273 = OpAccessChain %26 %202 %54 
                                       f32_4 %274 = OpLoad %273 
                                       f32_3 %275 = OpVectorShuffle %274 %274 1 1 1 
                                       f32_3 %276 = OpFMul %272 %275 
                                                      OpStore %269 %276 
                              Uniform f32_4* %277 = OpAccessChain %26 %198 %28 
                                       f32_4 %278 = OpLoad %277 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                              Uniform f32_4* %280 = OpAccessChain %26 %202 %54 
                                       f32_4 %281 = OpLoad %280 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 0 0 
                                       f32_3 %283 = OpFMul %279 %282 
                                       f32_3 %284 = OpLoad %269 
                                       f32_3 %285 = OpFAdd %283 %284 
                                                      OpStore %269 %285 
                              Uniform f32_4* %286 = OpAccessChain %26 %198 %54 
                                       f32_4 %287 = OpLoad %286 
                                       f32_3 %288 = OpVectorShuffle %287 %287 0 1 2 
                              Uniform f32_4* %289 = OpAccessChain %26 %202 %54 
                                       f32_4 %290 = OpLoad %289 
                                       f32_3 %291 = OpVectorShuffle %290 %290 2 2 2 
                                       f32_3 %292 = OpFMul %288 %291 
                                       f32_3 %293 = OpLoad %269 
                                       f32_3 %294 = OpFAdd %292 %293 
                                                      OpStore %269 %294 
                              Uniform f32_4* %295 = OpAccessChain %26 %198 %67 
                                       f32_4 %296 = OpLoad %295 
                                       f32_3 %297 = OpVectorShuffle %296 %296 0 1 2 
                              Uniform f32_4* %298 = OpAccessChain %26 %202 %54 
                                       f32_4 %299 = OpLoad %298 
                                       f32_3 %300 = OpVectorShuffle %299 %299 3 3 3 
                                       f32_3 %301 = OpFMul %297 %300 
                                       f32_3 %302 = OpLoad %269 
                                       f32_3 %303 = OpFAdd %301 %302 
                                                      OpStore %269 %303 
                                       f32_4 %304 = OpLoad %80 
                                       f32_3 %305 = OpVectorShuffle %304 %304 0 1 2 
                                       f32_3 %308 = OpLoad %307 
                                       f32_3 %309 = OpVectorShuffle %308 %308 1 1 1 
                                       f32_3 %310 = OpFMul %305 %309 
                                       f32_4 %311 = OpLoad %80 
                                       f32_4 %312 = OpVectorShuffle %311 %310 4 5 6 3 
                                                      OpStore %80 %312 
                                       f32_4 %313 = OpLoad %9 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 1 2 
                                       f32_3 %315 = OpLoad %307 
                                       f32_3 %316 = OpVectorShuffle %315 %315 0 0 0 
                                       f32_3 %317 = OpFMul %314 %316 
                                       f32_4 %318 = OpLoad %80 
                                       f32_3 %319 = OpVectorShuffle %318 %318 0 1 2 
                                       f32_3 %320 = OpFAdd %317 %319 
                                       f32_4 %321 = OpLoad %9 
                                       f32_4 %322 = OpVectorShuffle %321 %320 4 5 6 3 
                                                      OpStore %9 %322 
                                       f32_3 %323 = OpLoad %127 
                                       f32_3 %324 = OpLoad %307 
                                       f32_3 %325 = OpVectorShuffle %324 %324 2 2 2 
                                       f32_3 %326 = OpFMul %323 %325 
                                       f32_4 %327 = OpLoad %9 
                                       f32_3 %328 = OpVectorShuffle %327 %327 0 1 2 
                                       f32_3 %329 = OpFAdd %326 %328 
                                       f32_4 %330 = OpLoad %9 
                                       f32_4 %331 = OpVectorShuffle %330 %329 4 5 6 3 
                                                      OpStore %9 %331 
                                       f32_3 %332 = OpLoad %162 
                                       f32_4 %333 = OpLoad %9 
                                       f32_3 %334 = OpVectorShuffle %333 %333 0 1 2 
                                       f32_3 %335 = OpFAdd %332 %334 
                                       f32_4 %336 = OpLoad %9 
                                       f32_4 %337 = OpVectorShuffle %336 %335 4 5 6 3 
                                                      OpStore %9 %337 
                                       f32_3 %338 = OpLoad %197 
                                       f32_3 %340 = OpLoad %339 
                                         f32 %341 = OpDot %338 %340 
                                Private f32* %344 = OpAccessChain %80 %342 
                                                      OpStore %344 %341 
                                       f32_3 %345 = OpLoad %234 
                                       f32_3 %346 = OpLoad %339 
                                         f32 %347 = OpDot %345 %346 
                                Private f32* %349 = OpAccessChain %80 %348 
                                                      OpStore %349 %347 
                                       f32_3 %350 = OpLoad %269 
                                       f32_3 %351 = OpLoad %339 
                                         f32 %352 = OpDot %350 %351 
                                Private f32* %354 = OpAccessChain %80 %353 
                                                      OpStore %354 %352 
                                       f32_4 %356 = OpLoad %80 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                       f32_4 %358 = OpLoad %80 
                                       f32_3 %359 = OpVectorShuffle %358 %358 0 1 2 
                                         f32 %360 = OpDot %357 %359 
                                                      OpStore %355 %360 
                                         f32 %361 = OpLoad %355 
                                         f32 %362 = OpExtInst %1 32 %361 
                                                      OpStore %355 %362 
                                         f32 %363 = OpLoad %355 
                                       f32_3 %364 = OpCompositeConstruct %363 %363 %363 
                                       f32_4 %365 = OpLoad %80 
                                       f32_3 %366 = OpVectorShuffle %365 %365 0 1 2 
                                       f32_3 %367 = OpFMul %364 %366 
                                       f32_4 %368 = OpLoad %80 
                                       f32_4 %369 = OpVectorShuffle %368 %367 4 5 6 3 
                                                      OpStore %80 %369 
                                       f32_4 %370 = OpLoad %9 
                                       f32_3 %371 = OpVectorShuffle %370 %370 0 1 2 
                                       f32_4 %372 = OpLoad %9 
                                       f32_3 %373 = OpVectorShuffle %372 %372 0 1 2 
                                         f32 %374 = OpDot %371 %373 
                                                      OpStore %355 %374 
                                         f32 %376 = OpLoad %355 
                                         f32 %377 = OpExtInst %1 32 %376 
                                                      OpStore %375 %377 
                              Uniform f32_4* %379 = OpAccessChain %26 %378 
                                       f32_4 %380 = OpLoad %379 
                                       f32_3 %381 = OpVectorShuffle %380 %380 0 1 2 
                              Uniform f32_4* %383 = OpAccessChain %26 %382 
                                       f32_4 %384 = OpLoad %383 
                                       f32_3 %385 = OpVectorShuffle %384 %384 0 1 2 
                                       f32_3 %386 = OpFMul %381 %385 
                              Uniform f32_4* %388 = OpAccessChain %26 %387 
                                       f32_4 %389 = OpLoad %388 
                                       f32_3 %390 = OpVectorShuffle %389 %389 0 1 2 
                                       f32_3 %391 = OpFAdd %386 %390 
                                                      OpStore %127 %391 
                                Uniform f32* %395 = OpAccessChain %26 %393 
                                         f32 %396 = OpLoad %395 
                                         f32 %398 = OpFMul %396 %397 
                                                      OpStore %392 %398 
                                       f32_3 %399 = OpLoad %127 
                                                      OpStore %162 %399 
                                Private f32* %401 = OpAccessChain %197 %342 
                                                      OpStore %401 %400 
                                Private f32* %402 = OpAccessChain %197 %348 
                                                      OpStore %402 %400 
                                Private f32* %403 = OpAccessChain %197 %353 
                                                      OpStore %403 %400 
                                                      OpStore %405 %28 
                                                      OpBranch %406 
                                             %406 = OpLabel 
                                                      OpLoopMerge %408 %409 None 
                                                      OpBranch %410 
                                             %410 = OpLabel 
                                         i32 %411 = OpLoad %405 
                                Uniform i32* %414 = OpAccessChain %26 %412 %342 
                                         i32 %415 = OpLoad %414 
                                        bool %417 = OpSLessThan %411 %415 
                                                      OpBranchConditional %417 %407 %408 
                                             %407 = OpLabel 
                                       f32_4 %418 = OpLoad %9 
                                       f32_3 %419 = OpVectorShuffle %418 %418 0 1 2 
                                       f32_3 %420 = OpFNegate %419 
                                         i32 %421 = OpLoad %405 
                              Uniform f32_4* %422 = OpAccessChain %26 %35 %421 
                                       f32_4 %423 = OpLoad %422 
                                       f32_3 %424 = OpVectorShuffle %423 %423 3 3 3 
                                       f32_3 %425 = OpFMul %420 %424 
                                         i32 %426 = OpLoad %405 
                              Uniform f32_4* %427 = OpAccessChain %26 %35 %426 
                                       f32_4 %428 = OpLoad %427 
                                       f32_3 %429 = OpVectorShuffle %428 %428 0 1 2 
                                       f32_3 %430 = OpFAdd %425 %429 
                                                      OpStore %234 %430 
                                       f32_3 %432 = OpLoad %234 
                                       f32_3 %433 = OpLoad %234 
                                         f32 %434 = OpDot %432 %433 
                                                      OpStore %431 %434 
                                         i32 %436 = OpLoad %405 
                                Uniform f32* %437 = OpAccessChain %26 %54 %436 %353 
                                         f32 %438 = OpLoad %437 
                                         f32 %439 = OpLoad %431 
                                         f32 %440 = OpFMul %438 %439 
                                         f32 %442 = OpFAdd %440 %441 
                                                      OpStore %435 %442 
                                         f32 %443 = OpLoad %435 
                                         f32 %444 = OpFDiv %441 %443 
                                                      OpStore %435 %444 
                                         i32 %447 = OpLoad %405 
                                Uniform f32* %449 = OpAccessChain %26 %35 %447 %448 
                                         f32 %450 = OpLoad %449 
                                        bool %451 = OpFOrdNotEqual %400 %450 
                                                      OpStore %446 %451 
                                         i32 %453 = OpLoad %405 
                                Uniform f32* %454 = OpAccessChain %26 %54 %453 %448 
                                         f32 %455 = OpLoad %454 
                                         f32 %456 = OpLoad %431 
                                        bool %457 = OpFOrdLessThan %455 %456 
                                                      OpStore %452 %457 
                                        bool %458 = OpLoad %452 
                                        bool %459 = OpLoad %446 
                                        bool %460 = OpLogicalAnd %458 %459 
                                                      OpStore %446 %460 
                                        bool %461 = OpLoad %446 
                                         f32 %462 = OpLoad %435 
                                         f32 %463 = OpSelect %461 %400 %462 
                                                      OpStore %435 %463 
                                         f32 %464 = OpLoad %431 
                                         f32 %466 = OpExtInst %1 40 %464 %465 
                                                      OpStore %431 %466 
                                         f32 %467 = OpLoad %431 
                                         f32 %468 = OpExtInst %1 32 %467 
                                                      OpStore %431 %468 
                                         f32 %469 = OpLoad %431 
                                       f32_3 %470 = OpCompositeConstruct %469 %469 %469 
                                       f32_3 %471 = OpLoad %234 
                                       f32_3 %472 = OpFMul %470 %471 
                                                      OpStore %234 %472 
                                       f32_3 %473 = OpLoad %234 
                                         i32 %474 = OpLoad %405 
                              Uniform f32_4* %475 = OpAccessChain %26 %67 %474 
                                       f32_4 %476 = OpLoad %475 
                                       f32_3 %477 = OpVectorShuffle %476 %476 0 1 2 
                                         f32 %478 = OpDot %473 %477 
                                                      OpStore %431 %478 
                                         f32 %479 = OpLoad %431 
                                         f32 %480 = OpExtInst %1 40 %479 %400 
                                                      OpStore %431 %480 
                                         f32 %481 = OpLoad %431 
                                         i32 %482 = OpLoad %405 
                                Uniform f32* %483 = OpAccessChain %26 %54 %482 %342 
                                         f32 %484 = OpLoad %483 
                                         f32 %485 = OpFNegate %484 
                                         f32 %486 = OpFAdd %481 %485 
                                                      OpStore %431 %486 
                                         f32 %487 = OpLoad %431 
                                         i32 %488 = OpLoad %405 
                                Uniform f32* %489 = OpAccessChain %26 %54 %488 %348 
                                         f32 %490 = OpLoad %489 
                                         f32 %491 = OpFMul %487 %490 
                                                      OpStore %431 %491 
                                         f32 %492 = OpLoad %431 
                                         f32 %493 = OpExtInst %1 43 %492 %400 %441 
                                                      OpStore %431 %493 
                                         f32 %494 = OpLoad %431 
                                         f32 %495 = OpLoad %435 
                                         f32 %496 = OpFMul %494 %495 
                                                      OpStore %431 %496 
                                         f32 %497 = OpLoad %431 
                                         f32 %499 = OpFMul %497 %498 
                                                      OpStore %431 %499 
                                       f32_4 %500 = OpLoad %80 
                                       f32_3 %501 = OpVectorShuffle %500 %500 0 1 2 
                                       f32_3 %502 = OpLoad %234 
                                         f32 %503 = OpDot %501 %502 
                                                      OpStore %435 %503 
                                         f32 %504 = OpLoad %435 
                                         f32 %505 = OpExtInst %1 40 %504 %400 
                                                      OpStore %435 %505 
                                         f32 %506 = OpLoad %435 
                                       f32_3 %507 = OpCompositeConstruct %506 %506 %506 
                              Uniform f32_4* %508 = OpAccessChain %26 %378 
                                       f32_4 %509 = OpLoad %508 
                                       f32_3 %510 = OpVectorShuffle %509 %509 0 1 2 
                                       f32_3 %511 = OpFMul %507 %510 
                                                      OpStore %269 %511 
                                       f32_3 %512 = OpLoad %269 
                                         i32 %513 = OpLoad %405 
                              Uniform f32_4* %514 = OpAccessChain %26 %28 %513 
                                       f32_4 %515 = OpLoad %514 
                                       f32_3 %516 = OpVectorShuffle %515 %515 0 1 2 
                                       f32_3 %517 = OpFMul %512 %516 
                                                      OpStore %269 %517 
                                         f32 %519 = OpLoad %435 
                                        bool %520 = OpFOrdLessThan %400 %519 
                                                      OpStore %518 %520 
                                        bool %521 = OpLoad %518 
                                                      OpSelectionMerge %523 None 
                                                      OpBranchConditional %521 %522 %523 
                                             %522 = OpLabel 
                                       f32_4 %524 = OpLoad %9 
                                       f32_3 %525 = OpVectorShuffle %524 %524 0 1 2 
                                       f32_3 %526 = OpFNegate %525 
                                         f32 %527 = OpLoad %375 
                                       f32_3 %528 = OpCompositeConstruct %527 %527 %527 
                                       f32_3 %529 = OpFMul %526 %528 
                                       f32_3 %530 = OpLoad %234 
                                       f32_3 %531 = OpFAdd %529 %530 
                                                      OpStore %234 %531 
                                       f32_3 %532 = OpLoad %234 
                                       f32_3 %533 = OpLoad %234 
                                         f32 %534 = OpDot %532 %533 
                                                      OpStore %435 %534 
                                         f32 %535 = OpLoad %435 
                                         f32 %536 = OpExtInst %1 32 %535 
                                                      OpStore %435 %536 
                                         f32 %537 = OpLoad %435 
                                       f32_3 %538 = OpCompositeConstruct %537 %537 %537 
                                       f32_3 %539 = OpLoad %234 
                                       f32_3 %540 = OpFMul %538 %539 
                                                      OpStore %234 %540 
                                       f32_4 %541 = OpLoad %80 
                                       f32_3 %542 = OpVectorShuffle %541 %541 0 1 2 
                                       f32_3 %543 = OpLoad %234 
                                         f32 %544 = OpDot %542 %543 
                                Private f32* %545 = OpAccessChain %234 %342 
                                                      OpStore %545 %544 
                                Private f32* %546 = OpAccessChain %234 %342 
                                         f32 %547 = OpLoad %546 
                                         f32 %548 = OpExtInst %1 40 %547 %400 
                                Private f32* %549 = OpAccessChain %234 %342 
                                                      OpStore %549 %548 
                                Private f32* %550 = OpAccessChain %234 %342 
                                         f32 %551 = OpLoad %550 
                                         f32 %552 = OpExtInst %1 30 %551 
                                Private f32* %553 = OpAccessChain %234 %342 
                                                      OpStore %553 %552 
                                         f32 %554 = OpLoad %392 
                                Private f32* %555 = OpAccessChain %234 %342 
                                         f32 %556 = OpLoad %555 
                                         f32 %557 = OpFMul %554 %556 
                                Private f32* %558 = OpAccessChain %234 %342 
                                                      OpStore %558 %557 
                                Private f32* %559 = OpAccessChain %234 %342 
                                         f32 %560 = OpLoad %559 
                                         f32 %561 = OpExtInst %1 29 %560 
                                Private f32* %562 = OpAccessChain %234 %342 
                                                      OpStore %562 %561 
                                Private f32* %563 = OpAccessChain %234 %342 
                                         f32 %564 = OpLoad %563 
                                         f32 %565 = OpExtInst %1 37 %564 %441 
                                Private f32* %566 = OpAccessChain %234 %342 
                                                      OpStore %566 %565 
                                         f32 %567 = OpLoad %431 
                                Private f32* %568 = OpAccessChain %234 %342 
                                         f32 %569 = OpLoad %568 
                                         f32 %570 = OpFMul %567 %569 
                                Private f32* %571 = OpAccessChain %234 %342 
                                                      OpStore %571 %570 
                                       f32_3 %572 = OpLoad %234 
                                       f32_3 %573 = OpVectorShuffle %572 %572 0 0 0 
                                         i32 %574 = OpLoad %405 
                              Uniform f32_4* %575 = OpAccessChain %26 %28 %574 
                                       f32_4 %576 = OpLoad %575 
                                       f32_3 %577 = OpVectorShuffle %576 %576 0 1 2 
                                       f32_3 %578 = OpFMul %573 %577 
                                       f32_3 %579 = OpLoad %197 
                                       f32_3 %580 = OpFAdd %578 %579 
                                                      OpStore %197 %580 
                                                      OpBranch %523 
                                             %523 = OpLabel 
                                         f32 %581 = OpLoad %431 
                                       f32_3 %582 = OpCompositeConstruct %581 %581 %581 
                                       f32_3 %583 = OpLoad %269 
                                       f32_3 %584 = OpFMul %582 %583 
                                                      OpStore %234 %584 
                                       f32_3 %585 = OpLoad %234 
                                       f32_3 %587 = OpExtInst %1 37 %585 %586 
                                                      OpStore %234 %587 
                                       f32_3 %588 = OpLoad %162 
                                       f32_3 %589 = OpLoad %234 
                                       f32_3 %590 = OpFAdd %588 %589 
                                                      OpStore %162 %590 
                                                      OpBranch %409 
                                             %409 = OpLabel 
                                         i32 %591 = OpLoad %405 
                                         i32 %592 = OpIAdd %591 %35 
                                                      OpStore %405 %592 
                                                      OpBranch %406 
                                             %408 = OpLabel 
                                       f32_3 %595 = OpLoad %197 
                              Uniform f32_4* %597 = OpAccessChain %26 %596 
                                       f32_4 %598 = OpLoad %597 
                                       f32_3 %599 = OpVectorShuffle %598 %598 0 1 2 
                                       f32_3 %600 = OpFMul %595 %599 
                                                      OpStore %594 %600 
                                       f32_3 %601 = OpLoad %594 
                                       f32_3 %602 = OpCompositeConstruct %400 %400 %400 
                                       f32_3 %603 = OpCompositeConstruct %441 %441 %441 
                                       f32_3 %604 = OpExtInst %1 43 %601 %602 %603 
                                                      OpStore %594 %604 
                                       f32_3 %607 = OpLoad %162 
                                       f32_4 %608 = OpLoad %606 
                                       f32_4 %609 = OpVectorShuffle %608 %607 4 5 6 3 
                                                      OpStore %606 %609 
                                       f32_4 %610 = OpLoad %606 
                                       f32_3 %611 = OpVectorShuffle %610 %610 0 1 2 
                                       f32_3 %612 = OpCompositeConstruct %400 %400 %400 
                                       f32_3 %613 = OpCompositeConstruct %441 %441 %441 
                                       f32_3 %614 = OpExtInst %1 43 %611 %612 %613 
                                       f32_4 %615 = OpLoad %606 
                                       f32_4 %616 = OpVectorShuffle %615 %614 4 5 6 3 
                                                      OpStore %606 %616 
                                Uniform f32* %617 = OpAccessChain %26 %378 %448 
                                         f32 %618 = OpLoad %617 
                                 Output f32* %620 = OpAccessChain %606 %448 
                                                      OpStore %620 %618 
                                 Output f32* %621 = OpAccessChain %606 %448 
                                         f32 %622 = OpLoad %621 
                                         f32 %623 = OpExtInst %1 43 %622 %400 %441 
                                 Output f32* %624 = OpAccessChain %606 %448 
                                                      OpStore %624 %623 
                                       f32_3 %629 = OpLoad %628 
                                       f32_2 %630 = OpVectorShuffle %629 %629 0 1 
                              Uniform f32_4* %632 = OpAccessChain %26 %631 
                                       f32_4 %633 = OpLoad %632 
                                       f32_2 %634 = OpVectorShuffle %633 %633 0 1 
                                       f32_2 %635 = OpFMul %630 %634 
                              Uniform f32_4* %636 = OpAccessChain %26 %631 
                                       f32_4 %637 = OpLoad %636 
                                       f32_2 %638 = OpVectorShuffle %637 %637 2 3 
                                       f32_2 %639 = OpFAdd %635 %638 
                                                      OpStore vs_TEXCOORD0 %639 
                                         f32 %640 = OpLoad %355 
                                         f32 %641 = OpExtInst %1 31 %640 
                                Private f32* %642 = OpAccessChain %9 %342 
                                                      OpStore %642 %641 
                                Private f32* %644 = OpAccessChain %9 %342 
                                         f32 %645 = OpLoad %644 
                                Uniform f32* %647 = OpAccessChain %26 %646 %353 
                                         f32 %648 = OpLoad %647 
                                         f32 %649 = OpFMul %645 %648 
                                Uniform f32* %650 = OpAccessChain %26 %646 %448 
                                         f32 %651 = OpLoad %650 
                                         f32 %652 = OpFAdd %649 %651 
                                                      OpStore vs_TEXCOORD1 %652 
                                         f32 %653 = OpLoad vs_TEXCOORD1 
                                         f32 %654 = OpExtInst %1 43 %653 %400 %441 
                                                      OpStore vs_TEXCOORD1 %654 
                                       f32_3 %655 = OpLoad %307 
                                       f32_4 %656 = OpVectorShuffle %655 %655 1 1 1 1 
                              Uniform f32_4* %657 = OpAccessChain %26 %27 %35 
                                       f32_4 %658 = OpLoad %657 
                                       f32_4 %659 = OpFMul %656 %658 
                                                      OpStore %9 %659 
                              Uniform f32_4* %660 = OpAccessChain %26 %27 %28 
                                       f32_4 %661 = OpLoad %660 
                                       f32_3 %662 = OpLoad %307 
                                       f32_4 %663 = OpVectorShuffle %662 %662 0 0 0 0 
                                       f32_4 %664 = OpFMul %661 %663 
                                       f32_4 %665 = OpLoad %9 
                                       f32_4 %666 = OpFAdd %664 %665 
                                                      OpStore %9 %666 
                              Uniform f32_4* %667 = OpAccessChain %26 %27 %54 
                                       f32_4 %668 = OpLoad %667 
                                       f32_3 %669 = OpLoad %307 
                                       f32_4 %670 = OpVectorShuffle %669 %669 2 2 2 2 
                                       f32_4 %671 = OpFMul %668 %670 
                                       f32_4 %672 = OpLoad %9 
                                       f32_4 %673 = OpFAdd %671 %672 
                                                      OpStore %9 %673 
                                       f32_4 %674 = OpLoad %9 
                              Uniform f32_4* %675 = OpAccessChain %26 %27 %67 
                                       f32_4 %676 = OpLoad %675 
                                       f32_4 %677 = OpFAdd %674 %676 
                                                      OpStore %9 %677 
                                       f32_4 %678 = OpLoad %9 
                                       f32_4 %679 = OpVectorShuffle %678 %678 1 1 1 1 
                              Uniform f32_4* %681 = OpAccessChain %26 %680 %35 
                                       f32_4 %682 = OpLoad %681 
                                       f32_4 %683 = OpFMul %679 %682 
                                                      OpStore %80 %683 
                              Uniform f32_4* %684 = OpAccessChain %26 %680 %28 
                                       f32_4 %685 = OpLoad %684 
                                       f32_4 %686 = OpLoad %9 
                                       f32_4 %687 = OpVectorShuffle %686 %686 0 0 0 0 
                                       f32_4 %688 = OpFMul %685 %687 
                                       f32_4 %689 = OpLoad %80 
                                       f32_4 %690 = OpFAdd %688 %689 
                                                      OpStore %80 %690 
                              Uniform f32_4* %691 = OpAccessChain %26 %680 %54 
                                       f32_4 %692 = OpLoad %691 
                                       f32_4 %693 = OpLoad %9 
                                       f32_4 %694 = OpVectorShuffle %693 %693 2 2 2 2 
                                       f32_4 %695 = OpFMul %692 %694 
                                       f32_4 %696 = OpLoad %80 
                                       f32_4 %697 = OpFAdd %695 %696 
                                                      OpStore %80 %697 
                              Uniform f32_4* %702 = OpAccessChain %26 %680 %67 
                                       f32_4 %703 = OpLoad %702 
                                       f32_4 %704 = OpLoad %9 
                                       f32_4 %705 = OpVectorShuffle %704 %704 3 3 3 3 
                                       f32_4 %706 = OpFMul %703 %705 
                                       f32_4 %707 = OpLoad %80 
                                       f32_4 %708 = OpFAdd %706 %707 
                               Output f32_4* %709 = OpAccessChain %701 %28 
                                                      OpStore %709 %708 
                                 Output f32* %710 = OpAccessChain %701 %28 %348 
                                         f32 %711 = OpLoad %710 
                                         f32 %712 = OpFNegate %711 
                                 Output f32* %713 = OpAccessChain %701 %28 %348 
                                                      OpStore %713 %712 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 73
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %29 %38 %54 %56 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %29 Location 29 
                                             OpDecorate %38 Location 38 
                                             OpMemberDecorate %42 0 Offset 42 
                                             OpDecorate %42 Block 
                                             OpDecorate %44 DescriptorSet 44 
                                             OpDecorate %44 Binding 44 
                                             OpDecorate %54 Location 54 
                                             OpDecorate vs_TEXCOORD1 Location 56 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                                     %28 = OpTypePointer Input %24 
                        Input f32_4* %29 = OpVariable Input 
                                 f32 %34 = OpConstant 3.674022E-40 
                               f32_3 %35 = OpConstantComposite %34 %34 %34 
                                     %37 = OpTypePointer Input %7 
                        Input f32_3* %38 = OpVariable Input 
                                     %42 = OpTypeStruct %24 
                                     %43 = OpTypePointer Uniform %42 
            Uniform struct {f32_4;}* %44 = OpVariable Uniform 
                                     %45 = OpTypeInt 32 1 
                                 i32 %46 = OpConstant 0 
                                     %47 = OpTypePointer Uniform %24 
                                     %53 = OpTypePointer Output %24 
                       Output f32_4* %54 = OpVariable Output 
                                     %55 = OpTypePointer Input %6 
                 Input f32* vs_TEXCOORD1 = OpVariable Input 
                                 f32 %67 = OpConstant 3.674022E-40 
                                     %68 = OpTypeInt 32 0 
                                 u32 %69 = OpConstant 3 
                                     %70 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %27 = OpLoad %9 
                               f32_4 %30 = OpLoad %29 
                               f32_3 %31 = OpVectorShuffle %30 %30 0 1 2 
                               f32_3 %32 = OpFMul %27 %31 
                                             OpStore %9 %32 
                               f32_3 %33 = OpLoad %9 
                               f32_3 %36 = OpFMul %33 %35 
                               f32_3 %39 = OpLoad %38 
                               f32_3 %40 = OpFAdd %36 %39 
                                             OpStore %9 %40 
                               f32_3 %41 = OpLoad %9 
                      Uniform f32_4* %48 = OpAccessChain %44 %46 
                               f32_4 %49 = OpLoad %48 
                               f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                               f32_3 %51 = OpFNegate %50 
                               f32_3 %52 = OpFAdd %41 %51 
                                             OpStore %9 %52 
                                 f32 %57 = OpLoad vs_TEXCOORD1 
                               f32_3 %58 = OpCompositeConstruct %57 %57 %57 
                               f32_3 %59 = OpLoad %9 
                               f32_3 %60 = OpFMul %58 %59 
                      Uniform f32_4* %61 = OpAccessChain %44 %46 
                               f32_4 %62 = OpLoad %61 
                               f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                               f32_3 %64 = OpFAdd %60 %63 
                               f32_4 %65 = OpLoad %54 
                               f32_4 %66 = OpVectorShuffle %65 %64 4 5 6 3 
                                             OpStore %54 %66 
                         Output f32* %71 = OpAccessChain %54 %69 
                                             OpStore %71 %67 
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
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" }
""
}
SubProgram "vulkan " {
Keywords { "POINT" }
""
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" }
""
}
SubProgram "vulkan " {
Keywords { "SPOT" }
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
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" "POINT" }
""
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" "POINT" }
""
}
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" "SPOT" }
""
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" "SPOT" }
""
}
}
}
 Pass {
  LOD 100
  Tags { "LIGHTMODE" = "VertexLM" "RenderType" = "Opaque" }
  Fog {
   Mode Off
  }
  GpuProgramID 153878
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
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_TEXCOORD1;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = vec4(0.0, 0.0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _Color;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D unity_Lightmap;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = texture(unity_Lightmap, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat0.xyz;
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
; Bound: 119
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %9 %15 %18 %39 %40 %54 %104 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %9 Location 9 
                                                      OpDecorate vs_TEXCOORD0 Location 15 
                                                      OpDecorate %18 Location 18 
                                                      OpDecorate %23 ArrayStride 23 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpMemberDecorate %25 0 Offset 25 
                                                      OpMemberDecorate %25 1 Offset 25 
                                                      OpMemberDecorate %25 2 Offset 25 
                                                      OpMemberDecorate %25 3 Offset 25 
                                                      OpDecorate %25 Block 
                                                      OpDecorate %27 DescriptorSet 27 
                                                      OpDecorate %27 Binding 27 
                                                      OpDecorate vs_TEXCOORD1 Location 39 
                                                      OpDecorate %40 Location 40 
                                                      OpDecorate %54 Location 54 
                                                      OpMemberDecorate %102 0 BuiltIn 102 
                                                      OpMemberDecorate %102 1 BuiltIn 102 
                                                      OpMemberDecorate %102 2 BuiltIn 102 
                                                      OpDecorate %102 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Output %7 
                                 Output f32_4* %9 = OpVariable Output 
                                          f32 %10 = OpConstant 3.674022E-40 
                                          f32 %11 = OpConstant 3.674022E-40 
                                        f32_4 %12 = OpConstantComposite %10 %10 %10 %11 
                                              %13 = OpTypeVector %6 2 
                                              %14 = OpTypePointer Output %13 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %16 = OpTypeVector %6 3 
                                              %17 = OpTypePointer Input %16 
                                 Input f32_3* %18 = OpVariable Input 
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 4 
                                              %23 = OpTypeArray %7 %22 
                                              %24 = OpTypeArray %7 %22 
                                              %25 = OpTypeStruct %23 %24 %7 %7 
                                              %26 = OpTypePointer Uniform %25 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4;}* %27 = OpVariable Uniform 
                                              %28 = OpTypeInt 32 1 
                                          i32 %29 = OpConstant 2 
                                              %30 = OpTypePointer Uniform %7 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                 Input f32_3* %40 = OpVariable Input 
                                          i32 %43 = OpConstant 3 
                                              %52 = OpTypePointer Private %7 
                               Private f32_4* %53 = OpVariable Private 
                                 Input f32_3* %54 = OpVariable Input 
                                          i32 %57 = OpConstant 0 
                                          i32 %58 = OpConstant 1 
                               Private f32_4* %80 = OpVariable Private 
                                         u32 %100 = OpConstant 1 
                                             %101 = OpTypeArray %6 %100 
                                             %102 = OpTypeStruct %7 %6 %101 
                                             %103 = OpTypePointer Output %102 
        Output struct {f32_4; f32; f32[1];}* %104 = OpVariable Output 
                                             %113 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                                      OpStore %9 %12 
                                        f32_3 %19 = OpLoad %18 
                                        f32_2 %20 = OpVectorShuffle %19 %19 0 1 
                               Uniform f32_4* %31 = OpAccessChain %27 %29 
                                        f32_4 %32 = OpLoad %31 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                        f32_2 %34 = OpFMul %20 %33 
                               Uniform f32_4* %35 = OpAccessChain %27 %29 
                                        f32_4 %36 = OpLoad %35 
                                        f32_2 %37 = OpVectorShuffle %36 %36 2 3 
                                        f32_2 %38 = OpFAdd %34 %37 
                                                      OpStore vs_TEXCOORD0 %38 
                                        f32_3 %41 = OpLoad %40 
                                        f32_2 %42 = OpVectorShuffle %41 %41 0 1 
                               Uniform f32_4* %44 = OpAccessChain %27 %43 
                                        f32_4 %45 = OpLoad %44 
                                        f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                                        f32_2 %47 = OpFMul %42 %46 
                               Uniform f32_4* %48 = OpAccessChain %27 %43 
                                        f32_4 %49 = OpLoad %48 
                                        f32_2 %50 = OpVectorShuffle %49 %49 2 3 
                                        f32_2 %51 = OpFAdd %47 %50 
                                                      OpStore vs_TEXCOORD1 %51 
                                        f32_3 %55 = OpLoad %54 
                                        f32_4 %56 = OpVectorShuffle %55 %55 1 1 1 1 
                               Uniform f32_4* %59 = OpAccessChain %27 %57 %58 
                                        f32_4 %60 = OpLoad %59 
                                        f32_4 %61 = OpFMul %56 %60 
                                                      OpStore %53 %61 
                               Uniform f32_4* %62 = OpAccessChain %27 %57 %57 
                                        f32_4 %63 = OpLoad %62 
                                        f32_3 %64 = OpLoad %54 
                                        f32_4 %65 = OpVectorShuffle %64 %64 0 0 0 0 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %53 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %53 %68 
                               Uniform f32_4* %69 = OpAccessChain %27 %57 %29 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpLoad %54 
                                        f32_4 %72 = OpVectorShuffle %71 %71 2 2 2 2 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %53 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %53 %75 
                                        f32_4 %76 = OpLoad %53 
                               Uniform f32_4* %77 = OpAccessChain %27 %57 %43 
                                        f32_4 %78 = OpLoad %77 
                                        f32_4 %79 = OpFAdd %76 %78 
                                                      OpStore %53 %79 
                                        f32_4 %81 = OpLoad %53 
                                        f32_4 %82 = OpVectorShuffle %81 %81 1 1 1 1 
                               Uniform f32_4* %83 = OpAccessChain %27 %58 %58 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpFMul %82 %84 
                                                      OpStore %80 %85 
                               Uniform f32_4* %86 = OpAccessChain %27 %58 %57 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %53 
                                        f32_4 %89 = OpVectorShuffle %88 %88 0 0 0 0 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %80 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %80 %92 
                               Uniform f32_4* %93 = OpAccessChain %27 %58 %29 
                                        f32_4 %94 = OpLoad %93 
                                        f32_4 %95 = OpLoad %53 
                                        f32_4 %96 = OpVectorShuffle %95 %95 2 2 2 2 
                                        f32_4 %97 = OpFMul %94 %96 
                                        f32_4 %98 = OpLoad %80 
                                        f32_4 %99 = OpFAdd %97 %98 
                                                      OpStore %80 %99 
                              Uniform f32_4* %105 = OpAccessChain %27 %58 %43 
                                       f32_4 %106 = OpLoad %105 
                                       f32_4 %107 = OpLoad %53 
                                       f32_4 %108 = OpVectorShuffle %107 %107 3 3 3 3 
                                       f32_4 %109 = OpFMul %106 %108 
                                       f32_4 %110 = OpLoad %80 
                                       f32_4 %111 = OpFAdd %109 %110 
                               Output f32_4* %112 = OpAccessChain %104 %57 
                                                      OpStore %112 %111 
                                 Output f32* %114 = OpAccessChain %104 %57 %100 
                                         f32 %115 = OpLoad %114 
                                         f32 %116 = OpFNegate %115 
                                 Output f32* %117 = OpAccessChain %104 %57 %100 
                                                      OpStore %117 %116 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 64
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %44 %52 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpMemberDecorate %28 0 Offset 28 
                                             OpDecorate %28 Block 
                                             OpDecorate %30 DescriptorSet 30 
                                             OpDecorate %30 Binding 30 
                                             OpDecorate %39 DescriptorSet 39 
                                             OpDecorate %39 Binding 39 
                                             OpDecorate %41 DescriptorSet 41 
                                             OpDecorate %41 Binding 41 
                                             OpDecorate vs_TEXCOORD1 Location 44 
                                             OpDecorate %52 Location 52 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                                     %28 = OpTypeStruct %24 
                                     %29 = OpTypePointer Uniform %28 
            Uniform struct {f32_4;}* %30 = OpVariable Uniform 
                                     %31 = OpTypeInt 32 1 
                                 i32 %32 = OpConstant 0 
                                     %33 = OpTypePointer Uniform %24 
                      Private f32_3* %38 = OpVariable Private 
UniformConstant read_only Texture2D* %39 = OpVariable UniformConstant 
            UniformConstant sampler* %41 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %51 = OpTypePointer Output %24 
                       Output f32_4* %52 = OpVariable Output 
                                 f32 %58 = OpConstant 3.674022E-40 
                                     %59 = OpTypeInt 32 0 
                                 u32 %60 = OpConstant 3 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %27 = OpLoad %9 
                      Uniform f32_4* %34 = OpAccessChain %30 %32 
                               f32_4 %35 = OpLoad %34 
                               f32_3 %36 = OpVectorShuffle %35 %35 0 1 2 
                               f32_3 %37 = OpFMul %27 %36 
                                             OpStore %9 %37 
                 read_only Texture2D %40 = OpLoad %39 
                             sampler %42 = OpLoad %41 
          read_only Texture2DSampled %43 = OpSampledImage %40 %42 
                               f32_2 %45 = OpLoad vs_TEXCOORD1 
                               f32_4 %46 = OpImageSampleImplicitLod %43 %45 
                               f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                             OpStore %38 %47 
                               f32_3 %48 = OpLoad %9 
                               f32_3 %49 = OpLoad %38 
                               f32_3 %50 = OpFMul %48 %49 
                                             OpStore %9 %50 
                               f32_3 %53 = OpLoad %9 
                               f32_3 %54 = OpLoad %9 
                               f32_3 %55 = OpFAdd %53 %54 
                               f32_4 %56 = OpLoad %52 
                               f32_4 %57 = OpVectorShuffle %56 %55 4 5 6 3 
                                             OpStore %52 %57 
                         Output f32* %62 = OpAccessChain %52 %60 
                                             OpStore %62 %58 
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_TEXCOORD1;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = vec4(0.0, 0.0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    vs_TEXCOORD2 = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD2 = clamp(vs_TEXCOORD2, 0.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 unity_FogColor;
uniform 	vec4 _Color;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D unity_Lightmap;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  float vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = texture(unity_Lightmap, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 362
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %9 %15 %18 %40 %41 %106 %288 %348 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %9 Location 9 
                                                      OpDecorate vs_TEXCOORD0 Location 15 
                                                      OpDecorate %18 Location 18 
                                                      OpDecorate %23 ArrayStride 23 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpDecorate %25 ArrayStride 25 
                                                      OpMemberDecorate %26 0 Offset 26 
                                                      OpMemberDecorate %26 1 Offset 26 
                                                      OpMemberDecorate %26 2 Offset 26 
                                                      OpMemberDecorate %26 3 Offset 26 
                                                      OpMemberDecorate %26 4 Offset 26 
                                                      OpMemberDecorate %26 5 Offset 26 
                                                      OpDecorate %26 Block 
                                                      OpDecorate %28 DescriptorSet 28 
                                                      OpDecorate %28 Binding 28 
                                                      OpDecorate vs_TEXCOORD1 Location 40 
                                                      OpDecorate %41 Location 41 
                                                      OpDecorate %106 Location 106 
                                                      OpDecorate vs_TEXCOORD2 Location 288 
                                                      OpMemberDecorate %346 0 BuiltIn 346 
                                                      OpMemberDecorate %346 1 BuiltIn 346 
                                                      OpMemberDecorate %346 2 BuiltIn 346 
                                                      OpDecorate %346 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Output %7 
                                 Output f32_4* %9 = OpVariable Output 
                                          f32 %10 = OpConstant 3.674022E-40 
                                          f32 %11 = OpConstant 3.674022E-40 
                                        f32_4 %12 = OpConstantComposite %10 %10 %10 %11 
                                              %13 = OpTypeVector %6 2 
                                              %14 = OpTypePointer Output %13 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %16 = OpTypeVector %6 3 
                                              %17 = OpTypePointer Input %16 
                                 Input f32_3* %18 = OpVariable Input 
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 4 
                                              %23 = OpTypeArray %7 %22 
                                              %24 = OpTypeArray %7 %22 
                                              %25 = OpTypeArray %7 %22 
                                              %26 = OpTypeStruct %23 %24 %25 %7 %7 %7 
                                              %27 = OpTypePointer Uniform %26 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4;}* %28 = OpVariable Uniform 
                                              %29 = OpTypeInt 32 1 
                                          i32 %30 = OpConstant 4 
                                              %31 = OpTypePointer Uniform %7 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                 Input f32_3* %41 = OpVariable Input 
                                          i32 %44 = OpConstant 5 
                                              %53 = OpTypePointer Private %7 
                               Private f32_4* %54 = OpVariable Private 
                                          i32 %55 = OpConstant 0 
                                          i32 %56 = OpConstant 1 
                                          i32 %78 = OpConstant 2 
                                          i32 %91 = OpConstant 3 
                                Input f32_3* %106 = OpVariable Input 
                              Private f32_4* %112 = OpVariable Private 
                                         u32 %280 = OpConstant 0 
                                             %281 = OpTypePointer Private %6 
                                             %287 = OpTypePointer Output %6 
                         Output f32* vs_TEXCOORD2 = OpVariable Output 
                                         u32 %291 = OpConstant 2 
                                             %292 = OpTypePointer Uniform %6 
                                         u32 %296 = OpConstant 3 
                                         u32 %344 = OpConstant 1 
                                             %345 = OpTypeArray %6 %344 
                                             %346 = OpTypeStruct %7 %6 %345 
                                             %347 = OpTypePointer Output %346 
        Output struct {f32_4; f32; f32[1];}* %348 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                                      OpStore %9 %12 
                                        f32_3 %19 = OpLoad %18 
                                        f32_2 %20 = OpVectorShuffle %19 %19 0 1 
                               Uniform f32_4* %32 = OpAccessChain %28 %30 
                                        f32_4 %33 = OpLoad %32 
                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                        f32_2 %35 = OpFMul %20 %34 
                               Uniform f32_4* %36 = OpAccessChain %28 %30 
                                        f32_4 %37 = OpLoad %36 
                                        f32_2 %38 = OpVectorShuffle %37 %37 2 3 
                                        f32_2 %39 = OpFAdd %35 %38 
                                                      OpStore vs_TEXCOORD0 %39 
                                        f32_3 %42 = OpLoad %41 
                                        f32_2 %43 = OpVectorShuffle %42 %42 0 1 
                               Uniform f32_4* %45 = OpAccessChain %28 %44 
                                        f32_4 %46 = OpLoad %45 
                                        f32_2 %47 = OpVectorShuffle %46 %46 0 1 
                                        f32_2 %48 = OpFMul %43 %47 
                               Uniform f32_4* %49 = OpAccessChain %28 %44 
                                        f32_4 %50 = OpLoad %49 
                                        f32_2 %51 = OpVectorShuffle %50 %50 2 3 
                                        f32_2 %52 = OpFAdd %48 %51 
                                                      OpStore vs_TEXCOORD1 %52 
                               Uniform f32_4* %57 = OpAccessChain %28 %55 %56 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %28 %56 %56 
                                        f32_4 %61 = OpLoad %60 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFMul %59 %62 
                                        f32_4 %64 = OpLoad %54 
                                        f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                                      OpStore %54 %65 
                               Uniform f32_4* %66 = OpAccessChain %28 %56 %55 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                               Uniform f32_4* %69 = OpAccessChain %28 %55 %56 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 0 0 
                                        f32_3 %72 = OpFMul %68 %71 
                                        f32_4 %73 = OpLoad %54 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %72 %74 
                                        f32_4 %76 = OpLoad %54 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                                      OpStore %54 %77 
                               Uniform f32_4* %79 = OpAccessChain %28 %56 %78 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                               Uniform f32_4* %82 = OpAccessChain %28 %55 %56 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 2 2 2 
                                        f32_3 %85 = OpFMul %81 %84 
                                        f32_4 %86 = OpLoad %54 
                                        f32_3 %87 = OpVectorShuffle %86 %86 0 1 2 
                                        f32_3 %88 = OpFAdd %85 %87 
                                        f32_4 %89 = OpLoad %54 
                                        f32_4 %90 = OpVectorShuffle %89 %88 4 5 6 3 
                                                      OpStore %54 %90 
                               Uniform f32_4* %92 = OpAccessChain %28 %56 %91 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                               Uniform f32_4* %95 = OpAccessChain %28 %55 %56 
                                        f32_4 %96 = OpLoad %95 
                                        f32_3 %97 = OpVectorShuffle %96 %96 3 3 3 
                                        f32_3 %98 = OpFMul %94 %97 
                                        f32_4 %99 = OpLoad %54 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpFAdd %98 %100 
                                       f32_4 %102 = OpLoad %54 
                                       f32_4 %103 = OpVectorShuffle %102 %101 4 5 6 3 
                                                      OpStore %54 %103 
                                       f32_4 %104 = OpLoad %54 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                                       f32_3 %107 = OpLoad %106 
                                       f32_3 %108 = OpVectorShuffle %107 %107 1 1 1 
                                       f32_3 %109 = OpFMul %105 %108 
                                       f32_4 %110 = OpLoad %54 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 6 3 
                                                      OpStore %54 %111 
                              Uniform f32_4* %113 = OpAccessChain %28 %55 %55 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 1 1 1 
                              Uniform f32_4* %116 = OpAccessChain %28 %56 %56 
                                       f32_4 %117 = OpLoad %116 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                                       f32_3 %119 = OpFMul %115 %118 
                                       f32_4 %120 = OpLoad %112 
                                       f32_4 %121 = OpVectorShuffle %120 %119 4 5 6 3 
                                                      OpStore %112 %121 
                              Uniform f32_4* %122 = OpAccessChain %28 %56 %55 
                                       f32_4 %123 = OpLoad %122 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                              Uniform f32_4* %125 = OpAccessChain %28 %55 %55 
                                       f32_4 %126 = OpLoad %125 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 0 0 
                                       f32_3 %128 = OpFMul %124 %127 
                                       f32_4 %129 = OpLoad %112 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32_3 %131 = OpFAdd %128 %130 
                                       f32_4 %132 = OpLoad %112 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
                                                      OpStore %112 %133 
                              Uniform f32_4* %134 = OpAccessChain %28 %56 %78 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                              Uniform f32_4* %137 = OpAccessChain %28 %55 %55 
                                       f32_4 %138 = OpLoad %137 
                                       f32_3 %139 = OpVectorShuffle %138 %138 2 2 2 
                                       f32_3 %140 = OpFMul %136 %139 
                                       f32_4 %141 = OpLoad %112 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFAdd %140 %142 
                                       f32_4 %144 = OpLoad %112 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 6 3 
                                                      OpStore %112 %145 
                              Uniform f32_4* %146 = OpAccessChain %28 %56 %91 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                              Uniform f32_4* %149 = OpAccessChain %28 %55 %55 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 3 3 3 
                                       f32_3 %152 = OpFMul %148 %151 
                                       f32_4 %153 = OpLoad %112 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpFAdd %152 %154 
                                       f32_4 %156 = OpLoad %112 
                                       f32_4 %157 = OpVectorShuffle %156 %155 4 5 6 3 
                                                      OpStore %112 %157 
                                       f32_4 %158 = OpLoad %112 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpLoad %106 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 0 0 
                                       f32_3 %162 = OpFMul %159 %161 
                                       f32_4 %163 = OpLoad %54 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                       f32_3 %165 = OpFAdd %162 %164 
                                       f32_4 %166 = OpLoad %54 
                                       f32_4 %167 = OpVectorShuffle %166 %165 4 5 6 3 
                                                      OpStore %54 %167 
                              Uniform f32_4* %168 = OpAccessChain %28 %55 %78 
                                       f32_4 %169 = OpLoad %168 
                                       f32_3 %170 = OpVectorShuffle %169 %169 1 1 1 
                              Uniform f32_4* %171 = OpAccessChain %28 %56 %56 
                                       f32_4 %172 = OpLoad %171 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                                       f32_3 %174 = OpFMul %170 %173 
                                       f32_4 %175 = OpLoad %112 
                                       f32_4 %176 = OpVectorShuffle %175 %174 4 5 6 3 
                                                      OpStore %112 %176 
                              Uniform f32_4* %177 = OpAccessChain %28 %56 %55 
                                       f32_4 %178 = OpLoad %177 
                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
                              Uniform f32_4* %180 = OpAccessChain %28 %55 %78 
                                       f32_4 %181 = OpLoad %180 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 0 0 
                                       f32_3 %183 = OpFMul %179 %182 
                                       f32_4 %184 = OpLoad %112 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                       f32_3 %186 = OpFAdd %183 %185 
                                       f32_4 %187 = OpLoad %112 
                                       f32_4 %188 = OpVectorShuffle %187 %186 4 5 6 3 
                                                      OpStore %112 %188 
                              Uniform f32_4* %189 = OpAccessChain %28 %56 %78 
                                       f32_4 %190 = OpLoad %189 
                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
                              Uniform f32_4* %192 = OpAccessChain %28 %55 %78 
                                       f32_4 %193 = OpLoad %192 
                                       f32_3 %194 = OpVectorShuffle %193 %193 2 2 2 
                                       f32_3 %195 = OpFMul %191 %194 
                                       f32_4 %196 = OpLoad %112 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
                                       f32_3 %198 = OpFAdd %195 %197 
                                       f32_4 %199 = OpLoad %112 
                                       f32_4 %200 = OpVectorShuffle %199 %198 4 5 6 3 
                                                      OpStore %112 %200 
                              Uniform f32_4* %201 = OpAccessChain %28 %56 %91 
                                       f32_4 %202 = OpLoad %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 0 1 2 
                              Uniform f32_4* %204 = OpAccessChain %28 %55 %78 
                                       f32_4 %205 = OpLoad %204 
                                       f32_3 %206 = OpVectorShuffle %205 %205 3 3 3 
                                       f32_3 %207 = OpFMul %203 %206 
                                       f32_4 %208 = OpLoad %112 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                                       f32_3 %210 = OpFAdd %207 %209 
                                       f32_4 %211 = OpLoad %112 
                                       f32_4 %212 = OpVectorShuffle %211 %210 4 5 6 3 
                                                      OpStore %112 %212 
                                       f32_4 %213 = OpLoad %112 
                                       f32_3 %214 = OpVectorShuffle %213 %213 0 1 2 
                                       f32_3 %215 = OpLoad %106 
                                       f32_3 %216 = OpVectorShuffle %215 %215 2 2 2 
                                       f32_3 %217 = OpFMul %214 %216 
                                       f32_4 %218 = OpLoad %54 
                                       f32_3 %219 = OpVectorShuffle %218 %218 0 1 2 
                                       f32_3 %220 = OpFAdd %217 %219 
                                       f32_4 %221 = OpLoad %54 
                                       f32_4 %222 = OpVectorShuffle %221 %220 4 5 6 3 
                                                      OpStore %54 %222 
                              Uniform f32_4* %223 = OpAccessChain %28 %55 %91 
                                       f32_4 %224 = OpLoad %223 
                                       f32_3 %225 = OpVectorShuffle %224 %224 1 1 1 
                              Uniform f32_4* %226 = OpAccessChain %28 %56 %56 
                                       f32_4 %227 = OpLoad %226 
                                       f32_3 %228 = OpVectorShuffle %227 %227 0 1 2 
                                       f32_3 %229 = OpFMul %225 %228 
                                       f32_4 %230 = OpLoad %112 
                                       f32_4 %231 = OpVectorShuffle %230 %229 4 5 6 3 
                                                      OpStore %112 %231 
                              Uniform f32_4* %232 = OpAccessChain %28 %56 %55 
                                       f32_4 %233 = OpLoad %232 
                                       f32_3 %234 = OpVectorShuffle %233 %233 0 1 2 
                              Uniform f32_4* %235 = OpAccessChain %28 %55 %91 
                                       f32_4 %236 = OpLoad %235 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 0 0 
                                       f32_3 %238 = OpFMul %234 %237 
                                       f32_4 %239 = OpLoad %112 
                                       f32_3 %240 = OpVectorShuffle %239 %239 0 1 2 
                                       f32_3 %241 = OpFAdd %238 %240 
                                       f32_4 %242 = OpLoad %112 
                                       f32_4 %243 = OpVectorShuffle %242 %241 4 5 6 3 
                                                      OpStore %112 %243 
                              Uniform f32_4* %244 = OpAccessChain %28 %56 %78 
                                       f32_4 %245 = OpLoad %244 
                                       f32_3 %246 = OpVectorShuffle %245 %245 0 1 2 
                              Uniform f32_4* %247 = OpAccessChain %28 %55 %91 
                                       f32_4 %248 = OpLoad %247 
                                       f32_3 %249 = OpVectorShuffle %248 %248 2 2 2 
                                       f32_3 %250 = OpFMul %246 %249 
                                       f32_4 %251 = OpLoad %112 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                                       f32_3 %253 = OpFAdd %250 %252 
                                       f32_4 %254 = OpLoad %112 
                                       f32_4 %255 = OpVectorShuffle %254 %253 4 5 6 3 
                                                      OpStore %112 %255 
                              Uniform f32_4* %256 = OpAccessChain %28 %56 %91 
                                       f32_4 %257 = OpLoad %256 
                                       f32_3 %258 = OpVectorShuffle %257 %257 0 1 2 
                              Uniform f32_4* %259 = OpAccessChain %28 %55 %91 
                                       f32_4 %260 = OpLoad %259 
                                       f32_3 %261 = OpVectorShuffle %260 %260 3 3 3 
                                       f32_3 %262 = OpFMul %258 %261 
                                       f32_4 %263 = OpLoad %112 
                                       f32_3 %264 = OpVectorShuffle %263 %263 0 1 2 
                                       f32_3 %265 = OpFAdd %262 %264 
                                       f32_4 %266 = OpLoad %112 
                                       f32_4 %267 = OpVectorShuffle %266 %265 4 5 6 3 
                                                      OpStore %112 %267 
                                       f32_4 %268 = OpLoad %54 
                                       f32_3 %269 = OpVectorShuffle %268 %268 0 1 2 
                                       f32_4 %270 = OpLoad %112 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 1 2 
                                       f32_3 %272 = OpFAdd %269 %271 
                                       f32_4 %273 = OpLoad %54 
                                       f32_4 %274 = OpVectorShuffle %273 %272 4 5 6 3 
                                                      OpStore %54 %274 
                                       f32_4 %275 = OpLoad %54 
                                       f32_3 %276 = OpVectorShuffle %275 %275 0 1 2 
                                       f32_4 %277 = OpLoad %54 
                                       f32_3 %278 = OpVectorShuffle %277 %277 0 1 2 
                                         f32 %279 = OpDot %276 %278 
                                Private f32* %282 = OpAccessChain %54 %280 
                                                      OpStore %282 %279 
                                Private f32* %283 = OpAccessChain %54 %280 
                                         f32 %284 = OpLoad %283 
                                         f32 %285 = OpExtInst %1 31 %284 
                                Private f32* %286 = OpAccessChain %54 %280 
                                                      OpStore %286 %285 
                                Private f32* %289 = OpAccessChain %54 %280 
                                         f32 %290 = OpLoad %289 
                                Uniform f32* %293 = OpAccessChain %28 %91 %291 
                                         f32 %294 = OpLoad %293 
                                         f32 %295 = OpFMul %290 %294 
                                Uniform f32* %297 = OpAccessChain %28 %91 %296 
                                         f32 %298 = OpLoad %297 
                                         f32 %299 = OpFAdd %295 %298 
                                                      OpStore vs_TEXCOORD2 %299 
                                         f32 %300 = OpLoad vs_TEXCOORD2 
                                         f32 %301 = OpExtInst %1 43 %300 %10 %11 
                                                      OpStore vs_TEXCOORD2 %301 
                                       f32_3 %302 = OpLoad %106 
                                       f32_4 %303 = OpVectorShuffle %302 %302 1 1 1 1 
                              Uniform f32_4* %304 = OpAccessChain %28 %55 %56 
                                       f32_4 %305 = OpLoad %304 
                                       f32_4 %306 = OpFMul %303 %305 
                                                      OpStore %54 %306 
                              Uniform f32_4* %307 = OpAccessChain %28 %55 %55 
                                       f32_4 %308 = OpLoad %307 
                                       f32_3 %309 = OpLoad %106 
                                       f32_4 %310 = OpVectorShuffle %309 %309 0 0 0 0 
                                       f32_4 %311 = OpFMul %308 %310 
                                       f32_4 %312 = OpLoad %54 
                                       f32_4 %313 = OpFAdd %311 %312 
                                                      OpStore %54 %313 
                              Uniform f32_4* %314 = OpAccessChain %28 %55 %78 
                                       f32_4 %315 = OpLoad %314 
                                       f32_3 %316 = OpLoad %106 
                                       f32_4 %317 = OpVectorShuffle %316 %316 2 2 2 2 
                                       f32_4 %318 = OpFMul %315 %317 
                                       f32_4 %319 = OpLoad %54 
                                       f32_4 %320 = OpFAdd %318 %319 
                                                      OpStore %54 %320 
                                       f32_4 %321 = OpLoad %54 
                              Uniform f32_4* %322 = OpAccessChain %28 %55 %91 
                                       f32_4 %323 = OpLoad %322 
                                       f32_4 %324 = OpFAdd %321 %323 
                                                      OpStore %54 %324 
                                       f32_4 %325 = OpLoad %54 
                                       f32_4 %326 = OpVectorShuffle %325 %325 1 1 1 1 
                              Uniform f32_4* %327 = OpAccessChain %28 %78 %56 
                                       f32_4 %328 = OpLoad %327 
                                       f32_4 %329 = OpFMul %326 %328 
                                                      OpStore %112 %329 
                              Uniform f32_4* %330 = OpAccessChain %28 %78 %55 
                                       f32_4 %331 = OpLoad %330 
                                       f32_4 %332 = OpLoad %54 
                                       f32_4 %333 = OpVectorShuffle %332 %332 0 0 0 0 
                                       f32_4 %334 = OpFMul %331 %333 
                                       f32_4 %335 = OpLoad %112 
                                       f32_4 %336 = OpFAdd %334 %335 
                                                      OpStore %112 %336 
                              Uniform f32_4* %337 = OpAccessChain %28 %78 %78 
                                       f32_4 %338 = OpLoad %337 
                                       f32_4 %339 = OpLoad %54 
                                       f32_4 %340 = OpVectorShuffle %339 %339 2 2 2 2 
                                       f32_4 %341 = OpFMul %338 %340 
                                       f32_4 %342 = OpLoad %112 
                                       f32_4 %343 = OpFAdd %341 %342 
                                                      OpStore %112 %343 
                              Uniform f32_4* %349 = OpAccessChain %28 %78 %91 
                                       f32_4 %350 = OpLoad %349 
                                       f32_4 %351 = OpLoad %54 
                                       f32_4 %352 = OpVectorShuffle %351 %351 3 3 3 3 
                                       f32_4 %353 = OpFMul %350 %352 
                                       f32_4 %354 = OpLoad %112 
                                       f32_4 %355 = OpFAdd %353 %354 
                               Output f32_4* %356 = OpAccessChain %348 %55 
                                                      OpStore %356 %355 
                                 Output f32* %357 = OpAccessChain %348 %55 %344 
                                         f32 %358 = OpLoad %357 
                                         f32 %359 = OpFNegate %358 
                                 Output f32* %360 = OpAccessChain %348 %55 %344 
                                                      OpStore %360 %359 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 81
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %44 %62 %64 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpMemberDecorate %28 0 Offset 28 
                                             OpMemberDecorate %28 1 Offset 28 
                                             OpDecorate %28 Block 
                                             OpDecorate %30 DescriptorSet 30 
                                             OpDecorate %30 Binding 30 
                                             OpDecorate %39 DescriptorSet 39 
                                             OpDecorate %39 Binding 39 
                                             OpDecorate %41 DescriptorSet 41 
                                             OpDecorate %41 Binding 41 
                                             OpDecorate vs_TEXCOORD1 Location 44 
                                             OpDecorate %62 Location 62 
                                             OpDecorate vs_TEXCOORD2 Location 64 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                                     %28 = OpTypeStruct %24 %24 
                                     %29 = OpTypePointer Uniform %28 
     Uniform struct {f32_4; f32_4;}* %30 = OpVariable Uniform 
                                     %31 = OpTypeInt 32 1 
                                 i32 %32 = OpConstant 1 
                                     %33 = OpTypePointer Uniform %24 
                      Private f32_3* %38 = OpVariable Private 
UniformConstant read_only Texture2D* %39 = OpVariable UniformConstant 
            UniformConstant sampler* %41 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                 f32 %52 = OpConstant 3.674022E-40 
                               f32_3 %53 = OpConstantComposite %52 %52 %52 
                                 i32 %55 = OpConstant 0 
                                     %61 = OpTypePointer Output %24 
                       Output f32_4* %62 = OpVariable Output 
                                     %63 = OpTypePointer Input %6 
                 Input f32* vs_TEXCOORD2 = OpVariable Input 
                                 f32 %75 = OpConstant 3.674022E-40 
                                     %76 = OpTypeInt 32 0 
                                 u32 %77 = OpConstant 3 
                                     %78 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %27 = OpLoad %9 
                      Uniform f32_4* %34 = OpAccessChain %30 %32 
                               f32_4 %35 = OpLoad %34 
                               f32_3 %36 = OpVectorShuffle %35 %35 0 1 2 
                               f32_3 %37 = OpFMul %27 %36 
                                             OpStore %9 %37 
                 read_only Texture2D %40 = OpLoad %39 
                             sampler %42 = OpLoad %41 
          read_only Texture2DSampled %43 = OpSampledImage %40 %42 
                               f32_2 %45 = OpLoad vs_TEXCOORD1 
                               f32_4 %46 = OpImageSampleImplicitLod %43 %45 
                               f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                             OpStore %38 %47 
                               f32_3 %48 = OpLoad %9 
                               f32_3 %49 = OpLoad %38 
                               f32_3 %50 = OpFMul %48 %49 
                                             OpStore %9 %50 
                               f32_3 %51 = OpLoad %9 
                               f32_3 %54 = OpFMul %51 %53 
                      Uniform f32_4* %56 = OpAccessChain %30 %55 
                               f32_4 %57 = OpLoad %56 
                               f32_3 %58 = OpVectorShuffle %57 %57 0 1 2 
                               f32_3 %59 = OpFNegate %58 
                               f32_3 %60 = OpFAdd %54 %59 
                                             OpStore %9 %60 
                                 f32 %65 = OpLoad vs_TEXCOORD2 
                               f32_3 %66 = OpCompositeConstruct %65 %65 %65 
                               f32_3 %67 = OpLoad %9 
                               f32_3 %68 = OpFMul %66 %67 
                      Uniform f32_4* %69 = OpAccessChain %30 %55 
                               f32_4 %70 = OpLoad %69 
                               f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                               f32_3 %72 = OpFAdd %68 %71 
                               f32_4 %73 = OpLoad %62 
                               f32_4 %74 = OpVectorShuffle %73 %72 4 5 6 3 
                                             OpStore %62 %74 
                         Output f32* %79 = OpAccessChain %62 %77 
                                             OpStore %79 %75 
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
 Pass {
  LOD 100
  Tags { "LIGHTMODE" = "VertexLMRGBM" "RenderType" = "Opaque" }
  Fog {
   Mode Off
  }
  GpuProgramID 262140
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
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_Lightmap_ST;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_TEXCOORD1;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = vec4(0.0, 0.0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_Lightmap_ST.xy + unity_Lightmap_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _Color;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D unity_Lightmap;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = texture(unity_Lightmap, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat0.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat0.xyz;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(4.0, 4.0, 4.0);
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
; Bound: 131
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %9 %15 %18 %39 %51 %52 %66 %116 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %9 Location 9 
                                                      OpDecorate vs_TEXCOORD0 Location 15 
                                                      OpDecorate %18 Location 18 
                                                      OpDecorate %23 ArrayStride 23 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpMemberDecorate %25 0 Offset 25 
                                                      OpMemberDecorate %25 1 Offset 25 
                                                      OpMemberDecorate %25 2 Offset 25 
                                                      OpMemberDecorate %25 3 Offset 25 
                                                      OpMemberDecorate %25 4 Offset 25 
                                                      OpDecorate %25 Block 
                                                      OpDecorate %27 DescriptorSet 27 
                                                      OpDecorate %27 Binding 27 
                                                      OpDecorate vs_TEXCOORD1 Location 39 
                                                      OpDecorate vs_TEXCOORD2 Location 51 
                                                      OpDecorate %52 Location 52 
                                                      OpDecorate %66 Location 66 
                                                      OpMemberDecorate %114 0 BuiltIn 114 
                                                      OpMemberDecorate %114 1 BuiltIn 114 
                                                      OpMemberDecorate %114 2 BuiltIn 114 
                                                      OpDecorate %114 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Output %7 
                                 Output f32_4* %9 = OpVariable Output 
                                          f32 %10 = OpConstant 3.674022E-40 
                                          f32 %11 = OpConstant 3.674022E-40 
                                        f32_4 %12 = OpConstantComposite %10 %10 %10 %11 
                                              %13 = OpTypeVector %6 2 
                                              %14 = OpTypePointer Output %13 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %16 = OpTypeVector %6 3 
                                              %17 = OpTypePointer Input %16 
                                 Input f32_3* %18 = OpVariable Input 
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 4 
                                              %23 = OpTypeArray %7 %22 
                                              %24 = OpTypeArray %7 %22 
                                              %25 = OpTypeStruct %23 %24 %7 %7 %7 
                                              %26 = OpTypePointer Uniform %25 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4;}* %27 = OpVariable Uniform 
                                              %28 = OpTypeInt 32 1 
                                          i32 %29 = OpConstant 2 
                                              %30 = OpTypePointer Uniform %7 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                          i32 %42 = OpConstant 3 
                       Output f32_2* vs_TEXCOORD2 = OpVariable Output 
                                 Input f32_3* %52 = OpVariable Input 
                                          i32 %55 = OpConstant 4 
                                              %64 = OpTypePointer Private %7 
                               Private f32_4* %65 = OpVariable Private 
                                 Input f32_3* %66 = OpVariable Input 
                                          i32 %69 = OpConstant 0 
                                          i32 %70 = OpConstant 1 
                               Private f32_4* %92 = OpVariable Private 
                                         u32 %112 = OpConstant 1 
                                             %113 = OpTypeArray %6 %112 
                                             %114 = OpTypeStruct %7 %6 %113 
                                             %115 = OpTypePointer Output %114 
        Output struct {f32_4; f32; f32[1];}* %116 = OpVariable Output 
                                             %125 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                                      OpStore %9 %12 
                                        f32_3 %19 = OpLoad %18 
                                        f32_2 %20 = OpVectorShuffle %19 %19 0 1 
                               Uniform f32_4* %31 = OpAccessChain %27 %29 
                                        f32_4 %32 = OpLoad %31 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                        f32_2 %34 = OpFMul %20 %33 
                               Uniform f32_4* %35 = OpAccessChain %27 %29 
                                        f32_4 %36 = OpLoad %35 
                                        f32_2 %37 = OpVectorShuffle %36 %36 2 3 
                                        f32_2 %38 = OpFAdd %34 %37 
                                                      OpStore vs_TEXCOORD0 %38 
                                        f32_3 %40 = OpLoad %18 
                                        f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                               Uniform f32_4* %43 = OpAccessChain %27 %42 
                                        f32_4 %44 = OpLoad %43 
                                        f32_2 %45 = OpVectorShuffle %44 %44 0 1 
                                        f32_2 %46 = OpFMul %41 %45 
                               Uniform f32_4* %47 = OpAccessChain %27 %42 
                                        f32_4 %48 = OpLoad %47 
                                        f32_2 %49 = OpVectorShuffle %48 %48 2 3 
                                        f32_2 %50 = OpFAdd %46 %49 
                                                      OpStore vs_TEXCOORD1 %50 
                                        f32_3 %53 = OpLoad %52 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
                               Uniform f32_4* %56 = OpAccessChain %27 %55 
                                        f32_4 %57 = OpLoad %56 
                                        f32_2 %58 = OpVectorShuffle %57 %57 0 1 
                                        f32_2 %59 = OpFMul %54 %58 
                               Uniform f32_4* %60 = OpAccessChain %27 %55 
                                        f32_4 %61 = OpLoad %60 
                                        f32_2 %62 = OpVectorShuffle %61 %61 2 3 
                                        f32_2 %63 = OpFAdd %59 %62 
                                                      OpStore vs_TEXCOORD2 %63 
                                        f32_3 %67 = OpLoad %66 
                                        f32_4 %68 = OpVectorShuffle %67 %67 1 1 1 1 
                               Uniform f32_4* %71 = OpAccessChain %27 %69 %70 
                                        f32_4 %72 = OpLoad %71 
                                        f32_4 %73 = OpFMul %68 %72 
                                                      OpStore %65 %73 
                               Uniform f32_4* %74 = OpAccessChain %27 %69 %69 
                                        f32_4 %75 = OpLoad %74 
                                        f32_3 %76 = OpLoad %66 
                                        f32_4 %77 = OpVectorShuffle %76 %76 0 0 0 0 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %65 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %65 %80 
                               Uniform f32_4* %81 = OpAccessChain %27 %69 %29 
                                        f32_4 %82 = OpLoad %81 
                                        f32_3 %83 = OpLoad %66 
                                        f32_4 %84 = OpVectorShuffle %83 %83 2 2 2 2 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %65 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %65 %87 
                                        f32_4 %88 = OpLoad %65 
                               Uniform f32_4* %89 = OpAccessChain %27 %69 %42 
                                        f32_4 %90 = OpLoad %89 
                                        f32_4 %91 = OpFAdd %88 %90 
                                                      OpStore %65 %91 
                                        f32_4 %93 = OpLoad %65 
                                        f32_4 %94 = OpVectorShuffle %93 %93 1 1 1 1 
                               Uniform f32_4* %95 = OpAccessChain %27 %70 %70 
                                        f32_4 %96 = OpLoad %95 
                                        f32_4 %97 = OpFMul %94 %96 
                                                      OpStore %92 %97 
                               Uniform f32_4* %98 = OpAccessChain %27 %70 %69 
                                        f32_4 %99 = OpLoad %98 
                                       f32_4 %100 = OpLoad %65 
                                       f32_4 %101 = OpVectorShuffle %100 %100 0 0 0 0 
                                       f32_4 %102 = OpFMul %99 %101 
                                       f32_4 %103 = OpLoad %92 
                                       f32_4 %104 = OpFAdd %102 %103 
                                                      OpStore %92 %104 
                              Uniform f32_4* %105 = OpAccessChain %27 %70 %29 
                                       f32_4 %106 = OpLoad %105 
                                       f32_4 %107 = OpLoad %65 
                                       f32_4 %108 = OpVectorShuffle %107 %107 2 2 2 2 
                                       f32_4 %109 = OpFMul %106 %108 
                                       f32_4 %110 = OpLoad %92 
                                       f32_4 %111 = OpFAdd %109 %110 
                                                      OpStore %92 %111 
                              Uniform f32_4* %117 = OpAccessChain %27 %70 %42 
                                       f32_4 %118 = OpLoad %117 
                                       f32_4 %119 = OpLoad %65 
                                       f32_4 %120 = OpVectorShuffle %119 %119 3 3 3 3 
                                       f32_4 %121 = OpFMul %118 %120 
                                       f32_4 %122 = OpLoad %92 
                                       f32_4 %123 = OpFAdd %121 %122 
                               Output f32_4* %124 = OpAccessChain %116 %69 
                                                      OpStore %124 %123 
                                 Output f32* %126 = OpAccessChain %116 %69 %112 
                                         f32 %127 = OpLoad %126 
                                         f32 %128 = OpFNegate %127 
                                 Output f32* %129 = OpAccessChain %116 %69 %112 
                                                      OpStore %129 %128 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 86
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %61 %72 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpMemberDecorate %35 0 Offset 35 
                                             OpDecorate %35 Block 
                                             OpDecorate %37 DescriptorSet 37 
                                             OpDecorate %37 Binding 37 
                                             OpDecorate %56 DescriptorSet 56 
                                             OpDecorate %56 Binding 56 
                                             OpDecorate %58 DescriptorSet 58 
                                             OpDecorate %58 Binding 58 
                                             OpDecorate vs_TEXCOORD2 Location 61 
                                             OpDecorate %72 Location 72 
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
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %25 = OpTypeVector %6 3 
                                     %35 = OpTypeStruct %7 
                                     %36 = OpTypePointer Uniform %35 
            Uniform struct {f32_4;}* %37 = OpVariable Uniform 
                                     %38 = OpTypeInt 32 1 
                                 i32 %39 = OpConstant 0 
                                     %40 = OpTypePointer Uniform %7 
                                     %54 = OpTypePointer Private %25 
                      Private f32_3* %55 = OpVariable Private 
UniformConstant read_only Texture2D* %56 = OpVariable UniformConstant 
            UniformConstant sampler* %58 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD2 = OpVariable Input 
                                     %71 = OpTypePointer Output %7 
                       Output f32_4* %72 = OpVariable Output 
                                 f32 %75 = OpConstant 3.674022E-40 
                               f32_3 %76 = OpConstantComposite %75 %75 %75 
                                 f32 %80 = OpConstant 3.674022E-40 
                                     %81 = OpTypeInt 32 0 
                                 u32 %82 = OpConstant 3 
                                     %83 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                               f32_3 %27 = OpVectorShuffle %26 %26 3 3 3 
                               f32_4 %28 = OpLoad %9 
                               f32_3 %29 = OpVectorShuffle %28 %28 0 1 2 
                               f32_3 %30 = OpFMul %27 %29 
                               f32_4 %31 = OpLoad %9 
                               f32_4 %32 = OpVectorShuffle %31 %30 4 5 6 3 
                                             OpStore %9 %32 
                               f32_4 %33 = OpLoad %9 
                               f32_3 %34 = OpVectorShuffle %33 %33 0 1 2 
                      Uniform f32_4* %41 = OpAccessChain %37 %39 
                               f32_4 %42 = OpLoad %41 
                               f32_3 %43 = OpVectorShuffle %42 %42 0 1 2 
                               f32_3 %44 = OpFMul %34 %43 
                               f32_4 %45 = OpLoad %9 
                               f32_4 %46 = OpVectorShuffle %45 %44 4 5 6 3 
                                             OpStore %9 %46 
                               f32_4 %47 = OpLoad %9 
                               f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                               f32_4 %49 = OpLoad %9 
                               f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                               f32_3 %51 = OpFAdd %48 %50 
                               f32_4 %52 = OpLoad %9 
                               f32_4 %53 = OpVectorShuffle %52 %51 4 5 6 3 
                                             OpStore %9 %53 
                 read_only Texture2D %57 = OpLoad %56 
                             sampler %59 = OpLoad %58 
          read_only Texture2DSampled %60 = OpSampledImage %57 %59 
                               f32_2 %62 = OpLoad vs_TEXCOORD2 
                               f32_4 %63 = OpImageSampleImplicitLod %60 %62 
                               f32_3 %64 = OpVectorShuffle %63 %63 0 1 2 
                                             OpStore %55 %64 
                               f32_4 %65 = OpLoad %9 
                               f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                               f32_3 %67 = OpLoad %55 
                               f32_3 %68 = OpFMul %66 %67 
                               f32_4 %69 = OpLoad %9 
                               f32_4 %70 = OpVectorShuffle %69 %68 4 5 6 3 
                                             OpStore %9 %70 
                               f32_4 %73 = OpLoad %9 
                               f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                               f32_3 %77 = OpFMul %74 %76 
                               f32_4 %78 = OpLoad %72 
                               f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
                                             OpStore %72 %79 
                         Output f32* %84 = OpAccessChain %72 %82 
                                             OpStore %84 %80 
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_Lightmap_ST;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_TEXCOORD1;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out float vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = vec4(0.0, 0.0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_Lightmap_ST.xy + unity_Lightmap_ST.zw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    vs_TEXCOORD3 = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD3 = clamp(vs_TEXCOORD3, 0.0, 1.0);
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 unity_FogColor;
uniform 	vec4 _Color;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D unity_Lightmap;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD2;
in  float vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = texture(unity_Lightmap, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat0.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat0.xyz;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(4.0, 4.0, 4.0) + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD3) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 374
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %9 %15 %18 %40 %105 %287 %301 %302 %360 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %9 Location 9 
                                                      OpDecorate vs_TEXCOORD0 Location 15 
                                                      OpDecorate %18 Location 18 
                                                      OpDecorate %23 ArrayStride 23 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpDecorate %25 ArrayStride 25 
                                                      OpMemberDecorate %26 0 Offset 26 
                                                      OpMemberDecorate %26 1 Offset 26 
                                                      OpMemberDecorate %26 2 Offset 26 
                                                      OpMemberDecorate %26 3 Offset 26 
                                                      OpMemberDecorate %26 4 Offset 26 
                                                      OpMemberDecorate %26 5 Offset 26 
                                                      OpMemberDecorate %26 6 Offset 26 
                                                      OpDecorate %26 Block 
                                                      OpDecorate %28 DescriptorSet 28 
                                                      OpDecorate %28 Binding 28 
                                                      OpDecorate vs_TEXCOORD1 Location 40 
                                                      OpDecorate %105 Location 105 
                                                      OpDecorate vs_TEXCOORD3 Location 287 
                                                      OpDecorate vs_TEXCOORD2 Location 301 
                                                      OpDecorate %302 Location 302 
                                                      OpMemberDecorate %358 0 BuiltIn 358 
                                                      OpMemberDecorate %358 1 BuiltIn 358 
                                                      OpMemberDecorate %358 2 BuiltIn 358 
                                                      OpDecorate %358 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Output %7 
                                 Output f32_4* %9 = OpVariable Output 
                                          f32 %10 = OpConstant 3.674022E-40 
                                          f32 %11 = OpConstant 3.674022E-40 
                                        f32_4 %12 = OpConstantComposite %10 %10 %10 %11 
                                              %13 = OpTypeVector %6 2 
                                              %14 = OpTypePointer Output %13 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %16 = OpTypeVector %6 3 
                                              %17 = OpTypePointer Input %16 
                                 Input f32_3* %18 = OpVariable Input 
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 4 
                                              %23 = OpTypeArray %7 %22 
                                              %24 = OpTypeArray %7 %22 
                                              %25 = OpTypeArray %7 %22 
                                              %26 = OpTypeStruct %23 %24 %25 %7 %7 %7 %7 
                                              %27 = OpTypePointer Uniform %26 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4;}* %28 = OpVariable Uniform 
                                              %29 = OpTypeInt 32 1 
                                          i32 %30 = OpConstant 4 
                                              %31 = OpTypePointer Uniform %7 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                          i32 %43 = OpConstant 5 
                                              %52 = OpTypePointer Private %7 
                               Private f32_4* %53 = OpVariable Private 
                                          i32 %54 = OpConstant 0 
                                          i32 %55 = OpConstant 1 
                                          i32 %77 = OpConstant 2 
                                          i32 %90 = OpConstant 3 
                                Input f32_3* %105 = OpVariable Input 
                              Private f32_4* %111 = OpVariable Private 
                                         u32 %279 = OpConstant 0 
                                             %280 = OpTypePointer Private %6 
                                             %286 = OpTypePointer Output %6 
                         Output f32* vs_TEXCOORD3 = OpVariable Output 
                                         u32 %290 = OpConstant 2 
                                             %291 = OpTypePointer Uniform %6 
                                         u32 %295 = OpConstant 3 
                       Output f32_2* vs_TEXCOORD2 = OpVariable Output 
                                Input f32_3* %302 = OpVariable Input 
                                         i32 %305 = OpConstant 6 
                                         u32 %356 = OpConstant 1 
                                             %357 = OpTypeArray %6 %356 
                                             %358 = OpTypeStruct %7 %6 %357 
                                             %359 = OpTypePointer Output %358 
        Output struct {f32_4; f32; f32[1];}* %360 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                                      OpStore %9 %12 
                                        f32_3 %19 = OpLoad %18 
                                        f32_2 %20 = OpVectorShuffle %19 %19 0 1 
                               Uniform f32_4* %32 = OpAccessChain %28 %30 
                                        f32_4 %33 = OpLoad %32 
                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                        f32_2 %35 = OpFMul %20 %34 
                               Uniform f32_4* %36 = OpAccessChain %28 %30 
                                        f32_4 %37 = OpLoad %36 
                                        f32_2 %38 = OpVectorShuffle %37 %37 2 3 
                                        f32_2 %39 = OpFAdd %35 %38 
                                                      OpStore vs_TEXCOORD0 %39 
                                        f32_3 %41 = OpLoad %18 
                                        f32_2 %42 = OpVectorShuffle %41 %41 0 1 
                               Uniform f32_4* %44 = OpAccessChain %28 %43 
                                        f32_4 %45 = OpLoad %44 
                                        f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                                        f32_2 %47 = OpFMul %42 %46 
                               Uniform f32_4* %48 = OpAccessChain %28 %43 
                                        f32_4 %49 = OpLoad %48 
                                        f32_2 %50 = OpVectorShuffle %49 %49 2 3 
                                        f32_2 %51 = OpFAdd %47 %50 
                                                      OpStore vs_TEXCOORD1 %51 
                               Uniform f32_4* %56 = OpAccessChain %28 %54 %55 
                                        f32_4 %57 = OpLoad %56 
                                        f32_3 %58 = OpVectorShuffle %57 %57 1 1 1 
                               Uniform f32_4* %59 = OpAccessChain %28 %55 %55 
                                        f32_4 %60 = OpLoad %59 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_3 %62 = OpFMul %58 %61 
                                        f32_4 %63 = OpLoad %53 
                                        f32_4 %64 = OpVectorShuffle %63 %62 4 5 6 3 
                                                      OpStore %53 %64 
                               Uniform f32_4* %65 = OpAccessChain %28 %55 %54 
                                        f32_4 %66 = OpLoad %65 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                               Uniform f32_4* %68 = OpAccessChain %28 %54 %55 
                                        f32_4 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 0 0 
                                        f32_3 %71 = OpFMul %67 %70 
                                        f32_4 %72 = OpLoad %53 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                        f32_3 %74 = OpFAdd %71 %73 
                                        f32_4 %75 = OpLoad %53 
                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                                      OpStore %53 %76 
                               Uniform f32_4* %78 = OpAccessChain %28 %55 %77 
                                        f32_4 %79 = OpLoad %78 
                                        f32_3 %80 = OpVectorShuffle %79 %79 0 1 2 
                               Uniform f32_4* %81 = OpAccessChain %28 %54 %55 
                                        f32_4 %82 = OpLoad %81 
                                        f32_3 %83 = OpVectorShuffle %82 %82 2 2 2 
                                        f32_3 %84 = OpFMul %80 %83 
                                        f32_4 %85 = OpLoad %53 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFAdd %84 %86 
                                        f32_4 %88 = OpLoad %53 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %53 %89 
                               Uniform f32_4* %91 = OpAccessChain %28 %55 %90 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                               Uniform f32_4* %94 = OpAccessChain %28 %54 %55 
                                        f32_4 %95 = OpLoad %94 
                                        f32_3 %96 = OpVectorShuffle %95 %95 3 3 3 
                                        f32_3 %97 = OpFMul %93 %96 
                                        f32_4 %98 = OpLoad %53 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                                       f32_3 %100 = OpFAdd %97 %99 
                                       f32_4 %101 = OpLoad %53 
                                       f32_4 %102 = OpVectorShuffle %101 %100 4 5 6 3 
                                                      OpStore %53 %102 
                                       f32_4 %103 = OpLoad %53 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_3 %106 = OpLoad %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 1 1 1 
                                       f32_3 %108 = OpFMul %104 %107 
                                       f32_4 %109 = OpLoad %53 
                                       f32_4 %110 = OpVectorShuffle %109 %108 4 5 6 3 
                                                      OpStore %53 %110 
                              Uniform f32_4* %112 = OpAccessChain %28 %54 %54 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 1 1 1 
                              Uniform f32_4* %115 = OpAccessChain %28 %55 %55 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFMul %114 %117 
                                       f32_4 %119 = OpLoad %111 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %111 %120 
                              Uniform f32_4* %121 = OpAccessChain %28 %55 %54 
                                       f32_4 %122 = OpLoad %121 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                              Uniform f32_4* %124 = OpAccessChain %28 %54 %54 
                                       f32_4 %125 = OpLoad %124 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 0 0 
                                       f32_3 %127 = OpFMul %123 %126 
                                       f32_4 %128 = OpLoad %111 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                       f32_3 %130 = OpFAdd %127 %129 
                                       f32_4 %131 = OpLoad %111 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 6 3 
                                                      OpStore %111 %132 
                              Uniform f32_4* %133 = OpAccessChain %28 %55 %77 
                                       f32_4 %134 = OpLoad %133 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                              Uniform f32_4* %136 = OpAccessChain %28 %54 %54 
                                       f32_4 %137 = OpLoad %136 
                                       f32_3 %138 = OpVectorShuffle %137 %137 2 2 2 
                                       f32_3 %139 = OpFMul %135 %138 
                                       f32_4 %140 = OpLoad %111 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                                       f32_3 %142 = OpFAdd %139 %141 
                                       f32_4 %143 = OpLoad %111 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 6 3 
                                                      OpStore %111 %144 
                              Uniform f32_4* %145 = OpAccessChain %28 %55 %90 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                              Uniform f32_4* %148 = OpAccessChain %28 %54 %54 
                                       f32_4 %149 = OpLoad %148 
                                       f32_3 %150 = OpVectorShuffle %149 %149 3 3 3 
                                       f32_3 %151 = OpFMul %147 %150 
                                       f32_4 %152 = OpLoad %111 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                       f32_3 %154 = OpFAdd %151 %153 
                                       f32_4 %155 = OpLoad %111 
                                       f32_4 %156 = OpVectorShuffle %155 %154 4 5 6 3 
                                                      OpStore %111 %156 
                                       f32_4 %157 = OpLoad %111 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                       f32_3 %159 = OpLoad %105 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 0 0 
                                       f32_3 %161 = OpFMul %158 %160 
                                       f32_4 %162 = OpLoad %53 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                       f32_3 %164 = OpFAdd %161 %163 
                                       f32_4 %165 = OpLoad %53 
                                       f32_4 %166 = OpVectorShuffle %165 %164 4 5 6 3 
                                                      OpStore %53 %166 
                              Uniform f32_4* %167 = OpAccessChain %28 %54 %77 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 1 1 1 
                              Uniform f32_4* %170 = OpAccessChain %28 %55 %55 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                       f32_3 %173 = OpFMul %169 %172 
                                       f32_4 %174 = OpLoad %111 
                                       f32_4 %175 = OpVectorShuffle %174 %173 4 5 6 3 
                                                      OpStore %111 %175 
                              Uniform f32_4* %176 = OpAccessChain %28 %55 %54 
                                       f32_4 %177 = OpLoad %176 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                              Uniform f32_4* %179 = OpAccessChain %28 %54 %77 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 0 0 
                                       f32_3 %182 = OpFMul %178 %181 
                                       f32_4 %183 = OpLoad %111 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                                       f32_3 %185 = OpFAdd %182 %184 
                                       f32_4 %186 = OpLoad %111 
                                       f32_4 %187 = OpVectorShuffle %186 %185 4 5 6 3 
                                                      OpStore %111 %187 
                              Uniform f32_4* %188 = OpAccessChain %28 %55 %77 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                              Uniform f32_4* %191 = OpAccessChain %28 %54 %77 
                                       f32_4 %192 = OpLoad %191 
                                       f32_3 %193 = OpVectorShuffle %192 %192 2 2 2 
                                       f32_3 %194 = OpFMul %190 %193 
                                       f32_4 %195 = OpLoad %111 
                                       f32_3 %196 = OpVectorShuffle %195 %195 0 1 2 
                                       f32_3 %197 = OpFAdd %194 %196 
                                       f32_4 %198 = OpLoad %111 
                                       f32_4 %199 = OpVectorShuffle %198 %197 4 5 6 3 
                                                      OpStore %111 %199 
                              Uniform f32_4* %200 = OpAccessChain %28 %55 %90 
                                       f32_4 %201 = OpLoad %200 
                                       f32_3 %202 = OpVectorShuffle %201 %201 0 1 2 
                              Uniform f32_4* %203 = OpAccessChain %28 %54 %77 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 3 3 3 
                                       f32_3 %206 = OpFMul %202 %205 
                                       f32_4 %207 = OpLoad %111 
                                       f32_3 %208 = OpVectorShuffle %207 %207 0 1 2 
                                       f32_3 %209 = OpFAdd %206 %208 
                                       f32_4 %210 = OpLoad %111 
                                       f32_4 %211 = OpVectorShuffle %210 %209 4 5 6 3 
                                                      OpStore %111 %211 
                                       f32_4 %212 = OpLoad %111 
                                       f32_3 %213 = OpVectorShuffle %212 %212 0 1 2 
                                       f32_3 %214 = OpLoad %105 
                                       f32_3 %215 = OpVectorShuffle %214 %214 2 2 2 
                                       f32_3 %216 = OpFMul %213 %215 
                                       f32_4 %217 = OpLoad %53 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                                       f32_3 %219 = OpFAdd %216 %218 
                                       f32_4 %220 = OpLoad %53 
                                       f32_4 %221 = OpVectorShuffle %220 %219 4 5 6 3 
                                                      OpStore %53 %221 
                              Uniform f32_4* %222 = OpAccessChain %28 %54 %90 
                                       f32_4 %223 = OpLoad %222 
                                       f32_3 %224 = OpVectorShuffle %223 %223 1 1 1 
                              Uniform f32_4* %225 = OpAccessChain %28 %55 %55 
                                       f32_4 %226 = OpLoad %225 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
                                       f32_3 %228 = OpFMul %224 %227 
                                       f32_4 %229 = OpLoad %111 
                                       f32_4 %230 = OpVectorShuffle %229 %228 4 5 6 3 
                                                      OpStore %111 %230 
                              Uniform f32_4* %231 = OpAccessChain %28 %55 %54 
                                       f32_4 %232 = OpLoad %231 
                                       f32_3 %233 = OpVectorShuffle %232 %232 0 1 2 
                              Uniform f32_4* %234 = OpAccessChain %28 %54 %90 
                                       f32_4 %235 = OpLoad %234 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 0 0 
                                       f32_3 %237 = OpFMul %233 %236 
                                       f32_4 %238 = OpLoad %111 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                       f32_3 %240 = OpFAdd %237 %239 
                                       f32_4 %241 = OpLoad %111 
                                       f32_4 %242 = OpVectorShuffle %241 %240 4 5 6 3 
                                                      OpStore %111 %242 
                              Uniform f32_4* %243 = OpAccessChain %28 %55 %77 
                                       f32_4 %244 = OpLoad %243 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 1 2 
                              Uniform f32_4* %246 = OpAccessChain %28 %54 %90 
                                       f32_4 %247 = OpLoad %246 
                                       f32_3 %248 = OpVectorShuffle %247 %247 2 2 2 
                                       f32_3 %249 = OpFMul %245 %248 
                                       f32_4 %250 = OpLoad %111 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                                       f32_3 %252 = OpFAdd %249 %251 
                                       f32_4 %253 = OpLoad %111 
                                       f32_4 %254 = OpVectorShuffle %253 %252 4 5 6 3 
                                                      OpStore %111 %254 
                              Uniform f32_4* %255 = OpAccessChain %28 %55 %90 
                                       f32_4 %256 = OpLoad %255 
                                       f32_3 %257 = OpVectorShuffle %256 %256 0 1 2 
                              Uniform f32_4* %258 = OpAccessChain %28 %54 %90 
                                       f32_4 %259 = OpLoad %258 
                                       f32_3 %260 = OpVectorShuffle %259 %259 3 3 3 
                                       f32_3 %261 = OpFMul %257 %260 
                                       f32_4 %262 = OpLoad %111 
                                       f32_3 %263 = OpVectorShuffle %262 %262 0 1 2 
                                       f32_3 %264 = OpFAdd %261 %263 
                                       f32_4 %265 = OpLoad %111 
                                       f32_4 %266 = OpVectorShuffle %265 %264 4 5 6 3 
                                                      OpStore %111 %266 
                                       f32_4 %267 = OpLoad %53 
                                       f32_3 %268 = OpVectorShuffle %267 %267 0 1 2 
                                       f32_4 %269 = OpLoad %111 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                                       f32_3 %271 = OpFAdd %268 %270 
                                       f32_4 %272 = OpLoad %53 
                                       f32_4 %273 = OpVectorShuffle %272 %271 4 5 6 3 
                                                      OpStore %53 %273 
                                       f32_4 %274 = OpLoad %53 
                                       f32_3 %275 = OpVectorShuffle %274 %274 0 1 2 
                                       f32_4 %276 = OpLoad %53 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
                                         f32 %278 = OpDot %275 %277 
                                Private f32* %281 = OpAccessChain %53 %279 
                                                      OpStore %281 %278 
                                Private f32* %282 = OpAccessChain %53 %279 
                                         f32 %283 = OpLoad %282 
                                         f32 %284 = OpExtInst %1 31 %283 
                                Private f32* %285 = OpAccessChain %53 %279 
                                                      OpStore %285 %284 
                                Private f32* %288 = OpAccessChain %53 %279 
                                         f32 %289 = OpLoad %288 
                                Uniform f32* %292 = OpAccessChain %28 %90 %290 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpFMul %289 %293 
                                Uniform f32* %296 = OpAccessChain %28 %90 %295 
                                         f32 %297 = OpLoad %296 
                                         f32 %298 = OpFAdd %294 %297 
                                                      OpStore vs_TEXCOORD3 %298 
                                         f32 %299 = OpLoad vs_TEXCOORD3 
                                         f32 %300 = OpExtInst %1 43 %299 %10 %11 
                                                      OpStore vs_TEXCOORD3 %300 
                                       f32_3 %303 = OpLoad %302 
                                       f32_2 %304 = OpVectorShuffle %303 %303 0 1 
                              Uniform f32_4* %306 = OpAccessChain %28 %305 
                                       f32_4 %307 = OpLoad %306 
                                       f32_2 %308 = OpVectorShuffle %307 %307 0 1 
                                       f32_2 %309 = OpFMul %304 %308 
                              Uniform f32_4* %310 = OpAccessChain %28 %305 
                                       f32_4 %311 = OpLoad %310 
                                       f32_2 %312 = OpVectorShuffle %311 %311 2 3 
                                       f32_2 %313 = OpFAdd %309 %312 
                                                      OpStore vs_TEXCOORD2 %313 
                                       f32_3 %314 = OpLoad %105 
                                       f32_4 %315 = OpVectorShuffle %314 %314 1 1 1 1 
                              Uniform f32_4* %316 = OpAccessChain %28 %54 %55 
                                       f32_4 %317 = OpLoad %316 
                                       f32_4 %318 = OpFMul %315 %317 
                                                      OpStore %53 %318 
                              Uniform f32_4* %319 = OpAccessChain %28 %54 %54 
                                       f32_4 %320 = OpLoad %319 
                                       f32_3 %321 = OpLoad %105 
                                       f32_4 %322 = OpVectorShuffle %321 %321 0 0 0 0 
                                       f32_4 %323 = OpFMul %320 %322 
                                       f32_4 %324 = OpLoad %53 
                                       f32_4 %325 = OpFAdd %323 %324 
                                                      OpStore %53 %325 
                              Uniform f32_4* %326 = OpAccessChain %28 %54 %77 
                                       f32_4 %327 = OpLoad %326 
                                       f32_3 %328 = OpLoad %105 
                                       f32_4 %329 = OpVectorShuffle %328 %328 2 2 2 2 
                                       f32_4 %330 = OpFMul %327 %329 
                                       f32_4 %331 = OpLoad %53 
                                       f32_4 %332 = OpFAdd %330 %331 
                                                      OpStore %53 %332 
                                       f32_4 %333 = OpLoad %53 
                              Uniform f32_4* %334 = OpAccessChain %28 %54 %90 
                                       f32_4 %335 = OpLoad %334 
                                       f32_4 %336 = OpFAdd %333 %335 
                                                      OpStore %53 %336 
                                       f32_4 %337 = OpLoad %53 
                                       f32_4 %338 = OpVectorShuffle %337 %337 1 1 1 1 
                              Uniform f32_4* %339 = OpAccessChain %28 %77 %55 
                                       f32_4 %340 = OpLoad %339 
                                       f32_4 %341 = OpFMul %338 %340 
                                                      OpStore %111 %341 
                              Uniform f32_4* %342 = OpAccessChain %28 %77 %54 
                                       f32_4 %343 = OpLoad %342 
                                       f32_4 %344 = OpLoad %53 
                                       f32_4 %345 = OpVectorShuffle %344 %344 0 0 0 0 
                                       f32_4 %346 = OpFMul %343 %345 
                                       f32_4 %347 = OpLoad %111 
                                       f32_4 %348 = OpFAdd %346 %347 
                                                      OpStore %111 %348 
                              Uniform f32_4* %349 = OpAccessChain %28 %77 %77 
                                       f32_4 %350 = OpLoad %349 
                                       f32_4 %351 = OpLoad %53 
                                       f32_4 %352 = OpVectorShuffle %351 %351 2 2 2 2 
                                       f32_4 %353 = OpFMul %350 %352 
                                       f32_4 %354 = OpLoad %111 
                                       f32_4 %355 = OpFAdd %353 %354 
                                                      OpStore %111 %355 
                              Uniform f32_4* %361 = OpAccessChain %28 %77 %90 
                                       f32_4 %362 = OpLoad %361 
                                       f32_4 %363 = OpLoad %53 
                                       f32_4 %364 = OpVectorShuffle %363 %363 3 3 3 3 
                                       f32_4 %365 = OpFMul %362 %364 
                                       f32_4 %366 = OpLoad %111 
                                       f32_4 %367 = OpFAdd %365 %366 
                               Output f32_4* %368 = OpAccessChain %360 %54 
                                                      OpStore %368 %367 
                                 Output f32* %369 = OpAccessChain %360 %54 %356 
                                         f32 %370 = OpLoad %369 
                                         f32 %371 = OpFNegate %370 
                                 Output f32* %372 = OpAccessChain %360 %54 %356 
                                                      OpStore %372 %371 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 105
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %61 %85 %87 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpMemberDecorate %35 0 Offset 35 
                                             OpMemberDecorate %35 1 Offset 35 
                                             OpDecorate %35 Block 
                                             OpDecorate %37 DescriptorSet 37 
                                             OpDecorate %37 Binding 37 
                                             OpDecorate %56 DescriptorSet 56 
                                             OpDecorate %56 Binding 56 
                                             OpDecorate %58 DescriptorSet 58 
                                             OpDecorate %58 Binding 58 
                                             OpDecorate vs_TEXCOORD2 Location 61 
                                             OpDecorate %85 Location 85 
                                             OpDecorate vs_TEXCOORD3 Location 87 
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
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %25 = OpTypeVector %6 3 
                                     %35 = OpTypeStruct %7 %7 
                                     %36 = OpTypePointer Uniform %35 
     Uniform struct {f32_4; f32_4;}* %37 = OpVariable Uniform 
                                     %38 = OpTypeInt 32 1 
                                 i32 %39 = OpConstant 1 
                                     %40 = OpTypePointer Uniform %7 
                                     %54 = OpTypePointer Private %25 
                      Private f32_3* %55 = OpVariable Private 
UniformConstant read_only Texture2D* %56 = OpVariable UniformConstant 
            UniformConstant sampler* %58 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD2 = OpVariable Input 
                                 f32 %73 = OpConstant 3.674022E-40 
                               f32_3 %74 = OpConstantComposite %73 %73 %73 
                                 i32 %76 = OpConstant 0 
                                     %84 = OpTypePointer Output %7 
                       Output f32_4* %85 = OpVariable Output 
                                     %86 = OpTypePointer Input %6 
                 Input f32* vs_TEXCOORD3 = OpVariable Input 
                                 f32 %99 = OpConstant 3.674022E-40 
                                    %100 = OpTypeInt 32 0 
                                u32 %101 = OpConstant 3 
                                    %102 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                               f32_3 %27 = OpVectorShuffle %26 %26 3 3 3 
                               f32_4 %28 = OpLoad %9 
                               f32_3 %29 = OpVectorShuffle %28 %28 0 1 2 
                               f32_3 %30 = OpFMul %27 %29 
                               f32_4 %31 = OpLoad %9 
                               f32_4 %32 = OpVectorShuffle %31 %30 4 5 6 3 
                                             OpStore %9 %32 
                               f32_4 %33 = OpLoad %9 
                               f32_3 %34 = OpVectorShuffle %33 %33 0 1 2 
                      Uniform f32_4* %41 = OpAccessChain %37 %39 
                               f32_4 %42 = OpLoad %41 
                               f32_3 %43 = OpVectorShuffle %42 %42 0 1 2 
                               f32_3 %44 = OpFMul %34 %43 
                               f32_4 %45 = OpLoad %9 
                               f32_4 %46 = OpVectorShuffle %45 %44 4 5 6 3 
                                             OpStore %9 %46 
                               f32_4 %47 = OpLoad %9 
                               f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                               f32_4 %49 = OpLoad %9 
                               f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                               f32_3 %51 = OpFAdd %48 %50 
                               f32_4 %52 = OpLoad %9 
                               f32_4 %53 = OpVectorShuffle %52 %51 4 5 6 3 
                                             OpStore %9 %53 
                 read_only Texture2D %57 = OpLoad %56 
                             sampler %59 = OpLoad %58 
          read_only Texture2DSampled %60 = OpSampledImage %57 %59 
                               f32_2 %62 = OpLoad vs_TEXCOORD2 
                               f32_4 %63 = OpImageSampleImplicitLod %60 %62 
                               f32_3 %64 = OpVectorShuffle %63 %63 0 1 2 
                                             OpStore %55 %64 
                               f32_4 %65 = OpLoad %9 
                               f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                               f32_3 %67 = OpLoad %55 
                               f32_3 %68 = OpFMul %66 %67 
                               f32_4 %69 = OpLoad %9 
                               f32_4 %70 = OpVectorShuffle %69 %68 4 5 6 3 
                                             OpStore %9 %70 
                               f32_4 %71 = OpLoad %9 
                               f32_3 %72 = OpVectorShuffle %71 %71 0 1 2 
                               f32_3 %75 = OpFMul %72 %74 
                      Uniform f32_4* %77 = OpAccessChain %37 %76 
                               f32_4 %78 = OpLoad %77 
                               f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                               f32_3 %80 = OpFNegate %79 
                               f32_3 %81 = OpFAdd %75 %80 
                               f32_4 %82 = OpLoad %9 
                               f32_4 %83 = OpVectorShuffle %82 %81 4 5 6 3 
                                             OpStore %9 %83 
                                 f32 %88 = OpLoad vs_TEXCOORD3 
                               f32_3 %89 = OpCompositeConstruct %88 %88 %88 
                               f32_4 %90 = OpLoad %9 
                               f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                               f32_3 %92 = OpFMul %89 %91 
                      Uniform f32_4* %93 = OpAccessChain %37 %76 
                               f32_4 %94 = OpLoad %93 
                               f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                               f32_3 %96 = OpFAdd %92 %95 
                               f32_4 %97 = OpLoad %85 
                               f32_4 %98 = OpVectorShuffle %97 %96 4 5 6 3 
                                             OpStore %85 %98 
                        Output f32* %103 = OpAccessChain %85 %101 
                                             OpStore %103 %99 
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
 Pass {
  Name "ShadowCaster"
  LOD 100
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 9208
Program "vp" {
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SHADOWS_DEPTH" }
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
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SHADOWS_DEPTH" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 254
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %66 %227 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %16 ArrayStride 16 
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
                                                      OpDecorate %66 Location 66 
                                                      OpMemberDecorate %225 0 BuiltIn 225 
                                                      OpMemberDecorate %225 1 BuiltIn 225 
                                                      OpMemberDecorate %225 2 BuiltIn 225 
                                                      OpDecorate %225 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %7 %16 %17 %18 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 3 
                                          i32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Uniform %7 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                          i32 %34 = OpConstant 1 
                                          u32 %39 = OpConstant 1 
                                          i32 %42 = OpConstant 2 
                                          u32 %47 = OpConstant 2 
                                 Private f32* %49 = OpVariable Private 
                               Private f32_4* %64 = OpVariable Private 
                                              %65 = OpTypePointer Input %7 
                                 Input f32_4* %66 = OpVariable Input 
                               Private f32_4* %93 = OpVariable Private 
                                         f32 %130 = OpConstant 3.674022E-40 
                                             %135 = OpTypePointer Uniform %6 
                                             %150 = OpTypeBool 
                                             %151 = OpTypePointer Private %150 
                               Private bool* %152 = OpVariable Private 
                                         f32 %155 = OpConstant 3.674022E-40 
                                             %158 = OpTypePointer Function %10 
                                         i32 %172 = OpConstant 4 
                                         u32 %199 = OpConstant 3 
                                         f32 %210 = OpConstant 3.674022E-40 
                                Private f32* %213 = OpVariable Private 
                                             %224 = OpTypeArray %6 %39 
                                             %225 = OpTypeStruct %7 %6 %224 
                                             %226 = OpTypePointer Output %225 
        Output struct {f32_4; f32; f32[1];}* %227 = OpVariable Output 
                                             %230 = OpTypePointer Output %7 
                                             %247 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %159 = OpVariable Function 
                                        f32_3 %13 = OpLoad %12 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                          f32 %29 = OpDot %13 %28 
                                 Private f32* %32 = OpAccessChain %9 %30 
                                                      OpStore %32 %29 
                                        f32_3 %33 = OpLoad %12 
                               Uniform f32_4* %35 = OpAccessChain %21 %23 %34 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                          f32 %38 = OpDot %33 %37 
                                 Private f32* %40 = OpAccessChain %9 %39 
                                                      OpStore %40 %38 
                                        f32_3 %41 = OpLoad %12 
                               Uniform f32_4* %43 = OpAccessChain %21 %23 %42 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                                          f32 %46 = OpDot %41 %45 
                                 Private f32* %48 = OpAccessChain %9 %47 
                                                      OpStore %48 %46 
                                        f32_4 %50 = OpLoad %9 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_4 %52 = OpLoad %9 
                                        f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                                          f32 %54 = OpDot %51 %53 
                                                      OpStore %49 %54 
                                          f32 %55 = OpLoad %49 
                                          f32 %56 = OpExtInst %1 32 %55 
                                                      OpStore %49 %56 
                                          f32 %57 = OpLoad %49 
                                        f32_3 %58 = OpCompositeConstruct %57 %57 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFMul %58 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
                                                      OpStore %9 %63 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpVectorShuffle %67 %67 1 1 1 1 
                               Uniform f32_4* %69 = OpAccessChain %21 %42 %34 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpFMul %68 %70 
                                                      OpStore %64 %71 
                               Uniform f32_4* %72 = OpAccessChain %21 %42 %24 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %66 
                                        f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %64 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %64 %78 
                               Uniform f32_4* %79 = OpAccessChain %21 %42 %42 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpLoad %66 
                                        f32_4 %82 = OpVectorShuffle %81 %81 2 2 2 2 
                                        f32_4 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %64 
                                        f32_4 %85 = OpFAdd %83 %84 
                                                      OpStore %64 %85 
                               Uniform f32_4* %86 = OpAccessChain %21 %42 %23 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %66 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %64 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %64 %92 
                                        f32_4 %94 = OpLoad %64 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_3 %96 = OpFNegate %95 
                               Uniform f32_4* %97 = OpAccessChain %21 %24 
                                        f32_4 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 3 3 3 
                                       f32_3 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %24 
                                       f32_4 %102 = OpLoad %101 
                                       f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
                                       f32_3 %104 = OpFAdd %100 %103 
                                       f32_4 %105 = OpLoad %93 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 6 3 
                                                      OpStore %93 %106 
                                       f32_4 %107 = OpLoad %93 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_4 %109 = OpLoad %93 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                         f32 %111 = OpDot %108 %110 
                                                      OpStore %49 %111 
                                         f32 %112 = OpLoad %49 
                                         f32 %113 = OpExtInst %1 32 %112 
                                                      OpStore %49 %113 
                                         f32 %114 = OpLoad %49 
                                       f32_3 %115 = OpCompositeConstruct %114 %114 %114 
                                       f32_4 %116 = OpLoad %93 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %93 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %93 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_4 %123 = OpLoad %93 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                         f32 %125 = OpDot %122 %124 
                                                      OpStore %49 %125 
                                         f32 %126 = OpLoad %49 
                                         f32 %127 = OpFNegate %126 
                                         f32 %128 = OpLoad %49 
                                         f32 %129 = OpFMul %127 %128 
                                         f32 %131 = OpFAdd %129 %130 
                                                      OpStore %49 %131 
                                         f32 %132 = OpLoad %49 
                                         f32 %133 = OpExtInst %1 31 %132 
                                                      OpStore %49 %133 
                                         f32 %134 = OpLoad %49 
                                Uniform f32* %136 = OpAccessChain %21 %34 %47 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFMul %134 %137 
                                                      OpStore %49 %138 
                                       f32_4 %139 = OpLoad %9 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                       f32_3 %141 = OpFNegate %140 
                                         f32 %142 = OpLoad %49 
                                       f32_3 %143 = OpCompositeConstruct %142 %142 %142 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %64 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFAdd %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %9 %149 
                                Uniform f32* %153 = OpAccessChain %21 %34 %47 
                                         f32 %154 = OpLoad %153 
                                        bool %156 = OpFOrdNotEqual %154 %155 
                                                      OpStore %152 %156 
                                        bool %157 = OpLoad %152 
                                                      OpSelectionMerge %161 None 
                                                      OpBranchConditional %157 %160 %164 
                                             %160 = OpLabel 
                                       f32_4 %162 = OpLoad %9 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                                      OpStore %159 %163 
                                                      OpBranch %161 
                                             %164 = OpLabel 
                                       f32_4 %165 = OpLoad %64 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                                      OpStore %159 %166 
                                                      OpBranch %161 
                                             %161 = OpLabel 
                                       f32_3 %167 = OpLoad %159 
                                       f32_4 %168 = OpLoad %9 
                                       f32_4 %169 = OpVectorShuffle %168 %167 4 5 6 3 
                                                      OpStore %9 %169 
                                       f32_4 %170 = OpLoad %9 
                                       f32_4 %171 = OpVectorShuffle %170 %170 1 1 1 1 
                              Uniform f32_4* %173 = OpAccessChain %21 %172 %34 
                                       f32_4 %174 = OpLoad %173 
                                       f32_4 %175 = OpFMul %171 %174 
                                                      OpStore %93 %175 
                              Uniform f32_4* %176 = OpAccessChain %21 %172 %24 
                                       f32_4 %177 = OpLoad %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %178 0 0 0 0 
                                       f32_4 %180 = OpFMul %177 %179 
                                       f32_4 %181 = OpLoad %93 
                                       f32_4 %182 = OpFAdd %180 %181 
                                                      OpStore %93 %182 
                              Uniform f32_4* %183 = OpAccessChain %21 %172 %42 
                                       f32_4 %184 = OpLoad %183 
                                       f32_4 %185 = OpLoad %9 
                                       f32_4 %186 = OpVectorShuffle %185 %185 2 2 2 2 
                                       f32_4 %187 = OpFMul %184 %186 
                                       f32_4 %188 = OpLoad %93 
                                       f32_4 %189 = OpFAdd %187 %188 
                                                      OpStore %9 %189 
                              Uniform f32_4* %190 = OpAccessChain %21 %172 %23 
                                       f32_4 %191 = OpLoad %190 
                                       f32_4 %192 = OpLoad %64 
                                       f32_4 %193 = OpVectorShuffle %192 %192 3 3 3 3 
                                       f32_4 %194 = OpFMul %191 %193 
                                       f32_4 %195 = OpLoad %9 
                                       f32_4 %196 = OpFAdd %194 %195 
                                                      OpStore %9 %196 
                                Uniform f32* %197 = OpAccessChain %21 %34 %30 
                                         f32 %198 = OpLoad %197 
                                Private f32* %200 = OpAccessChain %9 %199 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpFDiv %198 %201 
                                Private f32* %203 = OpAccessChain %64 %30 
                                                      OpStore %203 %202 
                                Private f32* %204 = OpAccessChain %64 %30 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpExtInst %1 37 %205 %155 
                                Private f32* %207 = OpAccessChain %64 %30 
                                                      OpStore %207 %206 
                                Private f32* %208 = OpAccessChain %64 %30 
                                         f32 %209 = OpLoad %208 
                                         f32 %211 = OpExtInst %1 40 %209 %210 
                                Private f32* %212 = OpAccessChain %64 %30 
                                                      OpStore %212 %211 
                                Private f32* %214 = OpAccessChain %9 %47 
                                         f32 %215 = OpLoad %214 
                                Private f32* %216 = OpAccessChain %64 %30 
                                         f32 %217 = OpLoad %216 
                                         f32 %218 = OpFAdd %215 %217 
                                                      OpStore %213 %218 
                                Private f32* %219 = OpAccessChain %9 %199 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpLoad %213 
                                         f32 %222 = OpExtInst %1 37 %220 %221 
                                Private f32* %223 = OpAccessChain %64 %30 
                                                      OpStore %223 %222 
                                       f32_4 %228 = OpLoad %9 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 3 
                               Output f32_4* %231 = OpAccessChain %227 %24 
                                       f32_4 %232 = OpLoad %231 
                                       f32_4 %233 = OpVectorShuffle %232 %229 4 5 2 6 
                                                      OpStore %231 %233 
                                         f32 %234 = OpLoad %213 
                                         f32 %235 = OpFNegate %234 
                                Private f32* %236 = OpAccessChain %64 %30 
                                         f32 %237 = OpLoad %236 
                                         f32 %238 = OpFAdd %235 %237 
                                Private f32* %239 = OpAccessChain %9 %30 
                                                      OpStore %239 %238 
                                Uniform f32* %240 = OpAccessChain %21 %34 %39 
                                         f32 %241 = OpLoad %240 
                                Private f32* %242 = OpAccessChain %9 %30 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpFMul %241 %243 
                                         f32 %245 = OpLoad %213 
                                         f32 %246 = OpFAdd %244 %245 
                                 Output f32* %248 = OpAccessChain %227 %24 %47 
                                                      OpStore %248 %246 
                                 Output f32* %249 = OpAccessChain %227 %24 %39 
                                         f32 %250 = OpLoad %249 
                                         f32 %251 = OpFNegate %250 
                                 Output f32* %252 = OpAccessChain %227 %24 %39 
                                                      OpStore %252 %251 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 13
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 Location 9 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
         f32 %10 = OpConstant 3.674022E-40 
       f32_4 %11 = OpConstantComposite %10 %10 %10 %10 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
                     OpStore %9 %11 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SHADOWS_CUBE" }
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
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SHADOWS_CUBE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 236
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %66 %214 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %16 ArrayStride 16 
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
                                                      OpDecorate %66 Location 66 
                                                      OpMemberDecorate %212 0 BuiltIn 212 
                                                      OpMemberDecorate %212 1 BuiltIn 212 
                                                      OpMemberDecorate %212 2 BuiltIn 212 
                                                      OpDecorate %212 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %7 %16 %17 %18 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 3 
                                          i32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Uniform %7 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                          i32 %34 = OpConstant 1 
                                          u32 %39 = OpConstant 1 
                                          i32 %42 = OpConstant 2 
                                          u32 %47 = OpConstant 2 
                                 Private f32* %49 = OpVariable Private 
                               Private f32_4* %64 = OpVariable Private 
                                              %65 = OpTypePointer Input %7 
                                 Input f32_4* %66 = OpVariable Input 
                               Private f32_4* %93 = OpVariable Private 
                                         f32 %130 = OpConstant 3.674022E-40 
                                             %135 = OpTypePointer Uniform %6 
                                             %150 = OpTypeBool 
                                             %151 = OpTypePointer Private %150 
                               Private bool* %152 = OpVariable Private 
                                         f32 %155 = OpConstant 3.674022E-40 
                                             %158 = OpTypePointer Function %10 
                                         i32 %172 = OpConstant 4 
                                         u32 %197 = OpConstant 3 
                                             %211 = OpTypeArray %6 %39 
                                             %212 = OpTypeStruct %7 %6 %211 
                                             %213 = OpTypePointer Output %212 
        Output struct {f32_4; f32; f32[1];}* %214 = OpVariable Output 
                                             %223 = OpTypePointer Output %6 
                                             %227 = OpTypePointer Output %7 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %159 = OpVariable Function 
                                        f32_3 %13 = OpLoad %12 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                          f32 %29 = OpDot %13 %28 
                                 Private f32* %32 = OpAccessChain %9 %30 
                                                      OpStore %32 %29 
                                        f32_3 %33 = OpLoad %12 
                               Uniform f32_4* %35 = OpAccessChain %21 %23 %34 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                          f32 %38 = OpDot %33 %37 
                                 Private f32* %40 = OpAccessChain %9 %39 
                                                      OpStore %40 %38 
                                        f32_3 %41 = OpLoad %12 
                               Uniform f32_4* %43 = OpAccessChain %21 %23 %42 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                                          f32 %46 = OpDot %41 %45 
                                 Private f32* %48 = OpAccessChain %9 %47 
                                                      OpStore %48 %46 
                                        f32_4 %50 = OpLoad %9 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_4 %52 = OpLoad %9 
                                        f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                                          f32 %54 = OpDot %51 %53 
                                                      OpStore %49 %54 
                                          f32 %55 = OpLoad %49 
                                          f32 %56 = OpExtInst %1 32 %55 
                                                      OpStore %49 %56 
                                          f32 %57 = OpLoad %49 
                                        f32_3 %58 = OpCompositeConstruct %57 %57 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFMul %58 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
                                                      OpStore %9 %63 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpVectorShuffle %67 %67 1 1 1 1 
                               Uniform f32_4* %69 = OpAccessChain %21 %42 %34 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpFMul %68 %70 
                                                      OpStore %64 %71 
                               Uniform f32_4* %72 = OpAccessChain %21 %42 %24 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %66 
                                        f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %64 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %64 %78 
                               Uniform f32_4* %79 = OpAccessChain %21 %42 %42 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpLoad %66 
                                        f32_4 %82 = OpVectorShuffle %81 %81 2 2 2 2 
                                        f32_4 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %64 
                                        f32_4 %85 = OpFAdd %83 %84 
                                                      OpStore %64 %85 
                               Uniform f32_4* %86 = OpAccessChain %21 %42 %23 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %66 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %64 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %64 %92 
                                        f32_4 %94 = OpLoad %64 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_3 %96 = OpFNegate %95 
                               Uniform f32_4* %97 = OpAccessChain %21 %24 
                                        f32_4 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 3 3 3 
                                       f32_3 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %24 
                                       f32_4 %102 = OpLoad %101 
                                       f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
                                       f32_3 %104 = OpFAdd %100 %103 
                                       f32_4 %105 = OpLoad %93 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 6 3 
                                                      OpStore %93 %106 
                                       f32_4 %107 = OpLoad %93 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_4 %109 = OpLoad %93 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                         f32 %111 = OpDot %108 %110 
                                                      OpStore %49 %111 
                                         f32 %112 = OpLoad %49 
                                         f32 %113 = OpExtInst %1 32 %112 
                                                      OpStore %49 %113 
                                         f32 %114 = OpLoad %49 
                                       f32_3 %115 = OpCompositeConstruct %114 %114 %114 
                                       f32_4 %116 = OpLoad %93 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %93 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %93 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_4 %123 = OpLoad %93 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                         f32 %125 = OpDot %122 %124 
                                                      OpStore %49 %125 
                                         f32 %126 = OpLoad %49 
                                         f32 %127 = OpFNegate %126 
                                         f32 %128 = OpLoad %49 
                                         f32 %129 = OpFMul %127 %128 
                                         f32 %131 = OpFAdd %129 %130 
                                                      OpStore %49 %131 
                                         f32 %132 = OpLoad %49 
                                         f32 %133 = OpExtInst %1 31 %132 
                                                      OpStore %49 %133 
                                         f32 %134 = OpLoad %49 
                                Uniform f32* %136 = OpAccessChain %21 %34 %47 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFMul %134 %137 
                                                      OpStore %49 %138 
                                       f32_4 %139 = OpLoad %9 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                       f32_3 %141 = OpFNegate %140 
                                         f32 %142 = OpLoad %49 
                                       f32_3 %143 = OpCompositeConstruct %142 %142 %142 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %64 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFAdd %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %9 %149 
                                Uniform f32* %153 = OpAccessChain %21 %34 %47 
                                         f32 %154 = OpLoad %153 
                                        bool %156 = OpFOrdNotEqual %154 %155 
                                                      OpStore %152 %156 
                                        bool %157 = OpLoad %152 
                                                      OpSelectionMerge %161 None 
                                                      OpBranchConditional %157 %160 %164 
                                             %160 = OpLabel 
                                       f32_4 %162 = OpLoad %9 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                                      OpStore %159 %163 
                                                      OpBranch %161 
                                             %164 = OpLabel 
                                       f32_4 %165 = OpLoad %64 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                                      OpStore %159 %166 
                                                      OpBranch %161 
                                             %161 = OpLabel 
                                       f32_3 %167 = OpLoad %159 
                                       f32_4 %168 = OpLoad %9 
                                       f32_4 %169 = OpVectorShuffle %168 %167 4 5 6 3 
                                                      OpStore %9 %169 
                                       f32_4 %170 = OpLoad %9 
                                       f32_4 %171 = OpVectorShuffle %170 %170 1 1 1 1 
                              Uniform f32_4* %173 = OpAccessChain %21 %172 %34 
                                       f32_4 %174 = OpLoad %173 
                                       f32_4 %175 = OpFMul %171 %174 
                                                      OpStore %93 %175 
                              Uniform f32_4* %176 = OpAccessChain %21 %172 %24 
                                       f32_4 %177 = OpLoad %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %178 0 0 0 0 
                                       f32_4 %180 = OpFMul %177 %179 
                                       f32_4 %181 = OpLoad %93 
                                       f32_4 %182 = OpFAdd %180 %181 
                                                      OpStore %93 %182 
                              Uniform f32_4* %183 = OpAccessChain %21 %172 %42 
                                       f32_4 %184 = OpLoad %183 
                                       f32_4 %185 = OpLoad %9 
                                       f32_4 %186 = OpVectorShuffle %185 %185 2 2 2 2 
                                       f32_4 %187 = OpFMul %184 %186 
                                       f32_4 %188 = OpLoad %93 
                                       f32_4 %189 = OpFAdd %187 %188 
                                                      OpStore %9 %189 
                              Uniform f32_4* %190 = OpAccessChain %21 %172 %23 
                                       f32_4 %191 = OpLoad %190 
                                       f32_4 %192 = OpLoad %64 
                                       f32_4 %193 = OpVectorShuffle %192 %192 3 3 3 3 
                                       f32_4 %194 = OpFMul %191 %193 
                                       f32_4 %195 = OpLoad %9 
                                       f32_4 %196 = OpFAdd %194 %195 
                                                      OpStore %9 %196 
                                Private f32* %198 = OpAccessChain %9 %197 
                                         f32 %199 = OpLoad %198 
                                Private f32* %200 = OpAccessChain %9 %47 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpExtInst %1 37 %199 %201 
                                Private f32* %203 = OpAccessChain %64 %30 
                                                      OpStore %203 %202 
                                Private f32* %204 = OpAccessChain %9 %47 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpFNegate %205 
                                Private f32* %207 = OpAccessChain %64 %30 
                                         f32 %208 = OpLoad %207 
                                         f32 %209 = OpFAdd %206 %208 
                                Private f32* %210 = OpAccessChain %64 %30 
                                                      OpStore %210 %209 
                                Uniform f32* %215 = OpAccessChain %21 %34 %39 
                                         f32 %216 = OpLoad %215 
                                Private f32* %217 = OpAccessChain %64 %30 
                                         f32 %218 = OpLoad %217 
                                         f32 %219 = OpFMul %216 %218 
                                Private f32* %220 = OpAccessChain %9 %47 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFAdd %219 %221 
                                 Output f32* %224 = OpAccessChain %214 %24 %47 
                                                      OpStore %224 %222 
                                       f32_4 %225 = OpLoad %9 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 3 
                               Output f32_4* %228 = OpAccessChain %214 %24 
                                       f32_4 %229 = OpLoad %228 
                                       f32_4 %230 = OpVectorShuffle %229 %226 4 5 2 6 
                                                      OpStore %228 %230 
                                 Output f32* %231 = OpAccessChain %214 %24 %39 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpFNegate %232 
                                 Output f32* %234 = OpAccessChain %214 %24 %39 
                                                      OpStore %234 %233 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 13
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 Location 9 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
         f32 %10 = OpConstant 3.674022E-40 
       f32_4 %11 = OpConstantComposite %10 %10 %10 %10 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
                     OpStore %9 %11 
                     OpReturn
                     OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "vulkan " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "vulkan " {
Keywords { "SHADOWS_CUBE" }
""
}
}
}
}
}