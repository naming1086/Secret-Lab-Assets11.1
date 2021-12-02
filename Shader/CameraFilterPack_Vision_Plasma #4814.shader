//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Vision_Plasma" {
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
  GpuProgramID 44450
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
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
vec2 u_xlat6;
void main()
{
    u_xlat0.y = 0.5;
    u_xlat1 = vec4(_TimeX) * vec4(0.330000013, 0.924000025, 0.660000026, 0.561000049);
    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat6.x * 8.79199982 + u_xlat1.y;
    u_xlat4 = sin(u_xlat4);
    u_xlat0.x = u_xlat4 * 0.5 + 0.5;
    u_xlat0.xy = (-u_xlat0.xy) + u_xlat6.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 5.5999999;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat2.x = u_xlat0.x * 0.5;
    u_xlat0.x = cos(u_xlat1.z);
    u_xlat0.x = u_xlat0.x * 1.60000002;
    u_xlat0.y = sin(u_xlat1.w);
    u_xlat0.xy = (-u_xlat0.xy) + u_xlat6.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 1.29999995;
    u_xlat2.z = cos(u_xlat0.x);
    u_xlat0.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat0.x = u_xlat0.x * 4.61999989 + u_xlat1.x;
    u_xlat2.y = cos(u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat0.x = u_xlat0.x / _Value3;
    u_xlat1.xyz = vec3(_TimeX) * vec3(1.13850009, 1.03950012, 0.415800005);
    u_xlat1.xyz = u_xlat0.xxx * vec3(6.28000021, 6.28000021, 6.28000021) + u_xlat1.xyz;
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2 = texture(_MainTex, u_xlat6.xy);
    u_xlat0.xy = (-u_xlat6.xy) + vec2(0.5, 0.5);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_Value);
    u_xlat3.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.400000006) + (-u_xlat2.xyz);
    u_xlat1.x = _Value + -0.0500000007;
    u_xlat1.x = u_xlat1.x + (-_Value2);
    u_xlat1.x = u_xlat1.x + (-_Value);
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat1.x) * u_xlat0.x + 1.0;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat2.xyz;
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
; Bound: 299
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %35 %287 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpMemberDecorate %18 3 Offset 18 
                                                     OpMemberDecorate %18 4 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate vs_TEXCOORD0 Location 35 
                                                     OpDecorate %190 DescriptorSet 190 
                                                     OpDecorate %190 Binding 190 
                                                     OpDecorate %194 DescriptorSet 194 
                                                     OpDecorate %194 Binding 194 
                                                     OpDecorate %287 Location 287 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 2 
                                              %8 = OpTypePointer Private %7 
                               Private f32_2* %9 = OpVariable Private 
                                         f32 %10 = OpConstant 3.674022E-40 
                                             %11 = OpTypeInt 32 0 
                                         u32 %12 = OpConstant 1 
                                             %13 = OpTypePointer Private %6 
                                             %15 = OpTypeVector %6 4 
                                             %16 = OpTypePointer Private %15 
                              Private f32_4* %17 = OpVariable Private 
                                             %18 = OpTypeStruct %6 %6 %6 %6 %15 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32; f32; f32; f32; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 0 
                                             %23 = OpTypePointer Uniform %6 
                                         f32 %27 = OpConstant 3.674022E-40 
                                         f32 %28 = OpConstant 3.674022E-40 
                                         f32 %29 = OpConstant 3.674022E-40 
                                         f32 %30 = OpConstant 3.674022E-40 
                                       f32_4 %31 = OpConstantComposite %27 %28 %29 %30 
                              Private f32_2* %33 = OpVariable Private 
                                             %34 = OpTypePointer Input %7 
                       Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                         i32 %37 = OpConstant 4 
                                             %38 = OpTypePointer Uniform %15 
                                Private f32* %47 = OpVariable Private 
                                         u32 %48 = OpConstant 0 
                                         f32 %51 = OpConstant 3.674022E-40 
                                         f32 %76 = OpConstant 3.674022E-40 
                                         f32 %85 = OpConstant 3.674022E-40 
                                             %88 = OpTypeVector %6 3 
                                             %89 = OpTypePointer Private %88 
                              Private f32_3* %90 = OpVariable Private 
                                         u32 %95 = OpConstant 2 
                                        f32 %102 = OpConstant 3.674022E-40 
                                        u32 %105 = OpConstant 3 
                                        f32 %124 = OpConstant 3.674022E-40 
                                        f32 %137 = OpConstant 3.674022E-40 
                                      f32_3 %148 = OpConstantComposite %85 %85 %85 
                                        i32 %153 = OpConstant 3 
                                        f32 %161 = OpConstant 3.674022E-40 
                                        f32 %162 = OpConstant 3.674022E-40 
                                        f32 %163 = OpConstant 3.674022E-40 
                                      f32_3 %164 = OpConstantComposite %161 %162 %163 
                                        f32 %170 = OpConstant 3.674022E-40 
                                      f32_3 %171 = OpConstantComposite %170 %170 %170 
                                            %188 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %189 = OpTypePointer UniformConstant %188 
       UniformConstant read_only Texture2D* %190 = OpVariable UniformConstant 
                                            %192 = OpTypeSampler 
                                            %193 = OpTypePointer UniformConstant %192 
                   UniformConstant sampler* %194 = OpVariable UniformConstant 
                                            %196 = OpTypeSampledImage %188 
                                      f32_2 %203 = OpConstantComposite %10 %10 
                                        i32 %215 = OpConstant 1 
                             Private f32_3* %221 = OpVariable Private 
                                        f32 %224 = OpConstant 3.674022E-40 
                                      f32_3 %225 = OpConstantComposite %10 %10 %224 
                                        f32 %232 = OpConstant 3.674022E-40 
                                        i32 %237 = OpConstant 2 
                                        f32 %262 = OpConstant 3.674022E-40 
                                        f32 %267 = OpConstant 3.674022E-40 
                                        f32 %269 = OpConstant 3.674022E-40 
                                            %286 = OpTypePointer Output %15 
                              Output f32_4* %287 = OpVariable Output 
                                            %296 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                Private f32* %14 = OpAccessChain %9 %12 
                                                     OpStore %14 %10 
                                Uniform f32* %24 = OpAccessChain %20 %22 
                                         f32 %25 = OpLoad %24 
                                       f32_4 %26 = OpCompositeConstruct %25 %25 %25 %25 
                                       f32_4 %32 = OpFMul %26 %31 
                                                     OpStore %17 %32 
                                       f32_2 %36 = OpLoad vs_TEXCOORD0 
                              Uniform f32_4* %39 = OpAccessChain %20 %37 
                                       f32_4 %40 = OpLoad %39 
                                       f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                       f32_2 %42 = OpFMul %36 %41 
                              Uniform f32_4* %43 = OpAccessChain %20 %37 
                                       f32_4 %44 = OpLoad %43 
                                       f32_2 %45 = OpVectorShuffle %44 %44 2 3 
                                       f32_2 %46 = OpFAdd %42 %45 
                                                     OpStore %33 %46 
                                Private f32* %49 = OpAccessChain %33 %48 
                                         f32 %50 = OpLoad %49 
                                         f32 %52 = OpFMul %50 %51 
                                Private f32* %53 = OpAccessChain %17 %12 
                                         f32 %54 = OpLoad %53 
                                         f32 %55 = OpFAdd %52 %54 
                                                     OpStore %47 %55 
                                         f32 %56 = OpLoad %47 
                                         f32 %57 = OpExtInst %1 13 %56 
                                                     OpStore %47 %57 
                                         f32 %58 = OpLoad %47 
                                         f32 %59 = OpFMul %58 %10 
                                         f32 %60 = OpFAdd %59 %10 
                                Private f32* %61 = OpAccessChain %9 %48 
                                                     OpStore %61 %60 
                                       f32_2 %62 = OpLoad %9 
                                       f32_2 %63 = OpFNegate %62 
                                       f32_2 %64 = OpLoad %33 
                                       f32_2 %65 = OpFAdd %63 %64 
                                                     OpStore %9 %65 
                                       f32_2 %66 = OpLoad %9 
                                       f32_2 %67 = OpLoad %9 
                                         f32 %68 = OpDot %66 %67 
                                Private f32* %69 = OpAccessChain %9 %48 
                                                     OpStore %69 %68 
                                Private f32* %70 = OpAccessChain %9 %48 
                                         f32 %71 = OpLoad %70 
                                         f32 %72 = OpExtInst %1 31 %71 
                                Private f32* %73 = OpAccessChain %9 %48 
                                                     OpStore %73 %72 
                                Private f32* %74 = OpAccessChain %9 %48 
                                         f32 %75 = OpLoad %74 
                                         f32 %77 = OpFMul %75 %76 
                                Private f32* %78 = OpAccessChain %9 %48 
                                                     OpStore %78 %77 
                                Private f32* %79 = OpAccessChain %9 %48 
                                         f32 %80 = OpLoad %79 
                                         f32 %81 = OpExtInst %1 14 %80 
                                Private f32* %82 = OpAccessChain %9 %48 
                                                     OpStore %82 %81 
                                Private f32* %83 = OpAccessChain %9 %48 
                                         f32 %84 = OpLoad %83 
                                         f32 %86 = OpFAdd %84 %85 
                                Private f32* %87 = OpAccessChain %9 %48 
                                                     OpStore %87 %86 
                                Private f32* %91 = OpAccessChain %9 %48 
                                         f32 %92 = OpLoad %91 
                                         f32 %93 = OpFMul %92 %10 
                                Private f32* %94 = OpAccessChain %90 %48 
                                                     OpStore %94 %93 
                                Private f32* %96 = OpAccessChain %17 %95 
                                         f32 %97 = OpLoad %96 
                                         f32 %98 = OpExtInst %1 14 %97 
                                Private f32* %99 = OpAccessChain %9 %48 
                                                     OpStore %99 %98 
                               Private f32* %100 = OpAccessChain %9 %48 
                                        f32 %101 = OpLoad %100 
                                        f32 %103 = OpFMul %101 %102 
                               Private f32* %104 = OpAccessChain %9 %48 
                                                     OpStore %104 %103 
                               Private f32* %106 = OpAccessChain %17 %105 
                                        f32 %107 = OpLoad %106 
                                        f32 %108 = OpExtInst %1 13 %107 
                               Private f32* %109 = OpAccessChain %9 %12 
                                                     OpStore %109 %108 
                                      f32_2 %110 = OpLoad %9 
                                      f32_2 %111 = OpFNegate %110 
                                      f32_2 %112 = OpLoad %33 
                                      f32_2 %113 = OpFAdd %111 %112 
                                                     OpStore %9 %113 
                                      f32_2 %114 = OpLoad %9 
                                      f32_2 %115 = OpLoad %9 
                                        f32 %116 = OpDot %114 %115 
                               Private f32* %117 = OpAccessChain %9 %48 
                                                     OpStore %117 %116 
                               Private f32* %118 = OpAccessChain %9 %48 
                                        f32 %119 = OpLoad %118 
                                        f32 %120 = OpExtInst %1 31 %119 
                               Private f32* %121 = OpAccessChain %9 %48 
                                                     OpStore %121 %120 
                               Private f32* %122 = OpAccessChain %9 %48 
                                        f32 %123 = OpLoad %122 
                                        f32 %125 = OpFMul %123 %124 
                               Private f32* %126 = OpAccessChain %9 %48 
                                                     OpStore %126 %125 
                               Private f32* %127 = OpAccessChain %9 %48 
                                        f32 %128 = OpLoad %127 
                                        f32 %129 = OpExtInst %1 14 %128 
                               Private f32* %130 = OpAccessChain %90 %95 
                                                     OpStore %130 %129 
                                      f32_2 %131 = OpLoad %33 
                                      f32_2 %132 = OpLoad %33 
                                        f32 %133 = OpDot %131 %132 
                               Private f32* %134 = OpAccessChain %9 %48 
                                                     OpStore %134 %133 
                               Private f32* %135 = OpAccessChain %9 %48 
                                        f32 %136 = OpLoad %135 
                                        f32 %138 = OpFMul %136 %137 
                               Private f32* %139 = OpAccessChain %17 %48 
                                        f32 %140 = OpLoad %139 
                                        f32 %141 = OpFAdd %138 %140 
                               Private f32* %142 = OpAccessChain %9 %48 
                                                     OpStore %142 %141 
                               Private f32* %143 = OpAccessChain %9 %48 
                                        f32 %144 = OpLoad %143 
                                        f32 %145 = OpExtInst %1 14 %144 
                               Private f32* %146 = OpAccessChain %90 %12 
                                                     OpStore %146 %145 
                                      f32_3 %147 = OpLoad %90 
                                        f32 %149 = OpDot %147 %148 
                               Private f32* %150 = OpAccessChain %9 %48 
                                                     OpStore %150 %149 
                               Private f32* %151 = OpAccessChain %9 %48 
                                        f32 %152 = OpLoad %151 
                               Uniform f32* %154 = OpAccessChain %20 %153 
                                        f32 %155 = OpLoad %154 
                                        f32 %156 = OpFDiv %152 %155 
                               Private f32* %157 = OpAccessChain %9 %48 
                                                     OpStore %157 %156 
                               Uniform f32* %158 = OpAccessChain %20 %22 
                                        f32 %159 = OpLoad %158 
                                      f32_3 %160 = OpCompositeConstruct %159 %159 %159 
                                      f32_3 %165 = OpFMul %160 %164 
                                      f32_4 %166 = OpLoad %17 
                                      f32_4 %167 = OpVectorShuffle %166 %165 4 5 6 3 
                                                     OpStore %17 %167 
                                      f32_2 %168 = OpLoad %9 
                                      f32_3 %169 = OpVectorShuffle %168 %168 0 0 0 
                                      f32_3 %172 = OpFMul %169 %171 
                                      f32_4 %173 = OpLoad %17 
                                      f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                      f32_3 %175 = OpFAdd %172 %174 
                                      f32_4 %176 = OpLoad %17 
                                      f32_4 %177 = OpVectorShuffle %176 %175 4 5 6 3 
                                                     OpStore %17 %177 
                                      f32_4 %178 = OpLoad %17 
                                      f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
                                      f32_3 %180 = OpExtInst %1 13 %179 
                                      f32_4 %181 = OpLoad %17 
                                      f32_4 %182 = OpVectorShuffle %181 %180 4 5 6 3 
                                                     OpStore %17 %182 
                                      f32_4 %183 = OpLoad %17 
                                      f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                                      f32_3 %185 = OpFAdd %184 %148 
                                      f32_4 %186 = OpLoad %17 
                                      f32_4 %187 = OpVectorShuffle %186 %185 4 5 6 3 
                                                     OpStore %17 %187 
                        read_only Texture2D %191 = OpLoad %190 
                                    sampler %195 = OpLoad %194 
                 read_only Texture2DSampled %197 = OpSampledImage %191 %195 
                                      f32_2 %198 = OpLoad %33 
                                      f32_4 %199 = OpImageSampleImplicitLod %197 %198 
                                      f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
                                                     OpStore %90 %200 
                                      f32_2 %201 = OpLoad %33 
                                      f32_2 %202 = OpFNegate %201 
                                      f32_2 %204 = OpFAdd %202 %203 
                                                     OpStore %9 %204 
                                      f32_2 %205 = OpLoad %9 
                                      f32_2 %206 = OpLoad %9 
                                        f32 %207 = OpDot %205 %206 
                               Private f32* %208 = OpAccessChain %9 %48 
                                                     OpStore %208 %207 
                               Private f32* %209 = OpAccessChain %9 %48 
                                        f32 %210 = OpLoad %209 
                                        f32 %211 = OpExtInst %1 31 %210 
                               Private f32* %212 = OpAccessChain %9 %48 
                                                     OpStore %212 %211 
                               Private f32* %213 = OpAccessChain %9 %48 
                                        f32 %214 = OpLoad %213 
                               Uniform f32* %216 = OpAccessChain %20 %215 
                                        f32 %217 = OpLoad %216 
                                        f32 %218 = OpFNegate %217 
                                        f32 %219 = OpFAdd %214 %218 
                               Private f32* %220 = OpAccessChain %9 %48 
                                                     OpStore %220 %219 
                                      f32_4 %222 = OpLoad %17 
                                      f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                      f32_3 %226 = OpFMul %223 %225 
                                      f32_3 %227 = OpLoad %90 
                                      f32_3 %228 = OpFNegate %227 
                                      f32_3 %229 = OpFAdd %226 %228 
                                                     OpStore %221 %229 
                               Uniform f32* %230 = OpAccessChain %20 %215 
                                        f32 %231 = OpLoad %230 
                                        f32 %233 = OpFAdd %231 %232 
                               Private f32* %234 = OpAccessChain %17 %48 
                                                     OpStore %234 %233 
                               Private f32* %235 = OpAccessChain %17 %48 
                                        f32 %236 = OpLoad %235 
                               Uniform f32* %238 = OpAccessChain %20 %237 
                                        f32 %239 = OpLoad %238 
                                        f32 %240 = OpFNegate %239 
                                        f32 %241 = OpFAdd %236 %240 
                               Private f32* %242 = OpAccessChain %17 %48 
                                                     OpStore %242 %241 
                               Private f32* %243 = OpAccessChain %17 %48 
                                        f32 %244 = OpLoad %243 
                               Uniform f32* %245 = OpAccessChain %20 %215 
                                        f32 %246 = OpLoad %245 
                                        f32 %247 = OpFNegate %246 
                                        f32 %248 = OpFAdd %244 %247 
                               Private f32* %249 = OpAccessChain %17 %48 
                                                     OpStore %249 %248 
                               Private f32* %250 = OpAccessChain %17 %48 
                                        f32 %251 = OpLoad %250 
                                        f32 %252 = OpFDiv %85 %251 
                               Private f32* %253 = OpAccessChain %17 %48 
                                                     OpStore %253 %252 
                               Private f32* %254 = OpAccessChain %9 %48 
                                        f32 %255 = OpLoad %254 
                               Private f32* %256 = OpAccessChain %17 %48 
                                        f32 %257 = OpLoad %256 
                                        f32 %258 = OpFMul %255 %257 
                               Private f32* %259 = OpAccessChain %9 %48 
                                                     OpStore %259 %258 
                               Private f32* %260 = OpAccessChain %9 %48 
                                        f32 %261 = OpLoad %260 
                                        f32 %263 = OpExtInst %1 43 %261 %262 %85 
                               Private f32* %264 = OpAccessChain %9 %48 
                                                     OpStore %264 %263 
                               Private f32* %265 = OpAccessChain %9 %48 
                                        f32 %266 = OpLoad %265 
                                        f32 %268 = OpFMul %266 %267 
                                        f32 %270 = OpFAdd %268 %269 
                               Private f32* %271 = OpAccessChain %17 %48 
                                                     OpStore %271 %270 
                               Private f32* %272 = OpAccessChain %9 %48 
                                        f32 %273 = OpLoad %272 
                               Private f32* %274 = OpAccessChain %9 %48 
                                        f32 %275 = OpLoad %274 
                                        f32 %276 = OpFMul %273 %275 
                               Private f32* %277 = OpAccessChain %9 %48 
                                                     OpStore %277 %276 
                               Private f32* %278 = OpAccessChain %17 %48 
                                        f32 %279 = OpLoad %278 
                                        f32 %280 = OpFNegate %279 
                               Private f32* %281 = OpAccessChain %9 %48 
                                        f32 %282 = OpLoad %281 
                                        f32 %283 = OpFMul %280 %282 
                                        f32 %284 = OpFAdd %283 %85 
                               Private f32* %285 = OpAccessChain %9 %48 
                                                     OpStore %285 %284 
                                      f32_2 %288 = OpLoad %9 
                                      f32_3 %289 = OpVectorShuffle %288 %288 0 0 0 
                                      f32_3 %290 = OpLoad %221 
                                      f32_3 %291 = OpFMul %289 %290 
                                      f32_3 %292 = OpLoad %90 
                                      f32_3 %293 = OpFAdd %291 %292 
                                      f32_4 %294 = OpLoad %287 
                                      f32_4 %295 = OpVectorShuffle %294 %293 4 5 6 3 
                                                     OpStore %287 %295 
                                Output f32* %297 = OpAccessChain %287 %105 
                                                     OpStore %297 %85 
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