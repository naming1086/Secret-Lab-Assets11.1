//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Vision_Blood_Fast" {
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
  GpuProgramID 35193
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
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec2 u_xlat20;
float u_xlat30;
int u_xlati30;
int u_xlati31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.z = 0.5;
    u_xlat2 = texture(_MainTex, vec2(0.100000001, 0.5));
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + u_xlat1.xyz;
    u_xlat20.x = _TimeX * 0.5;
    u_xlat20.x = sin(u_xlat20.x);
    u_xlat3.xyz = u_xlat1.xyz;
    u_xlat4.x = float(0.0);
    u_xlat4.y = float(0.0);
    u_xlat4.z = float(0.0);
    u_xlat5.x = 0.0;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<3 ; u_xlati_loop_1++)
    {
        u_xlat6.xyz = u_xlat20.xxx * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
        u_xlat7.xyz = u_xlat6.xyz;
        u_xlat8.z = u_xlat5.x;
        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<7 ; u_xlati_loop_2++)
        {
            u_xlat9.xyz = u_xlat7.zyx + vec3(-0.400000006, -0.400000006, -0.400000006);
            u_xlat7.xyz = abs(u_xlat9.xyz) + vec3(-0.899999976, -0.899999976, -0.899999976);
            u_xlat32 = dot(u_xlat3.xyz, u_xlat7.xyz);
            u_xlat32 = abs(u_xlat32) * -1.80336881;
            u_xlat32 = exp2(u_xlat32);
            u_xlat8.z = u_xlat32 + u_xlat8.z;
        }
        u_xlat5.xy = u_xlat8.zz * vec2(0.333333343, 0.0333333351);
        u_xlat3.xyz = u_xlat2.xyz * u_xlat5.xxx + u_xlat3.xyz;
        u_xlat5.zw = u_xlat5.xx * u_xlat5.xy;
        u_xlat8.xy = u_xlat5.zy * u_xlat5.wz;
        u_xlat4.xyz = u_xlat8.xyz * vec3(3.1730001, -0.0410000011, -0.00033333333) + u_xlat4.xyz;
    }
    u_xlat20.x = _Value + -0.0500000007;
    u_xlat20.x = u_xlat20.x + (-_Value2);
    u_xlat1.xy = (-u_xlat0.xy) + vec2(0.5, 0.5);
    u_xlat30 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat20.y = sqrt(u_xlat30);
    u_xlat20.xy = u_xlat20.xy + (-vec2(vec2(_Value, _Value)));
    u_xlat20.x = float(1.0) / u_xlat20.x;
    u_xlat20.x = u_xlat20.x * u_xlat20.y;
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
    u_xlat30 = u_xlat20.x * -2.0 + 3.0;
    u_xlat20.x = u_xlat20.x * u_xlat20.x;
    u_xlat20.x = (-u_xlat30) * u_xlat20.x + 1.0;
    u_xlat1.xyz = u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.415888339, 0.415888339, 0.415888339) + vec3(-0.5, -0.5, -0.5);
    u_xlat30 = u_xlat1.x * 0.5;
    u_xlat2.xy = u_xlat0.xy * vec2(u_xlat30);
    u_xlat2 = texture(_MainTex, u_xlat2.xy);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.xyw = u_xlat1.xyz + (-u_xlat2.xyz);
    SV_Target0.xyz = u_xlat20.xxx * u_xlat0.xyw + u_xlat2.xyz;
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
; Bound: 328
; Schema: 0
                                                OpCapability Shader 
                                         %1 = OpExtInstImport "GLSL.std.450" 
                                                OpMemoryModel Logical GLSL450 
                                                OpEntryPoint Fragment %4 "main" %12 %308 
                                                OpExecutionMode %4 OriginUpperLeft 
                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                OpDecorate vs_TEXCOORD0 Location 12 
                                                OpMemberDecorate %14 0 Offset 14 
                                                OpMemberDecorate %14 1 Offset 14 
                                                OpMemberDecorate %14 2 Offset 14 
                                                OpMemberDecorate %14 3 Offset 14 
                                                OpDecorate %14 Block 
                                                OpDecorate %16 DescriptorSet 16 
                                                OpDecorate %16 Binding 16 
                                                OpDecorate %48 DescriptorSet 48 
                                                OpDecorate %48 Binding 48 
                                                OpDecorate %52 DescriptorSet 52 
                                                OpDecorate %52 Binding 52 
                                                OpDecorate %308 Location 308 
                                         %2 = OpTypeVoid 
                                         %3 = OpTypeFunction %2 
                                         %6 = OpTypeFloat 32 
                                         %7 = OpTypeVector %6 4 
                                         %8 = OpTypePointer Private %7 
                          Private f32_4* %9 = OpVariable Private 
                                        %10 = OpTypeVector %6 2 
                                        %11 = OpTypePointer Input %10 
                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                        %14 = OpTypeStruct %6 %6 %6 %7 
                                        %15 = OpTypePointer Uniform %14 
Uniform struct {f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
                                        %17 = OpTypeInt 32 1 
                                    i32 %18 = OpConstant 3 
                                        %19 = OpTypePointer Uniform %7 
                                        %30 = OpTypeVector %6 3 
                                        %31 = OpTypePointer Private %30 
                         Private f32_3* %32 = OpVariable Private 
                                    f32 %35 = OpConstant 3.674022E-40 
                                  f32_2 %36 = OpConstantComposite %35 %35 
                                    f32 %40 = OpConstant 3.674022E-40 
                                        %41 = OpTypeInt 32 0 
                                    u32 %42 = OpConstant 2 
                                        %43 = OpTypePointer Private %6 
                         Private f32_3* %45 = OpVariable Private 
                                        %46 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                        %47 = OpTypePointer UniformConstant %46 
   UniformConstant read_only Texture2D* %48 = OpVariable UniformConstant 
                                        %50 = OpTypeSampler 
                                        %51 = OpTypePointer UniformConstant %50 
               UniformConstant sampler* %52 = OpVariable UniformConstant 
                                        %54 = OpTypeSampledImage %46 
                                    f32 %56 = OpConstant 3.674022E-40 
                                  f32_2 %57 = OpConstantComposite %56 %40 
                                    f32 %61 = OpConstant 3.674022E-40 
                                  f32_3 %62 = OpConstantComposite %61 %61 %61 
                                        %66 = OpTypePointer Private %10 
                         Private f32_2* %67 = OpVariable Private 
                                    i32 %68 = OpConstant 0 
                                        %69 = OpTypePointer Uniform %6 
                                    u32 %73 = OpConstant 0 
                         Private f32_3* %79 = OpVariable Private 
                         Private f32_3* %81 = OpVariable Private 
                                    f32 %82 = OpConstant 3.674022E-40 
                                    u32 %84 = OpConstant 1 
                         Private f32_4* %87 = OpVariable Private 
                                        %89 = OpTypePointer Function %17 
                                        %97 = OpTypeBool 
                         Private f32_3* %99 = OpVariable Private 
                                 f32_3 %102 = OpConstantComposite %40 %40 %40 
                        Private f32_3* %106 = OpVariable Private 
                        Private f32_3* %108 = OpVariable Private 
                                   i32 %119 = OpConstant 7 
                        Private f32_3* %121 = OpVariable Private 
                                   f32 %124 = OpConstant 3.674022E-40 
                                 f32_3 %125 = OpConstantComposite %124 %124 %124 
                                   f32 %129 = OpConstant 3.674022E-40 
                                 f32_3 %130 = OpConstantComposite %129 %129 %129 
                          Private f32* %132 = OpVariable Private 
                                   f32 %138 = OpConstant 3.674022E-40 
                                   i32 %148 = OpConstant 1 
                                   f32 %152 = OpConstant 3.674022E-40 
                                   f32 %153 = OpConstant 3.674022E-40 
                                 f32_2 %154 = OpConstantComposite %152 %153 
                                   f32 %179 = OpConstant 3.674022E-40 
                                   f32 %180 = OpConstant 3.674022E-40 
                                   f32 %181 = OpConstant 3.674022E-40 
                                 f32_3 %182 = OpConstantComposite %179 %180 %181 
                                   f32 %190 = OpConstant 3.674022E-40 
                                   i32 %195 = OpConstant 2 
                                 f32_2 %204 = OpConstantComposite %40 %40 
                          Private f32* %208 = OpVariable Private 
                                   f32 %228 = OpConstant 3.674022E-40 
                                   f32 %245 = OpConstant 3.674022E-40 
                                   f32 %247 = OpConstant 3.674022E-40 
                                 f32_3 %263 = OpConstantComposite %228 %228 %228 
                                   f32 %268 = OpConstant 3.674022E-40 
                                 f32_3 %269 = OpConstantComposite %268 %268 %268 
                                 f32_3 %271 = OpConstantComposite %35 %35 %35 
                                       %307 = OpTypePointer Output %7 
                         Output f32_4* %308 = OpVariable Output 
                                   u32 %318 = OpConstant 3 
                                       %319 = OpTypePointer Output %6 
                                       %322 = OpTypePointer Private %17 
                          Private i32* %323 = OpVariable Private 
                          Private i32* %324 = OpVariable Private 
                                       %325 = OpTypePointer Private %97 
                         Private bool* %326 = OpVariable Private 
                         Private bool* %327 = OpVariable Private 
                                    void %4 = OpFunction None %3 
                                         %5 = OpLabel 
                          Function i32* %90 = OpVariable Function 
                         Function i32* %112 = OpVariable Function 
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
                                  f32_4 %33 = OpLoad %9 
                                  f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                  f32_2 %37 = OpFAdd %34 %36 
                                  f32_3 %38 = OpLoad %32 
                                  f32_3 %39 = OpVectorShuffle %38 %37 3 4 2 
                                                OpStore %32 %39 
                           Private f32* %44 = OpAccessChain %32 %42 
                                                OpStore %44 %40 
                    read_only Texture2D %49 = OpLoad %48 
                                sampler %53 = OpLoad %52 
             read_only Texture2DSampled %55 = OpSampledImage %49 %53 
                                  f32_4 %58 = OpImageSampleImplicitLod %55 %57 
                                  f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                                OpStore %45 %59 
                                  f32_3 %60 = OpLoad %45 
                                  f32_3 %63 = OpFMul %60 %62 
                                  f32_3 %64 = OpLoad %32 
                                  f32_3 %65 = OpFAdd %63 %64 
                                                OpStore %45 %65 
                           Uniform f32* %70 = OpAccessChain %16 %68 
                                    f32 %71 = OpLoad %70 
                                    f32 %72 = OpFMul %71 %40 
                           Private f32* %74 = OpAccessChain %67 %73 
                                                OpStore %74 %72 
                           Private f32* %75 = OpAccessChain %67 %73 
                                    f32 %76 = OpLoad %75 
                                    f32 %77 = OpExtInst %1 13 %76 
                           Private f32* %78 = OpAccessChain %67 %73 
                                                OpStore %78 %77 
                                  f32_3 %80 = OpLoad %32 
                                                OpStore %79 %80 
                           Private f32* %83 = OpAccessChain %81 %73 
                                                OpStore %83 %82 
                           Private f32* %85 = OpAccessChain %81 %84 
                                                OpStore %85 %82 
                           Private f32* %86 = OpAccessChain %81 %42 
                                                OpStore %86 %82 
                           Private f32* %88 = OpAccessChain %87 %73 
                                                OpStore %88 %82 
                                                OpStore %90 %68 
                                                OpBranch %91 
                                        %91 = OpLabel 
                                                OpLoopMerge %93 %94 None 
                                                OpBranch %95 
                                        %95 = OpLabel 
                                    i32 %96 = OpLoad %90 
                                   bool %98 = OpSLessThan %96 %18 
                                                OpBranchConditional %98 %92 %93 
                                        %92 = OpLabel 
                                 f32_2 %100 = OpLoad %67 
                                 f32_3 %101 = OpVectorShuffle %100 %100 0 0 0 
                                 f32_3 %103 = OpFMul %101 %102 
                                 f32_3 %104 = OpLoad %79 
                                 f32_3 %105 = OpFAdd %103 %104 
                                                OpStore %99 %105 
                                 f32_3 %107 = OpLoad %99 
                                                OpStore %106 %107 
                          Private f32* %109 = OpAccessChain %87 %73 
                                   f32 %110 = OpLoad %109 
                          Private f32* %111 = OpAccessChain %108 %42 
                                                OpStore %111 %110 
                                                OpStore %112 %68 
                                                OpBranch %113 
                                       %113 = OpLabel 
                                                OpLoopMerge %115 %116 None 
                                                OpBranch %117 
                                       %117 = OpLabel 
                                   i32 %118 = OpLoad %112 
                                  bool %120 = OpSLessThan %118 %119 
                                                OpBranchConditional %120 %114 %115 
                                       %114 = OpLabel 
                                 f32_3 %122 = OpLoad %106 
                                 f32_3 %123 = OpVectorShuffle %122 %122 2 1 0 
                                 f32_3 %126 = OpFAdd %123 %125 
                                                OpStore %121 %126 
                                 f32_3 %127 = OpLoad %121 
                                 f32_3 %128 = OpExtInst %1 4 %127 
                                 f32_3 %131 = OpFAdd %128 %130 
                                                OpStore %106 %131 
                                 f32_3 %133 = OpLoad %79 
                                 f32_3 %134 = OpLoad %106 
                                   f32 %135 = OpDot %133 %134 
                                                OpStore %132 %135 
                                   f32 %136 = OpLoad %132 
                                   f32 %137 = OpExtInst %1 4 %136 
                                   f32 %139 = OpFMul %137 %138 
                                                OpStore %132 %139 
                                   f32 %140 = OpLoad %132 
                                   f32 %141 = OpExtInst %1 29 %140 
                                                OpStore %132 %141 
                                   f32 %142 = OpLoad %132 
                          Private f32* %143 = OpAccessChain %108 %42 
                                   f32 %144 = OpLoad %143 
                                   f32 %145 = OpFAdd %142 %144 
                          Private f32* %146 = OpAccessChain %108 %42 
                                                OpStore %146 %145 
                                                OpBranch %116 
                                       %116 = OpLabel 
                                   i32 %147 = OpLoad %112 
                                   i32 %149 = OpIAdd %147 %148 
                                                OpStore %112 %149 
                                                OpBranch %113 
                                       %115 = OpLabel 
                                 f32_3 %150 = OpLoad %108 
                                 f32_2 %151 = OpVectorShuffle %150 %150 2 2 
                                 f32_2 %155 = OpFMul %151 %154 
                                 f32_4 %156 = OpLoad %87 
                                 f32_4 %157 = OpVectorShuffle %156 %155 4 5 2 3 
                                                OpStore %87 %157 
                                 f32_3 %158 = OpLoad %45 
                                 f32_4 %159 = OpLoad %87 
                                 f32_3 %160 = OpVectorShuffle %159 %159 0 0 0 
                                 f32_3 %161 = OpFMul %158 %160 
                                 f32_3 %162 = OpLoad %79 
                                 f32_3 %163 = OpFAdd %161 %162 
                                                OpStore %79 %163 
                                 f32_4 %164 = OpLoad %87 
                                 f32_2 %165 = OpVectorShuffle %164 %164 0 0 
                                 f32_4 %166 = OpLoad %87 
                                 f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                 f32_2 %168 = OpFMul %165 %167 
                                 f32_4 %169 = OpLoad %87 
                                 f32_4 %170 = OpVectorShuffle %169 %168 0 1 4 5 
                                                OpStore %87 %170 
                                 f32_4 %171 = OpLoad %87 
                                 f32_2 %172 = OpVectorShuffle %171 %171 2 1 
                                 f32_4 %173 = OpLoad %87 
                                 f32_2 %174 = OpVectorShuffle %173 %173 3 2 
                                 f32_2 %175 = OpFMul %172 %174 
                                 f32_3 %176 = OpLoad %108 
                                 f32_3 %177 = OpVectorShuffle %176 %175 3 4 2 
                                                OpStore %108 %177 
                                 f32_3 %178 = OpLoad %108 
                                 f32_3 %183 = OpFMul %178 %182 
                                 f32_3 %184 = OpLoad %81 
                                 f32_3 %185 = OpFAdd %183 %184 
                                                OpStore %81 %185 
                                                OpBranch %94 
                                        %94 = OpLabel 
                                   i32 %186 = OpLoad %90 
                                   i32 %187 = OpIAdd %186 %148 
                                                OpStore %90 %187 
                                                OpBranch %91 
                                        %93 = OpLabel 
                          Uniform f32* %188 = OpAccessChain %16 %148 
                                   f32 %189 = OpLoad %188 
                                   f32 %191 = OpFAdd %189 %190 
                          Private f32* %192 = OpAccessChain %67 %73 
                                                OpStore %192 %191 
                          Private f32* %193 = OpAccessChain %67 %73 
                                   f32 %194 = OpLoad %193 
                          Uniform f32* %196 = OpAccessChain %16 %195 
                                   f32 %197 = OpLoad %196 
                                   f32 %198 = OpFNegate %197 
                                   f32 %199 = OpFAdd %194 %198 
                          Private f32* %200 = OpAccessChain %67 %73 
                                                OpStore %200 %199 
                                 f32_4 %201 = OpLoad %9 
                                 f32_2 %202 = OpVectorShuffle %201 %201 0 1 
                                 f32_2 %203 = OpFNegate %202 
                                 f32_2 %205 = OpFAdd %203 %204 
                                 f32_3 %206 = OpLoad %32 
                                 f32_3 %207 = OpVectorShuffle %206 %205 3 4 2 
                                                OpStore %32 %207 
                                 f32_3 %209 = OpLoad %32 
                                 f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                                 f32_3 %211 = OpLoad %32 
                                 f32_2 %212 = OpVectorShuffle %211 %211 0 1 
                                   f32 %213 = OpDot %210 %212 
                                                OpStore %208 %213 
                                   f32 %214 = OpLoad %208 
                                   f32 %215 = OpExtInst %1 31 %214 
                          Private f32* %216 = OpAccessChain %67 %84 
                                                OpStore %216 %215 
                                 f32_2 %217 = OpLoad %67 
                          Uniform f32* %218 = OpAccessChain %16 %148 
                                   f32 %219 = OpLoad %218 
                          Uniform f32* %220 = OpAccessChain %16 %148 
                                   f32 %221 = OpLoad %220 
                                 f32_2 %222 = OpCompositeConstruct %219 %221 
                                   f32 %223 = OpCompositeExtract %222 0 
                                   f32 %224 = OpCompositeExtract %222 1 
                                 f32_2 %225 = OpCompositeConstruct %223 %224 
                                 f32_2 %226 = OpFNegate %225 
                                 f32_2 %227 = OpFAdd %217 %226 
                                                OpStore %67 %227 
                          Private f32* %229 = OpAccessChain %67 %73 
                                   f32 %230 = OpLoad %229 
                                   f32 %231 = OpFDiv %228 %230 
                          Private f32* %232 = OpAccessChain %67 %73 
                                                OpStore %232 %231 
                          Private f32* %233 = OpAccessChain %67 %73 
                                   f32 %234 = OpLoad %233 
                          Private f32* %235 = OpAccessChain %67 %84 
                                   f32 %236 = OpLoad %235 
                                   f32 %237 = OpFMul %234 %236 
                          Private f32* %238 = OpAccessChain %67 %73 
                                                OpStore %238 %237 
                          Private f32* %239 = OpAccessChain %67 %73 
                                   f32 %240 = OpLoad %239 
                                   f32 %241 = OpExtInst %1 43 %240 %82 %228 
                          Private f32* %242 = OpAccessChain %67 %73 
                                                OpStore %242 %241 
                          Private f32* %243 = OpAccessChain %67 %73 
                                   f32 %244 = OpLoad %243 
                                   f32 %246 = OpFMul %244 %245 
                                   f32 %248 = OpFAdd %246 %247 
                                                OpStore %208 %248 
                          Private f32* %249 = OpAccessChain %67 %73 
                                   f32 %250 = OpLoad %249 
                          Private f32* %251 = OpAccessChain %67 %73 
                                   f32 %252 = OpLoad %251 
                                   f32 %253 = OpFMul %250 %252 
                          Private f32* %254 = OpAccessChain %67 %73 
                                                OpStore %254 %253 
                                   f32 %255 = OpLoad %208 
                                   f32 %256 = OpFNegate %255 
                          Private f32* %257 = OpAccessChain %67 %73 
                                   f32 %258 = OpLoad %257 
                                   f32 %259 = OpFMul %256 %258 
                                   f32 %260 = OpFAdd %259 %228 
                          Private f32* %261 = OpAccessChain %67 %73 
                                                OpStore %261 %260 
                                 f32_3 %262 = OpLoad %81 
                                 f32_3 %264 = OpFAdd %262 %263 
                                                OpStore %32 %264 
                                 f32_3 %265 = OpLoad %32 
                                 f32_3 %266 = OpExtInst %1 30 %265 
                                                OpStore %32 %266 
                                 f32_3 %267 = OpLoad %32 
                                 f32_3 %270 = OpFMul %267 %269 
                                 f32_3 %272 = OpFAdd %270 %271 
                                                OpStore %32 %272 
                          Private f32* %273 = OpAccessChain %32 %73 
                                   f32 %274 = OpLoad %273 
                                   f32 %275 = OpFMul %274 %40 
                                                OpStore %208 %275 
                                 f32_4 %276 = OpLoad %9 
                                 f32_2 %277 = OpVectorShuffle %276 %276 0 1 
                                   f32 %278 = OpLoad %208 
                                 f32_2 %279 = OpCompositeConstruct %278 %278 
                                 f32_2 %280 = OpFMul %277 %279 
                                 f32_3 %281 = OpLoad %45 
                                 f32_3 %282 = OpVectorShuffle %281 %280 3 4 2 
                                                OpStore %45 %282 
                   read_only Texture2D %283 = OpLoad %48 
                               sampler %284 = OpLoad %52 
            read_only Texture2DSampled %285 = OpSampledImage %283 %284 
                                 f32_3 %286 = OpLoad %45 
                                 f32_2 %287 = OpVectorShuffle %286 %286 0 1 
                                 f32_4 %288 = OpImageSampleImplicitLod %285 %287 
                                 f32_3 %289 = OpVectorShuffle %288 %288 0 1 2 
                                                OpStore %45 %289 
                                 f32_3 %290 = OpLoad %32 
                                 f32_3 %291 = OpLoad %45 
                                 f32_3 %292 = OpFAdd %290 %291 
                                                OpStore %32 %292 
                   read_only Texture2D %293 = OpLoad %48 
                               sampler %294 = OpLoad %52 
            read_only Texture2DSampled %295 = OpSampledImage %293 %294 
                                 f32_4 %296 = OpLoad %9 
                                 f32_2 %297 = OpVectorShuffle %296 %296 0 1 
                                 f32_4 %298 = OpImageSampleImplicitLod %295 %297 
                                 f32_3 %299 = OpVectorShuffle %298 %298 0 1 2 
                                 f32_4 %300 = OpLoad %9 
                                 f32_4 %301 = OpVectorShuffle %300 %299 4 5 2 6 
                                                OpStore %9 %301 
                                 f32_4 %302 = OpLoad %9 
                                 f32_3 %303 = OpVectorShuffle %302 %302 0 1 3 
                                 f32_3 %304 = OpFNegate %303 
                                 f32_3 %305 = OpLoad %32 
                                 f32_3 %306 = OpFAdd %304 %305 
                                                OpStore %32 %306 
                                 f32_2 %309 = OpLoad %67 
                                 f32_3 %310 = OpVectorShuffle %309 %309 0 0 0 
                                 f32_3 %311 = OpLoad %32 
                                 f32_3 %312 = OpFMul %310 %311 
                                 f32_4 %313 = OpLoad %9 
                                 f32_3 %314 = OpVectorShuffle %313 %313 0 1 3 
                                 f32_3 %315 = OpFAdd %312 %314 
                                 f32_4 %316 = OpLoad %308 
                                 f32_4 %317 = OpVectorShuffle %316 %315 4 5 6 3 
                                                OpStore %308 %317 
                           Output f32* %320 = OpAccessChain %308 %318 
                                                OpStore %320 %228 
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