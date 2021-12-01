//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Atmosphere_Rain_Pro_3D" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 12104
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
out vec4 vs_TEXCOORD1;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _ZBufferParams;
uniform 	float _TimeX;
uniform 	float _Value;
uniform 	float _Value2;
uniform 	float _Value3;
uniform 	float _Value4;
uniform 	float _Value5;
uniform 	float _Value6;
uniform 	float _Value7;
uniform 	float _Value8;
uniform 	float _Visualize;
uniform 	float Drop_Near;
uniform 	float Drop_Far;
uniform 	float Drop_With_Obj;
uniform 	float Drop_Floor_Fluid;
uniform 	float Myst;
uniform 	vec4 Myst_Color;
uniform 	float _FixDistance;
uniform 	vec4 _ScreenResolution;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform  sampler2D Texture2;
UNITY_LOCATION(2) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
float u_xlat7;
vec2 u_xlat8;
vec2 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7 = _FixDistance * 10.0;
    u_xlat0.x = u_xlat0.x / u_xlat7;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = (-Drop_Near) + Drop_Far;
    u_xlat0.x = u_xlat0.x + (-Drop_Near);
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat1 = u_xlat0.xxxx * vec4(u_xlat7);
    u_xlatb14 = _Visualize==1.0;
    if(u_xlatb14){
        SV_Target0 = u_xlat1;
        return;
    }
    u_xlat14.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = (-u_xlat7) * u_xlat0.x + 1.0;
    u_xlat1.xy = u_xlat0.xx * vec2(Drop_Floor_Fluid, Drop_With_Obj);
    u_xlat7 = u_xlat1.x * (-_Value3) + _Value3;
    u_xlat1.xz = u_xlat14.xy * vec2(vec2(_Value5, _Value5));
    u_xlat2.x = _TimeX * _Value4;
    u_xlat1.x = u_xlat7 * u_xlat1.z + u_xlat1.x;
    u_xlat9.x = _Value2 * 0.25;
    u_xlat3.x = u_xlat1.x * 3.0 + 0.100000001;
    u_xlat4 = u_xlat2.xxxx * vec4(0.800000012, 0.00999999978, 1.20000005, 0.200000003);
    u_xlat3.y = u_xlat1.z * 3.0 + u_xlat4.x;
    u_xlat5 = texture(Texture2, u_xlat3.xy);
    u_xlat1.x = u_xlat9.x * u_xlat5.x;
    u_xlat5.x = u_xlat3.x * 0.649999976 + 0.100000001;
    u_xlat5.y = u_xlat3.y * 0.649999976 + u_xlat2.x;
    u_xlat3 = texture(Texture2, u_xlat5.xy);
    u_xlat15 = u_xlat9.x * u_xlat3.x;
    u_xlat15 = u_xlat15 * 0.5;
    u_xlat1.x = u_xlat1.x * 0.300000012 + u_xlat15;
    u_xlat3.x = u_xlat5.x * 0.649999976 + 0.100000001;
    u_xlat3.y = u_xlat5.y * 0.649999976 + u_xlat4.z;
    u_xlat5 = texture(Texture2, u_xlat3.xy);
    u_xlat15 = u_xlat9.x * u_xlat5.x;
    u_xlat1.x = u_xlat15 * 0.699999988 + u_xlat1.x;
    u_xlat5.x = u_xlat3.x * 0.5 + 0.100000001;
    u_xlat5.y = u_xlat3.y * 0.5 + u_xlat4.z;
    u_xlat3 = texture(Texture2, u_xlat5.xy);
    u_xlat15 = u_xlat9.x * u_xlat3.x;
    u_xlat1.x = u_xlat15 * 0.899999976 + u_xlat1.x;
    u_xlat3.x = u_xlat5.x * 0.400000006 + 0.100000001;
    u_xlat3.y = u_xlat5.y * 0.400000006 + u_xlat4.z;
    u_xlat3 = texture(Texture2, u_xlat3.xy);
    u_xlat15 = u_xlat9.x * u_xlat3.x;
    u_xlat1.x = u_xlat15 * 0.899999976 + u_xlat1.x;
    u_xlat1.x = u_xlat1.y * (-u_xlat1.x) + u_xlat1.x;
    u_xlat3 = texture(_MainTex, u_xlat14.xy);
    u_xlat8.x = u_xlat1.w * _Value6;
    u_xlat8.xy = u_xlat1.xx * u_xlat8.xx + u_xlat14.xy;
    u_xlat5 = texture(_MainTex, u_xlat8.xy);
    u_xlat1 = u_xlat1.xxxx + u_xlat5;
    u_xlat1 = (-u_xlat3) + u_xlat1;
    u_xlat1 = vec4(vec4(_Value, _Value, _Value, _Value)) * u_xlat1 + u_xlat3;
    u_xlat4.x = u_xlat14.x * 0.00100000005 + u_xlat4.w;
    u_xlat4 = texture(Texture2, u_xlat4.xy);
    u_xlat9.x = u_xlat9.x * u_xlat4.y;
    u_xlat9.x = dot(u_xlat9.xx, vec2(vec2(_Value7, _Value7)));
    u_xlat1 = u_xlat1 + u_xlat9.xxxx;
    u_xlat4 = u_xlat14.xyxy * _ScreenResolution.xyxy + vec4(2.0, 4.0, 2.0, -4.0);
    u_xlat4 = u_xlat4 / _ScreenResolution.xyxy;
    u_xlat5 = texture(_MainTex, u_xlat4.xy);
    u_xlat4 = texture(_MainTex, u_xlat4.zw);
    u_xlat4 = (-u_xlat4) + u_xlat5;
    u_xlat9.xy = u_xlat14.xy * _ScreenResolution.xy + vec2(-2.0, 4.0);
    u_xlat9.xy = u_xlat9.xy / _ScreenResolution.xy;
    u_xlat6 = texture(_MainTex, u_xlat9.xy);
    u_xlat5 = u_xlat5 + (-u_xlat6);
    u_xlat4 = abs(u_xlat4) + abs(u_xlat5);
    u_xlat9.x = dot(u_xlat4, u_xlat4);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat4.xy = u_xlat14.xy + vec2(0.400000006, 0.400000006);
    u_xlat14.x = u_xlat0.x * 16.0;
    u_xlat14.x = floor(u_xlat14.x);
    u_xlat14.x = u_xlat14.x * 0.0625;
    u_xlat4.z = u_xlat4.x * 2.0;
    u_xlat14.xy = u_xlat4.zy / u_xlat14.xx;
    u_xlat16 = u_xlat2.x * 64.0;
    u_xlat16 = floor(u_xlat16);
    u_xlat14.xy = vec2(u_xlat16) * vec2(0.015625, 0.0625) + u_xlat14.xy;
    u_xlat7 = u_xlat7 * u_xlat2.x;
    u_xlat4.x = (-u_xlat7) * 0.550000012 + u_xlat14.x;
    u_xlat4.y = (-u_xlat2.x) * 0.150000006 + u_xlat14.y;
    u_xlat4 = texture(Texture2, u_xlat4.xy);
    u_xlat7 = u_xlat9.x * u_xlat4.z;
    u_xlat7 = u_xlat7 * _Value8;
    u_xlat1 = vec4(u_xlat7) * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat1;
    u_xlat1 = (-u_xlat3) + u_xlat1;
    u_xlat1 = vec4(vec4(_Value, _Value, _Value, _Value)) * u_xlat1 + u_xlat3;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat0.x * Myst;
    u_xlat2 = (-u_xlat1) + Myst_Color;
    SV_Target0 = u_xlat0.xxxx * u_xlat2 + u_xlat1;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 127
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %17 %85 %89 %90 %109 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
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
                                                     OpDecorate vs_TEXCOORD1 Location 109 
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
                                             %92 = OpTypePointer Private %6 
                                         u32 %95 = OpConstant 0 
                                             %96 = OpTypePointer Uniform %6 
                                            %101 = OpTypeVector %6 3 
                                        f32 %104 = OpConstant 3.674022E-40 
                                      f32_3 %105 = OpConstantComposite %104 %104 %104 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                            %121 = OpTypePointer Output %6 
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
                                Private f32* %93 = OpAccessChain %15 %81 
                                         f32 %94 = OpLoad %93 
                                Uniform f32* %97 = OpAccessChain %26 %33 %95 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFMul %94 %98 
                               Private f32* %100 = OpAccessChain %15 %81 
                                                     OpStore %100 %99 
                                      f32_4 %102 = OpLoad %15 
                                      f32_3 %103 = OpVectorShuffle %102 %102 0 3 1 
                                      f32_3 %106 = OpFMul %103 %105 
                                      f32_4 %107 = OpLoad %54 
                                      f32_4 %108 = OpVectorShuffle %107 %106 4 1 5 6 
                                                     OpStore %54 %108 
                                      f32_4 %110 = OpLoad %15 
                                      f32_2 %111 = OpVectorShuffle %110 %110 2 3 
                                      f32_4 %112 = OpLoad vs_TEXCOORD1 
                                      f32_4 %113 = OpVectorShuffle %112 %111 0 1 4 5 
                                                     OpStore vs_TEXCOORD1 %113 
                                      f32_4 %114 = OpLoad %54 
                                      f32_2 %115 = OpVectorShuffle %114 %114 2 2 
                                      f32_4 %116 = OpLoad %54 
                                      f32_2 %117 = OpVectorShuffle %116 %116 0 3 
                                      f32_2 %118 = OpFAdd %115 %117 
                                      f32_4 %119 = OpLoad vs_TEXCOORD1 
                                      f32_4 %120 = OpVectorShuffle %119 %118 4 5 2 3 
                                                     OpStore vs_TEXCOORD1 %120 
                                Output f32* %122 = OpAccessChain %85 %33 %81 
                                        f32 %123 = OpLoad %122 
                                        f32 %124 = OpFNegate %123 
                                Output f32* %125 = OpAccessChain %85 %33 %81 
                                                     OpStore %125 %124 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 715
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %136 %140 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD1 Location 12 
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
                                                      OpMemberDecorate %35 8 Offset 35 
                                                      OpMemberDecorate %35 9 Offset 35 
                                                      OpMemberDecorate %35 10 Offset 35 
                                                      OpMemberDecorate %35 11 Offset 35 
                                                      OpMemberDecorate %35 12 Offset 35 
                                                      OpMemberDecorate %35 13 Offset 35 
                                                      OpMemberDecorate %35 14 Offset 35 
                                                      OpMemberDecorate %35 15 Offset 35 
                                                      OpMemberDecorate %35 16 Offset 35 
                                                      OpMemberDecorate %35 17 Offset 35 
                                                      OpMemberDecorate %35 18 Offset 35 
                                                      OpMemberDecorate %35 19 Offset 35 
                                                      OpMemberDecorate %35 20 Offset 35 
                                                      OpDecorate %35 Block 
                                                      OpDecorate %37 DescriptorSet 37 
                                                      OpDecorate %37 Binding 37 
                                                      OpDecorate %136 Location 136 
                                                      OpDecorate vs_TEXCOORD0 Location 140 
                                                      OpDecorate %264 DescriptorSet 264 
                                                      OpDecorate %264 Binding 264 
                                                      OpDecorate %266 DescriptorSet 266 
                                                      OpDecorate %266 Binding 266 
                                                      OpDecorate %410 DescriptorSet 410 
                                                      OpDecorate %410 Binding 410 
                                                      OpDecorate %412 DescriptorSet 412 
                                                      OpDecorate %412 Binding 412 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 2 
                                               %8 = OpTypePointer Private %7 
                                Private f32_2* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 4 
                                              %11 = OpTypePointer Input %10 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
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
                                              %35 = OpTypeStruct %10 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %10 %6 %10 %7 %10 
                                              %36 = OpTypePointer Uniform %35 
Uniform struct {f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4; f32; f32_4; f32_2; f32_4;}* %37 = OpVariable Uniform 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 0 
                                          u32 %40 = OpConstant 2 
                                              %41 = OpTypePointer Uniform %6 
                                          u32 %47 = OpConstant 3 
                                          f32 %52 = OpConstant 3.674022E-40 
                               Private f32_2* %57 = OpVariable Private 
                                          i32 %58 = OpConstant 17 
                                          f32 %61 = OpConstant 3.674022E-40 
                                          f32 %72 = OpConstant 3.674022E-40 
                                          i32 %75 = OpConstant 11 
                                          i32 %79 = OpConstant 12 
                                         f32 %107 = OpConstant 3.674022E-40 
                                         f32 %109 = OpConstant 3.674022E-40 
                                             %118 = OpTypePointer Private %10 
                              Private f32_4* %119 = OpVariable Private 
                                             %125 = OpTypeBool 
                                             %126 = OpTypePointer Private %125 
                               Private bool* %127 = OpVariable Private 
                                         i32 %128 = OpConstant 10 
                                             %135 = OpTypePointer Output %10 
                               Output f32_4* %136 = OpVariable Output 
                                             %139 = OpTypePointer Input %7 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                         i32 %142 = OpConstant 20 
                                             %143 = OpTypePointer Uniform %10 
                                         i32 %154 = OpConstant 19 
                                         u32 %155 = OpConstant 1 
                                Private f32* %159 = OpVariable Private 
                                             %165 = OpTypePointer Function %6 
                                         i32 %185 = OpConstant 14 
                                         i32 %188 = OpConstant 13 
                                         i32 %195 = OpConstant 4 
                              Private f32_4* %204 = OpVariable Private 
                                         i32 %207 = OpConstant 6 
                                         i32 %219 = OpConstant 1 
                                         i32 %222 = OpConstant 5 
                                Private f32* %235 = OpVariable Private 
                                         i32 %236 = OpConstant 3 
                                         f32 %239 = OpConstant 3.674022E-40 
                              Private f32_4* %241 = OpVariable Private 
                                         f32 %245 = OpConstant 3.674022E-40 
                              Private f32_4* %248 = OpVariable Private 
                                         f32 %251 = OpConstant 3.674022E-40 
                                         f32 %252 = OpConstant 3.674022E-40 
                                         f32 %253 = OpConstant 3.674022E-40 
                                         f32 %254 = OpConstant 3.674022E-40 
                                       f32_4 %255 = OpConstantComposite %251 %252 %253 %254 
        UniformConstant read_only Texture2D* %264 = OpVariable UniformConstant 
                    UniformConstant sampler* %266 = OpVariable UniformConstant 
                              Private f32_4* %279 = OpVariable Private 
                                         f32 %282 = OpConstant 3.674022E-40 
                                Private f32* %292 = OpVariable Private 
                                         f32 %304 = OpConstant 3.674022E-40 
                                         f32 %308 = OpConstant 3.674022E-40 
                                         f32 %336 = OpConstant 3.674022E-40 
                                         f32 %365 = OpConstant 3.674022E-40 
                                         f32 %373 = OpConstant 3.674022E-40 
                                Private f32* %400 = OpVariable Private 
        UniformConstant read_only Texture2D* %410 = OpVariable UniformConstant 
                    UniformConstant sampler* %412 = OpVariable UniformConstant 
                                Private f32* %418 = OpVariable Private 
                                         i32 %421 = OpConstant 7 
                                         i32 %449 = OpConstant 2 
                                         f32 %470 = OpConstant 3.674022E-40 
                                         i32 %488 = OpConstant 8 
                                         i32 %504 = OpConstant 18 
                                         f32 %509 = OpConstant 3.674022E-40 
                                         f32 %510 = OpConstant 3.674022E-40 
                                         f32 %511 = OpConstant 3.674022E-40 
                                       f32_4 %512 = OpConstantComposite %509 %510 %509 %511 
                                             %535 = OpTypeVector %6 3 
                                             %536 = OpTypePointer Private %535 
                              Private f32_3* %537 = OpVariable Private 
                                       f32_2 %544 = OpConstantComposite %107 %510 
                              Private f32_4* %556 = OpVariable Private 
                                       f32_2 %579 = OpConstantComposite %373 %373 
                                         f32 %585 = OpConstant 3.674022E-40 
                                         f32 %592 = OpConstant 3.674022E-40 
                                       f32_2 %593 = OpConstantComposite %509 %592 
                                Private f32* %604 = OpVariable Private 
                                         f32 %606 = OpConstant 3.674022E-40 
                                         f32 %612 = OpConstant 3.674022E-40 
                                       f32_2 %613 = OpConstantComposite %612 %592 
                                         f32 %628 = OpConstant 3.674022E-40 
                                         f32 %636 = OpConstant 3.674022E-40 
                                         i32 %657 = OpConstant 9 
                                       f32_4 %664 = OpConstantComposite %239 %239 %239 %239 
                                         i32 %697 = OpConstant 15 
                                         i32 %704 = OpConstant 16 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %166 = OpVariable Function 
                                        f32_4 %13 = OpLoad vs_TEXCOORD1 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                        f32_4 %15 = OpLoad vs_TEXCOORD1 
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
                                 Private f32* %63 = OpAccessChain %57 %31 
                                                      OpStore %63 %62 
                                 Private f32* %64 = OpAccessChain %9 %31 
                                          f32 %65 = OpLoad %64 
                                 Private f32* %66 = OpAccessChain %57 %31 
                                          f32 %67 = OpLoad %66 
                                          f32 %68 = OpFDiv %65 %67 
                                 Private f32* %69 = OpAccessChain %9 %31 
                                                      OpStore %69 %68 
                                 Private f32* %70 = OpAccessChain %9 %31 
                                          f32 %71 = OpLoad %70 
                                          f32 %73 = OpExtInst %1 43 %71 %72 %52 
                                 Private f32* %74 = OpAccessChain %9 %31 
                                                      OpStore %74 %73 
                                 Uniform f32* %76 = OpAccessChain %37 %75 
                                          f32 %77 = OpLoad %76 
                                          f32 %78 = OpFNegate %77 
                                 Uniform f32* %80 = OpAccessChain %37 %79 
                                          f32 %81 = OpLoad %80 
                                          f32 %82 = OpFAdd %78 %81 
                                 Private f32* %83 = OpAccessChain %57 %31 
                                                      OpStore %83 %82 
                                 Private f32* %84 = OpAccessChain %9 %31 
                                          f32 %85 = OpLoad %84 
                                 Uniform f32* %86 = OpAccessChain %37 %75 
                                          f32 %87 = OpLoad %86 
                                          f32 %88 = OpFNegate %87 
                                          f32 %89 = OpFAdd %85 %88 
                                 Private f32* %90 = OpAccessChain %9 %31 
                                                      OpStore %90 %89 
                                 Private f32* %91 = OpAccessChain %57 %31 
                                          f32 %92 = OpLoad %91 
                                          f32 %93 = OpFDiv %52 %92 
                                 Private f32* %94 = OpAccessChain %57 %31 
                                                      OpStore %94 %93 
                                 Private f32* %95 = OpAccessChain %57 %31 
                                          f32 %96 = OpLoad %95 
                                 Private f32* %97 = OpAccessChain %9 %31 
                                          f32 %98 = OpLoad %97 
                                          f32 %99 = OpFMul %96 %98 
                                Private f32* %100 = OpAccessChain %9 %31 
                                                      OpStore %100 %99 
                                Private f32* %101 = OpAccessChain %9 %31 
                                         f32 %102 = OpLoad %101 
                                         f32 %103 = OpExtInst %1 43 %102 %72 %52 
                                Private f32* %104 = OpAccessChain %9 %31 
                                                      OpStore %104 %103 
                                Private f32* %105 = OpAccessChain %9 %31 
                                         f32 %106 = OpLoad %105 
                                         f32 %108 = OpFMul %106 %107 
                                         f32 %110 = OpFAdd %108 %109 
                                Private f32* %111 = OpAccessChain %57 %31 
                                                      OpStore %111 %110 
                                Private f32* %112 = OpAccessChain %9 %31 
                                         f32 %113 = OpLoad %112 
                                Private f32* %114 = OpAccessChain %9 %31 
                                         f32 %115 = OpLoad %114 
                                         f32 %116 = OpFMul %113 %115 
                                Private f32* %117 = OpAccessChain %9 %31 
                                                      OpStore %117 %116 
                                       f32_2 %120 = OpLoad %9 
                                       f32_4 %121 = OpVectorShuffle %120 %120 0 0 0 0 
                                       f32_2 %122 = OpLoad %57 
                                       f32_4 %123 = OpVectorShuffle %122 %122 0 0 0 0 
                                       f32_4 %124 = OpFMul %121 %123 
                                                      OpStore %119 %124 
                                Uniform f32* %129 = OpAccessChain %37 %128 
                                         f32 %130 = OpLoad %129 
                                        bool %131 = OpFOrdEqual %130 %52 
                                                      OpStore %127 %131 
                                        bool %132 = OpLoad %127 
                                                      OpSelectionMerge %134 None 
                                                      OpBranchConditional %132 %133 %134 
                                             %133 = OpLabel 
                                       f32_4 %137 = OpLoad %119 
                                                      OpStore %136 %137 
                                                      OpReturn
                                             %134 = OpLabel 
                                       f32_2 %141 = OpLoad vs_TEXCOORD0 
                              Uniform f32_4* %144 = OpAccessChain %37 %142 
                                       f32_4 %145 = OpLoad %144 
                                       f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                                       f32_2 %147 = OpFMul %141 %146 
                              Uniform f32_4* %148 = OpAccessChain %37 %142 
                                       f32_4 %149 = OpLoad %148 
                                       f32_2 %150 = OpVectorShuffle %149 %149 2 3 
                                       f32_2 %151 = OpFAdd %147 %150 
                                       f32_4 %152 = OpLoad %119 
                                       f32_4 %153 = OpVectorShuffle %152 %151 4 5 2 3 
                                                      OpStore %119 %153 
                                Uniform f32* %156 = OpAccessChain %37 %154 %155 
                                         f32 %157 = OpLoad %156 
                                        bool %158 = OpFOrdLessThan %157 %72 
                                                      OpStore %127 %158 
                                Private f32* %160 = OpAccessChain %119 %155 
                                         f32 %161 = OpLoad %160 
                                         f32 %162 = OpFNegate %161 
                                         f32 %163 = OpFAdd %162 %52 
                                                      OpStore %159 %163 
                                        bool %164 = OpLoad %127 
                                                      OpSelectionMerge %168 None 
                                                      OpBranchConditional %164 %167 %170 
                                             %167 = OpLabel 
                                         f32 %169 = OpLoad %159 
                                                      OpStore %166 %169 
                                                      OpBranch %168 
                                             %170 = OpLabel 
                                Private f32* %171 = OpAccessChain %119 %155 
                                         f32 %172 = OpLoad %171 
                                                      OpStore %166 %172 
                                                      OpBranch %168 
                                             %168 = OpLabel 
                                         f32 %173 = OpLoad %166 
                                Private f32* %174 = OpAccessChain %119 %40 
                                                      OpStore %174 %173 
                                Private f32* %175 = OpAccessChain %57 %31 
                                         f32 %176 = OpLoad %175 
                                         f32 %177 = OpFNegate %176 
                                Private f32* %178 = OpAccessChain %9 %31 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpFMul %177 %179 
                                         f32 %181 = OpFAdd %180 %52 
                                Private f32* %182 = OpAccessChain %9 %31 
                                                      OpStore %182 %181 
                                       f32_2 %183 = OpLoad %9 
                                       f32_2 %184 = OpVectorShuffle %183 %183 0 0 
                                Uniform f32* %186 = OpAccessChain %37 %185 
                                         f32 %187 = OpLoad %186 
                                Uniform f32* %189 = OpAccessChain %37 %188 
                                         f32 %190 = OpLoad %189 
                                       f32_2 %191 = OpCompositeConstruct %187 %190 
                                       f32_2 %192 = OpFMul %184 %191 
                                                      OpStore %57 %192 
                                Private f32* %193 = OpAccessChain %57 %31 
                                         f32 %194 = OpLoad %193 
                                Uniform f32* %196 = OpAccessChain %37 %195 
                                         f32 %197 = OpLoad %196 
                                         f32 %198 = OpFNegate %197 
                                         f32 %199 = OpFMul %194 %198 
                                Uniform f32* %200 = OpAccessChain %37 %195 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpFAdd %199 %201 
                                Private f32* %203 = OpAccessChain %57 %31 
                                                      OpStore %203 %202 
                                       f32_4 %205 = OpLoad %119 
                                       f32_2 %206 = OpVectorShuffle %205 %205 0 2 
                                Uniform f32* %208 = OpAccessChain %37 %207 
                                         f32 %209 = OpLoad %208 
                                Uniform f32* %210 = OpAccessChain %37 %207 
                                         f32 %211 = OpLoad %210 
                                       f32_2 %212 = OpCompositeConstruct %209 %211 
                                         f32 %213 = OpCompositeExtract %212 0 
                                         f32 %214 = OpCompositeExtract %212 1 
                                       f32_2 %215 = OpCompositeConstruct %213 %214 
                                       f32_2 %216 = OpFMul %206 %215 
                                       f32_4 %217 = OpLoad %204 
                                       f32_4 %218 = OpVectorShuffle %217 %216 4 5 2 3 
                                                      OpStore %204 %218 
                                Uniform f32* %220 = OpAccessChain %37 %219 
                                         f32 %221 = OpLoad %220 
                                Uniform f32* %223 = OpAccessChain %37 %222 
                                         f32 %224 = OpLoad %223 
                                         f32 %225 = OpFMul %221 %224 
                                                      OpStore %159 %225 
                                Private f32* %226 = OpAccessChain %57 %31 
                                         f32 %227 = OpLoad %226 
                                Private f32* %228 = OpAccessChain %204 %155 
                                         f32 %229 = OpLoad %228 
                                         f32 %230 = OpFMul %227 %229 
                                Private f32* %231 = OpAccessChain %204 %31 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpFAdd %230 %232 
                                Private f32* %234 = OpAccessChain %204 %31 
                                                      OpStore %234 %233 
                                Uniform f32* %237 = OpAccessChain %37 %236 
                                         f32 %238 = OpLoad %237 
                                         f32 %240 = OpFMul %238 %239 
                                                      OpStore %235 %240 
                                Private f32* %242 = OpAccessChain %204 %31 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpFMul %243 %109 
                                         f32 %246 = OpFAdd %244 %245 
                                Private f32* %247 = OpAccessChain %241 %31 
                                                      OpStore %247 %246 
                                         f32 %249 = OpLoad %159 
                                       f32_4 %250 = OpCompositeConstruct %249 %249 %249 %249 
                                       f32_4 %256 = OpFMul %250 %255 
                                                      OpStore %248 %256 
                                Private f32* %257 = OpAccessChain %204 %155 
                                         f32 %258 = OpLoad %257 
                                         f32 %259 = OpFMul %258 %109 
                                Private f32* %260 = OpAccessChain %248 %31 
                                         f32 %261 = OpLoad %260 
                                         f32 %262 = OpFAdd %259 %261 
                                Private f32* %263 = OpAccessChain %241 %155 
                                                      OpStore %263 %262 
                         read_only Texture2D %265 = OpLoad %264 
                                     sampler %267 = OpLoad %266 
                  read_only Texture2DSampled %268 = OpSampledImage %265 %267 
                                       f32_4 %269 = OpLoad %241 
                                       f32_2 %270 = OpVectorShuffle %269 %269 0 1 
                                       f32_4 %271 = OpImageSampleImplicitLod %268 %270 
                                         f32 %272 = OpCompositeExtract %271 0 
                                Private f32* %273 = OpAccessChain %204 %31 
                                                      OpStore %273 %272 
                                         f32 %274 = OpLoad %235 
                                Private f32* %275 = OpAccessChain %204 %31 
                                         f32 %276 = OpLoad %275 
                                         f32 %277 = OpFMul %274 %276 
                                Private f32* %278 = OpAccessChain %204 %31 
                                                      OpStore %278 %277 
                                Private f32* %280 = OpAccessChain %241 %31 
                                         f32 %281 = OpLoad %280 
                                         f32 %283 = OpFMul %281 %282 
                                         f32 %284 = OpFAdd %283 %245 
                                Private f32* %285 = OpAccessChain %279 %31 
                                                      OpStore %285 %284 
                                Private f32* %286 = OpAccessChain %241 %155 
                                         f32 %287 = OpLoad %286 
                                         f32 %288 = OpFMul %287 %282 
                                         f32 %289 = OpLoad %159 
                                         f32 %290 = OpFAdd %288 %289 
                                Private f32* %291 = OpAccessChain %279 %155 
                                                      OpStore %291 %290 
                         read_only Texture2D %293 = OpLoad %264 
                                     sampler %294 = OpLoad %266 
                  read_only Texture2DSampled %295 = OpSampledImage %293 %294 
                                       f32_4 %296 = OpLoad %279 
                                       f32_2 %297 = OpVectorShuffle %296 %296 0 1 
                                       f32_4 %298 = OpImageSampleImplicitLod %295 %297 
                                         f32 %299 = OpCompositeExtract %298 0 
                                                      OpStore %292 %299 
                                         f32 %300 = OpLoad %235 
                                         f32 %301 = OpLoad %292 
                                         f32 %302 = OpFMul %300 %301 
                                                      OpStore %292 %302 
                                         f32 %303 = OpLoad %292 
                                         f32 %305 = OpFMul %303 %304 
                                                      OpStore %292 %305 
                                Private f32* %306 = OpAccessChain %204 %31 
                                         f32 %307 = OpLoad %306 
                                         f32 %309 = OpFMul %307 %308 
                                         f32 %310 = OpLoad %292 
                                         f32 %311 = OpFAdd %309 %310 
                                Private f32* %312 = OpAccessChain %204 %31 
                                                      OpStore %312 %311 
                                Private f32* %313 = OpAccessChain %279 %31 
                                         f32 %314 = OpLoad %313 
                                         f32 %315 = OpFMul %314 %282 
                                         f32 %316 = OpFAdd %315 %245 
                                Private f32* %317 = OpAccessChain %241 %31 
                                                      OpStore %317 %316 
                                Private f32* %318 = OpAccessChain %279 %155 
                                         f32 %319 = OpLoad %318 
                                         f32 %320 = OpFMul %319 %282 
                                Private f32* %321 = OpAccessChain %248 %40 
                                         f32 %322 = OpLoad %321 
                                         f32 %323 = OpFAdd %320 %322 
                                Private f32* %324 = OpAccessChain %241 %155 
                                                      OpStore %324 %323 
                         read_only Texture2D %325 = OpLoad %264 
                                     sampler %326 = OpLoad %266 
                  read_only Texture2DSampled %327 = OpSampledImage %325 %326 
                                       f32_4 %328 = OpLoad %241 
                                       f32_2 %329 = OpVectorShuffle %328 %328 0 1 
                                       f32_4 %330 = OpImageSampleImplicitLod %327 %329 
                                         f32 %331 = OpCompositeExtract %330 0 
                                                      OpStore %292 %331 
                                         f32 %332 = OpLoad %235 
                                         f32 %333 = OpLoad %292 
                                         f32 %334 = OpFMul %332 %333 
                                                      OpStore %292 %334 
                                         f32 %335 = OpLoad %292 
                                         f32 %337 = OpFMul %335 %336 
                                Private f32* %338 = OpAccessChain %204 %31 
                                         f32 %339 = OpLoad %338 
                                         f32 %340 = OpFAdd %337 %339 
                                Private f32* %341 = OpAccessChain %204 %31 
                                                      OpStore %341 %340 
                                Private f32* %342 = OpAccessChain %241 %31 
                                         f32 %343 = OpLoad %342 
                                         f32 %344 = OpFMul %343 %304 
                                         f32 %345 = OpFAdd %344 %245 
                                Private f32* %346 = OpAccessChain %279 %31 
                                                      OpStore %346 %345 
                                Private f32* %347 = OpAccessChain %241 %155 
                                         f32 %348 = OpLoad %347 
                                         f32 %349 = OpFMul %348 %304 
                                Private f32* %350 = OpAccessChain %248 %40 
                                         f32 %351 = OpLoad %350 
                                         f32 %352 = OpFAdd %349 %351 
                                Private f32* %353 = OpAccessChain %279 %155 
                                                      OpStore %353 %352 
                         read_only Texture2D %354 = OpLoad %264 
                                     sampler %355 = OpLoad %266 
                  read_only Texture2DSampled %356 = OpSampledImage %354 %355 
                                       f32_4 %357 = OpLoad %279 
                                       f32_2 %358 = OpVectorShuffle %357 %357 0 1 
                                       f32_4 %359 = OpImageSampleImplicitLod %356 %358 
                                         f32 %360 = OpCompositeExtract %359 0 
                                                      OpStore %292 %360 
                                         f32 %361 = OpLoad %235 
                                         f32 %362 = OpLoad %292 
                                         f32 %363 = OpFMul %361 %362 
                                                      OpStore %292 %363 
                                         f32 %364 = OpLoad %292 
                                         f32 %366 = OpFMul %364 %365 
                                Private f32* %367 = OpAccessChain %204 %31 
                                         f32 %368 = OpLoad %367 
                                         f32 %369 = OpFAdd %366 %368 
                                Private f32* %370 = OpAccessChain %204 %31 
                                                      OpStore %370 %369 
                                Private f32* %371 = OpAccessChain %279 %31 
                                         f32 %372 = OpLoad %371 
                                         f32 %374 = OpFMul %372 %373 
                                         f32 %375 = OpFAdd %374 %245 
                                Private f32* %376 = OpAccessChain %241 %31 
                                                      OpStore %376 %375 
                                Private f32* %377 = OpAccessChain %279 %155 
                                         f32 %378 = OpLoad %377 
                                         f32 %379 = OpFMul %378 %373 
                                Private f32* %380 = OpAccessChain %248 %40 
                                         f32 %381 = OpLoad %380 
                                         f32 %382 = OpFAdd %379 %381 
                                Private f32* %383 = OpAccessChain %241 %155 
                                                      OpStore %383 %382 
                         read_only Texture2D %384 = OpLoad %264 
                                     sampler %385 = OpLoad %266 
                  read_only Texture2DSampled %386 = OpSampledImage %384 %385 
                                       f32_4 %387 = OpLoad %241 
                                       f32_2 %388 = OpVectorShuffle %387 %387 0 1 
                                       f32_4 %389 = OpImageSampleImplicitLod %386 %388 
                                         f32 %390 = OpCompositeExtract %389 0 
                                                      OpStore %292 %390 
                                         f32 %391 = OpLoad %235 
                                         f32 %392 = OpLoad %292 
                                         f32 %393 = OpFMul %391 %392 
                                                      OpStore %292 %393 
                                         f32 %394 = OpLoad %292 
                                         f32 %395 = OpFMul %394 %365 
                                Private f32* %396 = OpAccessChain %204 %31 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFAdd %395 %397 
                                Private f32* %399 = OpAccessChain %204 %31 
                                                      OpStore %399 %398 
                                Private f32* %401 = OpAccessChain %57 %155 
                                         f32 %402 = OpLoad %401 
                                Private f32* %403 = OpAccessChain %204 %31 
                                         f32 %404 = OpLoad %403 
                                         f32 %405 = OpFNegate %404 
                                         f32 %406 = OpFMul %402 %405 
                                Private f32* %407 = OpAccessChain %204 %31 
                                         f32 %408 = OpLoad %407 
                                         f32 %409 = OpFAdd %406 %408 
                                                      OpStore %400 %409 
                         read_only Texture2D %411 = OpLoad %410 
                                     sampler %413 = OpLoad %412 
                  read_only Texture2DSampled %414 = OpSampledImage %411 %413 
                                       f32_4 %415 = OpLoad %119 
                                       f32_2 %416 = OpVectorShuffle %415 %415 0 1 
                                       f32_4 %417 = OpImageSampleImplicitLod %414 %416 
                                                      OpStore %241 %417 
                                Private f32* %419 = OpAccessChain %119 %47 
                                         f32 %420 = OpLoad %419 
                                Uniform f32* %422 = OpAccessChain %37 %421 
                                         f32 %423 = OpLoad %422 
                                         f32 %424 = OpFMul %420 %423 
                                                      OpStore %418 %424 
                                         f32 %425 = OpLoad %400 
                                       f32_2 %426 = OpCompositeConstruct %425 %425 
                                         f32 %427 = OpLoad %418 
                                       f32_2 %428 = OpCompositeConstruct %427 %427 
                                       f32_2 %429 = OpFMul %426 %428 
                                       f32_4 %430 = OpLoad %119 
                                       f32_2 %431 = OpVectorShuffle %430 %430 0 1 
                                       f32_2 %432 = OpFAdd %429 %431 
                                       f32_4 %433 = OpLoad %204 
                                       f32_4 %434 = OpVectorShuffle %433 %432 4 5 2 3 
                                                      OpStore %204 %434 
                         read_only Texture2D %435 = OpLoad %410 
                                     sampler %436 = OpLoad %412 
                  read_only Texture2DSampled %437 = OpSampledImage %435 %436 
                                       f32_4 %438 = OpLoad %204 
                                       f32_2 %439 = OpVectorShuffle %438 %438 0 1 
                                       f32_4 %440 = OpImageSampleImplicitLod %437 %439 
                                                      OpStore %279 %440 
                                         f32 %441 = OpLoad %400 
                                       f32_4 %442 = OpCompositeConstruct %441 %441 %441 %441 
                                       f32_4 %443 = OpLoad %279 
                                       f32_4 %444 = OpFAdd %442 %443 
                                                      OpStore %279 %444 
                                       f32_4 %445 = OpLoad %241 
                                       f32_4 %446 = OpFNegate %445 
                                       f32_4 %447 = OpLoad %279 
                                       f32_4 %448 = OpFAdd %446 %447 
                                                      OpStore %279 %448 
                                Uniform f32* %450 = OpAccessChain %37 %449 
                                         f32 %451 = OpLoad %450 
                                Uniform f32* %452 = OpAccessChain %37 %449 
                                         f32 %453 = OpLoad %452 
                                Uniform f32* %454 = OpAccessChain %37 %449 
                                         f32 %455 = OpLoad %454 
                                Uniform f32* %456 = OpAccessChain %37 %449 
                                         f32 %457 = OpLoad %456 
                                       f32_4 %458 = OpCompositeConstruct %451 %453 %455 %457 
                                         f32 %459 = OpCompositeExtract %458 0 
                                         f32 %460 = OpCompositeExtract %458 1 
                                         f32 %461 = OpCompositeExtract %458 2 
                                         f32 %462 = OpCompositeExtract %458 3 
                                       f32_4 %463 = OpCompositeConstruct %459 %460 %461 %462 
                                       f32_4 %464 = OpLoad %279 
                                       f32_4 %465 = OpFMul %463 %464 
                                       f32_4 %466 = OpLoad %241 
                                       f32_4 %467 = OpFAdd %465 %466 
                                                      OpStore %279 %467 
                                Private f32* %468 = OpAccessChain %119 %31 
                                         f32 %469 = OpLoad %468 
                                         f32 %471 = OpFMul %469 %470 
                                Private f32* %472 = OpAccessChain %248 %47 
                                         f32 %473 = OpLoad %472 
                                         f32 %474 = OpFAdd %471 %473 
                                Private f32* %475 = OpAccessChain %248 %31 
                                                      OpStore %475 %474 
                         read_only Texture2D %476 = OpLoad %264 
                                     sampler %477 = OpLoad %266 
                  read_only Texture2DSampled %478 = OpSampledImage %476 %477 
                                       f32_4 %479 = OpLoad %248 
                                       f32_2 %480 = OpVectorShuffle %479 %479 0 1 
                                       f32_4 %481 = OpImageSampleImplicitLod %478 %480 
                                         f32 %482 = OpCompositeExtract %481 1 
                                                      OpStore %400 %482 
                                         f32 %483 = OpLoad %235 
                                         f32 %484 = OpLoad %400 
                                         f32 %485 = OpFMul %483 %484 
                                                      OpStore %400 %485 
                                         f32 %486 = OpLoad %400 
                                       f32_2 %487 = OpCompositeConstruct %486 %486 
                                Uniform f32* %489 = OpAccessChain %37 %488 
                                         f32 %490 = OpLoad %489 
                                Uniform f32* %491 = OpAccessChain %37 %488 
                                         f32 %492 = OpLoad %491 
                                       f32_2 %493 = OpCompositeConstruct %490 %492 
                                         f32 %494 = OpCompositeExtract %493 0 
                                         f32 %495 = OpCompositeExtract %493 1 
                                       f32_2 %496 = OpCompositeConstruct %494 %495 
                                         f32 %497 = OpDot %487 %496 
                                                      OpStore %400 %497 
                                         f32 %498 = OpLoad %400 
                                       f32_4 %499 = OpCompositeConstruct %498 %498 %498 %498 
                                       f32_4 %500 = OpLoad %279 
                                       f32_4 %501 = OpFAdd %499 %500 
                                                      OpStore %204 %501 
                                       f32_4 %502 = OpLoad %119 
                                       f32_4 %503 = OpVectorShuffle %502 %502 0 1 0 1 
                              Uniform f32_4* %505 = OpAccessChain %37 %504 
                                       f32_4 %506 = OpLoad %505 
                                       f32_4 %507 = OpVectorShuffle %506 %506 0 1 0 1 
                                       f32_4 %508 = OpFMul %503 %507 
                                       f32_4 %513 = OpFAdd %508 %512 
                                                      OpStore %248 %513 
                                       f32_4 %514 = OpLoad %248 
                              Uniform f32_4* %515 = OpAccessChain %37 %504 
                                       f32_4 %516 = OpLoad %515 
                                       f32_4 %517 = OpVectorShuffle %516 %516 0 1 0 1 
                                       f32_4 %518 = OpFDiv %514 %517 
                                                      OpStore %248 %518 
                         read_only Texture2D %519 = OpLoad %410 
                                     sampler %520 = OpLoad %412 
                  read_only Texture2DSampled %521 = OpSampledImage %519 %520 
                                       f32_4 %522 = OpLoad %248 
                                       f32_2 %523 = OpVectorShuffle %522 %522 0 1 
                                       f32_4 %524 = OpImageSampleImplicitLod %521 %523 
                                                      OpStore %279 %524 
                         read_only Texture2D %525 = OpLoad %410 
                                     sampler %526 = OpLoad %412 
                  read_only Texture2DSampled %527 = OpSampledImage %525 %526 
                                       f32_4 %528 = OpLoad %248 
                                       f32_2 %529 = OpVectorShuffle %528 %528 2 3 
                                       f32_4 %530 = OpImageSampleImplicitLod %527 %529 
                                                      OpStore %248 %530 
                                       f32_4 %531 = OpLoad %248 
                                       f32_4 %532 = OpFNegate %531 
                                       f32_4 %533 = OpLoad %279 
                                       f32_4 %534 = OpFAdd %532 %533 
                                                      OpStore %248 %534 
                                       f32_4 %538 = OpLoad %119 
                                       f32_2 %539 = OpVectorShuffle %538 %538 0 1 
                              Uniform f32_4* %540 = OpAccessChain %37 %504 
                                       f32_4 %541 = OpLoad %540 
                                       f32_2 %542 = OpVectorShuffle %541 %541 0 1 
                                       f32_2 %543 = OpFMul %539 %542 
                                       f32_2 %545 = OpFAdd %543 %544 
                                       f32_3 %546 = OpLoad %537 
                                       f32_3 %547 = OpVectorShuffle %546 %545 3 1 4 
                                                      OpStore %537 %547 
                                       f32_3 %548 = OpLoad %537 
                                       f32_2 %549 = OpVectorShuffle %548 %548 0 2 
                              Uniform f32_4* %550 = OpAccessChain %37 %504 
                                       f32_4 %551 = OpLoad %550 
                                       f32_2 %552 = OpVectorShuffle %551 %551 0 1 
                                       f32_2 %553 = OpFDiv %549 %552 
                                       f32_3 %554 = OpLoad %537 
                                       f32_3 %555 = OpVectorShuffle %554 %553 3 1 4 
                                                      OpStore %537 %555 
                         read_only Texture2D %557 = OpLoad %410 
                                     sampler %558 = OpLoad %412 
                  read_only Texture2DSampled %559 = OpSampledImage %557 %558 
                                       f32_3 %560 = OpLoad %537 
                                       f32_2 %561 = OpVectorShuffle %560 %560 0 2 
                                       f32_4 %562 = OpImageSampleImplicitLod %559 %561 
                                                      OpStore %556 %562 
                                       f32_4 %563 = OpLoad %279 
                                       f32_4 %564 = OpLoad %556 
                                       f32_4 %565 = OpFNegate %564 
                                       f32_4 %566 = OpFAdd %563 %565 
                                                      OpStore %279 %566 
                                       f32_4 %567 = OpLoad %248 
                                       f32_4 %568 = OpExtInst %1 4 %567 
                                       f32_4 %569 = OpLoad %279 
                                       f32_4 %570 = OpExtInst %1 4 %569 
                                       f32_4 %571 = OpFAdd %568 %570 
                                                      OpStore %248 %571 
                                       f32_4 %572 = OpLoad %248 
                                       f32_4 %573 = OpLoad %248 
                                         f32 %574 = OpDot %572 %573 
                                                      OpStore %400 %574 
                                         f32 %575 = OpLoad %400 
                                         f32 %576 = OpExtInst %1 31 %575 
                                                      OpStore %400 %576 
                                       f32_4 %577 = OpLoad %119 
                                       f32_2 %578 = OpVectorShuffle %577 %577 0 2 
                                       f32_2 %580 = OpFAdd %578 %579 
                                       f32_4 %581 = OpLoad %119 
                                       f32_4 %582 = OpVectorShuffle %581 %580 4 5 2 3 
                                                      OpStore %119 %582 
                                Private f32* %583 = OpAccessChain %9 %31 
                                         f32 %584 = OpLoad %583 
                                         f32 %586 = OpFMul %584 %585 
                                                      OpStore %418 %586 
                                         f32 %587 = OpLoad %418 
                                         f32 %588 = OpExtInst %1 8 %587 
                                Private f32* %589 = OpAccessChain %119 %47 
                                                      OpStore %589 %588 
                                       f32_4 %590 = OpLoad %119 
                                       f32_2 %591 = OpVectorShuffle %590 %590 0 3 
                                       f32_2 %594 = OpFMul %591 %593 
                                       f32_4 %595 = OpLoad %119 
                                       f32_4 %596 = OpVectorShuffle %595 %594 0 1 4 5 
                                                      OpStore %119 %596 
                                       f32_4 %597 = OpLoad %119 
                                       f32_2 %598 = OpVectorShuffle %597 %597 2 1 
                                       f32_4 %599 = OpLoad %119 
                                       f32_2 %600 = OpVectorShuffle %599 %599 3 3 
                                       f32_2 %601 = OpFDiv %598 %600 
                                       f32_4 %602 = OpLoad %119 
                                       f32_4 %603 = OpVectorShuffle %602 %601 4 5 2 3 
                                                      OpStore %119 %603 
                                         f32 %605 = OpLoad %159 
                                         f32 %607 = OpFMul %605 %606 
                                                      OpStore %604 %607 
                                         f32 %608 = OpLoad %604 
                                         f32 %609 = OpExtInst %1 8 %608 
                                                      OpStore %604 %609 
                                         f32 %610 = OpLoad %604 
                                       f32_2 %611 = OpCompositeConstruct %610 %610 
                                       f32_2 %614 = OpFMul %611 %613 
                                       f32_4 %615 = OpLoad %119 
                                       f32_2 %616 = OpVectorShuffle %615 %615 0 1 
                                       f32_2 %617 = OpFAdd %614 %616 
                                       f32_4 %618 = OpLoad %119 
                                       f32_4 %619 = OpVectorShuffle %618 %617 4 5 2 3 
                                                      OpStore %119 %619 
                                Private f32* %620 = OpAccessChain %57 %31 
                                         f32 %621 = OpLoad %620 
                                         f32 %622 = OpLoad %159 
                                         f32 %623 = OpFMul %621 %622 
                                Private f32* %624 = OpAccessChain %57 %31 
                                                      OpStore %624 %623 
                                Private f32* %625 = OpAccessChain %57 %31 
                                         f32 %626 = OpLoad %625 
                                         f32 %627 = OpFNegate %626 
                                         f32 %629 = OpFMul %627 %628 
                                Private f32* %630 = OpAccessChain %119 %31 
                                         f32 %631 = OpLoad %630 
                                         f32 %632 = OpFAdd %629 %631 
                                Private f32* %633 = OpAccessChain %248 %31 
                                                      OpStore %633 %632 
                                         f32 %634 = OpLoad %159 
                                         f32 %635 = OpFNegate %634 
                                         f32 %637 = OpFMul %635 %636 
                                Private f32* %638 = OpAccessChain %119 %155 
                                         f32 %639 = OpLoad %638 
                                         f32 %640 = OpFAdd %637 %639 
                                Private f32* %641 = OpAccessChain %248 %155 
                                                      OpStore %641 %640 
                         read_only Texture2D %642 = OpLoad %264 
                                     sampler %643 = OpLoad %266 
                  read_only Texture2DSampled %644 = OpSampledImage %642 %643 
                                       f32_4 %645 = OpLoad %248 
                                       f32_2 %646 = OpVectorShuffle %645 %645 0 1 
                                       f32_4 %647 = OpImageSampleImplicitLod %644 %646 
                                         f32 %648 = OpCompositeExtract %647 2 
                                Private f32* %649 = OpAccessChain %57 %31 
                                                      OpStore %649 %648 
                                Private f32* %650 = OpAccessChain %57 %31 
                                         f32 %651 = OpLoad %650 
                                         f32 %652 = OpLoad %400 
                                         f32 %653 = OpFMul %651 %652 
                                Private f32* %654 = OpAccessChain %57 %31 
                                                      OpStore %654 %653 
                                Private f32* %655 = OpAccessChain %57 %31 
                                         f32 %656 = OpLoad %655 
                                Uniform f32* %658 = OpAccessChain %37 %657 
                                         f32 %659 = OpLoad %658 
                                         f32 %660 = OpFMul %656 %659 
                                Private f32* %661 = OpAccessChain %57 %31 
                                                      OpStore %661 %660 
                                       f32_2 %662 = OpLoad %57 
                                       f32_4 %663 = OpVectorShuffle %662 %662 0 0 0 0 
                                       f32_4 %665 = OpFMul %663 %664 
                                       f32_4 %666 = OpLoad %204 
                                       f32_4 %667 = OpFAdd %665 %666 
                                                      OpStore %119 %667 
                                       f32_4 %668 = OpLoad %241 
                                       f32_4 %669 = OpFNegate %668 
                                       f32_4 %670 = OpLoad %119 
                                       f32_4 %671 = OpFAdd %669 %670 
                                                      OpStore %119 %671 
                                Uniform f32* %672 = OpAccessChain %37 %449 
                                         f32 %673 = OpLoad %672 
                                Uniform f32* %674 = OpAccessChain %37 %449 
                                         f32 %675 = OpLoad %674 
                                Uniform f32* %676 = OpAccessChain %37 %449 
                                         f32 %677 = OpLoad %676 
                                Uniform f32* %678 = OpAccessChain %37 %449 
                                         f32 %679 = OpLoad %678 
                                       f32_4 %680 = OpCompositeConstruct %673 %675 %677 %679 
                                         f32 %681 = OpCompositeExtract %680 0 
                                         f32 %682 = OpCompositeExtract %680 1 
                                         f32 %683 = OpCompositeExtract %680 2 
                                         f32 %684 = OpCompositeExtract %680 3 
                                       f32_4 %685 = OpCompositeConstruct %681 %682 %683 %684 
                                       f32_4 %686 = OpLoad %119 
                                       f32_4 %687 = OpFMul %685 %686 
                                       f32_4 %688 = OpLoad %241 
                                       f32_4 %689 = OpFAdd %687 %688 
                                                      OpStore %119 %689 
                                Private f32* %690 = OpAccessChain %9 %31 
                                         f32 %691 = OpLoad %690 
                                         f32 %692 = OpFNegate %691 
                                         f32 %693 = OpFAdd %692 %52 
                                Private f32* %694 = OpAccessChain %9 %31 
                                                      OpStore %694 %693 
                                Private f32* %695 = OpAccessChain %9 %31 
                                         f32 %696 = OpLoad %695 
                                Uniform f32* %698 = OpAccessChain %37 %697 
                                         f32 %699 = OpLoad %698 
                                         f32 %700 = OpFMul %696 %699 
                                Private f32* %701 = OpAccessChain %9 %31 
                                                      OpStore %701 %700 
                                       f32_4 %702 = OpLoad %119 
                                       f32_4 %703 = OpFNegate %702 
                              Uniform f32_4* %705 = OpAccessChain %37 %704 
                                       f32_4 %706 = OpLoad %705 
                                       f32_4 %707 = OpFAdd %703 %706 
                                                      OpStore %204 %707 
                                       f32_2 %708 = OpLoad %9 
                                       f32_4 %709 = OpVectorShuffle %708 %708 0 0 0 0 
                                       f32_4 %710 = OpLoad %204 
                                       f32_4 %711 = OpFMul %709 %710 
                                       f32_4 %712 = OpLoad %119 
                                       f32_4 %713 = OpFAdd %711 %712 
                                                      OpStore %136 %713 
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