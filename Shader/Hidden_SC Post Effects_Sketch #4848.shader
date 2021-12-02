//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/Sketch" {
Properties {
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 53197
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 hlslcc_mtx4x4clipToWorld[4];
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec3 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4clipToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4clipToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4clipToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _Params;
uniform 	vec2 _Brightness;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
UNITY_LOCATION(2) uniform  sampler2D _Strokes;
in  vec2 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat9;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
float u_xlat15;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
    u_xlat6.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = u_xlat0.x * _ZBufferParams.x;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat6.xyz = vs_TEXCOORD2.xyz * u_xlat6.xxx + _WorldSpaceCameraPos.xyz;
    u_xlat6.xyz = u_xlat6.xyz * _Params.www;
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978);
    u_xlat1 = texture(_Strokes, u_xlat6.yz);
    u_xlat2 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat13 = dot(u_xlat2.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat19 = u_xlat13 + 0.0549999997;
    u_xlat19 = u_xlat19 * 0.947867334;
    u_xlat19 = max(abs(u_xlat19), 1.1920929e-07);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * 2.4000001;
    u_xlat19 = exp2(u_xlat19);
    u_xlat3.x = u_xlat13 * 0.0773993805;
    u_xlatb13 = 0.0404499993>=u_xlat13;
    u_xlat13 = (u_xlatb13) ? u_xlat3.x : u_xlat19;
    u_xlat19 = (-u_xlat13) + 1.0;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat1.x = (-u_xlat19) + u_xlat1.x;
    u_xlat3.x = float(1.0) / (-u_xlat19);
    u_xlat1.x = u_xlat1.x * u_xlat3.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat9 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat9 * u_xlat1.x + _Brightness.x;
    u_xlat9 = float(1.0) / u_xlat19;
    u_xlat7 = u_xlat1.y * u_xlat9;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat15 = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat7 * u_xlat15;
    u_xlat7 = u_xlat7 * _Brightness.y + (-u_xlat1.x);
    u_xlat1.x = u_xlat13 * u_xlat7 + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat4 = texture(_Strokes, u_xlat6.xz);
    u_xlat5 = texture(_Strokes, u_xlat6.xy);
    u_xlat6.x = (-u_xlat19) + u_xlat4.x;
    u_xlat12 = u_xlat9 * u_xlat4.y;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat18 = u_xlat9 * u_xlat5.y;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat7 = (-u_xlat19) + u_xlat5.x;
    u_xlat7 = u_xlat3.x * u_xlat7;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat6.x = u_xlat3.x * u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat19 = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat19 * u_xlat6.x + _Brightness.x;
    u_xlat19 = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * u_xlat19;
    u_xlat12 = u_xlat12 * _Brightness.y + (-u_xlat6.x);
    u_xlat6.x = u_xlat13 * u_xlat12 + u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat6.x = u_xlat6.x + u_xlat1.x;
    u_xlat12 = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat12 = u_xlat18 * u_xlat12;
    u_xlat18 = u_xlat7 * -2.0 + 3.0;
    u_xlat1.x = u_xlat7 * u_xlat7;
    u_xlat18 = u_xlat18 * u_xlat1.x + _Brightness.x;
    u_xlat12 = u_xlat12 * _Brightness.y + (-u_xlat18);
    u_xlat12 = u_xlat13 * u_xlat12 + u_xlat18;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat6.x = u_xlat12 + u_xlat6.x;
    u_xlat6.x = u_xlat6.x * 0.330000013;
    u_xlat12 = (-unity_OrthoParams.w) + 1.0;
    u_xlat12 = u_xlat12 * u_xlat0.x + _ZBufferParams.y;
    u_xlat0.x = (-unity_OrthoParams.w) * u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat0.x / u_xlat12;
    u_xlatb0 = 0.99000001<u_xlat0.x;
    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat6.x;
    u_xlat6.xyz = u_xlat2.xyz * u_xlat0.xxx + (-u_xlat2.xyz);
    u_xlat6.xyz = _Params.zzz * u_xlat6.xyz + u_xlat2.xyz;
    u_xlat1.xyz = (-u_xlat2.xyz) + u_xlat0.xxx;
    u_xlat3.xyz = _Params.zzz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat1.xyz = _Params.zzz * u_xlat1.xyz + u_xlat2.xyz;
    u_xlatb4.xyz = equal(_Params.yyyy, vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat1.xyz = (u_xlatb4.x) ? u_xlat1.xyz : u_xlat2.xyz;
    SV_Target0.w = u_xlat2.w;
    u_xlat0.xyz = (u_xlatb4.y) ? u_xlat6.xyz : u_xlat1.xyz;
    SV_Target0.xyz = (u_xlatb4.z) ? u_xlat3.xyz : u_xlat0.xyz;
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 117
; Schema: 0
                                                OpCapability Shader 
                                         %1 = OpExtInstImport "GLSL.std.450" 
                                                OpMemoryModel Logical GLSL450 
                                                OpEntryPoint Vertex %4 "main" %13 %18 %50 %74 %104 
                                                OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                                OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                                OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                                OpDecorate %11 Block 
                                                OpDecorate %18 Location 18 
                                                OpDecorate vs_TEXCOORD1 Location 50 
                                                OpDecorate %54 ArrayStride 54 
                                                OpMemberDecorate %55 0 Offset 55 
                                                OpMemberDecorate %55 1 Offset 55 
                                                OpMemberDecorate %55 2 Offset 55 
                                                OpDecorate %55 Block 
                                                OpDecorate %57 DescriptorSet 57 
                                                OpDecorate %57 Binding 57 
                                                OpDecorate vs_TEXCOORD0 Location 74 
                                                OpDecorate vs_TEXCOORD2 Location 104 
                                         %2 = OpTypeVoid 
                                         %3 = OpTypeFunction %2 
                                         %6 = OpTypeFloat 32 
                                         %7 = OpTypeVector %6 4 
                                         %8 = OpTypeInt 32 0 
                                     u32 %9 = OpConstant 1 
                                        %10 = OpTypeArray %6 %9 
                                        %11 = OpTypeStruct %7 %6 %10 
                                        %12 = OpTypePointer Output %11 
   Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                        %14 = OpTypeInt 32 1 
                                    i32 %15 = OpConstant 0 
                                        %16 = OpTypeVector %6 3 
                                        %17 = OpTypePointer Input %16 
                           Input f32_3* %18 = OpVariable Input 
                                        %19 = OpTypeVector %6 2 
                                        %22 = OpTypePointer Output %7 
                                    f32 %26 = OpConstant 3.674022E-40 
                                    f32 %27 = OpConstant 3.674022E-40 
                                  f32_2 %28 = OpConstantComposite %26 %27 
                                        %32 = OpTypePointer Private %16 
                         Private f32_3* %33 = OpVariable Private 
                                  f32_2 %36 = OpConstantComposite %27 %27 
                                    f32 %42 = OpConstant 3.674022E-40 
                                    f32 %43 = OpConstant 3.674022E-40 
                                  f32_2 %44 = OpConstantComposite %42 %43 
                                        %49 = OpTypePointer Output %19 
                 Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                    u32 %53 = OpConstant 4 
                                        %54 = OpTypeArray %7 %53 
                                        %55 = OpTypeStruct %16 %6 %54 
                                        %56 = OpTypePointer Uniform %55 
Uniform struct {f32_3; f32; f32_4[4];}* %57 = OpVariable Uniform 
                                    i32 %58 = OpConstant 1 
                                        %59 = OpTypePointer Uniform %6 
                                    f32 %66 = OpConstant 3.674022E-40 
                                  f32_2 %67 = OpConstantComposite %66 %66 
                                    f32 %69 = OpConstant 3.674022E-40 
                                  f32_2 %70 = OpConstantComposite %69 %69 
                 Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                  f32_2 %78 = OpConstantComposite %42 %42 
                         Private f32_3* %80 = OpVariable Private 
                                    i32 %83 = OpConstant 2 
                                        %84 = OpTypePointer Uniform %7 
                                    i32 %98 = OpConstant 3 
                                       %103 = OpTypePointer Output %16 
                 Output f32_3* vs_TEXCOORD2 = OpVariable Output 
                                       %106 = OpTypePointer Uniform %16 
                                       %111 = OpTypePointer Output %6 
                                    void %4 = OpFunction None %3 
                                         %5 = OpLabel 
                                  f32_3 %20 = OpLoad %18 
                                  f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                          Output f32_4* %23 = OpAccessChain %13 %15 
                                  f32_4 %24 = OpLoad %23 
                                  f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                                OpStore %23 %25 
                          Output f32_4* %29 = OpAccessChain %13 %15 
                                  f32_4 %30 = OpLoad %29 
                                  f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                                OpStore %29 %31 
                                  f32_3 %34 = OpLoad %18 
                                  f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                                  f32_2 %37 = OpFAdd %35 %36 
                                  f32_3 %38 = OpLoad %33 
                                  f32_3 %39 = OpVectorShuffle %38 %37 3 4 2 
                                                OpStore %33 %39 
                                  f32_3 %40 = OpLoad %33 
                                  f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                  f32_2 %45 = OpFMul %41 %44 
                                  f32_2 %46 = OpFAdd %45 %28 
                                  f32_3 %47 = OpLoad %33 
                                  f32_3 %48 = OpVectorShuffle %47 %46 3 4 2 
                                                OpStore %33 %48 
                                  f32_3 %51 = OpLoad %33 
                                  f32_2 %52 = OpVectorShuffle %51 %51 0 1 
                           Uniform f32* %60 = OpAccessChain %57 %58 
                                    f32 %61 = OpLoad %60 
                                  f32_2 %62 = OpCompositeConstruct %61 %61 
                                  f32_2 %63 = OpFMul %52 %62 
                                                OpStore vs_TEXCOORD1 %63 
                                  f32_3 %64 = OpLoad %33 
                                  f32_2 %65 = OpVectorShuffle %64 %64 0 1 
                                  f32_2 %68 = OpFMul %65 %67 
                                  f32_2 %71 = OpFAdd %68 %70 
                                  f32_3 %72 = OpLoad %33 
                                  f32_3 %73 = OpVectorShuffle %72 %71 3 4 2 
                                                OpStore %33 %73 
                                  f32_3 %75 = OpLoad %18 
                                  f32_2 %76 = OpVectorShuffle %75 %75 0 1 
                                  f32_2 %77 = OpFMul %76 %44 
                                  f32_2 %79 = OpFAdd %77 %78 
                                                OpStore vs_TEXCOORD0 %79 
                                  f32_3 %81 = OpLoad %33 
                                  f32_3 %82 = OpVectorShuffle %81 %81 1 1 1 
                         Uniform f32_4* %85 = OpAccessChain %57 %83 %58 
                                  f32_4 %86 = OpLoad %85 
                                  f32_3 %87 = OpVectorShuffle %86 %86 0 1 2 
                                  f32_3 %88 = OpFMul %82 %87 
                                                OpStore %80 %88 
                         Uniform f32_4* %89 = OpAccessChain %57 %83 %15 
                                  f32_4 %90 = OpLoad %89 
                                  f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                  f32_3 %92 = OpLoad %33 
                                  f32_3 %93 = OpVectorShuffle %92 %92 0 0 0 
                                  f32_3 %94 = OpFMul %91 %93 
                                  f32_3 %95 = OpLoad %80 
                                  f32_3 %96 = OpFAdd %94 %95 
                                                OpStore %33 %96 
                                  f32_3 %97 = OpLoad %33 
                         Uniform f32_4* %99 = OpAccessChain %57 %83 %98 
                                 f32_4 %100 = OpLoad %99 
                                 f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                 f32_3 %102 = OpFAdd %97 %101 
                                                OpStore %33 %102 
                                 f32_3 %105 = OpLoad %33 
                        Uniform f32_3* %107 = OpAccessChain %57 %15 
                                 f32_3 %108 = OpLoad %107 
                                 f32_3 %109 = OpFNegate %108 
                                 f32_3 %110 = OpFAdd %105 %109 
                                                OpStore vs_TEXCOORD2 %110 
                           Output f32* %112 = OpAccessChain %13 %15 %9 
                                   f32 %113 = OpLoad %112 
                                   f32 %114 = OpFNegate %113 
                           Output f32* %115 = OpAccessChain %13 %15 %9 
                                                OpStore %115 %114 
                                                OpReturn
                                                OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 526
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %22 %61 %493 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate vs_TEXCOORD1 Location 22 
                                                      OpMemberDecorate %32 0 Offset 32 
                                                      OpMemberDecorate %32 1 Offset 32 
                                                      OpMemberDecorate %32 2 Offset 32 
                                                      OpMemberDecorate %32 3 Offset 32 
                                                      OpMemberDecorate %32 4 Offset 32 
                                                      OpDecorate %32 Block 
                                                      OpDecorate %34 DescriptorSet 34 
                                                      OpDecorate %34 Binding 34 
                                                      OpDecorate vs_TEXCOORD2 Location 61 
                                                      OpDecorate %83 DescriptorSet 83 
                                                      OpDecorate %83 Binding 83 
                                                      OpDecorate %85 DescriptorSet 85 
                                                      OpDecorate %85 Binding 85 
                                                      OpDecorate %96 DescriptorSet 96 
                                                      OpDecorate %96 Binding 96 
                                                      OpDecorate %493 Location 493 
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
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                              %24 = OpTypeVector %6 4 
                                              %26 = OpTypeInt 32 0 
                                          u32 %27 = OpConstant 0 
                                              %29 = OpTypePointer Private %6 
                               Private f32_3* %31 = OpVariable Private 
                                              %32 = OpTypeStruct %7 %24 %24 %24 %20 
                                              %33 = OpTypePointer Uniform %32 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_2;}* %34 = OpVariable Uniform 
                                              %35 = OpTypeInt 32 1 
                                          i32 %36 = OpConstant 2 
                                          u32 %37 = OpConstant 2 
                                              %38 = OpTypePointer Uniform %6 
                                          u32 %44 = OpConstant 3 
                                          f32 %55 = OpConstant 3.674022E-40 
                                              %60 = OpTypePointer Input %7 
                        Input f32_3* vs_TEXCOORD2 = OpVariable Input 
                                          i32 %66 = OpConstant 0 
                                              %67 = OpTypePointer Uniform %7 
                                          i32 %72 = OpConstant 3 
                                              %73 = OpTypePointer Uniform %24 
                                          f32 %79 = OpConstant 3.674022E-40 
                                        f32_3 %80 = OpConstantComposite %79 %79 %79 
                               Private f32_3* %82 = OpVariable Private 
         UniformConstant read_only Texture2D* %83 = OpVariable UniformConstant 
                     UniformConstant sampler* %85 = OpVariable UniformConstant 
                                              %94 = OpTypePointer Private %24 
                               Private f32_4* %95 = OpVariable Private 
         UniformConstant read_only Texture2D* %96 = OpVariable UniformConstant 
                                Private f32* %102 = OpVariable Private 
                                         f32 %105 = OpConstant 3.674022E-40 
                                         f32 %106 = OpConstant 3.674022E-40 
                                         f32 %107 = OpConstant 3.674022E-40 
                                       f32_3 %108 = OpConstantComposite %105 %106 %107 
                                Private f32* %110 = OpVariable Private 
                                         f32 %112 = OpConstant 3.674022E-40 
                                         f32 %115 = OpConstant 3.674022E-40 
                                         f32 %119 = OpConstant 3.674022E-40 
                                         f32 %124 = OpConstant 3.674022E-40 
                              Private f32_3* %128 = OpVariable Private 
                                         f32 %130 = OpConstant 3.674022E-40 
                                             %133 = OpTypeBool 
                                             %134 = OpTypePointer Private %133 
                               Private bool* %135 = OpVariable Private 
                                         f32 %136 = OpConstant 3.674022E-40 
                                             %140 = OpTypePointer Function %6 
                                         f32 %153 = OpConstant 3.674022E-40 
                                Private f32* %175 = OpVariable Private 
                                         f32 %178 = OpConstant 3.674022E-40 
                                         f32 %180 = OpConstant 3.674022E-40 
                                         i32 %192 = OpConstant 4 
                                         u32 %199 = OpConstant 1 
                                Private f32* %201 = OpVariable Private 
                                             %209 = OpTypePointer Private %20 
                              Private f32_2* %210 = OpVariable Private 
                                Private f32* %288 = OpVariable Private 
                                Private f32* %332 = OpVariable Private 
                                         f32 %388 = OpConstant 3.674022E-40 
                                         i32 %391 = OpConstant 1 
                               Private bool* %416 = OpVariable Private 
                                         f32 %417 = OpConstant 3.674022E-40 
                                             %470 = OpTypeVector %133 3 
                                             %471 = OpTypePointer Private %470 
                             Private bool_3* %472 = OpVariable Private 
                                         f32 %476 = OpConstant 3.674022E-40 
                                       f32_4 %477 = OpConstantComposite %153 %55 %476 %153 
                                             %478 = OpTypeVector %133 4 
                                             %483 = OpTypePointer Function %7 
                                             %492 = OpTypePointer Output %24 
                               Output f32_4* %493 = OpVariable Output 
                                             %496 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %141 = OpVariable Function 
                               Function f32* %422 = OpVariable Function 
                             Function f32_3* %484 = OpVariable Function 
                             Function f32_3* %500 = OpVariable Function 
                             Function f32_3* %509 = OpVariable Function 
                          read_only Texture2D %13 = OpLoad %12 
                                      sampler %17 = OpLoad %16 
                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                        f32_2 %23 = OpLoad vs_TEXCOORD1 
                                        f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                                          f32 %28 = OpCompositeExtract %25 0 
                                 Private f32* %30 = OpAccessChain %9 %27 
                                                      OpStore %30 %28 
                                 Uniform f32* %39 = OpAccessChain %34 %36 %37 
                                          f32 %40 = OpLoad %39 
                                 Private f32* %41 = OpAccessChain %9 %27 
                                          f32 %42 = OpLoad %41 
                                          f32 %43 = OpFMul %40 %42 
                                 Uniform f32* %45 = OpAccessChain %34 %36 %44 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpFAdd %43 %46 
                                 Private f32* %48 = OpAccessChain %31 %27 
                                                      OpStore %48 %47 
                                 Private f32* %49 = OpAccessChain %9 %27 
                                          f32 %50 = OpLoad %49 
                                 Uniform f32* %51 = OpAccessChain %34 %36 %27 
                                          f32 %52 = OpLoad %51 
                                          f32 %53 = OpFMul %50 %52 
                                 Private f32* %54 = OpAccessChain %9 %27 
                                                      OpStore %54 %53 
                                 Private f32* %56 = OpAccessChain %31 %27 
                                          f32 %57 = OpLoad %56 
                                          f32 %58 = OpFDiv %55 %57 
                                 Private f32* %59 = OpAccessChain %31 %27 
                                                      OpStore %59 %58 
                                        f32_3 %62 = OpLoad vs_TEXCOORD2 
                                        f32_3 %63 = OpLoad %31 
                                        f32_3 %64 = OpVectorShuffle %63 %63 0 0 0 
                                        f32_3 %65 = OpFMul %62 %64 
                               Uniform f32_3* %68 = OpAccessChain %34 %66 
                                        f32_3 %69 = OpLoad %68 
                                        f32_3 %70 = OpFAdd %65 %69 
                                                      OpStore %31 %70 
                                        f32_3 %71 = OpLoad %31 
                               Uniform f32_4* %74 = OpAccessChain %34 %72 
                                        f32_4 %75 = OpLoad %74 
                                        f32_3 %76 = OpVectorShuffle %75 %75 3 3 3 
                                        f32_3 %77 = OpFMul %71 %76 
                                                      OpStore %31 %77 
                                        f32_3 %78 = OpLoad %31 
                                        f32_3 %81 = OpFMul %78 %80 
                                                      OpStore %31 %81 
                          read_only Texture2D %84 = OpLoad %83 
                                      sampler %86 = OpLoad %85 
                   read_only Texture2DSampled %87 = OpSampledImage %84 %86 
                                        f32_3 %88 = OpLoad %31 
                                        f32_2 %89 = OpVectorShuffle %88 %88 1 2 
                                        f32_4 %90 = OpImageSampleImplicitLod %87 %89 
                                        f32_2 %91 = OpVectorShuffle %90 %90 0 1 
                                        f32_3 %92 = OpLoad %82 
                                        f32_3 %93 = OpVectorShuffle %92 %91 3 4 2 
                                                      OpStore %82 %93 
                          read_only Texture2D %97 = OpLoad %96 
                                      sampler %98 = OpLoad %16 
                   read_only Texture2DSampled %99 = OpSampledImage %97 %98 
                                       f32_2 %100 = OpLoad vs_TEXCOORD1 
                                       f32_4 %101 = OpImageSampleImplicitLod %99 %100 
                                                      OpStore %95 %101 
                                       f32_4 %103 = OpLoad %95 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                         f32 %109 = OpDot %104 %108 
                                                      OpStore %102 %109 
                                         f32 %111 = OpLoad %102 
                                         f32 %113 = OpFAdd %111 %112 
                                                      OpStore %110 %113 
                                         f32 %114 = OpLoad %110 
                                         f32 %116 = OpFMul %114 %115 
                                                      OpStore %110 %116 
                                         f32 %117 = OpLoad %110 
                                         f32 %118 = OpExtInst %1 4 %117 
                                         f32 %120 = OpExtInst %1 40 %118 %119 
                                                      OpStore %110 %120 
                                         f32 %121 = OpLoad %110 
                                         f32 %122 = OpExtInst %1 30 %121 
                                                      OpStore %110 %122 
                                         f32 %123 = OpLoad %110 
                                         f32 %125 = OpFMul %123 %124 
                                                      OpStore %110 %125 
                                         f32 %126 = OpLoad %110 
                                         f32 %127 = OpExtInst %1 29 %126 
                                                      OpStore %110 %127 
                                         f32 %129 = OpLoad %102 
                                         f32 %131 = OpFMul %129 %130 
                                Private f32* %132 = OpAccessChain %128 %27 
                                                      OpStore %132 %131 
                                         f32 %137 = OpLoad %102 
                                        bool %138 = OpFOrdGreaterThanEqual %136 %137 
                                                      OpStore %135 %138 
                                        bool %139 = OpLoad %135 
                                                      OpSelectionMerge %143 None 
                                                      OpBranchConditional %139 %142 %146 
                                             %142 = OpLabel 
                                Private f32* %144 = OpAccessChain %128 %27 
                                         f32 %145 = OpLoad %144 
                                                      OpStore %141 %145 
                                                      OpBranch %143 
                                             %146 = OpLabel 
                                         f32 %147 = OpLoad %110 
                                                      OpStore %141 %147 
                                                      OpBranch %143 
                                             %143 = OpLabel 
                                         f32 %148 = OpLoad %141 
                                                      OpStore %102 %148 
                                         f32 %149 = OpLoad %102 
                                         f32 %150 = OpFNegate %149 
                                         f32 %151 = OpFAdd %150 %55 
                                                      OpStore %110 %151 
                                         f32 %152 = OpLoad %110 
                                         f32 %154 = OpExtInst %1 43 %152 %153 %55 
                                                      OpStore %110 %154 
                                         f32 %155 = OpLoad %110 
                                         f32 %156 = OpFNegate %155 
                                Private f32* %157 = OpAccessChain %82 %27 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFAdd %156 %158 
                                Private f32* %160 = OpAccessChain %82 %27 
                                                      OpStore %160 %159 
                                         f32 %161 = OpLoad %110 
                                         f32 %162 = OpFNegate %161 
                                         f32 %163 = OpFDiv %55 %162 
                                Private f32* %164 = OpAccessChain %128 %27 
                                                      OpStore %164 %163 
                                Private f32* %165 = OpAccessChain %82 %27 
                                         f32 %166 = OpLoad %165 
                                Private f32* %167 = OpAccessChain %128 %27 
                                         f32 %168 = OpLoad %167 
                                         f32 %169 = OpFMul %166 %168 
                                Private f32* %170 = OpAccessChain %82 %27 
                                                      OpStore %170 %169 
                                Private f32* %171 = OpAccessChain %82 %27 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpExtInst %1 43 %172 %153 %55 
                                Private f32* %174 = OpAccessChain %82 %27 
                                                      OpStore %174 %173 
                                Private f32* %176 = OpAccessChain %82 %27 
                                         f32 %177 = OpLoad %176 
                                         f32 %179 = OpFMul %177 %178 
                                         f32 %181 = OpFAdd %179 %180 
                                                      OpStore %175 %181 
                                Private f32* %182 = OpAccessChain %82 %27 
                                         f32 %183 = OpLoad %182 
                                Private f32* %184 = OpAccessChain %82 %27 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFMul %183 %185 
                                Private f32* %187 = OpAccessChain %82 %27 
                                                      OpStore %187 %186 
                                         f32 %188 = OpLoad %175 
                                Private f32* %189 = OpAccessChain %82 %27 
                                         f32 %190 = OpLoad %189 
                                         f32 %191 = OpFMul %188 %190 
                                Uniform f32* %193 = OpAccessChain %34 %192 %27 
                                         f32 %194 = OpLoad %193 
                                         f32 %195 = OpFAdd %191 %194 
                                Private f32* %196 = OpAccessChain %82 %27 
                                                      OpStore %196 %195 
                                         f32 %197 = OpLoad %110 
                                         f32 %198 = OpFDiv %55 %197 
                                Private f32* %200 = OpAccessChain %128 %199 
                                                      OpStore %200 %198 
                                Private f32* %202 = OpAccessChain %82 %199 
                                         f32 %203 = OpLoad %202 
                                Private f32* %204 = OpAccessChain %128 %199 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpFMul %203 %205 
                                                      OpStore %201 %206 
                                         f32 %207 = OpLoad %201 
                                         f32 %208 = OpExtInst %1 43 %207 %153 %55 
                                                      OpStore %201 %208 
                                         f32 %211 = OpLoad %201 
                                         f32 %212 = OpFMul %211 %178 
                                         f32 %213 = OpFAdd %212 %180 
                                Private f32* %214 = OpAccessChain %210 %27 
                                                      OpStore %214 %213 
                                         f32 %215 = OpLoad %201 
                                         f32 %216 = OpLoad %201 
                                         f32 %217 = OpFMul %215 %216 
                                                      OpStore %201 %217 
                                         f32 %218 = OpLoad %201 
                                Private f32* %219 = OpAccessChain %210 %27 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpFMul %218 %220 
                                                      OpStore %201 %221 
                                         f32 %222 = OpLoad %201 
                                Uniform f32* %223 = OpAccessChain %34 %192 %199 
                                         f32 %224 = OpLoad %223 
                                         f32 %225 = OpFMul %222 %224 
                                Private f32* %226 = OpAccessChain %82 %27 
                                         f32 %227 = OpLoad %226 
                                         f32 %228 = OpFNegate %227 
                                         f32 %229 = OpFAdd %225 %228 
                                                      OpStore %201 %229 
                                         f32 %230 = OpLoad %102 
                                         f32 %231 = OpLoad %201 
                                         f32 %232 = OpFMul %230 %231 
                                Private f32* %233 = OpAccessChain %82 %27 
                                         f32 %234 = OpLoad %233 
                                         f32 %235 = OpFAdd %232 %234 
                                Private f32* %236 = OpAccessChain %82 %27 
                                                      OpStore %236 %235 
                                Private f32* %237 = OpAccessChain %82 %27 
                                         f32 %238 = OpLoad %237 
                                         f32 %239 = OpExtInst %1 43 %238 %153 %55 
                                Private f32* %240 = OpAccessChain %82 %27 
                                                      OpStore %240 %239 
                         read_only Texture2D %241 = OpLoad %83 
                                     sampler %242 = OpLoad %85 
                  read_only Texture2DSampled %243 = OpSampledImage %241 %242 
                                       f32_3 %244 = OpLoad %31 
                                       f32_2 %245 = OpVectorShuffle %244 %244 0 2 
                                       f32_4 %246 = OpImageSampleImplicitLod %243 %245 
                                       f32_2 %247 = OpVectorShuffle %246 %246 0 1 
                                                      OpStore %210 %247 
                         read_only Texture2D %248 = OpLoad %83 
                                     sampler %249 = OpLoad %85 
                  read_only Texture2DSampled %250 = OpSampledImage %248 %249 
                                       f32_3 %251 = OpLoad %31 
                                       f32_2 %252 = OpVectorShuffle %251 %251 0 1 
                                       f32_4 %253 = OpImageSampleImplicitLod %250 %252 
                                       f32_2 %254 = OpVectorShuffle %253 %253 0 1 
                                       f32_3 %255 = OpLoad %31 
                                       f32_3 %256 = OpVectorShuffle %255 %254 3 4 2 
                                                      OpStore %31 %256 
                                         f32 %257 = OpLoad %110 
                                         f32 %258 = OpFNegate %257 
                                Private f32* %259 = OpAccessChain %210 %27 
                                         f32 %260 = OpLoad %259 
                                         f32 %261 = OpFAdd %258 %260 
                                Private f32* %262 = OpAccessChain %31 %37 
                                                      OpStore %262 %261 
                                Private f32* %263 = OpAccessChain %128 %199 
                                         f32 %264 = OpLoad %263 
                                Private f32* %265 = OpAccessChain %210 %199 
                                         f32 %266 = OpLoad %265 
                                         f32 %267 = OpFMul %264 %266 
                                                      OpStore %201 %267 
                                         f32 %268 = OpLoad %201 
                                         f32 %269 = OpExtInst %1 43 %268 %153 %55 
                                                      OpStore %201 %269 
                                         f32 %270 = OpLoad %110 
                                         f32 %271 = OpFNegate %270 
                                Private f32* %272 = OpAccessChain %31 %27 
                                         f32 %273 = OpLoad %272 
                                         f32 %274 = OpFAdd %271 %273 
                                Private f32* %275 = OpAccessChain %31 %27 
                                                      OpStore %275 %274 
                                       f32_3 %276 = OpLoad %128 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 0 
                                       f32_3 %278 = OpLoad %31 
                                       f32_3 %279 = OpFMul %277 %278 
                                                      OpStore %31 %279 
                                       f32_3 %280 = OpLoad %31 
                                       f32_3 %281 = OpCompositeConstruct %153 %153 %153 
                                       f32_3 %282 = OpCompositeConstruct %55 %55 %55 
                                       f32_3 %283 = OpExtInst %1 43 %280 %281 %282 
                                                      OpStore %31 %283 
                                Private f32* %284 = OpAccessChain %31 %37 
                                         f32 %285 = OpLoad %284 
                                         f32 %286 = OpFMul %285 %178 
                                         f32 %287 = OpFAdd %286 %180 
                                                      OpStore %110 %287 
                                Private f32* %289 = OpAccessChain %31 %37 
                                         f32 %290 = OpLoad %289 
                                Private f32* %291 = OpAccessChain %31 %37 
                                         f32 %292 = OpLoad %291 
                                         f32 %293 = OpFMul %290 %292 
                                                      OpStore %288 %293 
                                         f32 %294 = OpLoad %110 
                                         f32 %295 = OpLoad %288 
                                         f32 %296 = OpFMul %294 %295 
                                Uniform f32* %297 = OpAccessChain %34 %192 %27 
                                         f32 %298 = OpLoad %297 
                                         f32 %299 = OpFAdd %296 %298 
                                                      OpStore %288 %299 
                                         f32 %300 = OpLoad %201 
                                         f32 %301 = OpFMul %300 %178 
                                         f32 %302 = OpFAdd %301 %180 
                                                      OpStore %110 %302 
                                         f32 %303 = OpLoad %201 
                                         f32 %304 = OpLoad %201 
                                         f32 %305 = OpFMul %303 %304 
                                                      OpStore %201 %305 
                                         f32 %306 = OpLoad %201 
                                         f32 %307 = OpLoad %110 
                                         f32 %308 = OpFMul %306 %307 
                                                      OpStore %201 %308 
                                         f32 %309 = OpLoad %201 
                                Uniform f32* %310 = OpAccessChain %34 %192 %199 
                                         f32 %311 = OpLoad %310 
                                         f32 %312 = OpFMul %309 %311 
                                         f32 %313 = OpLoad %288 
                                         f32 %314 = OpFNegate %313 
                                         f32 %315 = OpFAdd %312 %314 
                                                      OpStore %201 %315 
                                         f32 %316 = OpLoad %102 
                                         f32 %317 = OpLoad %201 
                                         f32 %318 = OpFMul %316 %317 
                                         f32 %319 = OpLoad %288 
                                         f32 %320 = OpFAdd %318 %319 
                                                      OpStore %288 %320 
                                         f32 %321 = OpLoad %288 
                                         f32 %322 = OpExtInst %1 43 %321 %153 %55 
                                                      OpStore %288 %322 
                                         f32 %323 = OpLoad %288 
                                Private f32* %324 = OpAccessChain %82 %27 
                                         f32 %325 = OpLoad %324 
                                         f32 %326 = OpFAdd %323 %325 
                                                      OpStore %288 %326 
                                Private f32* %327 = OpAccessChain %31 %199 
                                         f32 %328 = OpLoad %327 
                                         f32 %329 = OpFMul %328 %178 
                                         f32 %330 = OpFAdd %329 %180 
                                Private f32* %331 = OpAccessChain %82 %27 
                                                      OpStore %331 %330 
                                Private f32* %333 = OpAccessChain %31 %199 
                                         f32 %334 = OpLoad %333 
                                Private f32* %335 = OpAccessChain %31 %199 
                                         f32 %336 = OpLoad %335 
                                         f32 %337 = OpFMul %334 %336 
                                                      OpStore %332 %337 
                                         f32 %338 = OpLoad %332 
                                Private f32* %339 = OpAccessChain %82 %27 
                                         f32 %340 = OpLoad %339 
                                         f32 %341 = OpFMul %338 %340 
                                                      OpStore %332 %341 
                                Private f32* %342 = OpAccessChain %31 %27 
                                         f32 %343 = OpLoad %342 
                                         f32 %344 = OpFMul %343 %178 
                                         f32 %345 = OpFAdd %344 %180 
                                Private f32* %346 = OpAccessChain %82 %27 
                                                      OpStore %346 %345 
                                Private f32* %347 = OpAccessChain %31 %27 
                                         f32 %348 = OpLoad %347 
                                Private f32* %349 = OpAccessChain %31 %27 
                                         f32 %350 = OpLoad %349 
                                         f32 %351 = OpFMul %348 %350 
                                Private f32* %352 = OpAccessChain %31 %27 
                                                      OpStore %352 %351 
                                Private f32* %353 = OpAccessChain %82 %27 
                                         f32 %354 = OpLoad %353 
                                Private f32* %355 = OpAccessChain %31 %27 
                                         f32 %356 = OpLoad %355 
                                         f32 %357 = OpFMul %354 %356 
                                Uniform f32* %358 = OpAccessChain %34 %192 %27 
                                         f32 %359 = OpLoad %358 
                                         f32 %360 = OpFAdd %357 %359 
                                Private f32* %361 = OpAccessChain %31 %27 
                                                      OpStore %361 %360 
                                         f32 %362 = OpLoad %332 
                                Uniform f32* %363 = OpAccessChain %34 %192 %199 
                                         f32 %364 = OpLoad %363 
                                         f32 %365 = OpFMul %362 %364 
                                Private f32* %366 = OpAccessChain %31 %27 
                                         f32 %367 = OpLoad %366 
                                         f32 %368 = OpFNegate %367 
                                         f32 %369 = OpFAdd %365 %368 
                                                      OpStore %332 %369 
                                         f32 %370 = OpLoad %102 
                                         f32 %371 = OpLoad %332 
                                         f32 %372 = OpFMul %370 %371 
                                Private f32* %373 = OpAccessChain %31 %27 
                                         f32 %374 = OpLoad %373 
                                         f32 %375 = OpFAdd %372 %374 
                                Private f32* %376 = OpAccessChain %31 %27 
                                                      OpStore %376 %375 
                                Private f32* %377 = OpAccessChain %31 %27 
                                         f32 %378 = OpLoad %377 
                                         f32 %379 = OpExtInst %1 43 %378 %153 %55 
                                Private f32* %380 = OpAccessChain %31 %27 
                                                      OpStore %380 %379 
                                Private f32* %381 = OpAccessChain %31 %27 
                                         f32 %382 = OpLoad %381 
                                         f32 %383 = OpLoad %288 
                                         f32 %384 = OpFAdd %382 %383 
                                Private f32* %385 = OpAccessChain %31 %27 
                                                      OpStore %385 %384 
                                Private f32* %386 = OpAccessChain %31 %27 
                                         f32 %387 = OpLoad %386 
                                         f32 %389 = OpFMul %387 %388 
                                Private f32* %390 = OpAccessChain %31 %27 
                                                      OpStore %390 %389 
                                Uniform f32* %392 = OpAccessChain %34 %391 %44 
                                         f32 %393 = OpLoad %392 
                                         f32 %394 = OpFNegate %393 
                                         f32 %395 = OpFAdd %394 %55 
                                                      OpStore %332 %395 
                                         f32 %396 = OpLoad %332 
                                Private f32* %397 = OpAccessChain %9 %27 
                                         f32 %398 = OpLoad %397 
                                         f32 %399 = OpFMul %396 %398 
                                Uniform f32* %400 = OpAccessChain %34 %36 %199 
                                         f32 %401 = OpLoad %400 
                                         f32 %402 = OpFAdd %399 %401 
                                                      OpStore %332 %402 
                                Uniform f32* %403 = OpAccessChain %34 %391 %44 
                                         f32 %404 = OpLoad %403 
                                         f32 %405 = OpFNegate %404 
                                Private f32* %406 = OpAccessChain %9 %27 
                                         f32 %407 = OpLoad %406 
                                         f32 %408 = OpFMul %405 %407 
                                         f32 %409 = OpFAdd %408 %55 
                                Private f32* %410 = OpAccessChain %9 %27 
                                                      OpStore %410 %409 
                                Private f32* %411 = OpAccessChain %9 %27 
                                         f32 %412 = OpLoad %411 
                                         f32 %413 = OpLoad %332 
                                         f32 %414 = OpFDiv %412 %413 
                                Private f32* %415 = OpAccessChain %9 %27 
                                                      OpStore %415 %414 
                                Private f32* %418 = OpAccessChain %9 %27 
                                         f32 %419 = OpLoad %418 
                                        bool %420 = OpFOrdLessThan %417 %419 
                                                      OpStore %416 %420 
                                        bool %421 = OpLoad %416 
                                                      OpSelectionMerge %424 None 
                                                      OpBranchConditional %421 %423 %425 
                                             %423 = OpLabel 
                                                      OpStore %422 %55 
                                                      OpBranch %424 
                                             %425 = OpLabel 
                                Private f32* %426 = OpAccessChain %31 %27 
                                         f32 %427 = OpLoad %426 
                                                      OpStore %422 %427 
                                                      OpBranch %424 
                                             %424 = OpLabel 
                                         f32 %428 = OpLoad %422 
                                Private f32* %429 = OpAccessChain %9 %27 
                                                      OpStore %429 %428 
                                       f32_4 %430 = OpLoad %95 
                                       f32_3 %431 = OpVectorShuffle %430 %430 0 1 2 
                                       f32_3 %432 = OpLoad %9 
                                       f32_3 %433 = OpVectorShuffle %432 %432 0 0 0 
                                       f32_3 %434 = OpFMul %431 %433 
                                       f32_4 %435 = OpLoad %95 
                                       f32_3 %436 = OpVectorShuffle %435 %435 0 1 2 
                                       f32_3 %437 = OpFNegate %436 
                                       f32_3 %438 = OpFAdd %434 %437 
                                                      OpStore %31 %438 
                              Uniform f32_4* %439 = OpAccessChain %34 %72 
                                       f32_4 %440 = OpLoad %439 
                                       f32_3 %441 = OpVectorShuffle %440 %440 2 2 2 
                                       f32_3 %442 = OpLoad %31 
                                       f32_3 %443 = OpFMul %441 %442 
                                       f32_4 %444 = OpLoad %95 
                                       f32_3 %445 = OpVectorShuffle %444 %444 0 1 2 
                                       f32_3 %446 = OpFAdd %443 %445 
                                                      OpStore %31 %446 
                                       f32_4 %447 = OpLoad %95 
                                       f32_3 %448 = OpVectorShuffle %447 %447 0 1 2 
                                       f32_3 %449 = OpFNegate %448 
                                       f32_3 %450 = OpLoad %9 
                                       f32_3 %451 = OpVectorShuffle %450 %450 0 0 0 
                                       f32_3 %452 = OpFAdd %449 %451 
                                                      OpStore %82 %452 
                              Uniform f32_4* %453 = OpAccessChain %34 %72 
                                       f32_4 %454 = OpLoad %453 
                                       f32_3 %455 = OpVectorShuffle %454 %454 2 2 2 
                                       f32_3 %456 = OpLoad %9 
                                       f32_3 %457 = OpVectorShuffle %456 %456 0 0 0 
                                       f32_3 %458 = OpFMul %455 %457 
                                       f32_4 %459 = OpLoad %95 
                                       f32_3 %460 = OpVectorShuffle %459 %459 0 1 2 
                                       f32_3 %461 = OpFAdd %458 %460 
                                                      OpStore %128 %461 
                              Uniform f32_4* %462 = OpAccessChain %34 %72 
                                       f32_4 %463 = OpLoad %462 
                                       f32_3 %464 = OpVectorShuffle %463 %463 2 2 2 
                                       f32_3 %465 = OpLoad %82 
                                       f32_3 %466 = OpFMul %464 %465 
                                       f32_4 %467 = OpLoad %95 
                                       f32_3 %468 = OpVectorShuffle %467 %467 0 1 2 
                                       f32_3 %469 = OpFAdd %466 %468 
                                                      OpStore %82 %469 
                              Uniform f32_4* %473 = OpAccessChain %34 %72 
                                       f32_4 %474 = OpLoad %473 
                                       f32_4 %475 = OpVectorShuffle %474 %474 1 1 1 1 
                                      bool_4 %479 = OpFOrdEqual %475 %477 
                                      bool_3 %480 = OpVectorShuffle %479 %479 0 1 2 
                                                      OpStore %472 %480 
                               Private bool* %481 = OpAccessChain %472 %27 
                                        bool %482 = OpLoad %481 
                                                      OpSelectionMerge %486 None 
                                                      OpBranchConditional %482 %485 %488 
                                             %485 = OpLabel 
                                       f32_3 %487 = OpLoad %82 
                                                      OpStore %484 %487 
                                                      OpBranch %486 
                                             %488 = OpLabel 
                                       f32_4 %489 = OpLoad %95 
                                       f32_3 %490 = OpVectorShuffle %489 %489 0 1 2 
                                                      OpStore %484 %490 
                                                      OpBranch %486 
                                             %486 = OpLabel 
                                       f32_3 %491 = OpLoad %484 
                                                      OpStore %82 %491 
                                Private f32* %494 = OpAccessChain %95 %44 
                                         f32 %495 = OpLoad %494 
                                 Output f32* %497 = OpAccessChain %493 %44 
                                                      OpStore %497 %495 
                               Private bool* %498 = OpAccessChain %472 %199 
                                        bool %499 = OpLoad %498 
                                                      OpSelectionMerge %502 None 
                                                      OpBranchConditional %499 %501 %504 
                                             %501 = OpLabel 
                                       f32_3 %503 = OpLoad %31 
                                                      OpStore %500 %503 
                                                      OpBranch %502 
                                             %504 = OpLabel 
                                       f32_3 %505 = OpLoad %82 
                                                      OpStore %500 %505 
                                                      OpBranch %502 
                                             %502 = OpLabel 
                                       f32_3 %506 = OpLoad %500 
                                                      OpStore %9 %506 
                               Private bool* %507 = OpAccessChain %472 %37 
                                        bool %508 = OpLoad %507 
                                                      OpSelectionMerge %511 None 
                                                      OpBranchConditional %508 %510 %513 
                                             %510 = OpLabel 
                                       f32_3 %512 = OpLoad %128 
                                                      OpStore %509 %512 
                                                      OpBranch %511 
                                             %513 = OpLabel 
                                       f32_3 %514 = OpLoad %9 
                                                      OpStore %509 %514 
                                                      OpBranch %511 
                                             %511 = OpLabel 
                                       f32_3 %515 = OpLoad %509 
                                       f32_4 %516 = OpLoad %493 
                                       f32_4 %517 = OpVectorShuffle %516 %515 4 5 6 3 
                                                      OpStore %493 %517 
                                       f32_4 %518 = OpLoad %493 
                                       f32_3 %519 = OpVectorShuffle %518 %518 0 1 2 
                                       f32_3 %520 = OpCompositeConstruct %153 %153 %153 
                                       f32_3 %521 = OpCompositeConstruct %55 %55 %55 
                                       f32_3 %522 = OpExtInst %1 43 %519 %520 %521 
                                       f32_4 %523 = OpLoad %493 
                                       f32_4 %524 = OpVectorShuffle %523 %522 4 5 6 3 
                                                      OpStore %493 %524 
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
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 113678
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 _Params;
uniform 	vec2 _Brightness;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _Strokes;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat10;
bool u_xlatb10;
float u_xlat15;
void main()
{
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD0.x;
    u_xlat0.y = vs_TEXCOORD0.y;
    u_xlat0.xy = u_xlat0.xy * _Params.ww;
    u_xlat0 = texture(_Strokes, u_xlat0.xy);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat10 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat15 = u_xlat10 + 0.0549999997;
    u_xlat15 = u_xlat15 * 0.947867334;
    u_xlat15 = max(abs(u_xlat15), 1.1920929e-07);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * 2.4000001;
    u_xlat15 = exp2(u_xlat15);
    u_xlat2.x = u_xlat10 * 0.0773993805;
    u_xlatb10 = 0.0404499993>=u_xlat10;
    u_xlat10 = (u_xlatb10) ? u_xlat2.x : u_xlat15;
    u_xlat15 = (-u_xlat10) + 1.0;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat0.x = (-u_xlat15) + u_xlat0.x;
    u_xlat2.x = float(1.0) / (-u_xlat15);
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat5.x = u_xlat15 * u_xlat0.y;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat15 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat15 * u_xlat0.x + _Brightness.x;
    u_xlat15 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat15;
    u_xlat5.x = u_xlat5.x * _Brightness.y + (-u_xlat0.x);
    u_xlat0.x = u_xlat10 * u_xlat5.x + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat0.xxx + (-u_xlat1.xyz);
    u_xlat5.xyz = _Params.zzz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + u_xlat0.xxx;
    u_xlat3.xyz = _Params.zzz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat2.xyz = _Params.zzz * u_xlat2.xyz + u_xlat1.xyz;
    u_xlatb4.xyz = equal(_Params.yyyy, vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat1.xyz = (u_xlatb4.x) ? u_xlat2.xyz : u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
    u_xlat0.xyz = (u_xlatb4.y) ? u_xlat5.xyz : u_xlat1.xyz;
    SV_Target0.xyz = (u_xlatb4.z) ? u_xlat3.xyz : u_xlat0.xyz;
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 322
; Schema: 0
                                               OpCapability Shader 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Fragment %4 "main" %31 %73 %286 
                                               OpExecutionMode %4 OriginUpperLeft 
                                               OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                               OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                               OpMemberDecorate %12 0 Offset 12 
                                               OpMemberDecorate %12 1 Offset 12 
                                               OpMemberDecorate %12 2 Offset 12 
                                               OpDecorate %12 Block 
                                               OpDecorate %14 DescriptorSet 14 
                                               OpDecorate %14 Binding 14 
                                               OpDecorate vs_TEXCOORD0 Location 31 
                                               OpDecorate %52 DescriptorSet 52 
                                               OpDecorate %52 Binding 52 
                                               OpDecorate %56 DescriptorSet 56 
                                               OpDecorate %56 Binding 56 
                                               OpDecorate %68 DescriptorSet 68 
                                               OpDecorate %68 Binding 68 
                                               OpDecorate %70 DescriptorSet 70 
                                               OpDecorate %70 Binding 70 
                                               OpDecorate vs_TEXCOORD1 Location 73 
                                               OpDecorate %286 Location 286 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 3 
                                        %8 = OpTypePointer Private %7 
                         Private f32_3* %9 = OpVariable Private 
                                       %10 = OpTypeVector %6 4 
                                       %11 = OpTypeVector %6 2 
                                       %12 = OpTypeStruct %10 %10 %11 
                                       %13 = OpTypePointer Uniform %12 
Uniform struct {f32_4; f32_4; f32_2;}* %14 = OpVariable Uniform 
                                       %15 = OpTypeInt 32 1 
                                   i32 %16 = OpConstant 0 
                                       %17 = OpTypeInt 32 0 
                                   u32 %18 = OpConstant 0 
                                       %19 = OpTypePointer Uniform %6 
                                   u32 %22 = OpConstant 1 
                                       %26 = OpTypePointer Private %6 
                                       %30 = OpTypePointer Input %11 
                 Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                       %32 = OpTypePointer Input %6 
                                   i32 %42 = OpConstant 1 
                                       %43 = OpTypePointer Uniform %10 
                                       %50 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                       %51 = OpTypePointer UniformConstant %50 
  UniformConstant read_only Texture2D* %52 = OpVariable UniformConstant 
                                       %54 = OpTypeSampler 
                                       %55 = OpTypePointer UniformConstant %54 
              UniformConstant sampler* %56 = OpVariable UniformConstant 
                                       %58 = OpTypeSampledImage %50 
                                       %66 = OpTypePointer Private %10 
                        Private f32_4* %67 = OpVariable Private 
  UniformConstant read_only Texture2D* %68 = OpVariable UniformConstant 
              UniformConstant sampler* %70 = OpVariable UniformConstant 
                 Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                          Private f32* %76 = OpVariable Private 
                                   f32 %79 = OpConstant 3.674022E-40 
                                   f32 %80 = OpConstant 3.674022E-40 
                                   f32 %81 = OpConstant 3.674022E-40 
                                 f32_3 %82 = OpConstantComposite %79 %80 %81 
                          Private f32* %84 = OpVariable Private 
                                   f32 %86 = OpConstant 3.674022E-40 
                                   f32 %89 = OpConstant 3.674022E-40 
                                   f32 %93 = OpConstant 3.674022E-40 
                                   f32 %98 = OpConstant 3.674022E-40 
                       Private f32_3* %102 = OpVariable Private 
                                  f32 %104 = OpConstant 3.674022E-40 
                                      %107 = OpTypeBool 
                                      %108 = OpTypePointer Private %107 
                        Private bool* %109 = OpVariable Private 
                                  f32 %110 = OpConstant 3.674022E-40 
                                      %114 = OpTypePointer Function %6 
                                  f32 %125 = OpConstant 3.674022E-40 
                                  f32 %128 = OpConstant 3.674022E-40 
                       Private f32_3* %142 = OpVariable Private 
                                  f32 %164 = OpConstant 3.674022E-40 
                                  f32 %166 = OpConstant 3.674022E-40 
                                  i32 %178 = OpConstant 2 
                       Private f32_3* %243 = OpVariable Private 
                                      %261 = OpTypeVector %107 3 
                                      %262 = OpTypePointer Private %261 
                      Private bool_3* %263 = OpVariable Private 
                                  f32 %267 = OpConstant 3.674022E-40 
                                f32_4 %268 = OpConstantComposite %128 %125 %267 %128 
                                      %269 = OpTypeVector %107 4 
                                      %274 = OpTypePointer Function %7 
                                      %285 = OpTypePointer Output %10 
                        Output f32_4* %286 = OpVariable Output 
                                  u32 %287 = OpConstant 3 
                                      %290 = OpTypePointer Output %6 
                                  u32 %302 = OpConstant 2 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                        Function f32* %115 = OpVariable Function 
                      Function f32_3* %275 = OpVariable Function 
                      Function f32_3* %294 = OpVariable Function 
                      Function f32_3* %305 = OpVariable Function 
                          Uniform f32* %20 = OpAccessChain %14 %16 %18 
                                   f32 %21 = OpLoad %20 
                          Uniform f32* %23 = OpAccessChain %14 %16 %22 
                                   f32 %24 = OpLoad %23 
                                   f32 %25 = OpFDiv %21 %24 
                          Private f32* %27 = OpAccessChain %9 %18 
                                               OpStore %27 %25 
                          Private f32* %28 = OpAccessChain %9 %18 
                                   f32 %29 = OpLoad %28 
                            Input f32* %33 = OpAccessChain vs_TEXCOORD0 %18 
                                   f32 %34 = OpLoad %33 
                                   f32 %35 = OpFMul %29 %34 
                          Private f32* %36 = OpAccessChain %9 %18 
                                               OpStore %36 %35 
                            Input f32* %37 = OpAccessChain vs_TEXCOORD0 %22 
                                   f32 %38 = OpLoad %37 
                          Private f32* %39 = OpAccessChain %9 %22 
                                               OpStore %39 %38 
                                 f32_3 %40 = OpLoad %9 
                                 f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                        Uniform f32_4* %44 = OpAccessChain %14 %42 
                                 f32_4 %45 = OpLoad %44 
                                 f32_2 %46 = OpVectorShuffle %45 %45 3 3 
                                 f32_2 %47 = OpFMul %41 %46 
                                 f32_3 %48 = OpLoad %9 
                                 f32_3 %49 = OpVectorShuffle %48 %47 3 4 2 
                                               OpStore %9 %49 
                   read_only Texture2D %53 = OpLoad %52 
                               sampler %57 = OpLoad %56 
            read_only Texture2DSampled %59 = OpSampledImage %53 %57 
                                 f32_3 %60 = OpLoad %9 
                                 f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                 f32_4 %62 = OpImageSampleImplicitLod %59 %61 
                                 f32_2 %63 = OpVectorShuffle %62 %62 0 1 
                                 f32_3 %64 = OpLoad %9 
                                 f32_3 %65 = OpVectorShuffle %64 %63 3 4 2 
                                               OpStore %9 %65 
                   read_only Texture2D %69 = OpLoad %68 
                               sampler %71 = OpLoad %70 
            read_only Texture2DSampled %72 = OpSampledImage %69 %71 
                                 f32_2 %74 = OpLoad vs_TEXCOORD1 
                                 f32_4 %75 = OpImageSampleImplicitLod %72 %74 
                                               OpStore %67 %75 
                                 f32_4 %77 = OpLoad %67 
                                 f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
                                   f32 %83 = OpDot %78 %82 
                                               OpStore %76 %83 
                                   f32 %85 = OpLoad %76 
                                   f32 %87 = OpFAdd %85 %86 
                                               OpStore %84 %87 
                                   f32 %88 = OpLoad %84 
                                   f32 %90 = OpFMul %88 %89 
                                               OpStore %84 %90 
                                   f32 %91 = OpLoad %84 
                                   f32 %92 = OpExtInst %1 4 %91 
                                   f32 %94 = OpExtInst %1 40 %92 %93 
                                               OpStore %84 %94 
                                   f32 %95 = OpLoad %84 
                                   f32 %96 = OpExtInst %1 30 %95 
                                               OpStore %84 %96 
                                   f32 %97 = OpLoad %84 
                                   f32 %99 = OpFMul %97 %98 
                                               OpStore %84 %99 
                                  f32 %100 = OpLoad %84 
                                  f32 %101 = OpExtInst %1 29 %100 
                                               OpStore %84 %101 
                                  f32 %103 = OpLoad %76 
                                  f32 %105 = OpFMul %103 %104 
                         Private f32* %106 = OpAccessChain %102 %18 
                                               OpStore %106 %105 
                                  f32 %111 = OpLoad %76 
                                 bool %112 = OpFOrdGreaterThanEqual %110 %111 
                                               OpStore %109 %112 
                                 bool %113 = OpLoad %109 
                                               OpSelectionMerge %117 None 
                                               OpBranchConditional %113 %116 %120 
                                      %116 = OpLabel 
                         Private f32* %118 = OpAccessChain %102 %18 
                                  f32 %119 = OpLoad %118 
                                               OpStore %115 %119 
                                               OpBranch %117 
                                      %120 = OpLabel 
                                  f32 %121 = OpLoad %84 
                                               OpStore %115 %121 
                                               OpBranch %117 
                                      %117 = OpLabel 
                                  f32 %122 = OpLoad %115 
                                               OpStore %76 %122 
                                  f32 %123 = OpLoad %76 
                                  f32 %124 = OpFNegate %123 
                                  f32 %126 = OpFAdd %124 %125 
                                               OpStore %84 %126 
                                  f32 %127 = OpLoad %84 
                                  f32 %129 = OpExtInst %1 43 %127 %128 %125 
                                               OpStore %84 %129 
                                  f32 %130 = OpLoad %84 
                                  f32 %131 = OpFNegate %130 
                         Private f32* %132 = OpAccessChain %9 %18 
                                  f32 %133 = OpLoad %132 
                                  f32 %134 = OpFAdd %131 %133 
                         Private f32* %135 = OpAccessChain %9 %18 
                                               OpStore %135 %134 
                                  f32 %136 = OpLoad %84 
                                  f32 %137 = OpFNegate %136 
                                  f32 %138 = OpFDiv %125 %137 
                         Private f32* %139 = OpAccessChain %102 %18 
                                               OpStore %139 %138 
                                  f32 %140 = OpLoad %84 
                                  f32 %141 = OpFDiv %125 %140 
                                               OpStore %84 %141 
                                  f32 %143 = OpLoad %84 
                         Private f32* %144 = OpAccessChain %9 %22 
                                  f32 %145 = OpLoad %144 
                                  f32 %146 = OpFMul %143 %145 
                         Private f32* %147 = OpAccessChain %142 %18 
                                               OpStore %147 %146 
                         Private f32* %148 = OpAccessChain %142 %18 
                                  f32 %149 = OpLoad %148 
                                  f32 %150 = OpExtInst %1 43 %149 %128 %125 
                         Private f32* %151 = OpAccessChain %142 %18 
                                               OpStore %151 %150 
                         Private f32* %152 = OpAccessChain %9 %18 
                                  f32 %153 = OpLoad %152 
                         Private f32* %154 = OpAccessChain %102 %18 
                                  f32 %155 = OpLoad %154 
                                  f32 %156 = OpFMul %153 %155 
                         Private f32* %157 = OpAccessChain %9 %18 
                                               OpStore %157 %156 
                         Private f32* %158 = OpAccessChain %9 %18 
                                  f32 %159 = OpLoad %158 
                                  f32 %160 = OpExtInst %1 43 %159 %128 %125 
                         Private f32* %161 = OpAccessChain %9 %18 
                                               OpStore %161 %160 
                         Private f32* %162 = OpAccessChain %9 %18 
                                  f32 %163 = OpLoad %162 
                                  f32 %165 = OpFMul %163 %164 
                                  f32 %167 = OpFAdd %165 %166 
                                               OpStore %84 %167 
                         Private f32* %168 = OpAccessChain %9 %18 
                                  f32 %169 = OpLoad %168 
                         Private f32* %170 = OpAccessChain %9 %18 
                                  f32 %171 = OpLoad %170 
                                  f32 %172 = OpFMul %169 %171 
                         Private f32* %173 = OpAccessChain %9 %18 
                                               OpStore %173 %172 
                                  f32 %174 = OpLoad %84 
                         Private f32* %175 = OpAccessChain %9 %18 
                                  f32 %176 = OpLoad %175 
                                  f32 %177 = OpFMul %174 %176 
                         Uniform f32* %179 = OpAccessChain %14 %178 %18 
                                  f32 %180 = OpLoad %179 
                                  f32 %181 = OpFAdd %177 %180 
                         Private f32* %182 = OpAccessChain %9 %18 
                                               OpStore %182 %181 
                         Private f32* %183 = OpAccessChain %142 %18 
                                  f32 %184 = OpLoad %183 
                                  f32 %185 = OpFMul %184 %164 
                                  f32 %186 = OpFAdd %185 %166 
                                               OpStore %84 %186 
                         Private f32* %187 = OpAccessChain %142 %18 
                                  f32 %188 = OpLoad %187 
                         Private f32* %189 = OpAccessChain %142 %18 
                                  f32 %190 = OpLoad %189 
                                  f32 %191 = OpFMul %188 %190 
                         Private f32* %192 = OpAccessChain %142 %18 
                                               OpStore %192 %191 
                         Private f32* %193 = OpAccessChain %142 %18 
                                  f32 %194 = OpLoad %193 
                                  f32 %195 = OpLoad %84 
                                  f32 %196 = OpFMul %194 %195 
                         Private f32* %197 = OpAccessChain %142 %18 
                                               OpStore %197 %196 
                         Private f32* %198 = OpAccessChain %142 %18 
                                  f32 %199 = OpLoad %198 
                         Uniform f32* %200 = OpAccessChain %14 %178 %22 
                                  f32 %201 = OpLoad %200 
                                  f32 %202 = OpFMul %199 %201 
                         Private f32* %203 = OpAccessChain %9 %18 
                                  f32 %204 = OpLoad %203 
                                  f32 %205 = OpFNegate %204 
                                  f32 %206 = OpFAdd %202 %205 
                         Private f32* %207 = OpAccessChain %142 %18 
                                               OpStore %207 %206 
                                  f32 %208 = OpLoad %76 
                         Private f32* %209 = OpAccessChain %142 %18 
                                  f32 %210 = OpLoad %209 
                                  f32 %211 = OpFMul %208 %210 
                         Private f32* %212 = OpAccessChain %9 %18 
                                  f32 %213 = OpLoad %212 
                                  f32 %214 = OpFAdd %211 %213 
                         Private f32* %215 = OpAccessChain %9 %18 
                                               OpStore %215 %214 
                         Private f32* %216 = OpAccessChain %9 %18 
                                  f32 %217 = OpLoad %216 
                                  f32 %218 = OpExtInst %1 43 %217 %128 %125 
                         Private f32* %219 = OpAccessChain %9 %18 
                                               OpStore %219 %218 
                                f32_4 %220 = OpLoad %67 
                                f32_3 %221 = OpVectorShuffle %220 %220 0 1 2 
                                f32_3 %222 = OpLoad %9 
                                f32_3 %223 = OpVectorShuffle %222 %222 0 0 0 
                                f32_3 %224 = OpFMul %221 %223 
                                f32_4 %225 = OpLoad %67 
                                f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                                f32_3 %227 = OpFNegate %226 
                                f32_3 %228 = OpFAdd %224 %227 
                                               OpStore %142 %228 
                       Uniform f32_4* %229 = OpAccessChain %14 %42 
                                f32_4 %230 = OpLoad %229 
                                f32_3 %231 = OpVectorShuffle %230 %230 2 2 2 
                                f32_3 %232 = OpLoad %142 
                                f32_3 %233 = OpFMul %231 %232 
                                f32_4 %234 = OpLoad %67 
                                f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                                f32_3 %236 = OpFAdd %233 %235 
                                               OpStore %142 %236 
                                f32_4 %237 = OpLoad %67 
                                f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
                                f32_3 %239 = OpFNegate %238 
                                f32_3 %240 = OpLoad %9 
                                f32_3 %241 = OpVectorShuffle %240 %240 0 0 0 
                                f32_3 %242 = OpFAdd %239 %241 
                                               OpStore %102 %242 
                       Uniform f32_4* %244 = OpAccessChain %14 %42 
                                f32_4 %245 = OpLoad %244 
                                f32_3 %246 = OpVectorShuffle %245 %245 2 2 2 
                                f32_3 %247 = OpLoad %9 
                                f32_3 %248 = OpVectorShuffle %247 %247 0 0 0 
                                f32_3 %249 = OpFMul %246 %248 
                                f32_4 %250 = OpLoad %67 
                                f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                                f32_3 %252 = OpFAdd %249 %251 
                                               OpStore %243 %252 
                       Uniform f32_4* %253 = OpAccessChain %14 %42 
                                f32_4 %254 = OpLoad %253 
                                f32_3 %255 = OpVectorShuffle %254 %254 2 2 2 
                                f32_3 %256 = OpLoad %102 
                                f32_3 %257 = OpFMul %255 %256 
                                f32_4 %258 = OpLoad %67 
                                f32_3 %259 = OpVectorShuffle %258 %258 0 1 2 
                                f32_3 %260 = OpFAdd %257 %259 
                                               OpStore %102 %260 
                       Uniform f32_4* %264 = OpAccessChain %14 %42 
                                f32_4 %265 = OpLoad %264 
                                f32_4 %266 = OpVectorShuffle %265 %265 1 1 1 1 
                               bool_4 %270 = OpFOrdEqual %266 %268 
                               bool_3 %271 = OpVectorShuffle %270 %270 0 1 2 
                                               OpStore %263 %271 
                        Private bool* %272 = OpAccessChain %263 %18 
                                 bool %273 = OpLoad %272 
                                               OpSelectionMerge %277 None 
                                               OpBranchConditional %273 %276 %279 
                                      %276 = OpLabel 
                                f32_3 %278 = OpLoad %102 
                                               OpStore %275 %278 
                                               OpBranch %277 
                                      %279 = OpLabel 
                                f32_4 %280 = OpLoad %67 
                                f32_3 %281 = OpVectorShuffle %280 %280 0 1 2 
                                               OpStore %275 %281 
                                               OpBranch %277 
                                      %277 = OpLabel 
                                f32_3 %282 = OpLoad %275 
                                f32_4 %283 = OpLoad %67 
                                f32_4 %284 = OpVectorShuffle %283 %282 4 5 6 3 
                                               OpStore %67 %284 
                         Private f32* %288 = OpAccessChain %67 %287 
                                  f32 %289 = OpLoad %288 
                          Output f32* %291 = OpAccessChain %286 %287 
                                               OpStore %291 %289 
                        Private bool* %292 = OpAccessChain %263 %22 
                                 bool %293 = OpLoad %292 
                                               OpSelectionMerge %296 None 
                                               OpBranchConditional %293 %295 %298 
                                      %295 = OpLabel 
                                f32_3 %297 = OpLoad %142 
                                               OpStore %294 %297 
                                               OpBranch %296 
                                      %298 = OpLabel 
                                f32_4 %299 = OpLoad %67 
                                f32_3 %300 = OpVectorShuffle %299 %299 0 1 2 
                                               OpStore %294 %300 
                                               OpBranch %296 
                                      %296 = OpLabel 
                                f32_3 %301 = OpLoad %294 
                                               OpStore %9 %301 
                        Private bool* %303 = OpAccessChain %263 %302 
                                 bool %304 = OpLoad %303 
                                               OpSelectionMerge %307 None 
                                               OpBranchConditional %304 %306 %309 
                                      %306 = OpLabel 
                                f32_3 %308 = OpLoad %243 
                                               OpStore %305 %308 
                                               OpBranch %307 
                                      %309 = OpLabel 
                                f32_3 %310 = OpLoad %9 
                                               OpStore %305 %310 
                                               OpBranch %307 
                                      %307 = OpLabel 
                                f32_3 %311 = OpLoad %305 
                                f32_4 %312 = OpLoad %286 
                                f32_4 %313 = OpVectorShuffle %312 %311 4 5 6 3 
                                               OpStore %286 %313 
                                f32_4 %314 = OpLoad %286 
                                f32_3 %315 = OpVectorShuffle %314 %314 0 1 2 
                                f32_3 %316 = OpCompositeConstruct %128 %128 %128 
                                f32_3 %317 = OpCompositeConstruct %125 %125 %125 
                                f32_3 %318 = OpExtInst %1 43 %315 %316 %317 
                                f32_4 %319 = OpLoad %286 
                                f32_4 %320 = OpVectorShuffle %319 %318 4 5 6 3 
                                               OpStore %286 %320 
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