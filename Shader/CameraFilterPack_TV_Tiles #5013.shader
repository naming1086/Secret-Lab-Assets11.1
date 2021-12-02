//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/TV_Tiles" {
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
  GpuProgramID 21086
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
uniform 	float _Value3;
uniform 	float _Value4;
uniform 	float Fade;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec2 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
int u_xlati6;
vec3 u_xlat7;
vec2 u_xlat12;
vec2 u_xlat15;
float u_xlat18;
float u_xlat20;
bool u_xlatb20;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12.xy = u_xlat0.xy * vec2(256.0, 256.0) + vec2(_TimeX);
    u_xlat1.xy = (-u_xlat0.xy) + vec2(0.5, 0.5);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_Value3);
    u_xlat7.x = float(1.0) / (-_Value4);
    u_xlat1.x = u_xlat7.x * u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat7.x = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = (-u_xlat7.x) * u_xlat1.x + 1.0;
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = _Value + _Value;
    u_xlat7.x = float(0.0);
    u_xlat7.y = float(0.0);
    u_xlat7.z = float(0.0);
    u_xlat3.xy = u_xlat12.xy;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<6 ; u_xlati_loop_1++)
    {
        u_xlat15.xy = floor(u_xlat3.xy);
        u_xlat4.xy = fract(u_xlat3.xy);
        u_xlat20 = dot(u_xlat15.xy, vec2(7.0, 31.0));
        u_xlat20 = _TimeX * 0.00999999978 + u_xlat20;
        u_xlat20 = sin(u_xlat20);
        u_xlat5 = vec4(u_xlat20) + vec4(0.0350000001, 0.00999999978, 0.0, 0.699999988);
        u_xlat5 = u_xlat5 * vec4(13.5451698, 13.5451698, 13.5451698, 13.5451698);
        u_xlat5 = fract(u_xlat5);
        u_xlat20 = u_xlat5.w + -0.449999988;
        u_xlat20 = u_xlat20 * 9.99999809;
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat15.x = u_xlat20 * -2.0 + 3.0;
        u_xlat20 = u_xlat20 * u_xlat20;
        u_xlat20 = u_xlat20 * u_xlat15.x;
        u_xlat5.xyz = vec3(u_xlat20) * u_xlat5.xyz;
        u_xlat20 = u_xlat4.x * u_xlat4.y;
        u_xlat20 = u_xlat20 * 16.0;
        u_xlat15.xy = (-u_xlat4.xy) + vec2(1.0, 1.0);
        u_xlat20 = u_xlat20 * u_xlat15.x;
        u_xlat20 = u_xlat15.y * u_xlat20;
        u_xlat20 = sqrt(u_xlat20);
        u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat20) + u_xlat7.xyz;
        u_xlat3.xy = u_xlat3.xy / u_xlat0.xx;
        u_xlat7.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5);
    }
    u_xlat0.xyz = u_xlat7.xyz * vec3(2.5, 2.5, 2.5);
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.0, 1.0, 0.699999988);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Value2, _Value2, _Value2));
    u_xlat18 = u_xlat1.x * Fade;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + (-u_xlat2.xyz);
    SV_Target0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat2.xyz;
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
; Bound: 307
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %291 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpMemberDecorate %15 6 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %112 DescriptorSet 112 
                                                      OpDecorate %112 Binding 112 
                                                      OpDecorate %116 DescriptorSet 116 
                                                      OpDecorate %116 Binding 116 
                                                      OpDecorate %291 Location 291 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %14 = OpTypeVector %6 4 
                                              %15 = OpTypeStruct %6 %6 %6 %6 %6 %6 %14 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32; f32; f32; f32; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 6 
                                              %20 = OpTypePointer Uniform %14 
                                              %31 = OpTypePointer Private %10 
                               Private f32_2* %32 = OpVariable Private 
                                          f32 %35 = OpConstant 3.674022E-40 
                                        f32_2 %36 = OpConstantComposite %35 %35 
                                          i32 %38 = OpConstant 0 
                                              %39 = OpTypePointer Uniform %6 
                               Private f32_2* %44 = OpVariable Private 
                                          f32 %48 = OpConstant 3.674022E-40 
                                        f32_2 %49 = OpConstantComposite %48 %48 
                                              %54 = OpTypeInt 32 0 
                                          u32 %55 = OpConstant 0 
                                              %56 = OpTypePointer Private %6 
                                          i32 %64 = OpConstant 3 
                               Private f32_3* %70 = OpVariable Private 
                                          f32 %71 = OpConstant 3.674022E-40 
                                          i32 %72 = OpConstant 4 
                                          f32 %86 = OpConstant 3.674022E-40 
                                          f32 %91 = OpConstant 3.674022E-40 
                                          f32 %93 = OpConstant 3.674022E-40 
                                             %110 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %111 = OpTypePointer UniformConstant %110 
        UniformConstant read_only Texture2D* %112 = OpVariable UniformConstant 
                                             %114 = OpTypeSampler 
                                             %115 = OpTypePointer UniformConstant %114 
                    UniformConstant sampler* %116 = OpVariable UniformConstant 
                                             %118 = OpTypeSampledImage %110 
                                         i32 %124 = OpConstant 1 
                              Private f32_3* %131 = OpVariable Private 
                                         u32 %133 = OpConstant 1 
                                         u32 %135 = OpConstant 2 
                              Private f32_2* %137 = OpVariable Private 
                                             %139 = OpTypePointer Function %18 
                                             %147 = OpTypeBool 
                              Private f32_2* %149 = OpVariable Private 
                              Private f32_3* %152 = OpVariable Private 
                                Private f32* %157 = OpVariable Private 
                                         f32 %159 = OpConstant 3.674022E-40 
                                         f32 %160 = OpConstant 3.674022E-40 
                                       f32_2 %161 = OpConstantComposite %159 %160 
                                         f32 %165 = OpConstant 3.674022E-40 
                                             %171 = OpTypePointer Private %14 
                              Private f32_4* %172 = OpVariable Private 
                                         f32 %175 = OpConstant 3.674022E-40 
                                         f32 %176 = OpConstant 3.674022E-40 
                                       f32_4 %177 = OpConstantComposite %175 %165 %86 %176 
                                         f32 %180 = OpConstant 3.674022E-40 
                                       f32_4 %181 = OpConstantComposite %180 %180 %180 %180 
                                         u32 %185 = OpConstant 3 
                                         f32 %188 = OpConstant 3.674022E-40 
                                         f32 %191 = OpConstant 3.674022E-40 
                                         f32 %219 = OpConstant 3.674022E-40 
                                       f32_2 %224 = OpConstantComposite %71 %71 
                                       f32_3 %248 = OpConstantComposite %48 %48 %48 
                                         f32 %253 = OpConstant 3.674022E-40 
                                       f32_3 %254 = OpConstantComposite %253 %253 %253 
                                       f32_3 %259 = OpConstantComposite %71 %71 %176 
                                         i32 %264 = OpConstant 2 
                                Private f32* %277 = OpVariable Private 
                                         i32 %280 = OpConstant 5 
                                             %290 = OpTypePointer Output %14 
                               Output f32_4* %291 = OpVariable Output 
                                             %300 = OpTypePointer Output %6 
                                             %303 = OpTypePointer Private %18 
                                Private i32* %304 = OpVariable Private 
                                             %305 = OpTypePointer Private %147 
                               Private bool* %306 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %140 = OpVariable Function 
                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %21 = OpAccessChain %17 %19 
                                        f32_4 %22 = OpLoad %21 
                                        f32_2 %23 = OpVectorShuffle %22 %22 0 1 
                                        f32_2 %24 = OpFMul %13 %23 
                               Uniform f32_4* %25 = OpAccessChain %17 %19 
                                        f32_4 %26 = OpLoad %25 
                                        f32_2 %27 = OpVectorShuffle %26 %26 2 3 
                                        f32_2 %28 = OpFAdd %24 %27 
                                        f32_3 %29 = OpLoad %9 
                                        f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
                                                      OpStore %9 %30 
                                        f32_3 %33 = OpLoad %9 
                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                        f32_2 %37 = OpFMul %34 %36 
                                 Uniform f32* %40 = OpAccessChain %17 %38 
                                          f32 %41 = OpLoad %40 
                                        f32_2 %42 = OpCompositeConstruct %41 %41 
                                        f32_2 %43 = OpFAdd %37 %42 
                                                      OpStore %32 %43 
                                        f32_3 %45 = OpLoad %9 
                                        f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                                        f32_2 %47 = OpFNegate %46 
                                        f32_2 %50 = OpFAdd %47 %49 
                                                      OpStore %44 %50 
                                        f32_2 %51 = OpLoad %44 
                                        f32_2 %52 = OpLoad %44 
                                          f32 %53 = OpDot %51 %52 
                                 Private f32* %57 = OpAccessChain %44 %55 
                                                      OpStore %57 %53 
                                 Private f32* %58 = OpAccessChain %44 %55 
                                          f32 %59 = OpLoad %58 
                                          f32 %60 = OpExtInst %1 31 %59 
                                 Private f32* %61 = OpAccessChain %44 %55 
                                                      OpStore %61 %60 
                                 Private f32* %62 = OpAccessChain %44 %55 
                                          f32 %63 = OpLoad %62 
                                 Uniform f32* %65 = OpAccessChain %17 %64 
                                          f32 %66 = OpLoad %65 
                                          f32 %67 = OpFNegate %66 
                                          f32 %68 = OpFAdd %63 %67 
                                 Private f32* %69 = OpAccessChain %44 %55 
                                                      OpStore %69 %68 
                                 Uniform f32* %73 = OpAccessChain %17 %72 
                                          f32 %74 = OpLoad %73 
                                          f32 %75 = OpFNegate %74 
                                          f32 %76 = OpFDiv %71 %75 
                                 Private f32* %77 = OpAccessChain %70 %55 
                                                      OpStore %77 %76 
                                 Private f32* %78 = OpAccessChain %70 %55 
                                          f32 %79 = OpLoad %78 
                                 Private f32* %80 = OpAccessChain %44 %55 
                                          f32 %81 = OpLoad %80 
                                          f32 %82 = OpFMul %79 %81 
                                 Private f32* %83 = OpAccessChain %44 %55 
                                                      OpStore %83 %82 
                                 Private f32* %84 = OpAccessChain %44 %55 
                                          f32 %85 = OpLoad %84 
                                          f32 %87 = OpExtInst %1 43 %85 %86 %71 
                                 Private f32* %88 = OpAccessChain %44 %55 
                                                      OpStore %88 %87 
                                 Private f32* %89 = OpAccessChain %44 %55 
                                          f32 %90 = OpLoad %89 
                                          f32 %92 = OpFMul %90 %91 
                                          f32 %94 = OpFAdd %92 %93 
                                 Private f32* %95 = OpAccessChain %70 %55 
                                                      OpStore %95 %94 
                                 Private f32* %96 = OpAccessChain %44 %55 
                                          f32 %97 = OpLoad %96 
                                 Private f32* %98 = OpAccessChain %44 %55 
                                          f32 %99 = OpLoad %98 
                                         f32 %100 = OpFMul %97 %99 
                                Private f32* %101 = OpAccessChain %44 %55 
                                                      OpStore %101 %100 
                                Private f32* %102 = OpAccessChain %70 %55 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFNegate %103 
                                Private f32* %105 = OpAccessChain %44 %55 
                                         f32 %106 = OpLoad %105 
                                         f32 %107 = OpFMul %104 %106 
                                         f32 %108 = OpFAdd %107 %71 
                                Private f32* %109 = OpAccessChain %44 %55 
                                                      OpStore %109 %108 
                         read_only Texture2D %113 = OpLoad %112 
                                     sampler %117 = OpLoad %116 
                  read_only Texture2DSampled %119 = OpSampledImage %113 %117 
                                       f32_3 %120 = OpLoad %9 
                                       f32_2 %121 = OpVectorShuffle %120 %120 0 1 
                                       f32_4 %122 = OpImageSampleImplicitLod %119 %121 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                                      OpStore %70 %123 
                                Uniform f32* %125 = OpAccessChain %17 %124 
                                         f32 %126 = OpLoad %125 
                                Uniform f32* %127 = OpAccessChain %17 %124 
                                         f32 %128 = OpLoad %127 
                                         f32 %129 = OpFAdd %126 %128 
                                Private f32* %130 = OpAccessChain %9 %55 
                                                      OpStore %130 %129 
                                Private f32* %132 = OpAccessChain %131 %55 
                                                      OpStore %132 %86 
                                Private f32* %134 = OpAccessChain %131 %133 
                                                      OpStore %134 %86 
                                Private f32* %136 = OpAccessChain %131 %135 
                                                      OpStore %136 %86 
                                       f32_2 %138 = OpLoad %32 
                                                      OpStore %137 %138 
                                                      OpStore %140 %38 
                                                      OpBranch %141 
                                             %141 = OpLabel 
                                                      OpLoopMerge %143 %144 None 
                                                      OpBranch %145 
                                             %145 = OpLabel 
                                         i32 %146 = OpLoad %140 
                                        bool %148 = OpSLessThan %146 %19 
                                                      OpBranchConditional %148 %142 %143 
                                             %142 = OpLabel 
                                       f32_2 %150 = OpLoad %137 
                                       f32_2 %151 = OpExtInst %1 8 %150 
                                                      OpStore %149 %151 
                                       f32_2 %153 = OpLoad %137 
                                       f32_2 %154 = OpExtInst %1 10 %153 
                                       f32_3 %155 = OpLoad %152 
                                       f32_3 %156 = OpVectorShuffle %155 %154 3 4 2 
                                                      OpStore %152 %156 
                                       f32_2 %158 = OpLoad %149 
                                         f32 %162 = OpDot %158 %161 
                                                      OpStore %157 %162 
                                Uniform f32* %163 = OpAccessChain %17 %38 
                                         f32 %164 = OpLoad %163 
                                         f32 %166 = OpFMul %164 %165 
                                         f32 %167 = OpLoad %157 
                                         f32 %168 = OpFAdd %166 %167 
                                                      OpStore %157 %168 
                                         f32 %169 = OpLoad %157 
                                         f32 %170 = OpExtInst %1 13 %169 
                                                      OpStore %157 %170 
                                         f32 %173 = OpLoad %157 
                                       f32_4 %174 = OpCompositeConstruct %173 %173 %173 %173 
                                       f32_4 %178 = OpFAdd %174 %177 
                                                      OpStore %172 %178 
                                       f32_4 %179 = OpLoad %172 
                                       f32_4 %182 = OpFMul %179 %181 
                                                      OpStore %172 %182 
                                       f32_4 %183 = OpLoad %172 
                                       f32_4 %184 = OpExtInst %1 10 %183 
                                                      OpStore %172 %184 
                                Private f32* %186 = OpAccessChain %172 %185 
                                         f32 %187 = OpLoad %186 
                                         f32 %189 = OpFAdd %187 %188 
                                                      OpStore %157 %189 
                                         f32 %190 = OpLoad %157 
                                         f32 %192 = OpFMul %190 %191 
                                                      OpStore %157 %192 
                                         f32 %193 = OpLoad %157 
                                         f32 %194 = OpExtInst %1 43 %193 %86 %71 
                                                      OpStore %157 %194 
                                         f32 %195 = OpLoad %157 
                                         f32 %196 = OpFMul %195 %91 
                                         f32 %197 = OpFAdd %196 %93 
                                Private f32* %198 = OpAccessChain %149 %55 
                                                      OpStore %198 %197 
                                         f32 %199 = OpLoad %157 
                                         f32 %200 = OpLoad %157 
                                         f32 %201 = OpFMul %199 %200 
                                                      OpStore %157 %201 
                                         f32 %202 = OpLoad %157 
                                Private f32* %203 = OpAccessChain %149 %55 
                                         f32 %204 = OpLoad %203 
                                         f32 %205 = OpFMul %202 %204 
                                                      OpStore %157 %205 
                                         f32 %206 = OpLoad %157 
                                       f32_3 %207 = OpCompositeConstruct %206 %206 %206 
                                       f32_4 %208 = OpLoad %172 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                                       f32_3 %210 = OpFMul %207 %209 
                                       f32_4 %211 = OpLoad %172 
                                       f32_4 %212 = OpVectorShuffle %211 %210 4 5 6 3 
                                                      OpStore %172 %212 
                                Private f32* %213 = OpAccessChain %152 %55 
                                         f32 %214 = OpLoad %213 
                                Private f32* %215 = OpAccessChain %152 %133 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpFMul %214 %216 
                                                      OpStore %157 %217 
                                         f32 %218 = OpLoad %157 
                                         f32 %220 = OpFMul %218 %219 
                                                      OpStore %157 %220 
                                       f32_3 %221 = OpLoad %152 
                                       f32_2 %222 = OpVectorShuffle %221 %221 0 1 
                                       f32_2 %223 = OpFNegate %222 
                                       f32_2 %225 = OpFAdd %223 %224 
                                                      OpStore %149 %225 
                                         f32 %226 = OpLoad %157 
                                Private f32* %227 = OpAccessChain %149 %55 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFMul %226 %228 
                                                      OpStore %157 %229 
                                Private f32* %230 = OpAccessChain %149 %133 
                                         f32 %231 = OpLoad %230 
                                         f32 %232 = OpLoad %157 
                                         f32 %233 = OpFMul %231 %232 
                                                      OpStore %157 %233 
                                         f32 %234 = OpLoad %157 
                                         f32 %235 = OpExtInst %1 31 %234 
                                                      OpStore %157 %235 
                                       f32_4 %236 = OpLoad %172 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
                                         f32 %238 = OpLoad %157 
                                       f32_3 %239 = OpCompositeConstruct %238 %238 %238 
                                       f32_3 %240 = OpFMul %237 %239 
                                       f32_3 %241 = OpLoad %131 
                                       f32_3 %242 = OpFAdd %240 %241 
                                                      OpStore %152 %242 
                                       f32_2 %243 = OpLoad %137 
                                       f32_3 %244 = OpLoad %9 
                                       f32_2 %245 = OpVectorShuffle %244 %244 0 0 
                                       f32_2 %246 = OpFDiv %243 %245 
                                                      OpStore %137 %246 
                                       f32_3 %247 = OpLoad %152 
                                       f32_3 %249 = OpFMul %247 %248 
                                                      OpStore %131 %249 
                                                      OpBranch %144 
                                             %144 = OpLabel 
                                         i32 %250 = OpLoad %140 
                                         i32 %251 = OpIAdd %250 %124 
                                                      OpStore %140 %251 
                                                      OpBranch %141 
                                             %143 = OpLabel 
                                       f32_3 %252 = OpLoad %131 
                                       f32_3 %255 = OpFMul %252 %254 
                                                      OpStore %9 %255 
                                       f32_3 %256 = OpLoad %9 
                                       f32_3 %257 = OpExtInst %1 30 %256 
                                                      OpStore %9 %257 
                                       f32_3 %258 = OpLoad %9 
                                       f32_3 %260 = OpFMul %258 %259 
                                                      OpStore %9 %260 
                                       f32_3 %261 = OpLoad %9 
                                       f32_3 %262 = OpExtInst %1 29 %261 
                                                      OpStore %9 %262 
                                       f32_3 %263 = OpLoad %9 
                                Uniform f32* %265 = OpAccessChain %17 %264 
                                         f32 %266 = OpLoad %265 
                                Uniform f32* %267 = OpAccessChain %17 %264 
                                         f32 %268 = OpLoad %267 
                                Uniform f32* %269 = OpAccessChain %17 %264 
                                         f32 %270 = OpLoad %269 
                                       f32_3 %271 = OpCompositeConstruct %266 %268 %270 
                                         f32 %272 = OpCompositeExtract %271 0 
                                         f32 %273 = OpCompositeExtract %271 1 
                                         f32 %274 = OpCompositeExtract %271 2 
                                       f32_3 %275 = OpCompositeConstruct %272 %273 %274 
                                       f32_3 %276 = OpFMul %263 %275 
                                                      OpStore %9 %276 
                                Private f32* %278 = OpAccessChain %44 %55 
                                         f32 %279 = OpLoad %278 
                                Uniform f32* %281 = OpAccessChain %17 %280 
                                         f32 %282 = OpLoad %281 
                                         f32 %283 = OpFMul %279 %282 
                                                      OpStore %277 %283 
                                       f32_3 %284 = OpLoad %70 
                                       f32_3 %285 = OpLoad %9 
                                       f32_3 %286 = OpFMul %284 %285 
                                       f32_3 %287 = OpLoad %70 
                                       f32_3 %288 = OpFNegate %287 
                                       f32_3 %289 = OpFAdd %286 %288 
                                                      OpStore %9 %289 
                                         f32 %292 = OpLoad %277 
                                       f32_3 %293 = OpCompositeConstruct %292 %292 %292 
                                       f32_3 %294 = OpLoad %9 
                                       f32_3 %295 = OpFMul %293 %294 
                                       f32_3 %296 = OpLoad %70 
                                       f32_3 %297 = OpFAdd %295 %296 
                                       f32_4 %298 = OpLoad %291 
                                       f32_4 %299 = OpVectorShuffle %298 %297 4 5 6 3 
                                                      OpStore %291 %299 
                                 Output f32* %301 = OpAccessChain %291 %185 
                                                      OpStore %301 %71 
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