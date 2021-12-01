//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/NightVisionFX" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 52196
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
uniform 	float _OnOff;
uniform 	float _Vignette;
uniform 	float _Vignette_Alpha;
uniform 	float _Greenness;
uniform 	float _Distortion;
uniform 	float _Noise;
uniform 	float _Intensity;
uniform 	float _Light;
uniform 	float _Light2;
uniform 	float _Line;
uniform 	float _Color_R;
uniform 	float _Color_G;
uniform 	float _Color_B;
uniform 	float _Size;
uniform 	float _Dist;
uniform 	float _Smooth;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
vec2 u_xlat5;
vec2 u_xlat8;
vec2 u_xlat10;
float u_xlat12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(_TimeX) * vec2(8.0, 10.0);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat8.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat2.xy = u_xlat8.xy * u_xlat8.xy;
    u_xlat8.xy = u_xlat8.xy * vec2(1.20000005, 1.20000005);
    u_xlat13 = dot(u_xlat2.yy, u_xlat2.xx);
    u_xlat13 = u_xlat13 + 0.829999983;
    u_xlat8.xy = u_xlat8.xy * vec2(u_xlat13) + vec2(0.5, 0.5);
    u_xlat8.xy = (-u_xlat1.xy) + u_xlat8.xy;
    u_xlat8.xy = vec2(vec2(_Distortion, _Distortion)) * u_xlat8.xy + u_xlat1.xy;
    u_xlat2.xy = u_xlat0.xx * u_xlat8.xy;
    u_xlat0.x = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Noise;
    u_xlat2 = texture(_MainTex, u_xlat8.xy);
    u_xlat8.x = u_xlat8.y * _Light;
    u_xlat4 = u_xlat8.x * 300.0 + u_xlat0.y;
    u_xlat4 = sin(u_xlat4);
    u_xlat4 = u_xlat4 * 0.100000001 + -0.199999988;
    u_xlat4 = _Line * u_xlat4 + 1.0;
    u_xlat0.xzw = u_xlat0.xxx * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
    u_xlat2.xy = vec2(vec2(_Vignette, _Vignette)) + vec2(0.150000006, 0.25);
    u_xlat10.xy = (-u_xlat1.xy) + vec2(0.5, 0.5);
    u_xlat13 = dot(u_xlat10.xy, u_xlat10.xy);
    u_xlat13 = sqrt(u_xlat13);
    u_xlat2.xy = (-u_xlat2.xy) + vec2(u_xlat13);
    u_xlat2.xy = u_xlat2.xy * vec2(2.85714293, -4.0);
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10.xy = u_xlat2.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * u_xlat10.xy;
    u_xlat0.xzw = (-u_xlat2.xxx) * vec3(vec3(_Vignette_Alpha, _Vignette_Alpha, _Vignette_Alpha)) + u_xlat0.xzw;
    u_xlat0.xzw = u_xlat2.yyy * vec3(vec3(_Light2, _Light2, _Light2)) + u_xlat0.xzw;
    u_xlat0.xzw = u_xlat0.xzw + vec3(vec3(_Intensity, _Intensity, _Intensity));
    u_xlat13 = _Greenness * 0.25 + 1.54999995;
    u_xlat2.y = u_xlat0.z * u_xlat13;
    u_xlat2.xz = u_xlat0.xw * vec2(0.550000012, 0.550000012);
    u_xlat3.yz = u_xlat2.yz * vec2(u_xlat4) + vec2(_Color_G, _Color_B);
    u_xlat3.x = u_xlat2.x * u_xlat4 + _Color_R;
    u_xlat0.xyz = u_xlat0.xzw + (-u_xlat3.xyz);
    u_xlat0.xyz = vec3(vec3(_OnOff, _OnOff, _OnOff)) * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat1.z = u_xlat1.x * 1.38888884;
    u_xlat2.yz = (-u_xlat1.zy);
    u_xlat2.x = (-u_xlat1.x) * 1.38888884 + (-_Dist);
    u_xlat1.xy = u_xlat2.xz + vec2(0.694000006, 0.5);
    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat12 = sqrt(u_xlat12);
    u_xlat12 = u_xlat12 + (-_Size);
    u_xlat1.x = float(1.0) / (-_Smooth);
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat5.x = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = (-u_xlat5.x) * u_xlat12 + 1.0;
    u_xlat3.x = _Dist + 0.694000006;
    u_xlat3.y = 0.5;
    u_xlat5.xy = u_xlat2.yz + u_xlat3.xy;
    u_xlat5.x = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + (-_Size);
    u_xlat1.x = u_xlat1.x * u_xlat5.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat5.x = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = (-u_xlat5.x) * u_xlat1.x + 1.0;
    u_xlat12 = u_xlat12 * u_xlat1.x;
    SV_Target0.xyz = vec3(u_xlat12) * (-u_xlat0.xyz) + u_xlat0.xyz;
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
; Bound: 527
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %37 %511 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpMemberDecorate %10 4 Offset 10 
                                                      OpMemberDecorate %10 5 Offset 10 
                                                      OpMemberDecorate %10 6 Offset 10 
                                                      OpMemberDecorate %10 7 Offset 10 
                                                      OpMemberDecorate %10 8 Offset 10 
                                                      OpMemberDecorate %10 9 Offset 10 
                                                      OpMemberDecorate %10 10 Offset 10 
                                                      OpMemberDecorate %10 11 Offset 10 
                                                      OpMemberDecorate %10 12 Offset 10 
                                                      OpMemberDecorate %10 13 Offset 10 
                                                      OpMemberDecorate %10 14 Offset 10 
                                                      OpMemberDecorate %10 15 Offset 10 
                                                      OpMemberDecorate %10 16 Offset 10 
                                                      OpMemberDecorate %10 17 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate vs_TEXCOORD0 Location 37 
                                                      OpDecorate %138 DescriptorSet 138 
                                                      OpDecorate %138 Binding 138 
                                                      OpDecorate %142 DescriptorSet 142 
                                                      OpDecorate %142 Binding 142 
                                                      OpDecorate %511 Location 511 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeStruct %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 0 
                                              %15 = OpTypePointer Uniform %6 
                                              %18 = OpTypeVector %6 2 
                                          f32 %20 = OpConstant 3.674022E-40 
                                          f32 %21 = OpConstant 3.674022E-40 
                                        f32_2 %22 = OpConstantComposite %20 %21 
                                              %26 = OpTypeInt 32 0 
                                          u32 %27 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                              %33 = OpTypeVector %6 3 
                                              %34 = OpTypePointer Private %33 
                               Private f32_3* %35 = OpVariable Private 
                                              %36 = OpTypePointer Input %18 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          i32 %39 = OpConstant 17 
                                              %40 = OpTypePointer Uniform %7 
                                              %51 = OpTypePointer Private %18 
                               Private f32_2* %52 = OpVariable Private 
                                          f32 %55 = OpConstant 3.674022E-40 
                                        f32_2 %56 = OpConstantComposite %55 %55 
                               Private f32_3* %58 = OpVariable Private 
                                          f32 %65 = OpConstant 3.674022E-40 
                                        f32_2 %66 = OpConstantComposite %65 %65 
                                 Private f32* %68 = OpVariable Private 
                                          f32 %75 = OpConstant 3.674022E-40 
                                          f32 %81 = OpConstant 3.674022E-40 
                                        f32_2 %82 = OpConstantComposite %81 %81 
                                          i32 %89 = OpConstant 5 
                                         f32 %111 = OpConstant 3.674022E-40 
                                         f32 %112 = OpConstant 3.674022E-40 
                                       f32_2 %113 = OpConstantComposite %111 %112 
                                         f32 %122 = OpConstant 3.674022E-40 
                                         i32 %131 = OpConstant 6 
                                             %136 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %137 = OpTypePointer UniformConstant %136 
        UniformConstant read_only Texture2D* %138 = OpVariable UniformConstant 
                                             %140 = OpTypeSampler 
                                             %141 = OpTypePointer UniformConstant %140 
                    UniformConstant sampler* %142 = OpVariable UniformConstant 
                                             %144 = OpTypeSampledImage %136 
                                         u32 %149 = OpConstant 1 
                                         i32 %152 = OpConstant 8 
                                Private f32* %157 = OpVariable Private 
                                         f32 %160 = OpConstant 3.674022E-40 
                                         f32 %168 = OpConstant 3.674022E-40 
                                         f32 %170 = OpConstant 3.674022E-40 
                                         i32 %172 = OpConstant 10 
                                         f32 %177 = OpConstant 3.674022E-40 
                                       f32_3 %181 = OpConstantComposite %81 %81 %81 
                                         i32 %187 = OpConstant 2 
                                         f32 %196 = OpConstant 3.674022E-40 
                                         f32 %197 = OpConstant 3.674022E-40 
                                       f32_2 %198 = OpConstantComposite %196 %197 
                              Private f32_2* %202 = OpVariable Private 
                                         f32 %222 = OpConstant 3.674022E-40 
                                         f32 %223 = OpConstant 3.674022E-40 
                                       f32_2 %224 = OpConstantComposite %222 %223 
                                         f32 %230 = OpConstant 3.674022E-40 
                                         f32 %238 = OpConstant 3.674022E-40 
                                       f32_2 %239 = OpConstantComposite %238 %238 
                                         f32 %241 = OpConstant 3.674022E-40 
                                       f32_2 %242 = OpConstantComposite %241 %241 
                                         i32 %260 = OpConstant 3 
                                         i32 %280 = OpConstant 9 
                                         i32 %300 = OpConstant 7 
                                         i32 %315 = OpConstant 4 
                                         f32 %319 = OpConstant 3.674022E-40 
                                         u32 %321 = OpConstant 2 
                                         f32 %329 = OpConstant 3.674022E-40 
                                       f32_2 %330 = OpConstantComposite %329 %329 
                              Private f32_3* %334 = OpVariable Private 
                                         i32 %340 = OpConstant 12 
                                         i32 %343 = OpConstant 13 
                                         i32 %354 = OpConstant 11 
                                         i32 %366 = OpConstant 1 
                                         f32 %387 = OpConstant 3.674022E-40 
                                         i32 %399 = OpConstant 15 
                                         f32 %407 = OpConstant 3.674022E-40 
                                       f32_2 %408 = OpConstantComposite %407 %81 
                                Private f32* %412 = OpVariable Private 
                                         i32 %421 = OpConstant 14 
                                         i32 %426 = OpConstant 16 
                              Private f32_2* %438 = OpVariable Private 
                                             %510 = OpTypePointer Output %7 
                               Output f32_4* %511 = OpVariable Output 
                                         u32 %523 = OpConstant 3 
                                             %524 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %16 = OpAccessChain %12 %14 
                                          f32 %17 = OpLoad %16 
                                        f32_2 %19 = OpCompositeConstruct %17 %17 
                                        f32_2 %23 = OpFMul %19 %22 
                                        f32_4 %24 = OpLoad %9 
                                        f32_4 %25 = OpVectorShuffle %24 %23 4 5 2 3 
                                                      OpStore %9 %25 
                                 Private f32* %29 = OpAccessChain %9 %27 
                                          f32 %30 = OpLoad %29 
                                          f32 %31 = OpExtInst %1 8 %30 
                                 Private f32* %32 = OpAccessChain %9 %27 
                                                      OpStore %32 %31 
                                        f32_2 %38 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %41 = OpAccessChain %12 %39 
                                        f32_4 %42 = OpLoad %41 
                                        f32_2 %43 = OpVectorShuffle %42 %42 0 1 
                                        f32_2 %44 = OpFMul %38 %43 
                               Uniform f32_4* %45 = OpAccessChain %12 %39 
                                        f32_4 %46 = OpLoad %45 
                                        f32_2 %47 = OpVectorShuffle %46 %46 2 3 
                                        f32_2 %48 = OpFAdd %44 %47 
                                        f32_3 %49 = OpLoad %35 
                                        f32_3 %50 = OpVectorShuffle %49 %48 3 4 2 
                                                      OpStore %35 %50 
                                        f32_3 %53 = OpLoad %35 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
                                        f32_2 %57 = OpFAdd %54 %56 
                                                      OpStore %52 %57 
                                        f32_2 %59 = OpLoad %52 
                                        f32_2 %60 = OpLoad %52 
                                        f32_2 %61 = OpFMul %59 %60 
                                        f32_3 %62 = OpLoad %58 
                                        f32_3 %63 = OpVectorShuffle %62 %61 3 4 2 
                                                      OpStore %58 %63 
                                        f32_2 %64 = OpLoad %52 
                                        f32_2 %67 = OpFMul %64 %66 
                                                      OpStore %52 %67 
                                        f32_3 %69 = OpLoad %58 
                                        f32_2 %70 = OpVectorShuffle %69 %69 1 1 
                                        f32_3 %71 = OpLoad %58 
                                        f32_2 %72 = OpVectorShuffle %71 %71 0 0 
                                          f32 %73 = OpDot %70 %72 
                                                      OpStore %68 %73 
                                          f32 %74 = OpLoad %68 
                                          f32 %76 = OpFAdd %74 %75 
                                                      OpStore %68 %76 
                                        f32_2 %77 = OpLoad %52 
                                          f32 %78 = OpLoad %68 
                                        f32_2 %79 = OpCompositeConstruct %78 %78 
                                        f32_2 %80 = OpFMul %77 %79 
                                        f32_2 %83 = OpFAdd %80 %82 
                                                      OpStore %52 %83 
                                        f32_3 %84 = OpLoad %35 
                                        f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                                        f32_2 %86 = OpFNegate %85 
                                        f32_2 %87 = OpLoad %52 
                                        f32_2 %88 = OpFAdd %86 %87 
                                                      OpStore %52 %88 
                                 Uniform f32* %90 = OpAccessChain %12 %89 
                                          f32 %91 = OpLoad %90 
                                 Uniform f32* %92 = OpAccessChain %12 %89 
                                          f32 %93 = OpLoad %92 
                                        f32_2 %94 = OpCompositeConstruct %91 %93 
                                          f32 %95 = OpCompositeExtract %94 0 
                                          f32 %96 = OpCompositeExtract %94 1 
                                        f32_2 %97 = OpCompositeConstruct %95 %96 
                                        f32_2 %98 = OpLoad %52 
                                        f32_2 %99 = OpFMul %97 %98 
                                       f32_3 %100 = OpLoad %35 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                       f32_2 %102 = OpFAdd %99 %101 
                                                      OpStore %52 %102 
                                       f32_4 %103 = OpLoad %9 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 0 
                                       f32_2 %105 = OpLoad %52 
                                       f32_2 %106 = OpFMul %104 %105 
                                       f32_3 %107 = OpLoad %58 
                                       f32_3 %108 = OpVectorShuffle %107 %106 3 4 2 
                                                      OpStore %58 %108 
                                       f32_3 %109 = OpLoad %58 
                                       f32_2 %110 = OpVectorShuffle %109 %109 0 1 
                                         f32 %114 = OpDot %110 %113 
                                Private f32* %115 = OpAccessChain %9 %27 
                                                      OpStore %115 %114 
                                Private f32* %116 = OpAccessChain %9 %27 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpExtInst %1 13 %117 
                                Private f32* %119 = OpAccessChain %9 %27 
                                                      OpStore %119 %118 
                                Private f32* %120 = OpAccessChain %9 %27 
                                         f32 %121 = OpLoad %120 
                                         f32 %123 = OpFMul %121 %122 
                                Private f32* %124 = OpAccessChain %9 %27 
                                                      OpStore %124 %123 
                                Private f32* %125 = OpAccessChain %9 %27 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpExtInst %1 10 %126 
                                Private f32* %128 = OpAccessChain %9 %27 
                                                      OpStore %128 %127 
                                Private f32* %129 = OpAccessChain %9 %27 
                                         f32 %130 = OpLoad %129 
                                Uniform f32* %132 = OpAccessChain %12 %131 
                                         f32 %133 = OpLoad %132 
                                         f32 %134 = OpFMul %130 %133 
                                Private f32* %135 = OpAccessChain %9 %27 
                                                      OpStore %135 %134 
                         read_only Texture2D %139 = OpLoad %138 
                                     sampler %143 = OpLoad %142 
                  read_only Texture2DSampled %145 = OpSampledImage %139 %143 
                                       f32_2 %146 = OpLoad %52 
                                       f32_4 %147 = OpImageSampleImplicitLod %145 %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                                      OpStore %58 %148 
                                Private f32* %150 = OpAccessChain %52 %149 
                                         f32 %151 = OpLoad %150 
                                Uniform f32* %153 = OpAccessChain %12 %152 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpFMul %151 %154 
                                Private f32* %156 = OpAccessChain %52 %27 
                                                      OpStore %156 %155 
                                Private f32* %158 = OpAccessChain %52 %27 
                                         f32 %159 = OpLoad %158 
                                         f32 %161 = OpFMul %159 %160 
                                Private f32* %162 = OpAccessChain %9 %149 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpFAdd %161 %163 
                                                      OpStore %157 %164 
                                         f32 %165 = OpLoad %157 
                                         f32 %166 = OpExtInst %1 13 %165 
                                                      OpStore %157 %166 
                                         f32 %167 = OpLoad %157 
                                         f32 %169 = OpFMul %167 %168 
                                         f32 %171 = OpFAdd %169 %170 
                                                      OpStore %157 %171 
                                Uniform f32* %173 = OpAccessChain %12 %172 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpLoad %157 
                                         f32 %176 = OpFMul %174 %175 
                                         f32 %178 = OpFAdd %176 %177 
                                                      OpStore %157 %178 
                                       f32_4 %179 = OpLoad %9 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 0 0 
                                       f32_3 %182 = OpFMul %180 %181 
                                       f32_3 %183 = OpLoad %58 
                                       f32_3 %184 = OpFAdd %182 %183 
                                       f32_4 %185 = OpLoad %9 
                                       f32_4 %186 = OpVectorShuffle %185 %184 4 1 5 6 
                                                      OpStore %9 %186 
                                Uniform f32* %188 = OpAccessChain %12 %187 
                                         f32 %189 = OpLoad %188 
                                Uniform f32* %190 = OpAccessChain %12 %187 
                                         f32 %191 = OpLoad %190 
                                       f32_2 %192 = OpCompositeConstruct %189 %191 
                                         f32 %193 = OpCompositeExtract %192 0 
                                         f32 %194 = OpCompositeExtract %192 1 
                                       f32_2 %195 = OpCompositeConstruct %193 %194 
                                       f32_2 %199 = OpFAdd %195 %198 
                                       f32_3 %200 = OpLoad %58 
                                       f32_3 %201 = OpVectorShuffle %200 %199 3 4 2 
                                                      OpStore %58 %201 
                                       f32_3 %203 = OpLoad %35 
                                       f32_2 %204 = OpVectorShuffle %203 %203 0 1 
                                       f32_2 %205 = OpFNegate %204 
                                       f32_2 %206 = OpFAdd %205 %82 
                                                      OpStore %202 %206 
                                       f32_2 %207 = OpLoad %202 
                                       f32_2 %208 = OpLoad %202 
                                         f32 %209 = OpDot %207 %208 
                                                      OpStore %68 %209 
                                         f32 %210 = OpLoad %68 
                                         f32 %211 = OpExtInst %1 31 %210 
                                                      OpStore %68 %211 
                                       f32_3 %212 = OpLoad %58 
                                       f32_2 %213 = OpVectorShuffle %212 %212 0 1 
                                       f32_2 %214 = OpFNegate %213 
                                         f32 %215 = OpLoad %68 
                                       f32_2 %216 = OpCompositeConstruct %215 %215 
                                       f32_2 %217 = OpFAdd %214 %216 
                                       f32_3 %218 = OpLoad %58 
                                       f32_3 %219 = OpVectorShuffle %218 %217 3 4 2 
                                                      OpStore %58 %219 
                                       f32_3 %220 = OpLoad %58 
                                       f32_2 %221 = OpVectorShuffle %220 %220 0 1 
                                       f32_2 %225 = OpFMul %221 %224 
                                       f32_3 %226 = OpLoad %58 
                                       f32_3 %227 = OpVectorShuffle %226 %225 3 4 2 
                                                      OpStore %58 %227 
                                       f32_3 %228 = OpLoad %58 
                                       f32_2 %229 = OpVectorShuffle %228 %228 0 1 
                                       f32_2 %231 = OpCompositeConstruct %230 %230 
                                       f32_2 %232 = OpCompositeConstruct %177 %177 
                                       f32_2 %233 = OpExtInst %1 43 %229 %231 %232 
                                       f32_3 %234 = OpLoad %58 
                                       f32_3 %235 = OpVectorShuffle %234 %233 3 4 2 
                                                      OpStore %58 %235 
                                       f32_3 %236 = OpLoad %58 
                                       f32_2 %237 = OpVectorShuffle %236 %236 0 1 
                                       f32_2 %240 = OpFMul %237 %239 
                                       f32_2 %243 = OpFAdd %240 %242 
                                                      OpStore %202 %243 
                                       f32_3 %244 = OpLoad %58 
                                       f32_2 %245 = OpVectorShuffle %244 %244 0 1 
                                       f32_3 %246 = OpLoad %58 
                                       f32_2 %247 = OpVectorShuffle %246 %246 0 1 
                                       f32_2 %248 = OpFMul %245 %247 
                                       f32_3 %249 = OpLoad %58 
                                       f32_3 %250 = OpVectorShuffle %249 %248 3 4 2 
                                                      OpStore %58 %250 
                                       f32_3 %251 = OpLoad %58 
                                       f32_2 %252 = OpVectorShuffle %251 %251 0 1 
                                       f32_2 %253 = OpLoad %202 
                                       f32_2 %254 = OpFMul %252 %253 
                                       f32_3 %255 = OpLoad %58 
                                       f32_3 %256 = OpVectorShuffle %255 %254 3 4 2 
                                                      OpStore %58 %256 
                                       f32_3 %257 = OpLoad %58 
                                       f32_3 %258 = OpVectorShuffle %257 %257 0 0 0 
                                       f32_3 %259 = OpFNegate %258 
                                Uniform f32* %261 = OpAccessChain %12 %260 
                                         f32 %262 = OpLoad %261 
                                Uniform f32* %263 = OpAccessChain %12 %260 
                                         f32 %264 = OpLoad %263 
                                Uniform f32* %265 = OpAccessChain %12 %260 
                                         f32 %266 = OpLoad %265 
                                       f32_3 %267 = OpCompositeConstruct %262 %264 %266 
                                         f32 %268 = OpCompositeExtract %267 0 
                                         f32 %269 = OpCompositeExtract %267 1 
                                         f32 %270 = OpCompositeExtract %267 2 
                                       f32_3 %271 = OpCompositeConstruct %268 %269 %270 
                                       f32_3 %272 = OpFMul %259 %271 
                                       f32_4 %273 = OpLoad %9 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 2 3 
                                       f32_3 %275 = OpFAdd %272 %274 
                                       f32_4 %276 = OpLoad %9 
                                       f32_4 %277 = OpVectorShuffle %276 %275 4 1 5 6 
                                                      OpStore %9 %277 
                                       f32_3 %278 = OpLoad %58 
                                       f32_3 %279 = OpVectorShuffle %278 %278 1 1 1 
                                Uniform f32* %281 = OpAccessChain %12 %280 
                                         f32 %282 = OpLoad %281 
                                Uniform f32* %283 = OpAccessChain %12 %280 
                                         f32 %284 = OpLoad %283 
                                Uniform f32* %285 = OpAccessChain %12 %280 
                                         f32 %286 = OpLoad %285 
                                       f32_3 %287 = OpCompositeConstruct %282 %284 %286 
                                         f32 %288 = OpCompositeExtract %287 0 
                                         f32 %289 = OpCompositeExtract %287 1 
                                         f32 %290 = OpCompositeExtract %287 2 
                                       f32_3 %291 = OpCompositeConstruct %288 %289 %290 
                                       f32_3 %292 = OpFMul %279 %291 
                                       f32_4 %293 = OpLoad %9 
                                       f32_3 %294 = OpVectorShuffle %293 %293 0 2 3 
                                       f32_3 %295 = OpFAdd %292 %294 
                                       f32_4 %296 = OpLoad %9 
                                       f32_4 %297 = OpVectorShuffle %296 %295 4 1 5 6 
                                                      OpStore %9 %297 
                                       f32_4 %298 = OpLoad %9 
                                       f32_3 %299 = OpVectorShuffle %298 %298 0 2 3 
                                Uniform f32* %301 = OpAccessChain %12 %300 
                                         f32 %302 = OpLoad %301 
                                Uniform f32* %303 = OpAccessChain %12 %300 
                                         f32 %304 = OpLoad %303 
                                Uniform f32* %305 = OpAccessChain %12 %300 
                                         f32 %306 = OpLoad %305 
                                       f32_3 %307 = OpCompositeConstruct %302 %304 %306 
                                         f32 %308 = OpCompositeExtract %307 0 
                                         f32 %309 = OpCompositeExtract %307 1 
                                         f32 %310 = OpCompositeExtract %307 2 
                                       f32_3 %311 = OpCompositeConstruct %308 %309 %310 
                                       f32_3 %312 = OpFAdd %299 %311 
                                       f32_4 %313 = OpLoad %9 
                                       f32_4 %314 = OpVectorShuffle %313 %312 4 1 5 6 
                                                      OpStore %9 %314 
                                Uniform f32* %316 = OpAccessChain %12 %315 
                                         f32 %317 = OpLoad %316 
                                         f32 %318 = OpFMul %317 %197 
                                         f32 %320 = OpFAdd %318 %319 
                                                      OpStore %68 %320 
                                Private f32* %322 = OpAccessChain %9 %321 
                                         f32 %323 = OpLoad %322 
                                         f32 %324 = OpLoad %68 
                                         f32 %325 = OpFMul %323 %324 
                                Private f32* %326 = OpAccessChain %58 %149 
                                                      OpStore %326 %325 
                                       f32_4 %327 = OpLoad %9 
                                       f32_2 %328 = OpVectorShuffle %327 %327 0 3 
                                       f32_2 %331 = OpFMul %328 %330 
                                       f32_3 %332 = OpLoad %58 
                                       f32_3 %333 = OpVectorShuffle %332 %331 3 1 4 
                                                      OpStore %58 %333 
                                       f32_3 %335 = OpLoad %58 
                                       f32_2 %336 = OpVectorShuffle %335 %335 1 2 
                                         f32 %337 = OpLoad %157 
                                       f32_2 %338 = OpCompositeConstruct %337 %337 
                                       f32_2 %339 = OpFMul %336 %338 
                                Uniform f32* %341 = OpAccessChain %12 %340 
                                         f32 %342 = OpLoad %341 
                                Uniform f32* %344 = OpAccessChain %12 %343 
                                         f32 %345 = OpLoad %344 
                                       f32_2 %346 = OpCompositeConstruct %342 %345 
                                       f32_2 %347 = OpFAdd %339 %346 
                                       f32_3 %348 = OpLoad %334 
                                       f32_3 %349 = OpVectorShuffle %348 %347 0 3 4 
                                                      OpStore %334 %349 
                                Private f32* %350 = OpAccessChain %58 %27 
                                         f32 %351 = OpLoad %350 
                                         f32 %352 = OpLoad %157 
                                         f32 %353 = OpFMul %351 %352 
                                Uniform f32* %355 = OpAccessChain %12 %354 
                                         f32 %356 = OpLoad %355 
                                         f32 %357 = OpFAdd %353 %356 
                                Private f32* %358 = OpAccessChain %334 %27 
                                                      OpStore %358 %357 
                                       f32_4 %359 = OpLoad %9 
                                       f32_3 %360 = OpVectorShuffle %359 %359 0 2 3 
                                       f32_3 %361 = OpLoad %334 
                                       f32_3 %362 = OpFNegate %361 
                                       f32_3 %363 = OpFAdd %360 %362 
                                       f32_4 %364 = OpLoad %9 
                                       f32_4 %365 = OpVectorShuffle %364 %363 4 5 6 3 
                                                      OpStore %9 %365 
                                Uniform f32* %367 = OpAccessChain %12 %366 
                                         f32 %368 = OpLoad %367 
                                Uniform f32* %369 = OpAccessChain %12 %366 
                                         f32 %370 = OpLoad %369 
                                Uniform f32* %371 = OpAccessChain %12 %366 
                                         f32 %372 = OpLoad %371 
                                       f32_3 %373 = OpCompositeConstruct %368 %370 %372 
                                         f32 %374 = OpCompositeExtract %373 0 
                                         f32 %375 = OpCompositeExtract %373 1 
                                         f32 %376 = OpCompositeExtract %373 2 
                                       f32_3 %377 = OpCompositeConstruct %374 %375 %376 
                                       f32_4 %378 = OpLoad %9 
                                       f32_3 %379 = OpVectorShuffle %378 %378 0 1 2 
                                       f32_3 %380 = OpFMul %377 %379 
                                       f32_3 %381 = OpLoad %334 
                                       f32_3 %382 = OpFAdd %380 %381 
                                       f32_4 %383 = OpLoad %9 
                                       f32_4 %384 = OpVectorShuffle %383 %382 4 5 6 3 
                                                      OpStore %9 %384 
                                Private f32* %385 = OpAccessChain %35 %27 
                                         f32 %386 = OpLoad %385 
                                         f32 %388 = OpFMul %386 %387 
                                Private f32* %389 = OpAccessChain %35 %321 
                                                      OpStore %389 %388 
                                       f32_3 %390 = OpLoad %35 
                                       f32_2 %391 = OpVectorShuffle %390 %390 2 1 
                                       f32_2 %392 = OpFNegate %391 
                                       f32_3 %393 = OpLoad %58 
                                       f32_3 %394 = OpVectorShuffle %393 %392 0 3 4 
                                                      OpStore %58 %394 
                                Private f32* %395 = OpAccessChain %35 %27 
                                         f32 %396 = OpLoad %395 
                                         f32 %397 = OpFNegate %396 
                                         f32 %398 = OpFMul %397 %387 
                                Uniform f32* %400 = OpAccessChain %12 %399 
                                         f32 %401 = OpLoad %400 
                                         f32 %402 = OpFNegate %401 
                                         f32 %403 = OpFAdd %398 %402 
                                Private f32* %404 = OpAccessChain %58 %27 
                                                      OpStore %404 %403 
                                       f32_3 %405 = OpLoad %58 
                                       f32_2 %406 = OpVectorShuffle %405 %405 0 2 
                                       f32_2 %409 = OpFAdd %406 %408 
                                       f32_3 %410 = OpLoad %35 
                                       f32_3 %411 = OpVectorShuffle %410 %409 3 4 2 
                                                      OpStore %35 %411 
                                       f32_3 %413 = OpLoad %35 
                                       f32_2 %414 = OpVectorShuffle %413 %413 0 1 
                                       f32_3 %415 = OpLoad %35 
                                       f32_2 %416 = OpVectorShuffle %415 %415 0 1 
                                         f32 %417 = OpDot %414 %416 
                                                      OpStore %412 %417 
                                         f32 %418 = OpLoad %412 
                                         f32 %419 = OpExtInst %1 31 %418 
                                                      OpStore %412 %419 
                                         f32 %420 = OpLoad %412 
                                Uniform f32* %422 = OpAccessChain %12 %421 
                                         f32 %423 = OpLoad %422 
                                         f32 %424 = OpFNegate %423 
                                         f32 %425 = OpFAdd %420 %424 
                                                      OpStore %412 %425 
                                Uniform f32* %427 = OpAccessChain %12 %426 
                                         f32 %428 = OpLoad %427 
                                         f32 %429 = OpFNegate %428 
                                         f32 %430 = OpFDiv %177 %429 
                                Private f32* %431 = OpAccessChain %35 %27 
                                                      OpStore %431 %430 
                                         f32 %432 = OpLoad %412 
                                Private f32* %433 = OpAccessChain %35 %27 
                                         f32 %434 = OpLoad %433 
                                         f32 %435 = OpFMul %432 %434 
                                                      OpStore %412 %435 
                                         f32 %436 = OpLoad %412 
                                         f32 %437 = OpExtInst %1 43 %436 %230 %177 
                                                      OpStore %412 %437 
                                         f32 %439 = OpLoad %412 
                                         f32 %440 = OpFMul %439 %238 
                                         f32 %441 = OpFAdd %440 %241 
                                Private f32* %442 = OpAccessChain %438 %27 
                                                      OpStore %442 %441 
                                         f32 %443 = OpLoad %412 
                                         f32 %444 = OpLoad %412 
                                         f32 %445 = OpFMul %443 %444 
                                                      OpStore %412 %445 
                                Private f32* %446 = OpAccessChain %438 %27 
                                         f32 %447 = OpLoad %446 
                                         f32 %448 = OpFNegate %447 
                                         f32 %449 = OpLoad %412 
                                         f32 %450 = OpFMul %448 %449 
                                         f32 %451 = OpFAdd %450 %177 
                                                      OpStore %412 %451 
                                Uniform f32* %452 = OpAccessChain %12 %399 
                                         f32 %453 = OpLoad %452 
                                         f32 %454 = OpFAdd %453 %407 
                                Private f32* %455 = OpAccessChain %334 %27 
                                                      OpStore %455 %454 
                                Private f32* %456 = OpAccessChain %334 %149 
                                                      OpStore %456 %81 
                                       f32_3 %457 = OpLoad %58 
                                       f32_2 %458 = OpVectorShuffle %457 %457 1 2 
                                       f32_3 %459 = OpLoad %334 
                                       f32_2 %460 = OpVectorShuffle %459 %459 0 1 
                                       f32_2 %461 = OpFAdd %458 %460 
                                                      OpStore %438 %461 
                                       f32_2 %462 = OpLoad %438 
                                       f32_2 %463 = OpLoad %438 
                                         f32 %464 = OpDot %462 %463 
                                Private f32* %465 = OpAccessChain %438 %27 
                                                      OpStore %465 %464 
                                Private f32* %466 = OpAccessChain %438 %27 
                                         f32 %467 = OpLoad %466 
                                         f32 %468 = OpExtInst %1 31 %467 
                                Private f32* %469 = OpAccessChain %438 %27 
                                                      OpStore %469 %468 
                                Private f32* %470 = OpAccessChain %438 %27 
                                         f32 %471 = OpLoad %470 
                                Uniform f32* %472 = OpAccessChain %12 %421 
                                         f32 %473 = OpLoad %472 
                                         f32 %474 = OpFNegate %473 
                                         f32 %475 = OpFAdd %471 %474 
                                Private f32* %476 = OpAccessChain %438 %27 
                                                      OpStore %476 %475 
                                Private f32* %477 = OpAccessChain %35 %27 
                                         f32 %478 = OpLoad %477 
                                Private f32* %479 = OpAccessChain %438 %27 
                                         f32 %480 = OpLoad %479 
                                         f32 %481 = OpFMul %478 %480 
                                Private f32* %482 = OpAccessChain %35 %27 
                                                      OpStore %482 %481 
                                Private f32* %483 = OpAccessChain %35 %27 
                                         f32 %484 = OpLoad %483 
                                         f32 %485 = OpExtInst %1 43 %484 %230 %177 
                                Private f32* %486 = OpAccessChain %35 %27 
                                                      OpStore %486 %485 
                                Private f32* %487 = OpAccessChain %35 %27 
                                         f32 %488 = OpLoad %487 
                                         f32 %489 = OpFMul %488 %238 
                                         f32 %490 = OpFAdd %489 %241 
                                Private f32* %491 = OpAccessChain %438 %27 
                                                      OpStore %491 %490 
                                Private f32* %492 = OpAccessChain %35 %27 
                                         f32 %493 = OpLoad %492 
                                Private f32* %494 = OpAccessChain %35 %27 
                                         f32 %495 = OpLoad %494 
                                         f32 %496 = OpFMul %493 %495 
                                Private f32* %497 = OpAccessChain %35 %27 
                                                      OpStore %497 %496 
                                Private f32* %498 = OpAccessChain %438 %27 
                                         f32 %499 = OpLoad %498 
                                         f32 %500 = OpFNegate %499 
                                Private f32* %501 = OpAccessChain %35 %27 
                                         f32 %502 = OpLoad %501 
                                         f32 %503 = OpFMul %500 %502 
                                         f32 %504 = OpFAdd %503 %177 
                                Private f32* %505 = OpAccessChain %35 %27 
                                                      OpStore %505 %504 
                                         f32 %506 = OpLoad %412 
                                Private f32* %507 = OpAccessChain %35 %27 
                                         f32 %508 = OpLoad %507 
                                         f32 %509 = OpFMul %506 %508 
                                                      OpStore %412 %509 
                                         f32 %512 = OpLoad %412 
                                       f32_3 %513 = OpCompositeConstruct %512 %512 %512 
                                       f32_4 %514 = OpLoad %9 
                                       f32_3 %515 = OpVectorShuffle %514 %514 0 1 2 
                                       f32_3 %516 = OpFNegate %515 
                                       f32_3 %517 = OpFMul %513 %516 
                                       f32_4 %518 = OpLoad %9 
                                       f32_3 %519 = OpVectorShuffle %518 %518 0 1 2 
                                       f32_3 %520 = OpFAdd %517 %519 
                                       f32_4 %521 = OpLoad %511 
                                       f32_4 %522 = OpVectorShuffle %521 %520 4 5 6 3 
                                                      OpStore %511 %522 
                                 Output f32* %525 = OpAccessChain %511 %523 
                                                      OpStore %525 %177 
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