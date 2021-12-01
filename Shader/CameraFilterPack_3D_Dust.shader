//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/3D_Dust" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_ColorRGB ("_ColorRGB", Color) = (1,1,1,1)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 20795
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_COLOR0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat0.www + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _ZBufferParams;
uniform 	float _Visualize;
uniform 	float _Near;
uniform 	float _Far;
uniform 	float _FixDistance;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
int u_xlati2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
bool u_xlatb6;
float u_xlat7;
int u_xlati7;
bool u_xlatb9;
float u_xlat10;
float u_xlat13;
vec2 u_xlat14;
bool u_xlatb14;
bool u_xlatb16;
float u_xlat17;
float u_xlat21;
bool u_xlatb21;
float u_xlat24;
float u_xlat25;
float u_xlat26;
bool u_xlatb26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7 = _FixDistance * 10.0;
    u_xlat0.x = u_xlat0.x / u_xlat7;
    u_xlat7 = dot(vec2(_Near, _Far), vec2(4.0, 4.0));
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat7 = u_xlat7 + (-_Near);
    u_xlat0.x = u_xlat0.x + (-_Near);
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlatb14 = _Visualize==1.0;
    if(u_xlatb14){
        SV_Target0 = u_xlat0.xxxx;
        return;
    }
    u_xlat14.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = texture(_MainTex, u_xlat14.xy);
    u_xlat14.x = float(0.0);
    u_xlat14.y = float(0.00400000019);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<100 ; u_xlati_loop_1++)
    {
        u_xlatb9 = u_xlat14.y<0.00200000009;
        u_xlatb16 = 30.0<u_xlat14.x;
        u_xlatb9 = u_xlatb16 || u_xlatb9;
        if(u_xlatb9){
            break;
        }
        u_xlat0.y = u_xlat14.y * 2.0 + u_xlat14.x;
        u_xlat14.xy = u_xlat0.yx;
    }
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(0.0);
    u_xlat0.x = float(0.5);
    u_xlati7 = int(0);
    while(true){
        u_xlatb21 = u_xlati7>=7;
        if(u_xlatb21){break;}
        u_xlat3.xyz = u_xlat0.xxx + vec3(20.0, -0.400000006, 2.0);
        u_xlat21 = intBitsToFloat(int(0xFFC10000u)) / u_xlat3.x;
        u_xlat4.xyz = vec3(u_xlat21);
        u_xlat5.xyz = vec3(u_xlat21);
        u_xlat3.x = float(1.39999998);
        u_xlat24 = float(0.0);
        u_xlat25 = 0.0;
        while(true){
            u_xlatb26 = 3.0<u_xlat25;
            if(u_xlatb26){break;}
            u_xlat6.xy = u_xlat5.xy + u_xlat5.xy;
            u_xlat6.xyz = fract(u_xlat6.yxx);
            u_xlat6.xyz = u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
            u_xlat6.xyz = u_xlat5.zzy * vec3(2.0, 2.0, 2.0) + abs(u_xlat6.xyz);
            u_xlat6.xyz = fract(u_xlat6.xyz);
            u_xlat6.xyz = u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
            u_xlat6.xyz = _Time.xyz * vec3(0.100000001, 0.100000001, 0.100000001) + abs(u_xlat6.xyz);
            u_xlat6.xyz = u_xlat4.xyz + u_xlat6.xyz;
            u_xlat3.x = u_xlat3.x * 1.5;
            u_xlat4.xyz = u_xlat6.xyz * vec3(1.20000005, 1.20000005, 1.20000005);
            u_xlat26 = fract(u_xlat4.y);
            u_xlat26 = u_xlat26 + -0.5;
            u_xlat26 = u_xlat6.x * 1.20000005 + abs(u_xlat26);
            u_xlat26 = fract(u_xlat26);
            u_xlat26 = u_xlat26 + -0.5;
            u_xlat26 = u_xlat6.z * 1.20000005 + abs(u_xlat26);
            u_xlat26 = fract(u_xlat26);
            u_xlat26 = u_xlat26 + -0.5;
            u_xlat26 = abs(u_xlat26) / u_xlat3.x;
            u_xlat24 = u_xlat24 + u_xlat26;
            u_xlat5.xyz = u_xlat5.xyz * vec3(1.79999995, 1.79999995, 1.79999995) + vec3(0.140000001, 0.140000001, 0.140000001);
            u_xlat25 = u_xlat25 + 1.0;
        }
        u_xlat4.xyz = vec3(u_xlat21);
        u_xlat5.xyz = vec3(u_xlat21);
        u_xlat3.x = 1.39999998;
        u_xlat25 = 0.0;
        u_xlat26 = 0.0;
        while(true){
            u_xlatb6 = 3.0<u_xlat26;
            if(u_xlatb6){break;}
            u_xlat6.xy = u_xlat5.xy + u_xlat5.xy;
            u_xlat6.xyz = fract(u_xlat6.yxx);
            u_xlat6.xyz = u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
            u_xlat6.xyz = u_xlat5.zzy * vec3(2.0, 2.0, 2.0) + abs(u_xlat6.xyz);
            u_xlat6.xyz = fract(u_xlat6.xyz);
            u_xlat6.xyz = u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
            u_xlat6.xyz = _Time.xyz * vec3(0.100000001, 0.100000001, 0.100000001) + abs(u_xlat6.xyz);
            u_xlat6.xyz = u_xlat4.xyz + u_xlat6.xyz;
            u_xlat3.x = u_xlat3.x * 1.5;
            u_xlat4.xyz = u_xlat6.xyz * vec3(1.20000005, 1.20000005, 1.20000005);
            u_xlat13 = fract(u_xlat4.y);
            u_xlat13 = u_xlat13 + -0.5;
            u_xlat6.x = u_xlat6.x * 1.20000005 + abs(u_xlat13);
            u_xlat6.x = fract(u_xlat6.x);
            u_xlat6.x = u_xlat6.x + -0.5;
            u_xlat6.x = u_xlat6.z * 1.20000005 + abs(u_xlat6.x);
            u_xlat6.x = fract(u_xlat6.x);
            u_xlat6.x = u_xlat6.x + -0.5;
            u_xlat6.x = abs(u_xlat6.x) / u_xlat3.x;
            u_xlat25 = u_xlat25 + u_xlat6.x;
            u_xlat5.xyz = u_xlat5.xyz * vec3(1.79999995, 1.79999995, 1.79999995) + vec3(0.140000001, 0.140000001, 0.140000001);
            u_xlat26 = u_xlat26 + 1.0;
        }
        u_xlat21 = u_xlat24 + (-u_xlat25);
        u_xlat21 = u_xlat21 * 3.0;
        u_xlat21 = max(u_xlat21, 0.100000001);
        u_xlat21 = min(u_xlat21, 1.0);
        u_xlat21 = (-u_xlat21) + 1.0;
        u_xlat3.x = u_xlat0.x * 1.79999995;
        u_xlat17 = u_xlat0.x * 0.75 + u_xlat3.z;
        u_xlat17 = (-u_xlat3.y) + u_xlat17;
        u_xlat10 = u_xlat14.x + (-u_xlat3.y);
        u_xlat17 = float(1.0) / u_xlat17;
        u_xlat10 = u_xlat17 * u_xlat10;
        u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
        u_xlat17 = u_xlat10 * -2.0 + 3.0;
        u_xlat10 = u_xlat10 * u_xlat10;
        u_xlat10 = u_xlat10 * u_xlat17;
        u_xlat10 = u_xlat10 * u_xlat24;
        u_xlat10 = min(u_xlat10, 1.0);
        u_xlat4.xyz = (-u_xlat2.xyz) + vec3(u_xlat21);
        u_xlat2.xyz = vec3(u_xlat10) * u_xlat4.xyz + u_xlat2.xyz;
        u_xlati7 = u_xlati7 + 1;
        u_xlat0.x = u_xlat3.x;
    }
    u_xlat2.w = 1.0;
    SV_Target0 = u_xlat1 + u_xlat2;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 171
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %17 %85 %89 %90 %124 %134 %153 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                     OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                     OpDecorate vs_TEXCOORD0 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %17 Location 17 
                                                     OpDecorate %22 ArrayStride 22 
                                                     OpDecorate %23 ArrayStride 23 
                                                     OpMemberDecorate %24 0 Offset 24 
                                                     OpMemberDecorate %24 1 Offset 24 
                                                     OpMemberDecorate %24 2 Offset 24 
                                                     OpDecorate %24 Block 
                                                     OpDecorate %26 DescriptorSet 26 
                                                     OpDecorate %26 Binding 26 
                                                     OpMemberDecorate %83 0 BuiltIn 83 
                                                     OpMemberDecorate %83 1 BuiltIn 83 
                                                     OpMemberDecorate %83 2 BuiltIn 83 
                                                     OpDecorate %83 Block 
                                                     OpDecorate %89 Location 89 
                                                     OpDecorate %90 Location 90 
                                                     OpDecorate vs_TEXCOORD1 Location 124 
                                                     OpDecorate vs_TEXCOORD2 Location 134 
                                                     OpDecorate vs_TEXCOORD3 Location 153 
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
                                             %24 = OpTypeStruct %13 %22 %23 
                                             %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
                                             %27 = OpTypeInt 32 1 
                                         i32 %28 = OpConstant 1 
                                             %29 = OpTypePointer Uniform %13 
                                         i32 %33 = OpConstant 0 
                                         i32 %41 = OpConstant 2 
                                         i32 %50 = OpConstant 3 
                              Private f32_4* %54 = OpVariable Private 
                                         u32 %81 = OpConstant 1 
                                             %82 = OpTypeArray %6 %81 
                                             %83 = OpTypeStruct %13 %6 %82 
                                             %84 = OpTypePointer Output %83 
        Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                             %87 = OpTypePointer Output %13 
                               Output f32_4* %89 = OpVariable Output 
                                Input f32_4* %90 = OpVariable Input 
                                             %92 = OpTypeVector %6 3 
                                            %123 = OpTypePointer Output %92 
                      Output f32_3* vs_TEXCOORD1 = OpVariable Output 
                      Output f32_3* vs_TEXCOORD2 = OpVariable Output 
                                            %137 = OpTypePointer Private %6 
                                        u32 %140 = OpConstant 0 
                                            %141 = OpTypePointer Uniform %6 
                                        f32 %148 = OpConstant 3.674022E-40 
                                      f32_3 %149 = OpConstantComposite %148 %148 %148 
                      Output f32_4* vs_TEXCOORD3 = OpVariable Output 
                                            %165 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %12 = OpLoad %11 
                                                     OpStore vs_TEXCOORD0 %12 
                                       f32_4 %18 = OpLoad %17 
                                       f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
                              Uniform f32_4* %30 = OpAccessChain %26 %28 %28 
                                       f32_4 %31 = OpLoad %30 
                                       f32_4 %32 = OpFMul %19 %31 
                                                     OpStore %15 %32 
                              Uniform f32_4* %34 = OpAccessChain %26 %28 %33 
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
                              Uniform f32_4* %57 = OpAccessChain %26 %41 %28 
                                       f32_4 %58 = OpLoad %57 
                                       f32_4 %59 = OpFMul %56 %58 
                                                     OpStore %54 %59 
                              Uniform f32_4* %60 = OpAccessChain %26 %41 %33 
                                       f32_4 %61 = OpLoad %60 
                                       f32_4 %62 = OpLoad %15 
                                       f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                       f32_4 %64 = OpFMul %61 %63 
                                       f32_4 %65 = OpLoad %54 
                                       f32_4 %66 = OpFAdd %64 %65 
                                                     OpStore %54 %66 
                              Uniform f32_4* %67 = OpAccessChain %26 %41 %41 
                                       f32_4 %68 = OpLoad %67 
                                       f32_4 %69 = OpLoad %15 
                                       f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
                                       f32_4 %71 = OpFMul %68 %70 
                                       f32_4 %72 = OpLoad %54 
                                       f32_4 %73 = OpFAdd %71 %72 
                                                     OpStore %54 %73 
                              Uniform f32_4* %74 = OpAccessChain %26 %41 %50 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpLoad %15 
                                       f32_4 %77 = OpVectorShuffle %76 %76 3 3 3 3 
                                       f32_4 %78 = OpFMul %75 %77 
                                       f32_4 %79 = OpLoad %54 
                                       f32_4 %80 = OpFAdd %78 %79 
                                                     OpStore %15 %80 
                                       f32_4 %86 = OpLoad %15 
                               Output f32_4* %88 = OpAccessChain %85 %33 
                                                     OpStore %88 %86 
                                       f32_4 %91 = OpLoad %90 
                                                     OpStore %89 %91 
                                       f32_4 %93 = OpLoad %15 
                                       f32_3 %94 = OpVectorShuffle %93 %93 1 1 1 
                              Uniform f32_4* %95 = OpAccessChain %26 %28 %28 
                                       f32_4 %96 = OpLoad %95 
                                       f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                       f32_3 %98 = OpFMul %94 %97 
                                       f32_4 %99 = OpLoad %54 
                                      f32_4 %100 = OpVectorShuffle %99 %98 4 5 6 3 
                                                     OpStore %54 %100 
                             Uniform f32_4* %101 = OpAccessChain %26 %28 %33 
                                      f32_4 %102 = OpLoad %101 
                                      f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
                                      f32_4 %104 = OpLoad %15 
                                      f32_3 %105 = OpVectorShuffle %104 %104 0 0 0 
                                      f32_3 %106 = OpFMul %103 %105 
                                      f32_4 %107 = OpLoad %54 
                                      f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                      f32_3 %109 = OpFAdd %106 %108 
                                      f32_4 %110 = OpLoad %54 
                                      f32_4 %111 = OpVectorShuffle %110 %109 4 5 6 3 
                                                     OpStore %54 %111 
                             Uniform f32_4* %112 = OpAccessChain %26 %28 %41 
                                      f32_4 %113 = OpLoad %112 
                                      f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                      f32_4 %115 = OpLoad %15 
                                      f32_3 %116 = OpVectorShuffle %115 %115 2 2 2 
                                      f32_3 %117 = OpFMul %114 %116 
                                      f32_4 %118 = OpLoad %54 
                                      f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                      f32_3 %120 = OpFAdd %117 %119 
                                      f32_4 %121 = OpLoad %54 
                                      f32_4 %122 = OpVectorShuffle %121 %120 4 5 6 3 
                                                     OpStore %54 %122 
                             Uniform f32_4* %125 = OpAccessChain %26 %28 %50 
                                      f32_4 %126 = OpLoad %125 
                                      f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                      f32_4 %128 = OpLoad %15 
                                      f32_3 %129 = OpVectorShuffle %128 %128 3 3 3 
                                      f32_3 %130 = OpFMul %127 %129 
                                      f32_4 %131 = OpLoad %54 
                                      f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                      f32_3 %133 = OpFAdd %130 %132 
                                                     OpStore vs_TEXCOORD1 %133 
                                      f32_4 %135 = OpLoad %15 
                                      f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                                     OpStore vs_TEXCOORD2 %136 
                               Private f32* %138 = OpAccessChain %15 %81 
                                        f32 %139 = OpLoad %138 
                               Uniform f32* %142 = OpAccessChain %26 %33 %140 
                                        f32 %143 = OpLoad %142 
                                        f32 %144 = OpFMul %139 %143 
                               Private f32* %145 = OpAccessChain %15 %81 
                                                     OpStore %145 %144 
                                      f32_4 %146 = OpLoad %15 
                                      f32_3 %147 = OpVectorShuffle %146 %146 0 3 1 
                                      f32_3 %150 = OpFMul %147 %149 
                                      f32_4 %151 = OpLoad %54 
                                      f32_4 %152 = OpVectorShuffle %151 %150 4 1 5 6 
                                                     OpStore %54 %152 
                                      f32_4 %154 = OpLoad %15 
                                      f32_2 %155 = OpVectorShuffle %154 %154 2 3 
                                      f32_4 %156 = OpLoad vs_TEXCOORD3 
                                      f32_4 %157 = OpVectorShuffle %156 %155 0 1 4 5 
                                                     OpStore vs_TEXCOORD3 %157 
                                      f32_4 %158 = OpLoad %54 
                                      f32_2 %159 = OpVectorShuffle %158 %158 2 2 
                                      f32_4 %160 = OpLoad %54 
                                      f32_2 %161 = OpVectorShuffle %160 %160 0 3 
                                      f32_2 %162 = OpFAdd %159 %161 
                                      f32_4 %163 = OpLoad vs_TEXCOORD3 
                                      f32_4 %164 = OpVectorShuffle %163 %162 4 5 2 3 
                                                     OpStore vs_TEXCOORD3 %164 
                                Output f32* %166 = OpAccessChain %85 %33 %81 
                                        f32 %167 = OpLoad %166 
                                        f32 %168 = OpFNegate %167 
                                Output f32* %169 = OpAccessChain %85 %33 %81 
                                                     OpStore %169 %168 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 565
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %132 %139 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD3 Location 12 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpDecorate %24 DescriptorSet 24 
                                                      OpDecorate %24 Binding 24 
                                                      OpMemberDecorate %35 0 Offset 35 
                                                      OpMemberDecorate %35 1 Offset 35 
                                                      OpMemberDecorate %35 2 Offset 35 
                                                      OpMemberDecorate %35 3 Offset 35 
                                                      OpMemberDecorate %35 4 Offset 35 
                                                      OpMemberDecorate %35 5 Offset 35 
                                                      OpMemberDecorate %35 6 Offset 35 
                                                      OpMemberDecorate %35 7 Offset 35 
                                                      OpDecorate %35 Block 
                                                      OpDecorate %37 DescriptorSet 37 
                                                      OpDecorate %37 Binding 37 
                                                      OpDecorate %132 Location 132 
                                                      OpDecorate vs_TEXCOORD0 Location 139 
                                                      OpDecorate %174 DescriptorSet 174 
                                                      OpDecorate %174 Binding 174 
                                                      OpDecorate %176 DescriptorSet 176 
                                                      OpDecorate %176 Binding 176 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 2 
                                               %8 = OpTypePointer Private %7 
                                Private f32_2* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 4 
                                              %11 = OpTypePointer Input %10 
                        Input f32_4* vs_TEXCOORD3 = OpVariable Input 
                                              %18 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %19 = OpTypePointer UniformConstant %18 
         UniformConstant read_only Texture2D* %20 = OpVariable UniformConstant 
                                              %22 = OpTypeSampler 
                                              %23 = OpTypePointer UniformConstant %22 
                     UniformConstant sampler* %24 = OpVariable UniformConstant 
                                              %26 = OpTypeSampledImage %18 
                                              %30 = OpTypeInt 32 0 
                                          u32 %31 = OpConstant 0 
                                              %33 = OpTypePointer Private %6 
                                              %35 = OpTypeStruct %10 %10 %6 %6 %6 %6 %7 %10 
                                              %36 = OpTypePointer Uniform %35 
Uniform struct {f32_4; f32_4; f32; f32; f32; f32; f32_2; f32_4;}* %37 = OpVariable Uniform 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 1 
                                          u32 %40 = OpConstant 2 
                                              %41 = OpTypePointer Uniform %6 
                                          u32 %47 = OpConstant 3 
                                          f32 %52 = OpConstant 3.674022E-40 
                                 Private f32* %57 = OpVariable Private 
                                          i32 %58 = OpConstant 5 
                                          f32 %61 = OpConstant 3.674022E-40 
                                          i32 %68 = OpConstant 3 
                                          i32 %71 = OpConstant 4 
                                          f32 %75 = OpConstant 3.674022E-40 
                                        f32_2 %76 = OpConstantComposite %75 %75 
                                          f32 %79 = OpConstant 3.674022E-40 
                                         f32 %106 = OpConstant 3.674022E-40 
                                         f32 %108 = OpConstant 3.674022E-40 
                                             %121 = OpTypeBool 
                                             %122 = OpTypePointer Private %121 
                               Private bool* %123 = OpVariable Private 
                                         i32 %124 = OpConstant 2 
                                             %131 = OpTypePointer Output %10 
                               Output f32_4* %132 = OpVariable Output 
                                             %136 = OpTypePointer Private %10 
                              Private f32_4* %137 = OpVariable Private 
                                             %138 = OpTypePointer Input %7 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                         i32 %141 = OpConstant 7 
                                             %142 = OpTypePointer Uniform %10 
                                         i32 %153 = OpConstant 6 
                                         u32 %154 = OpConstant 1 
                                Private f32* %158 = OpVariable Private 
                                             %164 = OpTypePointer Function %6 
        UniformConstant read_only Texture2D* %174 = OpVariable UniformConstant 
                    UniformConstant sampler* %176 = OpVariable UniformConstant 
                              Private f32_2* %182 = OpVariable Private 
                                         f32 %184 = OpConstant 3.674022E-40 
                                             %186 = OpTypePointer Function %38 
                                         i32 %188 = OpConstant 0 
                                         i32 %195 = OpConstant 100 
                               Private bool* %197 = OpVariable Private 
                                         f32 %200 = OpConstant 3.674022E-40 
                               Private bool* %202 = OpVariable Private 
                                         f32 %203 = OpConstant 3.674022E-40 
                                         f32 %216 = OpConstant 3.674022E-40 
                              Private f32_4* %226 = OpVariable Private 
                                         f32 %230 = OpConstant 3.674022E-40 
                                             %232 = OpTypePointer Private %38 
                                Private i32* %233 = OpVariable Private 
                                        bool %239 = OpConstantTrue 
                               Private bool* %240 = OpVariable Private 
                                             %247 = OpTypeVector %6 3 
                                             %248 = OpTypePointer Private %247 
                              Private f32_3* %249 = OpVariable Private 
                                         f32 %252 = OpConstant 3.674022E-40 
                                         f32 %253 = OpConstant 3.674022E-40 
                                       f32_3 %254 = OpConstantComposite %252 %253 %216 
                                         i32 %256 = OpConstant -4128768 
                              Private f32_3* %261 = OpVariable Private 
                              Private f32_3* %264 = OpVariable Private 
                                         f32 %267 = OpConstant 3.674022E-40 
                                Private f32* %269 = OpVariable Private 
                                Private f32* %270 = OpVariable Private 
                               Private bool* %276 = OpVariable Private 
                              Private f32_3* %283 = OpVariable Private 
                                         f32 %295 = OpConstant 3.674022E-40 
                                       f32_3 %296 = OpConstantComposite %295 %295 %295 
                                       f32_3 %300 = OpConstantComposite %216 %216 %216 
                                         f32 %312 = OpConstant 3.674022E-40 
                                       f32_3 %313 = OpConstantComposite %312 %312 %312 
                                         f32 %323 = OpConstant 3.674022E-40 
                                         f32 %327 = OpConstant 3.674022E-40 
                                       f32_3 %328 = OpConstantComposite %327 %327 %327 
                                Private f32* %330 = OpVariable Private 
                                         f32 %365 = OpConstant 3.674022E-40 
                                       f32_3 %366 = OpConstantComposite %365 %365 %365 
                                         f32 %368 = OpConstant 3.674022E-40 
                                       f32_3 %369 = OpConstantComposite %368 %368 %368 
                               Private bool* %383 = OpVariable Private 
                                Private f32* %428 = OpVariable Private 
                                Private f32* %498 = OpVariable Private 
                                         f32 %501 = OpConstant 3.674022E-40 
                                Private f32* %511 = OpVariable Private 
                                Private i32* %564 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %165 = OpVariable Function 
                               Function i32* %187 = OpVariable Function 
                                        f32_4 %13 = OpLoad vs_TEXCOORD3 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                        f32_4 %15 = OpLoad vs_TEXCOORD3 
                                        f32_2 %16 = OpVectorShuffle %15 %15 3 3 
                                        f32_2 %17 = OpFDiv %14 %16 
                                                      OpStore %9 %17 
                          read_only Texture2D %21 = OpLoad %20 
                                      sampler %25 = OpLoad %24 
                   read_only Texture2DSampled %27 = OpSampledImage %21 %25 
                                        f32_2 %28 = OpLoad %9 
                                        f32_4 %29 = OpImageSampleImplicitLod %27 %28 
                                          f32 %32 = OpCompositeExtract %29 0 
                                 Private f32* %34 = OpAccessChain %9 %31 
                                                      OpStore %34 %32 
                                 Uniform f32* %42 = OpAccessChain %37 %39 %40 
                                          f32 %43 = OpLoad %42 
                                 Private f32* %44 = OpAccessChain %9 %31 
                                          f32 %45 = OpLoad %44 
                                          f32 %46 = OpFMul %43 %45 
                                 Uniform f32* %48 = OpAccessChain %37 %39 %47 
                                          f32 %49 = OpLoad %48 
                                          f32 %50 = OpFAdd %46 %49 
                                 Private f32* %51 = OpAccessChain %9 %31 
                                                      OpStore %51 %50 
                                 Private f32* %53 = OpAccessChain %9 %31 
                                          f32 %54 = OpLoad %53 
                                          f32 %55 = OpFDiv %52 %54 
                                 Private f32* %56 = OpAccessChain %9 %31 
                                                      OpStore %56 %55 
                                 Uniform f32* %59 = OpAccessChain %37 %58 
                                          f32 %60 = OpLoad %59 
                                          f32 %62 = OpFMul %60 %61 
                                                      OpStore %57 %62 
                                 Private f32* %63 = OpAccessChain %9 %31 
                                          f32 %64 = OpLoad %63 
                                          f32 %65 = OpLoad %57 
                                          f32 %66 = OpFDiv %64 %65 
                                 Private f32* %67 = OpAccessChain %9 %31 
                                                      OpStore %67 %66 
                                 Uniform f32* %69 = OpAccessChain %37 %68 
                                          f32 %70 = OpLoad %69 
                                 Uniform f32* %72 = OpAccessChain %37 %71 
                                          f32 %73 = OpLoad %72 
                                        f32_2 %74 = OpCompositeConstruct %70 %73 
                                          f32 %77 = OpDot %74 %76 
                                                      OpStore %57 %77 
                                          f32 %78 = OpLoad %57 
                                          f32 %80 = OpExtInst %1 43 %78 %79 %52 
                                                      OpStore %57 %80 
                                          f32 %81 = OpLoad %57 
                                 Uniform f32* %82 = OpAccessChain %37 %68 
                                          f32 %83 = OpLoad %82 
                                          f32 %84 = OpFNegate %83 
                                          f32 %85 = OpFAdd %81 %84 
                                                      OpStore %57 %85 
                                 Private f32* %86 = OpAccessChain %9 %31 
                                          f32 %87 = OpLoad %86 
                                 Uniform f32* %88 = OpAccessChain %37 %68 
                                          f32 %89 = OpLoad %88 
                                          f32 %90 = OpFNegate %89 
                                          f32 %91 = OpFAdd %87 %90 
                                 Private f32* %92 = OpAccessChain %9 %31 
                                                      OpStore %92 %91 
                                          f32 %93 = OpLoad %57 
                                          f32 %94 = OpFDiv %52 %93 
                                                      OpStore %57 %94 
                                          f32 %95 = OpLoad %57 
                                 Private f32* %96 = OpAccessChain %9 %31 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpFMul %95 %97 
                                 Private f32* %99 = OpAccessChain %9 %31 
                                                      OpStore %99 %98 
                                Private f32* %100 = OpAccessChain %9 %31 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpExtInst %1 43 %101 %79 %52 
                                Private f32* %103 = OpAccessChain %9 %31 
                                                      OpStore %103 %102 
                                Private f32* %104 = OpAccessChain %9 %31 
                                         f32 %105 = OpLoad %104 
                                         f32 %107 = OpFMul %105 %106 
                                         f32 %109 = OpFAdd %107 %108 
                                                      OpStore %57 %109 
                                Private f32* %110 = OpAccessChain %9 %31 
                                         f32 %111 = OpLoad %110 
                                Private f32* %112 = OpAccessChain %9 %31 
                                         f32 %113 = OpLoad %112 
                                         f32 %114 = OpFMul %111 %113 
                                Private f32* %115 = OpAccessChain %9 %31 
                                                      OpStore %115 %114 
                                Private f32* %116 = OpAccessChain %9 %31 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpLoad %57 
                                         f32 %119 = OpFMul %117 %118 
                                Private f32* %120 = OpAccessChain %9 %31 
                                                      OpStore %120 %119 
                                Uniform f32* %125 = OpAccessChain %37 %124 
                                         f32 %126 = OpLoad %125 
                                        bool %127 = OpFOrdEqual %126 %52 
                                                      OpStore %123 %127 
                                        bool %128 = OpLoad %123 
                                                      OpSelectionMerge %130 None 
                                                      OpBranchConditional %128 %129 %130 
                                             %129 = OpLabel 
                                       f32_2 %133 = OpLoad %9 
                                       f32_4 %134 = OpVectorShuffle %133 %133 0 0 0 0 
                                                      OpStore %132 %134 
                                                      OpReturn
                                             %130 = OpLabel 
                                       f32_2 %140 = OpLoad vs_TEXCOORD0 
                              Uniform f32_4* %143 = OpAccessChain %37 %141 
                                       f32_4 %144 = OpLoad %143 
                                       f32_2 %145 = OpVectorShuffle %144 %144 0 1 
                                       f32_2 %146 = OpFMul %140 %145 
                              Uniform f32_4* %147 = OpAccessChain %37 %141 
                                       f32_4 %148 = OpLoad %147 
                                       f32_2 %149 = OpVectorShuffle %148 %148 2 3 
                                       f32_2 %150 = OpFAdd %146 %149 
                                       f32_4 %151 = OpLoad %137 
                                       f32_4 %152 = OpVectorShuffle %151 %150 4 5 2 3 
                                                      OpStore %137 %152 
                                Uniform f32* %155 = OpAccessChain %37 %153 %154 
                                         f32 %156 = OpLoad %155 
                                        bool %157 = OpFOrdLessThan %156 %79 
                                                      OpStore %123 %157 
                                Private f32* %159 = OpAccessChain %137 %154 
                                         f32 %160 = OpLoad %159 
                                         f32 %161 = OpFNegate %160 
                                         f32 %162 = OpFAdd %161 %52 
                                                      OpStore %158 %162 
                                        bool %163 = OpLoad %123 
                                                      OpSelectionMerge %167 None 
                                                      OpBranchConditional %163 %166 %169 
                                             %166 = OpLabel 
                                         f32 %168 = OpLoad %158 
                                                      OpStore %165 %168 
                                                      OpBranch %167 
                                             %169 = OpLabel 
                                Private f32* %170 = OpAccessChain %137 %154 
                                         f32 %171 = OpLoad %170 
                                                      OpStore %165 %171 
                                                      OpBranch %167 
                                             %167 = OpLabel 
                                         f32 %172 = OpLoad %165 
                                Private f32* %173 = OpAccessChain %137 %40 
                                                      OpStore %173 %172 
                         read_only Texture2D %175 = OpLoad %174 
                                     sampler %177 = OpLoad %176 
                  read_only Texture2DSampled %178 = OpSampledImage %175 %177 
                                       f32_4 %179 = OpLoad %137 
                                       f32_2 %180 = OpVectorShuffle %179 %179 0 2 
                                       f32_4 %181 = OpImageSampleImplicitLod %178 %180 
                                                      OpStore %137 %181 
                                Private f32* %183 = OpAccessChain %182 %31 
                                                      OpStore %183 %79 
                                Private f32* %185 = OpAccessChain %182 %154 
                                                      OpStore %185 %184 
                                                      OpStore %187 %188 
                                                      OpBranch %189 
                                             %189 = OpLabel 
                                                      OpLoopMerge %191 %192 None 
                                                      OpBranch %193 
                                             %193 = OpLabel 
                                         i32 %194 = OpLoad %187 
                                        bool %196 = OpSLessThan %194 %195 
                                                      OpBranchConditional %196 %190 %191 
                                             %190 = OpLabel 
                                Private f32* %198 = OpAccessChain %182 %154 
                                         f32 %199 = OpLoad %198 
                                        bool %201 = OpFOrdLessThan %199 %200 
                                                      OpStore %197 %201 
                                Private f32* %204 = OpAccessChain %182 %31 
                                         f32 %205 = OpLoad %204 
                                        bool %206 = OpFOrdLessThan %203 %205 
                                                      OpStore %202 %206 
                                        bool %207 = OpLoad %202 
                                        bool %208 = OpLoad %197 
                                        bool %209 = OpLogicalOr %207 %208 
                                                      OpStore %197 %209 
                                        bool %210 = OpLoad %197 
                                                      OpSelectionMerge %212 None 
                                                      OpBranchConditional %210 %211 %212 
                                             %211 = OpLabel 
                                                      OpBranch %191 
                                             %212 = OpLabel 
                                Private f32* %214 = OpAccessChain %182 %154 
                                         f32 %215 = OpLoad %214 
                                         f32 %217 = OpFMul %215 %216 
                                Private f32* %218 = OpAccessChain %182 %31 
                                         f32 %219 = OpLoad %218 
                                         f32 %220 = OpFAdd %217 %219 
                                Private f32* %221 = OpAccessChain %9 %154 
                                                      OpStore %221 %220 
                                       f32_2 %222 = OpLoad %9 
                                       f32_2 %223 = OpVectorShuffle %222 %222 1 0 
                                                      OpStore %182 %223 
                                                      OpBranch %192 
                                             %192 = OpLabel 
                                         i32 %224 = OpLoad %187 
                                         i32 %225 = OpIAdd %224 %39 
                                                      OpStore %187 %225 
                                                      OpBranch %189 
                                             %191 = OpLabel 
                                Private f32* %227 = OpAccessChain %226 %31 
                                                      OpStore %227 %79 
                                Private f32* %228 = OpAccessChain %226 %154 
                                                      OpStore %228 %79 
                                Private f32* %229 = OpAccessChain %226 %40 
                                                      OpStore %229 %79 
                                Private f32* %231 = OpAccessChain %9 %31 
                                                      OpStore %231 %230 
                                                      OpStore %233 %188 
                                                      OpBranch %234 
                                             %234 = OpLabel 
                                                      OpLoopMerge %236 %237 None 
                                                      OpBranch %238 
                                             %238 = OpLabel 
                                                      OpBranchConditional %239 %235 %236 
                                             %235 = OpLabel 
                                         i32 %241 = OpLoad %233 
                                        bool %242 = OpSGreaterThanEqual %241 %141 
                                                      OpStore %240 %242 
                                        bool %243 = OpLoad %240 
                                                      OpSelectionMerge %245 None 
                                                      OpBranchConditional %243 %244 %245 
                                             %244 = OpLabel 
                                                      OpBranch %236 
                                             %245 = OpLabel 
                                       f32_2 %250 = OpLoad %9 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 0 0 
                                       f32_3 %255 = OpFAdd %251 %254 
                                                      OpStore %249 %255 
                                         f32 %257 = OpBitcast %256 
                                Private f32* %258 = OpAccessChain %249 %31 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFDiv %257 %259 
                                                      OpStore %158 %260 
                                         f32 %262 = OpLoad %158 
                                       f32_3 %263 = OpCompositeConstruct %262 %262 %262 
                                                      OpStore %261 %263 
                                         f32 %265 = OpLoad %158 
                                       f32_3 %266 = OpCompositeConstruct %265 %265 %265 
                                                      OpStore %264 %266 
                                Private f32* %268 = OpAccessChain %249 %31 
                                                      OpStore %268 %267 
                                                      OpStore %269 %79 
                                                      OpStore %270 %79 
                                                      OpBranch %271 
                                             %271 = OpLabel 
                                                      OpLoopMerge %273 %274 None 
                                                      OpBranch %275 
                                             %275 = OpLabel 
                                                      OpBranchConditional %239 %272 %273 
                                             %272 = OpLabel 
                                         f32 %277 = OpLoad %270 
                                        bool %278 = OpFOrdLessThan %108 %277 
                                                      OpStore %276 %278 
                                        bool %279 = OpLoad %276 
                                                      OpSelectionMerge %281 None 
                                                      OpBranchConditional %279 %280 %281 
                                             %280 = OpLabel 
                                                      OpBranch %273 
                                             %281 = OpLabel 
                                       f32_3 %284 = OpLoad %264 
                                       f32_2 %285 = OpVectorShuffle %284 %284 0 1 
                                       f32_3 %286 = OpLoad %264 
                                       f32_2 %287 = OpVectorShuffle %286 %286 0 1 
                                       f32_2 %288 = OpFAdd %285 %287 
                                       f32_3 %289 = OpLoad %283 
                                       f32_3 %290 = OpVectorShuffle %289 %288 3 4 2 
                                                      OpStore %283 %290 
                                       f32_3 %291 = OpLoad %283 
                                       f32_3 %292 = OpVectorShuffle %291 %291 1 0 0 
                                       f32_3 %293 = OpExtInst %1 10 %292 
                                                      OpStore %283 %293 
                                       f32_3 %294 = OpLoad %283 
                                       f32_3 %297 = OpFAdd %294 %296 
                                                      OpStore %283 %297 
                                       f32_3 %298 = OpLoad %264 
                                       f32_3 %299 = OpVectorShuffle %298 %298 2 2 1 
                                       f32_3 %301 = OpFMul %299 %300 
                                       f32_3 %302 = OpLoad %283 
                                       f32_3 %303 = OpExtInst %1 4 %302 
                                       f32_3 %304 = OpFAdd %301 %303 
                                                      OpStore %283 %304 
                                       f32_3 %305 = OpLoad %283 
                                       f32_3 %306 = OpExtInst %1 10 %305 
                                                      OpStore %283 %306 
                                       f32_3 %307 = OpLoad %283 
                                       f32_3 %308 = OpFAdd %307 %296 
                                                      OpStore %283 %308 
                              Uniform f32_4* %309 = OpAccessChain %37 %188 
                                       f32_4 %310 = OpLoad %309 
                                       f32_3 %311 = OpVectorShuffle %310 %310 0 1 2 
                                       f32_3 %314 = OpFMul %311 %313 
                                       f32_3 %315 = OpLoad %283 
                                       f32_3 %316 = OpExtInst %1 4 %315 
                                       f32_3 %317 = OpFAdd %314 %316 
                                                      OpStore %283 %317 
                                       f32_3 %318 = OpLoad %261 
                                       f32_3 %319 = OpLoad %283 
                                       f32_3 %320 = OpFAdd %318 %319 
                                                      OpStore %283 %320 
                                Private f32* %321 = OpAccessChain %249 %31 
                                         f32 %322 = OpLoad %321 
                                         f32 %324 = OpFMul %322 %323 
                                Private f32* %325 = OpAccessChain %249 %31 
                                                      OpStore %325 %324 
                                       f32_3 %326 = OpLoad %283 
                                       f32_3 %329 = OpFMul %326 %328 
                                                      OpStore %261 %329 
                                Private f32* %331 = OpAccessChain %261 %154 
                                         f32 %332 = OpLoad %331 
                                         f32 %333 = OpExtInst %1 10 %332 
                                                      OpStore %330 %333 
                                         f32 %334 = OpLoad %330 
                                         f32 %335 = OpFAdd %334 %295 
                                                      OpStore %330 %335 
                                Private f32* %336 = OpAccessChain %283 %31 
                                         f32 %337 = OpLoad %336 
                                         f32 %338 = OpFMul %337 %327 
                                         f32 %339 = OpLoad %330 
                                         f32 %340 = OpExtInst %1 4 %339 
                                         f32 %341 = OpFAdd %338 %340 
                                                      OpStore %330 %341 
                                         f32 %342 = OpLoad %330 
                                         f32 %343 = OpExtInst %1 10 %342 
                                                      OpStore %330 %343 
                                         f32 %344 = OpLoad %330 
                                         f32 %345 = OpFAdd %344 %295 
                                                      OpStore %330 %345 
                                Private f32* %346 = OpAccessChain %283 %40 
                                         f32 %347 = OpLoad %346 
                                         f32 %348 = OpFMul %347 %327 
                                         f32 %349 = OpLoad %330 
                                         f32 %350 = OpExtInst %1 4 %349 
                                         f32 %351 = OpFAdd %348 %350 
                                                      OpStore %330 %351 
                                         f32 %352 = OpLoad %330 
                                         f32 %353 = OpExtInst %1 10 %352 
                                                      OpStore %330 %353 
                                         f32 %354 = OpLoad %330 
                                         f32 %355 = OpFAdd %354 %295 
                                                      OpStore %330 %355 
                                         f32 %356 = OpLoad %330 
                                         f32 %357 = OpExtInst %1 4 %356 
                                Private f32* %358 = OpAccessChain %249 %31 
                                         f32 %359 = OpLoad %358 
                                         f32 %360 = OpFDiv %357 %359 
                                                      OpStore %330 %360 
                                         f32 %361 = OpLoad %269 
                                         f32 %362 = OpLoad %330 
                                         f32 %363 = OpFAdd %361 %362 
                                                      OpStore %269 %363 
                                       f32_3 %364 = OpLoad %264 
                                       f32_3 %367 = OpFMul %364 %366 
                                       f32_3 %370 = OpFAdd %367 %369 
                                                      OpStore %264 %370 
                                         f32 %371 = OpLoad %270 
                                         f32 %372 = OpFAdd %371 %52 
                                                      OpStore %270 %372 
                                                      OpBranch %274 
                                             %274 = OpLabel 
                                                      OpBranch %271 
                                             %273 = OpLabel 
                                         f32 %373 = OpLoad %158 
                                       f32_3 %374 = OpCompositeConstruct %373 %373 %373 
                                                      OpStore %261 %374 
                                         f32 %375 = OpLoad %158 
                                       f32_3 %376 = OpCompositeConstruct %375 %375 %375 
                                                      OpStore %264 %376 
                                Private f32* %377 = OpAccessChain %249 %31 
                                                      OpStore %377 %267 
                                                      OpStore %270 %79 
                                                      OpStore %330 %79 
                                                      OpBranch %378 
                                             %378 = OpLabel 
                                                      OpLoopMerge %380 %381 None 
                                                      OpBranch %382 
                                             %382 = OpLabel 
                                                      OpBranchConditional %239 %379 %380 
                                             %379 = OpLabel 
                                         f32 %384 = OpLoad %330 
                                        bool %385 = OpFOrdLessThan %108 %384 
                                                      OpStore %383 %385 
                                        bool %386 = OpLoad %383 
                                                      OpSelectionMerge %388 None 
                                                      OpBranchConditional %386 %387 %388 
                                             %387 = OpLabel 
                                                      OpBranch %380 
                                             %388 = OpLabel 
                                       f32_3 %390 = OpLoad %264 
                                       f32_2 %391 = OpVectorShuffle %390 %390 0 1 
                                       f32_3 %392 = OpLoad %264 
                                       f32_2 %393 = OpVectorShuffle %392 %392 0 1 
                                       f32_2 %394 = OpFAdd %391 %393 
                                       f32_3 %395 = OpLoad %283 
                                       f32_3 %396 = OpVectorShuffle %395 %394 3 4 2 
                                                      OpStore %283 %396 
                                       f32_3 %397 = OpLoad %283 
                                       f32_3 %398 = OpVectorShuffle %397 %397 1 0 0 
                                       f32_3 %399 = OpExtInst %1 10 %398 
                                                      OpStore %283 %399 
                                       f32_3 %400 = OpLoad %283 
                                       f32_3 %401 = OpFAdd %400 %296 
                                                      OpStore %283 %401 
                                       f32_3 %402 = OpLoad %264 
                                       f32_3 %403 = OpVectorShuffle %402 %402 2 2 1 
                                       f32_3 %404 = OpFMul %403 %300 
                                       f32_3 %405 = OpLoad %283 
                                       f32_3 %406 = OpExtInst %1 4 %405 
                                       f32_3 %407 = OpFAdd %404 %406 
                                                      OpStore %283 %407 
                                       f32_3 %408 = OpLoad %283 
                                       f32_3 %409 = OpExtInst %1 10 %408 
                                                      OpStore %283 %409 
                                       f32_3 %410 = OpLoad %283 
                                       f32_3 %411 = OpFAdd %410 %296 
                                                      OpStore %283 %411 
                              Uniform f32_4* %412 = OpAccessChain %37 %188 
                                       f32_4 %413 = OpLoad %412 
                                       f32_3 %414 = OpVectorShuffle %413 %413 0 1 2 
                                       f32_3 %415 = OpFMul %414 %313 
                                       f32_3 %416 = OpLoad %283 
                                       f32_3 %417 = OpExtInst %1 4 %416 
                                       f32_3 %418 = OpFAdd %415 %417 
                                                      OpStore %283 %418 
                                       f32_3 %419 = OpLoad %261 
                                       f32_3 %420 = OpLoad %283 
                                       f32_3 %421 = OpFAdd %419 %420 
                                                      OpStore %283 %421 
                                Private f32* %422 = OpAccessChain %249 %31 
                                         f32 %423 = OpLoad %422 
                                         f32 %424 = OpFMul %423 %323 
                                Private f32* %425 = OpAccessChain %249 %31 
                                                      OpStore %425 %424 
                                       f32_3 %426 = OpLoad %283 
                                       f32_3 %427 = OpFMul %426 %328 
                                                      OpStore %261 %427 
                                Private f32* %429 = OpAccessChain %261 %154 
                                         f32 %430 = OpLoad %429 
                                         f32 %431 = OpExtInst %1 10 %430 
                                                      OpStore %428 %431 
                                         f32 %432 = OpLoad %428 
                                         f32 %433 = OpFAdd %432 %295 
                                                      OpStore %428 %433 
                                Private f32* %434 = OpAccessChain %283 %31 
                                         f32 %435 = OpLoad %434 
                                         f32 %436 = OpFMul %435 %327 
                                         f32 %437 = OpLoad %428 
                                         f32 %438 = OpExtInst %1 4 %437 
                                         f32 %439 = OpFAdd %436 %438 
                                Private f32* %440 = OpAccessChain %283 %31 
                                                      OpStore %440 %439 
                                Private f32* %441 = OpAccessChain %283 %31 
                                         f32 %442 = OpLoad %441 
                                         f32 %443 = OpExtInst %1 10 %442 
                                Private f32* %444 = OpAccessChain %283 %31 
                                                      OpStore %444 %443 
                                Private f32* %445 = OpAccessChain %283 %31 
                                         f32 %446 = OpLoad %445 
                                         f32 %447 = OpFAdd %446 %295 
                                Private f32* %448 = OpAccessChain %283 %31 
                                                      OpStore %448 %447 
                                Private f32* %449 = OpAccessChain %283 %40 
                                         f32 %450 = OpLoad %449 
                                         f32 %451 = OpFMul %450 %327 
                                Private f32* %452 = OpAccessChain %283 %31 
                                         f32 %453 = OpLoad %452 
                                         f32 %454 = OpExtInst %1 4 %453 
                                         f32 %455 = OpFAdd %451 %454 
                                Private f32* %456 = OpAccessChain %283 %31 
                                                      OpStore %456 %455 
                                Private f32* %457 = OpAccessChain %283 %31 
                                         f32 %458 = OpLoad %457 
                                         f32 %459 = OpExtInst %1 10 %458 
                                Private f32* %460 = OpAccessChain %283 %31 
                                                      OpStore %460 %459 
                                Private f32* %461 = OpAccessChain %283 %31 
                                         f32 %462 = OpLoad %461 
                                         f32 %463 = OpFAdd %462 %295 
                                Private f32* %464 = OpAccessChain %283 %31 
                                                      OpStore %464 %463 
                                Private f32* %465 = OpAccessChain %283 %31 
                                         f32 %466 = OpLoad %465 
                                         f32 %467 = OpExtInst %1 4 %466 
                                Private f32* %468 = OpAccessChain %249 %31 
                                         f32 %469 = OpLoad %468 
                                         f32 %470 = OpFDiv %467 %469 
                                Private f32* %471 = OpAccessChain %283 %31 
                                                      OpStore %471 %470 
                                         f32 %472 = OpLoad %270 
                                Private f32* %473 = OpAccessChain %283 %31 
                                         f32 %474 = OpLoad %473 
                                         f32 %475 = OpFAdd %472 %474 
                                                      OpStore %270 %475 
                                       f32_3 %476 = OpLoad %264 
                                       f32_3 %477 = OpFMul %476 %366 
                                       f32_3 %478 = OpFAdd %477 %369 
                                                      OpStore %264 %478 
                                         f32 %479 = OpLoad %330 
                                         f32 %480 = OpFAdd %479 %52 
                                                      OpStore %330 %480 
                                                      OpBranch %381 
                                             %381 = OpLabel 
                                                      OpBranch %378 
                                             %380 = OpLabel 
                                         f32 %481 = OpLoad %269 
                                         f32 %482 = OpLoad %270 
                                         f32 %483 = OpFNegate %482 
                                         f32 %484 = OpFAdd %481 %483 
                                                      OpStore %158 %484 
                                         f32 %485 = OpLoad %158 
                                         f32 %486 = OpFMul %485 %108 
                                                      OpStore %158 %486 
                                         f32 %487 = OpLoad %158 
                                         f32 %488 = OpExtInst %1 40 %487 %312 
                                                      OpStore %158 %488 
                                         f32 %489 = OpLoad %158 
                                         f32 %490 = OpExtInst %1 37 %489 %52 
                                                      OpStore %158 %490 
                                         f32 %491 = OpLoad %158 
                                         f32 %492 = OpFNegate %491 
                                         f32 %493 = OpFAdd %492 %52 
                                                      OpStore %158 %493 
                                Private f32* %494 = OpAccessChain %9 %31 
                                         f32 %495 = OpLoad %494 
                                         f32 %496 = OpFMul %495 %365 
                                Private f32* %497 = OpAccessChain %249 %31 
                                                      OpStore %497 %496 
                                Private f32* %499 = OpAccessChain %9 %31 
                                         f32 %500 = OpLoad %499 
                                         f32 %502 = OpFMul %500 %501 
                                Private f32* %503 = OpAccessChain %249 %40 
                                         f32 %504 = OpLoad %503 
                                         f32 %505 = OpFAdd %502 %504 
                                                      OpStore %498 %505 
                                Private f32* %506 = OpAccessChain %249 %154 
                                         f32 %507 = OpLoad %506 
                                         f32 %508 = OpFNegate %507 
                                         f32 %509 = OpLoad %498 
                                         f32 %510 = OpFAdd %508 %509 
                                                      OpStore %498 %510 
                                Private f32* %512 = OpAccessChain %182 %31 
                                         f32 %513 = OpLoad %512 
                                Private f32* %514 = OpAccessChain %249 %154 
                                         f32 %515 = OpLoad %514 
                                         f32 %516 = OpFNegate %515 
                                         f32 %517 = OpFAdd %513 %516 
                                                      OpStore %511 %517 
                                         f32 %518 = OpLoad %498 
                                         f32 %519 = OpFDiv %52 %518 
                                                      OpStore %498 %519 
                                         f32 %520 = OpLoad %498 
                                         f32 %521 = OpLoad %511 
                                         f32 %522 = OpFMul %520 %521 
                                                      OpStore %511 %522 
                                         f32 %523 = OpLoad %511 
                                         f32 %524 = OpExtInst %1 43 %523 %79 %52 
                                                      OpStore %511 %524 
                                         f32 %525 = OpLoad %511 
                                         f32 %526 = OpFMul %525 %106 
                                         f32 %527 = OpFAdd %526 %108 
                                                      OpStore %498 %527 
                                         f32 %528 = OpLoad %511 
                                         f32 %529 = OpLoad %511 
                                         f32 %530 = OpFMul %528 %529 
                                                      OpStore %511 %530 
                                         f32 %531 = OpLoad %511 
                                         f32 %532 = OpLoad %498 
                                         f32 %533 = OpFMul %531 %532 
                                                      OpStore %511 %533 
                                         f32 %534 = OpLoad %511 
                                         f32 %535 = OpLoad %269 
                                         f32 %536 = OpFMul %534 %535 
                                                      OpStore %511 %536 
                                         f32 %537 = OpLoad %511 
                                         f32 %538 = OpExtInst %1 37 %537 %52 
                                                      OpStore %511 %538 
                                       f32_4 %539 = OpLoad %226 
                                       f32_3 %540 = OpVectorShuffle %539 %539 0 1 2 
                                       f32_3 %541 = OpFNegate %540 
                                         f32 %542 = OpLoad %158 
                                       f32_3 %543 = OpCompositeConstruct %542 %542 %542 
                                       f32_3 %544 = OpFAdd %541 %543 
                                                      OpStore %261 %544 
                                         f32 %545 = OpLoad %511 
                                       f32_3 %546 = OpCompositeConstruct %545 %545 %545 
                                       f32_3 %547 = OpLoad %261 
                                       f32_3 %548 = OpFMul %546 %547 
                                       f32_4 %549 = OpLoad %226 
                                       f32_3 %550 = OpVectorShuffle %549 %549 0 1 2 
                                       f32_3 %551 = OpFAdd %548 %550 
                                       f32_4 %552 = OpLoad %226 
                                       f32_4 %553 = OpVectorShuffle %552 %551 4 5 6 3 
                                                      OpStore %226 %553 
                                         i32 %554 = OpLoad %233 
                                         i32 %555 = OpIAdd %554 %39 
                                                      OpStore %233 %555 
                                Private f32* %556 = OpAccessChain %249 %31 
                                         f32 %557 = OpLoad %556 
                                Private f32* %558 = OpAccessChain %9 %31 
                                                      OpStore %558 %557 
                                                      OpBranch %237 
                                             %237 = OpLabel 
                                                      OpBranch %234 
                                             %236 = OpLabel 
                                Private f32* %559 = OpAccessChain %226 %47 
                                                      OpStore %559 %52 
                                       f32_4 %560 = OpLoad %137 
                                       f32_4 %561 = OpLoad %226 
                                       f32_4 %562 = OpFAdd %560 %561 
                                                      OpStore %132 %562 
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