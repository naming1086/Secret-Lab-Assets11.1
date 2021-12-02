//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/Ripples" {
Properties {
}
SubShader {
 Pass {
  Name "Ripples: Radial"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 33905
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
uniform 	vec4 _Time;
uniform 	float _Strength;
uniform 	float _Distance;
uniform 	float _Speed;
uniform 	vec2 _Size;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Size.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = _Time.x * _Speed + (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x / _Distance;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Strength;
    u_xlat0.xy = u_xlat0.xx * vec2(0.5, 0.5) + vs_TEXCOORD1.xy;
    SV_Target0 = texture(_MainTex, u_xlat0.xy);
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
; Bound: 93
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %75 %79 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate vs_TEXCOORD0 Location 11 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate vs_TEXCOORD1 Location 75 
                                                      OpDecorate %79 Location 79 
                                                      OpDecorate %82 DescriptorSet 82 
                                                      OpDecorate %82 Binding 82 
                                                      OpDecorate %86 DescriptorSet 86 
                                                      OpDecorate %86 Binding 86 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 2 
                                               %8 = OpTypePointer Private %7 
                                Private f32_2* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          f32 %14 = OpConstant 3.674022E-40 
                                        f32_2 %15 = OpConstantComposite %14 %14 
                                              %18 = OpTypeVector %6 4 
                                              %19 = OpTypeStruct %18 %6 %6 %6 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32; f32; f32; f32_2;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 4 
                                              %24 = OpTypePointer Uniform %7 
                                              %31 = OpTypeInt 32 0 
                                          u32 %32 = OpConstant 1 
                                              %33 = OpTypePointer Private %6 
                                          u32 %36 = OpConstant 0 
                                          i32 %41 = OpConstant 0 
                                              %42 = OpTypePointer Uniform %6 
                                          i32 %45 = OpConstant 3 
                                          i32 %56 = OpConstant 2 
                                          i32 %67 = OpConstant 1 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                              %78 = OpTypePointer Output %18 
                                Output f32_4* %79 = OpVariable Output 
                                              %80 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %81 = OpTypePointer UniformConstant %80 
         UniformConstant read_only Texture2D* %82 = OpVariable UniformConstant 
                                              %84 = OpTypeSampler 
                                              %85 = OpTypePointer UniformConstant %84 
                     UniformConstant sampler* %86 = OpVariable UniformConstant 
                                              %88 = OpTypeSampledImage %80 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_2 %12 = OpLoad vs_TEXCOORD0 
                                        f32_2 %13 = OpFNegate %12 
                                        f32_2 %16 = OpFAdd %13 %15 
                                                      OpStore %9 %16 
                                        f32_2 %17 = OpLoad %9 
                               Uniform f32_2* %25 = OpAccessChain %21 %23 
                                        f32_2 %26 = OpLoad %25 
                                        f32_2 %27 = OpFMul %17 %26 
                                                      OpStore %9 %27 
                                        f32_2 %28 = OpLoad %9 
                                        f32_2 %29 = OpLoad %9 
                                        f32_2 %30 = OpFMul %28 %29 
                                                      OpStore %9 %30 
                                 Private f32* %34 = OpAccessChain %9 %32 
                                          f32 %35 = OpLoad %34 
                                 Private f32* %37 = OpAccessChain %9 %36 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpFAdd %35 %38 
                                 Private f32* %40 = OpAccessChain %9 %36 
                                                      OpStore %40 %39 
                                 Uniform f32* %43 = OpAccessChain %21 %41 %36 
                                          f32 %44 = OpLoad %43 
                                 Uniform f32* %46 = OpAccessChain %21 %45 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFMul %44 %47 
                                 Private f32* %49 = OpAccessChain %9 %36 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFNegate %50 
                                          f32 %52 = OpFAdd %48 %51 
                                 Private f32* %53 = OpAccessChain %9 %36 
                                                      OpStore %53 %52 
                                 Private f32* %54 = OpAccessChain %9 %36 
                                          f32 %55 = OpLoad %54 
                                 Uniform f32* %57 = OpAccessChain %21 %56 
                                          f32 %58 = OpLoad %57 
                                          f32 %59 = OpFDiv %55 %58 
                                 Private f32* %60 = OpAccessChain %9 %36 
                                                      OpStore %60 %59 
                                 Private f32* %61 = OpAccessChain %9 %36 
                                          f32 %62 = OpLoad %61 
                                          f32 %63 = OpExtInst %1 13 %62 
                                 Private f32* %64 = OpAccessChain %9 %36 
                                                      OpStore %64 %63 
                                 Private f32* %65 = OpAccessChain %9 %36 
                                          f32 %66 = OpLoad %65 
                                 Uniform f32* %68 = OpAccessChain %21 %67 
                                          f32 %69 = OpLoad %68 
                                          f32 %70 = OpFMul %66 %69 
                                 Private f32* %71 = OpAccessChain %9 %36 
                                                      OpStore %71 %70 
                                        f32_2 %72 = OpLoad %9 
                                        f32_2 %73 = OpVectorShuffle %72 %72 0 0 
                                        f32_2 %74 = OpFMul %73 %15 
                                        f32_2 %76 = OpLoad vs_TEXCOORD1 
                                        f32_2 %77 = OpFAdd %74 %76 
                                                      OpStore %9 %77 
                          read_only Texture2D %83 = OpLoad %82 
                                      sampler %87 = OpLoad %86 
                   read_only Texture2DSampled %89 = OpSampledImage %83 %87 
                                        f32_2 %90 = OpLoad %9 
                                        f32_4 %91 = OpImageSampleImplicitLod %89 %90 
                                                      OpStore %79 %91 
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
  Name "Ripples: Omnidirectional"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 77851
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
uniform 	vec4 _Time;
uniform 	float _Strength;
uniform 	float _Distance;
uniform 	float _Speed;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
bvec4 u_xlatb8;
vec4 u_xlat9;
vec4 u_xlat10;
float u_xlat34;
void main()
{
    u_xlat0.x = float(0.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = _Distance * 100.0;
    u_xlat1.xy = u_xlat1.xx * vs_TEXCOORD1.xy;
    u_xlat34 = _Time.y * _Speed;
    u_xlat1.z = u_xlat34 * 0.25;
    u_xlat34 = dot(u_xlat1.xyz, vec3(0.333333343, 0.333333343, 0.333333343));
    u_xlat2.xyz = vec3(u_xlat34) + u_xlat1.xyz;
    u_xlat2.xyz = floor(u_xlat2.xyz);
    u_xlat3.xyz = u_xlat2.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat3.xyz = floor(u_xlat3.xyz);
    u_xlat3.xyz = (-u_xlat3.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
    u_xlat34 = dot(u_xlat2.xyz, vec3(0.166666672, 0.166666672, 0.166666672));
    u_xlat1.xyz = vec3(u_xlat34) + u_xlat1.xyz;
    u_xlatb2.xyz = greaterThanEqual(u_xlat1.zxyz, u_xlat1.xyzx).xyz;
    u_xlat4.x = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb2.z ? float(1.0) : 0.0;
    u_xlat4.z = u_xlatb2.x ? float(1.0) : 0.0;
;
    u_xlat2.x = (u_xlatb2.x) ? float(0.0) : float(1.0);
    u_xlat2.y = (u_xlatb2.y) ? float(0.0) : float(1.0);
    u_xlat2.z = (u_xlatb2.z) ? float(0.0) : float(1.0);
    u_xlat5.xyz = min(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat2.xyz = max(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat0.y = u_xlat5.z;
    u_xlat0.z = u_xlat2.z;
    u_xlat0 = u_xlat0 + u_xlat3.zzzz;
    u_xlat4 = u_xlat0 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * u_xlat4;
    u_xlat4 = u_xlat0 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4 = floor(u_xlat4);
    u_xlat0 = (-u_xlat4) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat0;
    u_xlat0 = u_xlat3.yyyy + u_xlat0;
    u_xlat4.x = float(0.0);
    u_xlat4.w = float(1.0);
    u_xlat4.y = u_xlat5.y;
    u_xlat4.z = u_xlat2.y;
    u_xlat0 = u_xlat0 + u_xlat4;
    u_xlat4 = u_xlat0 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * u_xlat4;
    u_xlat4 = u_xlat0 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4 = floor(u_xlat4);
    u_xlat0 = (-u_xlat4) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat0;
    u_xlat0 = u_xlat3.xxxx + u_xlat0;
    u_xlat3.x = float(0.0);
    u_xlat3.w = float(1.0);
    u_xlat3.y = u_xlat5.x;
    u_xlat4.xyz = u_xlat1.xyz + (-u_xlat5.xyz);
    u_xlat4.xyz = u_xlat4.xyz + vec3(0.166666672, 0.166666672, 0.166666672);
    u_xlat3.z = u_xlat2.x;
    u_xlat2.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz + vec3(0.333333343, 0.333333343, 0.333333343);
    u_xlat0 = u_xlat0 + u_xlat3;
    u_xlat3 = u_xlat0 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat3 = u_xlat0 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat3 = floor(u_xlat3);
    u_xlat0 = (-u_xlat3) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat0;
    u_xlat3 = u_xlat0 * vec4(0.0204081628, 0.0204081628, 0.0204081628, 0.0204081628);
    u_xlat3 = floor(u_xlat3);
    u_xlat0 = (-u_xlat3) * vec4(49.0, 49.0, 49.0, 49.0) + u_xlat0;
    u_xlat3 = u_xlat0 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149);
    u_xlat3 = floor(u_xlat3);
    u_xlat0 = (-u_xlat3) * vec4(7.0, 7.0, 7.0, 7.0) + u_xlat0;
    u_xlat3 = u_xlat3.zxwy * vec4(0.285714298, 0.285714298, 0.285714298, 0.285714298) + vec4(-0.928571403, -0.928571403, -0.928571403, -0.928571403);
    u_xlat0 = u_xlat0 * vec4(0.285714298, 0.285714298, 0.285714298, 0.285714298) + vec4(-0.928571403, -0.928571403, -0.928571403, -0.928571403);
    u_xlat5.yw = u_xlat0.xy;
    u_xlat5.xz = u_xlat3.yw;
    u_xlat6.yw = floor(u_xlat0.xy);
    u_xlat6.xz = floor(u_xlat3.yw);
    u_xlat6 = u_xlat6 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat7 = -abs(u_xlat3.ywxz) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat7 = -abs(u_xlat0.xywz) + u_xlat7.xywz;
    u_xlatb8 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xywz);
    u_xlat8.x = (u_xlatb8.x) ? float(-1.0) : float(-0.0);
    u_xlat8.y = (u_xlatb8.y) ? float(-1.0) : float(-0.0);
    u_xlat8.z = (u_xlatb8.z) ? float(-1.0) : float(-0.0);
    u_xlat8.w = (u_xlatb8.w) ? float(-1.0) : float(-0.0);
    u_xlat5 = u_xlat6.zwxy * u_xlat8.yyxx + u_xlat5.zwxy;
    u_xlat6.xy = u_xlat5.zw;
    u_xlat6.z = u_xlat7.x;
    u_xlat9.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat5.z = u_xlat7.y;
    u_xlat9.y = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat10.yw = floor(u_xlat0.zw);
    u_xlat3.yw = u_xlat0.zw;
    u_xlat10.xz = floor(u_xlat3.xz);
    u_xlat0 = u_xlat10 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * u_xlat8.zzww + u_xlat3;
    u_xlat7.xy = u_xlat0.zw;
    u_xlat0.z = u_xlat7.w;
    u_xlat9.z = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9.w = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat3 = (-u_xlat9) * vec4(0.853734732, 0.853734732, 0.853734732, 0.853734732) + vec4(1.79284286, 1.79284286, 1.79284286, 1.79284286);
    u_xlat5.xyz = u_xlat3.yyy * u_xlat5.xyz;
    u_xlat5.y = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat4.y = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.zzz;
    u_xlat5.z = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat4.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat3.xxx * u_xlat6.xyz;
    u_xlat2.xyz = u_xlat3.www * u_xlat7.xyz;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat1.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat4.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat5.w = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat4.w = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0 = (-u_xlat4) + vec4(0.600000024, 0.600000024, 0.600000024, 0.600000024);
    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0.x = dot(u_xlat0, u_xlat5);
    u_xlat0.x = u_xlat0.x * 21.0 + 0.5;
    u_xlat0.xy = u_xlat0.xx * vec2(_Strength) + vs_TEXCOORD1.xy;
    SV_Target0 = texture(_MainTex, u_xlat0.xy);
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
; Bound: 561
; Schema: 0
                                                OpCapability Shader 
                                         %1 = OpExtInstImport "GLSL.std.450" 
                                                OpMemoryModel Logical GLSL450 
                                                OpEntryPoint Fragment %4 "main" %36 %546 
                                                OpExecutionMode %4 OriginUpperLeft 
                                                OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                OpMemberDecorate %21 0 Offset 21 
                                                OpMemberDecorate %21 1 Offset 21 
                                                OpMemberDecorate %21 2 Offset 21 
                                                OpMemberDecorate %21 3 Offset 21 
                                                OpDecorate %21 Block 
                                                OpDecorate %23 DescriptorSet 23 
                                                OpDecorate %23 Binding 23 
                                                OpDecorate vs_TEXCOORD1 Location 36 
                                                OpDecorate %546 Location 546 
                                                OpDecorate %549 DescriptorSet 549 
                                                OpDecorate %549 Binding 549 
                                                OpDecorate %553 DescriptorSet 553 
                                                OpDecorate %553 Binding 553 
                                         %2 = OpTypeVoid 
                                         %3 = OpTypeFunction %2 
                                         %6 = OpTypeFloat 32 
                                         %7 = OpTypeVector %6 4 
                                         %8 = OpTypePointer Private %7 
                          Private f32_4* %9 = OpVariable Private 
                                    f32 %10 = OpConstant 3.674022E-40 
                                        %11 = OpTypeInt 32 0 
                                    u32 %12 = OpConstant 0 
                                        %13 = OpTypePointer Private %6 
                                    f32 %15 = OpConstant 3.674022E-40 
                                    u32 %16 = OpConstant 3 
                                        %18 = OpTypeVector %6 3 
                                        %19 = OpTypePointer Private %18 
                         Private f32_3* %20 = OpVariable Private 
                                        %21 = OpTypeStruct %7 %6 %6 %6 
                                        %22 = OpTypePointer Uniform %21 
Uniform struct {f32_4; f32; f32; f32;}* %23 = OpVariable Uniform 
                                        %24 = OpTypeInt 32 1 
                                    i32 %25 = OpConstant 2 
                                        %26 = OpTypePointer Uniform %6 
                                    f32 %29 = OpConstant 3.674022E-40 
                                        %32 = OpTypeVector %6 2 
                                        %35 = OpTypePointer Input %32 
                  Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                           Private f32* %41 = OpVariable Private 
                                    i32 %42 = OpConstant 0 
                                    u32 %43 = OpConstant 1 
                                    i32 %46 = OpConstant 3 
                                    f32 %51 = OpConstant 3.674022E-40 
                                    u32 %53 = OpConstant 2 
                                    f32 %56 = OpConstant 3.674022E-40 
                                  f32_3 %57 = OpConstantComposite %56 %56 %56 
                         Private f32_3* %59 = OpVariable Private 
                         Private f32_4* %66 = OpVariable Private 
                                    f32 %68 = OpConstant 3.674022E-40 
                                  f32_3 %69 = OpConstantComposite %68 %68 %68 
                                    f32 %81 = OpConstant 3.674022E-40 
                                  f32_3 %82 = OpConstantComposite %81 %81 %81 
                                    f32 %93 = OpConstant 3.674022E-40 
                                  f32_3 %94 = OpConstantComposite %93 %93 %93 
                                       %100 = OpTypeBool 
                                       %101 = OpTypeVector %100 3 
                                       %102 = OpTypePointer Private %101 
                       Private bool_3* %103 = OpVariable Private 
                                       %108 = OpTypeVector %100 4 
                        Private f32_4* %111 = OpVariable Private 
                                       %112 = OpTypePointer Private %100 
                        Private f32_4* %137 = OpVariable Private 
                                   f32 %159 = OpConstant 3.674022E-40 
                                 f32_4 %160 = OpConstantComposite %159 %159 %159 %159 
                                 f32_4 %162 = OpConstantComposite %15 %15 %15 %15 
                                 f32_4 %168 = OpConstantComposite %68 %68 %68 %68 
                                 f32_4 %174 = OpConstantComposite %81 %81 %81 %81 
                                   f32 %257 = OpConstant 3.674022E-40 
                                 f32_4 %258 = OpConstantComposite %257 %257 %257 %257 
                                   f32 %264 = OpConstant 3.674022E-40 
                                 f32_4 %265 = OpConstantComposite %264 %264 %264 %264 
                                   f32 %270 = OpConstant 3.674022E-40 
                                 f32_4 %271 = OpConstantComposite %270 %270 %270 %270 
                                   f32 %277 = OpConstant 3.674022E-40 
                                 f32_4 %278 = OpConstantComposite %277 %277 %277 %277 
                                   f32 %284 = OpConstant 3.674022E-40 
                                 f32_4 %285 = OpConstantComposite %284 %284 %284 %284 
                                   f32 %287 = OpConstant 3.674022E-40 
                                 f32_4 %288 = OpConstantComposite %287 %287 %287 %287 
                        Private f32_4* %301 = OpVariable Private 
                                   f32 %313 = OpConstant 3.674022E-40 
                                 f32_4 %314 = OpConstantComposite %313 %313 %313 %313 
                        Private f32_4* %317 = OpVariable Private 
                                       %330 = OpTypePointer Private %108 
                       Private bool_4* %331 = OpVariable Private 
                                 f32_4 %332 = OpConstantComposite %10 %10 %10 %10 
                        Private f32_4* %336 = OpVariable Private 
                                   f32 %339 = OpConstant 3.674022E-40 
                                   f32 %340 = OpConstant 3.674022E-40 
                        Private f32_4* %370 = OpVariable Private 
                        Private f32_4* %386 = OpVariable Private 
                                   f32 %431 = OpConstant 3.674022E-40 
                                 f32_4 %432 = OpConstantComposite %431 %431 %431 %431 
                                   f32 %434 = OpConstant 3.674022E-40 
                                 f32_4 %435 = OpConstantComposite %434 %434 %434 %434 
                                   f32 %490 = OpConstant 3.674022E-40 
                                 f32_3 %491 = OpConstantComposite %490 %490 %490 
                                   f32 %512 = OpConstant 3.674022E-40 
                                 f32_4 %513 = OpConstantComposite %512 %512 %512 %512 
                                   f32 %529 = OpConstant 3.674022E-40 
                                   f32 %531 = OpConstant 3.674022E-40 
                                   i32 %536 = OpConstant 1 
                                       %545 = OpTypePointer Output %7 
                         Output f32_4* %546 = OpVariable Output 
                                       %547 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                       %548 = OpTypePointer UniformConstant %547 
  UniformConstant read_only Texture2D* %549 = OpVariable UniformConstant 
                                       %551 = OpTypeSampler 
                                       %552 = OpTypePointer UniformConstant %551 
              UniformConstant sampler* %553 = OpVariable UniformConstant 
                                       %555 = OpTypeSampledImage %547 
                                    void %4 = OpFunction None %3 
                                         %5 = OpLabel 
                           Private f32* %14 = OpAccessChain %9 %12 
                                                OpStore %14 %10 
                           Private f32* %17 = OpAccessChain %9 %16 
                                                OpStore %17 %15 
                           Uniform f32* %27 = OpAccessChain %23 %25 
                                    f32 %28 = OpLoad %27 
                                    f32 %30 = OpFMul %28 %29 
                           Private f32* %31 = OpAccessChain %20 %12 
                                                OpStore %31 %30 
                                  f32_3 %33 = OpLoad %20 
                                  f32_2 %34 = OpVectorShuffle %33 %33 0 0 
                                  f32_2 %37 = OpLoad vs_TEXCOORD1 
                                  f32_2 %38 = OpFMul %34 %37 
                                  f32_3 %39 = OpLoad %20 
                                  f32_3 %40 = OpVectorShuffle %39 %38 3 4 2 
                                                OpStore %20 %40 
                           Uniform f32* %44 = OpAccessChain %23 %42 %43 
                                    f32 %45 = OpLoad %44 
                           Uniform f32* %47 = OpAccessChain %23 %46 
                                    f32 %48 = OpLoad %47 
                                    f32 %49 = OpFMul %45 %48 
                                                OpStore %41 %49 
                                    f32 %50 = OpLoad %41 
                                    f32 %52 = OpFMul %50 %51 
                           Private f32* %54 = OpAccessChain %20 %53 
                                                OpStore %54 %52 
                                  f32_3 %55 = OpLoad %20 
                                    f32 %58 = OpDot %55 %57 
                                                OpStore %41 %58 
                                    f32 %60 = OpLoad %41 
                                  f32_3 %61 = OpCompositeConstruct %60 %60 %60 
                                  f32_3 %62 = OpLoad %20 
                                  f32_3 %63 = OpFAdd %61 %62 
                                                OpStore %59 %63 
                                  f32_3 %64 = OpLoad %59 
                                  f32_3 %65 = OpExtInst %1 8 %64 
                                                OpStore %59 %65 
                                  f32_3 %67 = OpLoad %59 
                                  f32_3 %70 = OpFMul %67 %69 
                                  f32_4 %71 = OpLoad %66 
                                  f32_4 %72 = OpVectorShuffle %71 %70 4 5 6 3 
                                                OpStore %66 %72 
                                  f32_4 %73 = OpLoad %66 
                                  f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                  f32_3 %75 = OpExtInst %1 8 %74 
                                  f32_4 %76 = OpLoad %66 
                                  f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                                OpStore %66 %77 
                                  f32_4 %78 = OpLoad %66 
                                  f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                                  f32_3 %80 = OpFNegate %79 
                                  f32_3 %83 = OpFMul %80 %82 
                                  f32_3 %84 = OpLoad %59 
                                  f32_3 %85 = OpFAdd %83 %84 
                                  f32_4 %86 = OpLoad %66 
                                  f32_4 %87 = OpVectorShuffle %86 %85 4 5 6 3 
                                                OpStore %66 %87 
                                  f32_3 %88 = OpLoad %20 
                                  f32_3 %89 = OpLoad %59 
                                  f32_3 %90 = OpFNegate %89 
                                  f32_3 %91 = OpFAdd %88 %90 
                                                OpStore %20 %91 
                                  f32_3 %92 = OpLoad %59 
                                    f32 %95 = OpDot %92 %94 
                                                OpStore %41 %95 
                                    f32 %96 = OpLoad %41 
                                  f32_3 %97 = OpCompositeConstruct %96 %96 %96 
                                  f32_3 %98 = OpLoad %20 
                                  f32_3 %99 = OpFAdd %97 %98 
                                                OpStore %20 %99 
                                 f32_3 %104 = OpLoad %20 
                                 f32_4 %105 = OpVectorShuffle %104 %104 2 0 1 2 
                                 f32_3 %106 = OpLoad %20 
                                 f32_4 %107 = OpVectorShuffle %106 %106 0 1 2 0 
                                bool_4 %109 = OpFOrdGreaterThanEqual %105 %107 
                                bool_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                                OpStore %103 %110 
                         Private bool* %113 = OpAccessChain %103 %43 
                                  bool %114 = OpLoad %113 
                                   f32 %115 = OpSelect %114 %15 %10 
                          Private f32* %116 = OpAccessChain %111 %12 
                                                OpStore %116 %115 
                         Private bool* %117 = OpAccessChain %103 %53 
                                  bool %118 = OpLoad %117 
                                   f32 %119 = OpSelect %118 %15 %10 
                          Private f32* %120 = OpAccessChain %111 %43 
                                                OpStore %120 %119 
                         Private bool* %121 = OpAccessChain %103 %12 
                                  bool %122 = OpLoad %121 
                                   f32 %123 = OpSelect %122 %15 %10 
                          Private f32* %124 = OpAccessChain %111 %53 
                                                OpStore %124 %123 
                         Private bool* %125 = OpAccessChain %103 %12 
                                  bool %126 = OpLoad %125 
                                   f32 %127 = OpSelect %126 %10 %15 
                          Private f32* %128 = OpAccessChain %59 %12 
                                                OpStore %128 %127 
                         Private bool* %129 = OpAccessChain %103 %43 
                                  bool %130 = OpLoad %129 
                                   f32 %131 = OpSelect %130 %10 %15 
                          Private f32* %132 = OpAccessChain %59 %43 
                                                OpStore %132 %131 
                         Private bool* %133 = OpAccessChain %103 %53 
                                  bool %134 = OpLoad %133 
                                   f32 %135 = OpSelect %134 %10 %15 
                          Private f32* %136 = OpAccessChain %59 %53 
                                                OpStore %136 %135 
                                 f32_3 %138 = OpLoad %59 
                                 f32_4 %139 = OpLoad %111 
                                 f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                 f32_3 %141 = OpExtInst %1 37 %138 %140 
                                 f32_4 %142 = OpLoad %137 
                                 f32_4 %143 = OpVectorShuffle %142 %141 4 5 6 3 
                                                OpStore %137 %143 
                                 f32_3 %144 = OpLoad %59 
                                 f32_4 %145 = OpLoad %111 
                                 f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                 f32_3 %147 = OpExtInst %1 40 %144 %146 
                                                OpStore %59 %147 
                          Private f32* %148 = OpAccessChain %137 %53 
                                   f32 %149 = OpLoad %148 
                          Private f32* %150 = OpAccessChain %9 %43 
                                                OpStore %150 %149 
                          Private f32* %151 = OpAccessChain %59 %53 
                                   f32 %152 = OpLoad %151 
                          Private f32* %153 = OpAccessChain %9 %53 
                                                OpStore %153 %152 
                                 f32_4 %154 = OpLoad %9 
                                 f32_4 %155 = OpLoad %66 
                                 f32_4 %156 = OpVectorShuffle %155 %155 2 2 2 2 
                                 f32_4 %157 = OpFAdd %154 %156 
                                                OpStore %9 %157 
                                 f32_4 %158 = OpLoad %9 
                                 f32_4 %161 = OpFMul %158 %160 
                                 f32_4 %163 = OpFAdd %161 %162 
                                                OpStore %111 %163 
                                 f32_4 %164 = OpLoad %9 
                                 f32_4 %165 = OpLoad %111 
                                 f32_4 %166 = OpFMul %164 %165 
                                                OpStore %9 %166 
                                 f32_4 %167 = OpLoad %9 
                                 f32_4 %169 = OpFMul %167 %168 
                                                OpStore %111 %169 
                                 f32_4 %170 = OpLoad %111 
                                 f32_4 %171 = OpExtInst %1 8 %170 
                                                OpStore %111 %171 
                                 f32_4 %172 = OpLoad %111 
                                 f32_4 %173 = OpFNegate %172 
                                 f32_4 %175 = OpFMul %173 %174 
                                 f32_4 %176 = OpLoad %9 
                                 f32_4 %177 = OpFAdd %175 %176 
                                                OpStore %9 %177 
                                 f32_4 %178 = OpLoad %66 
                                 f32_4 %179 = OpVectorShuffle %178 %178 1 1 1 1 
                                 f32_4 %180 = OpLoad %9 
                                 f32_4 %181 = OpFAdd %179 %180 
                                                OpStore %9 %181 
                          Private f32* %182 = OpAccessChain %111 %12 
                                                OpStore %182 %10 
                          Private f32* %183 = OpAccessChain %111 %16 
                                                OpStore %183 %15 
                          Private f32* %184 = OpAccessChain %137 %43 
                                   f32 %185 = OpLoad %184 
                          Private f32* %186 = OpAccessChain %111 %43 
                                                OpStore %186 %185 
                          Private f32* %187 = OpAccessChain %59 %43 
                                   f32 %188 = OpLoad %187 
                          Private f32* %189 = OpAccessChain %111 %53 
                                                OpStore %189 %188 
                                 f32_4 %190 = OpLoad %9 
                                 f32_4 %191 = OpLoad %111 
                                 f32_4 %192 = OpFAdd %190 %191 
                                                OpStore %9 %192 
                                 f32_4 %193 = OpLoad %9 
                                 f32_4 %194 = OpFMul %193 %160 
                                 f32_4 %195 = OpFAdd %194 %162 
                                                OpStore %111 %195 
                                 f32_4 %196 = OpLoad %9 
                                 f32_4 %197 = OpLoad %111 
                                 f32_4 %198 = OpFMul %196 %197 
                                                OpStore %9 %198 
                                 f32_4 %199 = OpLoad %9 
                                 f32_4 %200 = OpFMul %199 %168 
                                                OpStore %111 %200 
                                 f32_4 %201 = OpLoad %111 
                                 f32_4 %202 = OpExtInst %1 8 %201 
                                                OpStore %111 %202 
                                 f32_4 %203 = OpLoad %111 
                                 f32_4 %204 = OpFNegate %203 
                                 f32_4 %205 = OpFMul %204 %174 
                                 f32_4 %206 = OpLoad %9 
                                 f32_4 %207 = OpFAdd %205 %206 
                                                OpStore %9 %207 
                                 f32_4 %208 = OpLoad %66 
                                 f32_4 %209 = OpVectorShuffle %208 %208 0 0 0 0 
                                 f32_4 %210 = OpLoad %9 
                                 f32_4 %211 = OpFAdd %209 %210 
                                                OpStore %9 %211 
                          Private f32* %212 = OpAccessChain %66 %12 
                                                OpStore %212 %10 
                          Private f32* %213 = OpAccessChain %66 %16 
                                                OpStore %213 %15 
                          Private f32* %214 = OpAccessChain %137 %12 
                                   f32 %215 = OpLoad %214 
                          Private f32* %216 = OpAccessChain %66 %43 
                                                OpStore %216 %215 
                                 f32_3 %217 = OpLoad %20 
                                 f32_4 %218 = OpLoad %137 
                                 f32_3 %219 = OpVectorShuffle %218 %218 0 1 2 
                                 f32_3 %220 = OpFNegate %219 
                                 f32_3 %221 = OpFAdd %217 %220 
                                 f32_4 %222 = OpLoad %111 
                                 f32_4 %223 = OpVectorShuffle %222 %221 4 5 6 3 
                                                OpStore %111 %223 
                                 f32_4 %224 = OpLoad %111 
                                 f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                                 f32_3 %226 = OpFAdd %225 %94 
                                 f32_4 %227 = OpLoad %111 
                                 f32_4 %228 = OpVectorShuffle %227 %226 4 5 6 3 
                                                OpStore %111 %228 
                          Private f32* %229 = OpAccessChain %59 %12 
                                   f32 %230 = OpLoad %229 
                          Private f32* %231 = OpAccessChain %66 %53 
                                                OpStore %231 %230 
                                 f32_3 %232 = OpLoad %20 
                                 f32_3 %233 = OpLoad %59 
                                 f32_3 %234 = OpFNegate %233 
                                 f32_3 %235 = OpFAdd %232 %234 
                                                OpStore %59 %235 
                                 f32_3 %236 = OpLoad %59 
                                 f32_3 %237 = OpFAdd %236 %57 
                                                OpStore %59 %237 
                                 f32_4 %238 = OpLoad %9 
                                 f32_4 %239 = OpLoad %66 
                                 f32_4 %240 = OpFAdd %238 %239 
                                                OpStore %9 %240 
                                 f32_4 %241 = OpLoad %9 
                                 f32_4 %242 = OpFMul %241 %160 
                                 f32_4 %243 = OpFAdd %242 %162 
                                                OpStore %66 %243 
                                 f32_4 %244 = OpLoad %9 
                                 f32_4 %245 = OpLoad %66 
                                 f32_4 %246 = OpFMul %244 %245 
                                                OpStore %9 %246 
                                 f32_4 %247 = OpLoad %9 
                                 f32_4 %248 = OpFMul %247 %168 
                                                OpStore %66 %248 
                                 f32_4 %249 = OpLoad %66 
                                 f32_4 %250 = OpExtInst %1 8 %249 
                                                OpStore %66 %250 
                                 f32_4 %251 = OpLoad %66 
                                 f32_4 %252 = OpFNegate %251 
                                 f32_4 %253 = OpFMul %252 %174 
                                 f32_4 %254 = OpLoad %9 
                                 f32_4 %255 = OpFAdd %253 %254 
                                                OpStore %9 %255 
                                 f32_4 %256 = OpLoad %9 
                                 f32_4 %259 = OpFMul %256 %258 
                                                OpStore %66 %259 
                                 f32_4 %260 = OpLoad %66 
                                 f32_4 %261 = OpExtInst %1 8 %260 
                                                OpStore %66 %261 
                                 f32_4 %262 = OpLoad %66 
                                 f32_4 %263 = OpFNegate %262 
                                 f32_4 %266 = OpFMul %263 %265 
                                 f32_4 %267 = OpLoad %9 
                                 f32_4 %268 = OpFAdd %266 %267 
                                                OpStore %9 %268 
                                 f32_4 %269 = OpLoad %9 
                                 f32_4 %272 = OpFMul %269 %271 
                                                OpStore %66 %272 
                                 f32_4 %273 = OpLoad %66 
                                 f32_4 %274 = OpExtInst %1 8 %273 
                                                OpStore %66 %274 
                                 f32_4 %275 = OpLoad %66 
                                 f32_4 %276 = OpFNegate %275 
                                 f32_4 %279 = OpFMul %276 %278 
                                 f32_4 %280 = OpLoad %9 
                                 f32_4 %281 = OpFAdd %279 %280 
                                                OpStore %9 %281 
                                 f32_4 %282 = OpLoad %66 
                                 f32_4 %283 = OpVectorShuffle %282 %282 2 0 3 1 
                                 f32_4 %286 = OpFMul %283 %285 
                                 f32_4 %289 = OpFAdd %286 %288 
                                                OpStore %66 %289 
                                 f32_4 %290 = OpLoad %9 
                                 f32_4 %291 = OpFMul %290 %285 
                                 f32_4 %292 = OpFAdd %291 %288 
                                                OpStore %9 %292 
                                 f32_4 %293 = OpLoad %9 
                                 f32_2 %294 = OpVectorShuffle %293 %293 0 1 
                                 f32_4 %295 = OpLoad %137 
                                 f32_4 %296 = OpVectorShuffle %295 %294 0 4 2 5 
                                                OpStore %137 %296 
                                 f32_4 %297 = OpLoad %66 
                                 f32_2 %298 = OpVectorShuffle %297 %297 1 3 
                                 f32_4 %299 = OpLoad %137 
                                 f32_4 %300 = OpVectorShuffle %299 %298 4 1 5 3 
                                                OpStore %137 %300 
                                 f32_4 %302 = OpLoad %9 
                                 f32_2 %303 = OpVectorShuffle %302 %302 0 1 
                                 f32_2 %304 = OpExtInst %1 8 %303 
                                 f32_4 %305 = OpLoad %301 
                                 f32_4 %306 = OpVectorShuffle %305 %304 0 4 2 5 
                                                OpStore %301 %306 
                                 f32_4 %307 = OpLoad %66 
                                 f32_2 %308 = OpVectorShuffle %307 %307 1 3 
                                 f32_2 %309 = OpExtInst %1 8 %308 
                                 f32_4 %310 = OpLoad %301 
                                 f32_4 %311 = OpVectorShuffle %310 %309 4 1 5 3 
                                                OpStore %301 %311 
                                 f32_4 %312 = OpLoad %301 
                                 f32_4 %315 = OpFMul %312 %314 
                                 f32_4 %316 = OpFAdd %315 %162 
                                                OpStore %301 %316 
                                 f32_4 %318 = OpLoad %66 
                                 f32_4 %319 = OpVectorShuffle %318 %318 1 3 0 2 
                                 f32_4 %320 = OpExtInst %1 4 %319 
                                 f32_4 %321 = OpFNegate %320 
                                 f32_4 %322 = OpFAdd %321 %162 
                                                OpStore %317 %322 
                                 f32_4 %323 = OpLoad %9 
                                 f32_4 %324 = OpVectorShuffle %323 %323 0 1 3 2 
                                 f32_4 %325 = OpExtInst %1 4 %324 
                                 f32_4 %326 = OpFNegate %325 
                                 f32_4 %327 = OpLoad %317 
                                 f32_4 %328 = OpVectorShuffle %327 %327 0 1 3 2 
                                 f32_4 %329 = OpFAdd %326 %328 
                                                OpStore %317 %329 
                                 f32_4 %333 = OpLoad %317 
                                 f32_4 %334 = OpVectorShuffle %333 %333 0 1 3 2 
                                bool_4 %335 = OpFOrdGreaterThanEqual %332 %334 
                                                OpStore %331 %335 
                         Private bool* %337 = OpAccessChain %331 %12 
                                  bool %338 = OpLoad %337 
                                   f32 %341 = OpSelect %338 %339 %340 
                          Private f32* %342 = OpAccessChain %336 %12 
                                                OpStore %342 %341 
                         Private bool* %343 = OpAccessChain %331 %43 
                                  bool %344 = OpLoad %343 
                                   f32 %345 = OpSelect %344 %339 %340 
                          Private f32* %346 = OpAccessChain %336 %43 
                                                OpStore %346 %345 
                         Private bool* %347 = OpAccessChain %331 %53 
                                  bool %348 = OpLoad %347 
                                   f32 %349 = OpSelect %348 %339 %340 
                          Private f32* %350 = OpAccessChain %336 %53 
                                                OpStore %350 %349 
                         Private bool* %351 = OpAccessChain %331 %16 
                                  bool %352 = OpLoad %351 
                                   f32 %353 = OpSelect %352 %339 %340 
                          Private f32* %354 = OpAccessChain %336 %16 
                                                OpStore %354 %353 
                                 f32_4 %355 = OpLoad %301 
                                 f32_4 %356 = OpVectorShuffle %355 %355 2 3 0 1 
                                 f32_4 %357 = OpLoad %336 
                                 f32_4 %358 = OpVectorShuffle %357 %357 1 1 0 0 
                                 f32_4 %359 = OpFMul %356 %358 
                                 f32_4 %360 = OpLoad %137 
                                 f32_4 %361 = OpVectorShuffle %360 %360 2 3 0 1 
                                 f32_4 %362 = OpFAdd %359 %361 
                                                OpStore %137 %362 
                                 f32_4 %363 = OpLoad %137 
                                 f32_2 %364 = OpVectorShuffle %363 %363 2 3 
                                 f32_4 %365 = OpLoad %301 
                                 f32_4 %366 = OpVectorShuffle %365 %364 4 5 2 3 
                                                OpStore %301 %366 
                          Private f32* %367 = OpAccessChain %317 %12 
                                   f32 %368 = OpLoad %367 
                          Private f32* %369 = OpAccessChain %301 %53 
                                                OpStore %369 %368 
                                 f32_4 %371 = OpLoad %301 
                                 f32_3 %372 = OpVectorShuffle %371 %371 0 1 2 
                                 f32_4 %373 = OpLoad %301 
                                 f32_3 %374 = OpVectorShuffle %373 %373 0 1 2 
                                   f32 %375 = OpDot %372 %374 
                          Private f32* %376 = OpAccessChain %370 %12 
                                                OpStore %376 %375 
                          Private f32* %377 = OpAccessChain %317 %43 
                                   f32 %378 = OpLoad %377 
                          Private f32* %379 = OpAccessChain %137 %53 
                                                OpStore %379 %378 
                                 f32_4 %380 = OpLoad %137 
                                 f32_3 %381 = OpVectorShuffle %380 %380 0 1 2 
                                 f32_4 %382 = OpLoad %137 
                                 f32_3 %383 = OpVectorShuffle %382 %382 0 1 2 
                                   f32 %384 = OpDot %381 %383 
                          Private f32* %385 = OpAccessChain %370 %43 
                                                OpStore %385 %384 
                                 f32_4 %387 = OpLoad %9 
                                 f32_2 %388 = OpVectorShuffle %387 %387 2 3 
                                 f32_2 %389 = OpExtInst %1 8 %388 
                                 f32_4 %390 = OpLoad %386 
                                 f32_4 %391 = OpVectorShuffle %390 %389 0 4 2 5 
                                                OpStore %386 %391 
                                 f32_4 %392 = OpLoad %9 
                                 f32_2 %393 = OpVectorShuffle %392 %392 2 3 
                                 f32_4 %394 = OpLoad %66 
                                 f32_4 %395 = OpVectorShuffle %394 %393 0 4 2 5 
                                                OpStore %66 %395 
                                 f32_4 %396 = OpLoad %66 
                                 f32_2 %397 = OpVectorShuffle %396 %396 0 2 
                                 f32_2 %398 = OpExtInst %1 8 %397 
                                 f32_4 %399 = OpLoad %386 
                                 f32_4 %400 = OpVectorShuffle %399 %398 4 1 5 3 
                                                OpStore %386 %400 
                                 f32_4 %401 = OpLoad %386 
                                 f32_4 %402 = OpFMul %401 %314 
                                 f32_4 %403 = OpFAdd %402 %162 
                                                OpStore %9 %403 
                                 f32_4 %404 = OpLoad %9 
                                 f32_4 %405 = OpLoad %336 
                                 f32_4 %406 = OpVectorShuffle %405 %405 2 2 3 3 
                                 f32_4 %407 = OpFMul %404 %406 
                                 f32_4 %408 = OpLoad %66 
                                 f32_4 %409 = OpFAdd %407 %408 
                                                OpStore %9 %409 
                                 f32_4 %410 = OpLoad %9 
                                 f32_2 %411 = OpVectorShuffle %410 %410 2 3 
                                 f32_4 %412 = OpLoad %317 
                                 f32_4 %413 = OpVectorShuffle %412 %411 4 5 2 3 
                                                OpStore %317 %413 
                          Private f32* %414 = OpAccessChain %317 %16 
                                   f32 %415 = OpLoad %414 
                          Private f32* %416 = OpAccessChain %9 %53 
                                                OpStore %416 %415 
                                 f32_4 %417 = OpLoad %9 
                                 f32_3 %418 = OpVectorShuffle %417 %417 0 1 2 
                                 f32_4 %419 = OpLoad %9 
                                 f32_3 %420 = OpVectorShuffle %419 %419 0 1 2 
                                   f32 %421 = OpDot %418 %420 
                          Private f32* %422 = OpAccessChain %370 %53 
                                                OpStore %422 %421 
                                 f32_4 %423 = OpLoad %317 
                                 f32_3 %424 = OpVectorShuffle %423 %423 0 1 2 
                                 f32_4 %425 = OpLoad %317 
                                 f32_3 %426 = OpVectorShuffle %425 %425 0 1 2 
                                   f32 %427 = OpDot %424 %426 
                          Private f32* %428 = OpAccessChain %370 %16 
                                                OpStore %428 %427 
                                 f32_4 %429 = OpLoad %370 
                                 f32_4 %430 = OpFNegate %429 
                                 f32_4 %433 = OpFMul %430 %432 
                                 f32_4 %436 = OpFAdd %433 %435 
                                                OpStore %66 %436 
                                 f32_4 %437 = OpLoad %66 
                                 f32_3 %438 = OpVectorShuffle %437 %437 1 1 1 
                                 f32_4 %439 = OpLoad %137 
                                 f32_3 %440 = OpVectorShuffle %439 %439 0 1 2 
                                 f32_3 %441 = OpFMul %438 %440 
                                 f32_4 %442 = OpLoad %137 
                                 f32_4 %443 = OpVectorShuffle %442 %441 4 5 6 3 
                                                OpStore %137 %443 
                                 f32_4 %444 = OpLoad %111 
                                 f32_3 %445 = OpVectorShuffle %444 %444 0 1 2 
                                 f32_4 %446 = OpLoad %137 
                                 f32_3 %447 = OpVectorShuffle %446 %446 0 1 2 
                                   f32 %448 = OpDot %445 %447 
                          Private f32* %449 = OpAccessChain %137 %43 
                                                OpStore %449 %448 
                                 f32_4 %450 = OpLoad %111 
                                 f32_3 %451 = OpVectorShuffle %450 %450 0 1 2 
                                 f32_4 %452 = OpLoad %111 
                                 f32_3 %453 = OpVectorShuffle %452 %452 0 1 2 
                                   f32 %454 = OpDot %451 %453 
                          Private f32* %455 = OpAccessChain %111 %43 
                                                OpStore %455 %454 
                                 f32_4 %456 = OpLoad %9 
                                 f32_3 %457 = OpVectorShuffle %456 %456 0 1 2 
                                 f32_4 %458 = OpLoad %66 
                                 f32_3 %459 = OpVectorShuffle %458 %458 2 2 2 
                                 f32_3 %460 = OpFMul %457 %459 
                                 f32_4 %461 = OpLoad %9 
                                 f32_4 %462 = OpVectorShuffle %461 %460 4 5 6 3 
                                                OpStore %9 %462 
                                 f32_3 %463 = OpLoad %59 
                                 f32_4 %464 = OpLoad %9 
                                 f32_3 %465 = OpVectorShuffle %464 %464 0 1 2 
                                   f32 %466 = OpDot %463 %465 
                          Private f32* %467 = OpAccessChain %137 %53 
                                                OpStore %467 %466 
                                 f32_3 %468 = OpLoad %59 
                                 f32_3 %469 = OpLoad %59 
                                   f32 %470 = OpDot %468 %469 
                          Private f32* %471 = OpAccessChain %111 %53 
                                                OpStore %471 %470 
                                 f32_4 %472 = OpLoad %66 
                                 f32_3 %473 = OpVectorShuffle %472 %472 0 0 0 
                                 f32_4 %474 = OpLoad %301 
                                 f32_3 %475 = OpVectorShuffle %474 %474 0 1 2 
                                 f32_3 %476 = OpFMul %473 %475 
                                 f32_4 %477 = OpLoad %9 
                                 f32_4 %478 = OpVectorShuffle %477 %476 4 5 6 3 
                                                OpStore %9 %478 
                                 f32_4 %479 = OpLoad %66 
                                 f32_3 %480 = OpVectorShuffle %479 %479 3 3 3 
                                 f32_4 %481 = OpLoad %317 
                                 f32_3 %482 = OpVectorShuffle %481 %481 0 1 2 
                                 f32_3 %483 = OpFMul %480 %482 
                                                OpStore %59 %483 
                                 f32_3 %484 = OpLoad %20 
                                 f32_4 %485 = OpLoad %9 
                                 f32_3 %486 = OpVectorShuffle %485 %485 0 1 2 
                                   f32 %487 = OpDot %484 %486 
                          Private f32* %488 = OpAccessChain %137 %12 
                                                OpStore %488 %487 
                                 f32_3 %489 = OpLoad %20 
                                 f32_3 %492 = OpFAdd %489 %491 
                                 f32_4 %493 = OpLoad %9 
                                 f32_4 %494 = OpVectorShuffle %493 %492 4 5 6 3 
                                                OpStore %9 %494 
                                 f32_3 %495 = OpLoad %20 
                                 f32_3 %496 = OpLoad %20 
                                   f32 %497 = OpDot %495 %496 
                          Private f32* %498 = OpAccessChain %111 %12 
                                                OpStore %498 %497 
                                 f32_4 %499 = OpLoad %9 
                                 f32_3 %500 = OpVectorShuffle %499 %499 0 1 2 
                                 f32_3 %501 = OpLoad %59 
                                   f32 %502 = OpDot %500 %501 
                          Private f32* %503 = OpAccessChain %137 %16 
                                                OpStore %503 %502 
                                 f32_4 %504 = OpLoad %9 
                                 f32_3 %505 = OpVectorShuffle %504 %504 0 1 2 
                                 f32_4 %506 = OpLoad %9 
                                 f32_3 %507 = OpVectorShuffle %506 %506 0 1 2 
                                   f32 %508 = OpDot %505 %507 
                          Private f32* %509 = OpAccessChain %111 %16 
                                                OpStore %509 %508 
                                 f32_4 %510 = OpLoad %111 
                                 f32_4 %511 = OpFNegate %510 
                                 f32_4 %514 = OpFAdd %511 %513 
                                                OpStore %9 %514 
                                 f32_4 %515 = OpLoad %9 
                                 f32_4 %516 = OpExtInst %1 40 %515 %332 
                                                OpStore %9 %516 
                                 f32_4 %517 = OpLoad %9 
                                 f32_4 %518 = OpLoad %9 
                                 f32_4 %519 = OpFMul %517 %518 
                                                OpStore %9 %519 
                                 f32_4 %520 = OpLoad %9 
                                 f32_4 %521 = OpLoad %9 
                                 f32_4 %522 = OpFMul %520 %521 
                                                OpStore %9 %522 
                                 f32_4 %523 = OpLoad %9 
                                 f32_4 %524 = OpLoad %137 
                                   f32 %525 = OpDot %523 %524 
                          Private f32* %526 = OpAccessChain %9 %12 
                                                OpStore %526 %525 
                          Private f32* %527 = OpAccessChain %9 %12 
                                   f32 %528 = OpLoad %527 
                                   f32 %530 = OpFMul %528 %529 
                                   f32 %532 = OpFAdd %530 %531 
                          Private f32* %533 = OpAccessChain %9 %12 
                                                OpStore %533 %532 
                                 f32_4 %534 = OpLoad %9 
                                 f32_2 %535 = OpVectorShuffle %534 %534 0 0 
                          Uniform f32* %537 = OpAccessChain %23 %536 
                                   f32 %538 = OpLoad %537 
                                 f32_2 %539 = OpCompositeConstruct %538 %538 
                                 f32_2 %540 = OpFMul %535 %539 
                                 f32_2 %541 = OpLoad vs_TEXCOORD1 
                                 f32_2 %542 = OpFAdd %540 %541 
                                 f32_4 %543 = OpLoad %9 
                                 f32_4 %544 = OpVectorShuffle %543 %542 4 5 2 3 
                                                OpStore %9 %544 
                   read_only Texture2D %550 = OpLoad %549 
                               sampler %554 = OpLoad %553 
            read_only Texture2DSampled %556 = OpSampledImage %550 %554 
                                 f32_4 %557 = OpLoad %9 
                                 f32_2 %558 = OpVectorShuffle %557 %557 0 1 
                                 f32_4 %559 = OpImageSampleImplicitLod %556 %558 
                                                OpStore %546 %559 
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