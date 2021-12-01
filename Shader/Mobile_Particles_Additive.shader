//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Mobile/Particles/Additive" {
Properties {
_MainTex ("Particle Texture", 2D) = "white" { }
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha One, SrcAlpha One
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 10119
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
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec4 in_COLOR0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
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
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 113
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %21 %24 %47 %98 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate %9 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate vs_TEXCOORD0 Location 21 
                                                     OpDecorate %24 Location 24 
                                                     OpDecorate %29 ArrayStride 29 
                                                     OpDecorate %30 ArrayStride 30 
                                                     OpMemberDecorate %31 0 Offset 31 
                                                     OpMemberDecorate %31 1 Offset 31 
                                                     OpMemberDecorate %31 2 Offset 31 
                                                     OpDecorate %31 Block 
                                                     OpDecorate %33 DescriptorSet 33 
                                                     OpDecorate %33 Binding 33 
                                                     OpDecorate %47 Location 47 
                                                     OpMemberDecorate %96 0 BuiltIn 96 
                                                     OpMemberDecorate %96 1 BuiltIn 96 
                                                     OpMemberDecorate %96 2 BuiltIn 96 
                                                     OpDecorate %96 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Output %7 
                                Output f32_4* %9 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                         f32 %14 = OpConstant 3.674022E-40 
                                         f32 %15 = OpConstant 3.674022E-40 
                                             %19 = OpTypeVector %6 2 
                                             %20 = OpTypePointer Output %19 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %22 = OpTypeVector %6 3 
                                             %23 = OpTypePointer Input %22 
                                Input f32_3* %24 = OpVariable Input 
                                             %27 = OpTypeInt 32 0 
                                         u32 %28 = OpConstant 4 
                                             %29 = OpTypeArray %7 %28 
                                             %30 = OpTypeArray %7 %28 
                                             %31 = OpTypeStruct %29 %30 %7 
                                             %32 = OpTypePointer Uniform %31 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %33 = OpVariable Uniform 
                                             %34 = OpTypeInt 32 1 
                                         i32 %35 = OpConstant 2 
                                             %36 = OpTypePointer Uniform %7 
                                             %45 = OpTypePointer Private %7 
                              Private f32_4* %46 = OpVariable Private 
                                Input f32_3* %47 = OpVariable Input 
                                         i32 %50 = OpConstant 0 
                                         i32 %51 = OpConstant 1 
                                         i32 %70 = OpConstant 3 
                              Private f32_4* %74 = OpVariable Private 
                                         u32 %94 = OpConstant 1 
                                             %95 = OpTypeArray %6 %94 
                                             %96 = OpTypeStruct %7 %6 %95 
                                             %97 = OpTypePointer Output %96 
        Output struct {f32_4; f32; f32[1];}* %98 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                                     OpStore %9 %12 
                                       f32_4 %13 = OpLoad %9 
                                       f32_4 %16 = OpCompositeConstruct %14 %14 %14 %14 
                                       f32_4 %17 = OpCompositeConstruct %15 %15 %15 %15 
                                       f32_4 %18 = OpExtInst %1 43 %13 %16 %17 
                                                     OpStore %9 %18 
                                       f32_3 %25 = OpLoad %24 
                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                              Uniform f32_4* %37 = OpAccessChain %33 %35 
                                       f32_4 %38 = OpLoad %37 
                                       f32_2 %39 = OpVectorShuffle %38 %38 0 1 
                                       f32_2 %40 = OpFMul %26 %39 
                              Uniform f32_4* %41 = OpAccessChain %33 %35 
                                       f32_4 %42 = OpLoad %41 
                                       f32_2 %43 = OpVectorShuffle %42 %42 2 3 
                                       f32_2 %44 = OpFAdd %40 %43 
                                                     OpStore vs_TEXCOORD0 %44 
                                       f32_3 %48 = OpLoad %47 
                                       f32_4 %49 = OpVectorShuffle %48 %48 1 1 1 1 
                              Uniform f32_4* %52 = OpAccessChain %33 %50 %51 
                                       f32_4 %53 = OpLoad %52 
                                       f32_4 %54 = OpFMul %49 %53 
                                                     OpStore %46 %54 
                              Uniform f32_4* %55 = OpAccessChain %33 %50 %50 
                                       f32_4 %56 = OpLoad %55 
                                       f32_3 %57 = OpLoad %47 
                                       f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                       f32_4 %59 = OpFMul %56 %58 
                                       f32_4 %60 = OpLoad %46 
                                       f32_4 %61 = OpFAdd %59 %60 
                                                     OpStore %46 %61 
                              Uniform f32_4* %62 = OpAccessChain %33 %50 %35 
                                       f32_4 %63 = OpLoad %62 
                                       f32_3 %64 = OpLoad %47 
                                       f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                       f32_4 %66 = OpFMul %63 %65 
                                       f32_4 %67 = OpLoad %46 
                                       f32_4 %68 = OpFAdd %66 %67 
                                                     OpStore %46 %68 
                                       f32_4 %69 = OpLoad %46 
                              Uniform f32_4* %71 = OpAccessChain %33 %50 %70 
                                       f32_4 %72 = OpLoad %71 
                                       f32_4 %73 = OpFAdd %69 %72 
                                                     OpStore %46 %73 
                                       f32_4 %75 = OpLoad %46 
                                       f32_4 %76 = OpVectorShuffle %75 %75 1 1 1 1 
                              Uniform f32_4* %77 = OpAccessChain %33 %51 %51 
                                       f32_4 %78 = OpLoad %77 
                                       f32_4 %79 = OpFMul %76 %78 
                                                     OpStore %74 %79 
                              Uniform f32_4* %80 = OpAccessChain %33 %51 %50 
                                       f32_4 %81 = OpLoad %80 
                                       f32_4 %82 = OpLoad %46 
                                       f32_4 %83 = OpVectorShuffle %82 %82 0 0 0 0 
                                       f32_4 %84 = OpFMul %81 %83 
                                       f32_4 %85 = OpLoad %74 
                                       f32_4 %86 = OpFAdd %84 %85 
                                                     OpStore %74 %86 
                              Uniform f32_4* %87 = OpAccessChain %33 %51 %35 
                                       f32_4 %88 = OpLoad %87 
                                       f32_4 %89 = OpLoad %46 
                                       f32_4 %90 = OpVectorShuffle %89 %89 2 2 2 2 
                                       f32_4 %91 = OpFMul %88 %90 
                                       f32_4 %92 = OpLoad %74 
                                       f32_4 %93 = OpFAdd %91 %92 
                                                     OpStore %74 %93 
                              Uniform f32_4* %99 = OpAccessChain %33 %51 %70 
                                      f32_4 %100 = OpLoad %99 
                                      f32_4 %101 = OpLoad %46 
                                      f32_4 %102 = OpVectorShuffle %101 %101 3 3 3 3 
                                      f32_4 %103 = OpFMul %100 %102 
                                      f32_4 %104 = OpLoad %74 
                                      f32_4 %105 = OpFAdd %103 %104 
                              Output f32_4* %106 = OpAccessChain %98 %50 
                                                     OpStore %106 %105 
                                Output f32* %108 = OpAccessChain %98 %50 %94 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %98 %50 %94 
                                                     OpStore %111 %110 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 33
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %26 %29 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %26 Location 26 
                                             OpDecorate %29 Location 29 
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
                                     %25 = OpTypePointer Output %7 
                       Output f32_4* %26 = OpVariable Output 
                                     %28 = OpTypePointer Input %7 
                        Input f32_4* %29 = OpVariable Input 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %27 = OpLoad %9 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpFMul %27 %30 
                                             OpStore %26 %31 
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
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec4 in_COLOR0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
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
    vs_TEXCOORD1 = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD1 = clamp(vs_TEXCOORD1, 0.0, 1.0);
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
in  vec2 vs_TEXCOORD0;
in  float vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat3;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
    u_xlat3 = u_xlat0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat3;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat0.xyz + unity_FogColor.xyz;
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
; Bound: 355
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %9 %11 %84 %266 %282 %283 %341 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %9 Location 9 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %23 ArrayStride 23 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpDecorate %25 ArrayStride 25 
                                                      OpMemberDecorate %26 0 Offset 26 
                                                      OpMemberDecorate %26 1 Offset 26 
                                                      OpMemberDecorate %26 2 Offset 26 
                                                      OpMemberDecorate %26 3 Offset 26 
                                                      OpMemberDecorate %26 4 Offset 26 
                                                      OpDecorate %26 Block 
                                                      OpDecorate %28 DescriptorSet 28 
                                                      OpDecorate %28 Binding 28 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate vs_TEXCOORD1 Location 266 
                                                      OpDecorate vs_TEXCOORD0 Location 282 
                                                      OpDecorate %283 Location 283 
                                                      OpMemberDecorate %339 0 BuiltIn 339 
                                                      OpMemberDecorate %339 1 BuiltIn 339 
                                                      OpMemberDecorate %339 2 BuiltIn 339 
                                                      OpDecorate %339 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Output %7 
                                 Output f32_4* %9 = OpVariable Output 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                          f32 %14 = OpConstant 3.674022E-40 
                                          f32 %15 = OpConstant 3.674022E-40 
                                              %19 = OpTypePointer Private %7 
                               Private f32_4* %20 = OpVariable Private 
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 4 
                                              %23 = OpTypeArray %7 %22 
                                              %24 = OpTypeArray %7 %22 
                                              %25 = OpTypeArray %7 %22 
                                              %26 = OpTypeStruct %23 %24 %25 %7 %7 
                                              %27 = OpTypePointer Uniform %26 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4;}* %28 = OpVariable Uniform 
                                              %29 = OpTypeInt 32 1 
                                          i32 %30 = OpConstant 0 
                                          i32 %31 = OpConstant 1 
                                              %32 = OpTypeVector %6 3 
                                              %33 = OpTypePointer Uniform %7 
                                          i32 %55 = OpConstant 2 
                                          i32 %68 = OpConstant 3 
                                              %83 = OpTypePointer Input %32 
                                 Input f32_3* %84 = OpVariable Input 
                               Private f32_4* %90 = OpVariable Private 
                                         u32 %258 = OpConstant 0 
                                             %259 = OpTypePointer Private %6 
                                             %265 = OpTypePointer Output %6 
                         Output f32* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %269 = OpConstant 2 
                                             %270 = OpTypePointer Uniform %6 
                                         u32 %274 = OpConstant 3 
                                             %280 = OpTypeVector %6 2 
                                             %281 = OpTypePointer Output %280 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_3* %283 = OpVariable Input 
                                         i32 %286 = OpConstant 4 
                                         u32 %337 = OpConstant 1 
                                             %338 = OpTypeArray %6 %337 
                                             %339 = OpTypeStruct %7 %6 %338 
                                             %340 = OpTypePointer Output %339 
        Output struct {f32_4; f32; f32[1];}* %341 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                                      OpStore %9 %12 
                                        f32_4 %13 = OpLoad %9 
                                        f32_4 %16 = OpCompositeConstruct %14 %14 %14 %14 
                                        f32_4 %17 = OpCompositeConstruct %15 %15 %15 %15 
                                        f32_4 %18 = OpExtInst %1 43 %13 %16 %17 
                                                      OpStore %9 %18 
                               Uniform f32_4* %34 = OpAccessChain %28 %30 %31 
                                        f32_4 %35 = OpLoad %34 
                                        f32_3 %36 = OpVectorShuffle %35 %35 1 1 1 
                               Uniform f32_4* %37 = OpAccessChain %28 %31 %31 
                                        f32_4 %38 = OpLoad %37 
                                        f32_3 %39 = OpVectorShuffle %38 %38 0 1 2 
                                        f32_3 %40 = OpFMul %36 %39 
                                        f32_4 %41 = OpLoad %20 
                                        f32_4 %42 = OpVectorShuffle %41 %40 4 5 6 3 
                                                      OpStore %20 %42 
                               Uniform f32_4* %43 = OpAccessChain %28 %31 %30 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                               Uniform f32_4* %46 = OpAccessChain %28 %30 %31 
                                        f32_4 %47 = OpLoad %46 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 0 0 
                                        f32_3 %49 = OpFMul %45 %48 
                                        f32_4 %50 = OpLoad %20 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_3 %52 = OpFAdd %49 %51 
                                        f32_4 %53 = OpLoad %20 
                                        f32_4 %54 = OpVectorShuffle %53 %52 4 5 6 3 
                                                      OpStore %20 %54 
                               Uniform f32_4* %56 = OpAccessChain %28 %31 %55 
                                        f32_4 %57 = OpLoad %56 
                                        f32_3 %58 = OpVectorShuffle %57 %57 0 1 2 
                               Uniform f32_4* %59 = OpAccessChain %28 %30 %31 
                                        f32_4 %60 = OpLoad %59 
                                        f32_3 %61 = OpVectorShuffle %60 %60 2 2 2 
                                        f32_3 %62 = OpFMul %58 %61 
                                        f32_4 %63 = OpLoad %20 
                                        f32_3 %64 = OpVectorShuffle %63 %63 0 1 2 
                                        f32_3 %65 = OpFAdd %62 %64 
                                        f32_4 %66 = OpLoad %20 
                                        f32_4 %67 = OpVectorShuffle %66 %65 4 5 6 3 
                                                      OpStore %20 %67 
                               Uniform f32_4* %69 = OpAccessChain %28 %31 %68 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                               Uniform f32_4* %72 = OpAccessChain %28 %30 %31 
                                        f32_4 %73 = OpLoad %72 
                                        f32_3 %74 = OpVectorShuffle %73 %73 3 3 3 
                                        f32_3 %75 = OpFMul %71 %74 
                                        f32_4 %76 = OpLoad %20 
                                        f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                        f32_3 %78 = OpFAdd %75 %77 
                                        f32_4 %79 = OpLoad %20 
                                        f32_4 %80 = OpVectorShuffle %79 %78 4 5 6 3 
                                                      OpStore %20 %80 
                                        f32_4 %81 = OpLoad %20 
                                        f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                        f32_3 %85 = OpLoad %84 
                                        f32_3 %86 = OpVectorShuffle %85 %85 1 1 1 
                                        f32_3 %87 = OpFMul %82 %86 
                                        f32_4 %88 = OpLoad %20 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %20 %89 
                               Uniform f32_4* %91 = OpAccessChain %28 %30 %30 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 1 1 1 
                               Uniform f32_4* %94 = OpAccessChain %28 %31 %31 
                                        f32_4 %95 = OpLoad %94 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFMul %93 %96 
                                        f32_4 %98 = OpLoad %90 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 6 3 
                                                      OpStore %90 %99 
                              Uniform f32_4* %100 = OpAccessChain %28 %31 %30 
                                       f32_4 %101 = OpLoad %100 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
                              Uniform f32_4* %103 = OpAccessChain %28 %30 %30 
                                       f32_4 %104 = OpLoad %103 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 0 0 
                                       f32_3 %106 = OpFMul %102 %105 
                                       f32_4 %107 = OpLoad %90 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpFAdd %106 %108 
                                       f32_4 %110 = OpLoad %90 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 6 3 
                                                      OpStore %90 %111 
                              Uniform f32_4* %112 = OpAccessChain %28 %31 %55 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                              Uniform f32_4* %115 = OpAccessChain %28 %30 %30 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 2 2 2 
                                       f32_3 %118 = OpFMul %114 %117 
                                       f32_4 %119 = OpLoad %90 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                       f32_3 %121 = OpFAdd %118 %120 
                                       f32_4 %122 = OpLoad %90 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %90 %123 
                              Uniform f32_4* %124 = OpAccessChain %28 %31 %68 
                                       f32_4 %125 = OpLoad %124 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                              Uniform f32_4* %127 = OpAccessChain %28 %30 %30 
                                       f32_4 %128 = OpLoad %127 
                                       f32_3 %129 = OpVectorShuffle %128 %128 3 3 3 
                                       f32_3 %130 = OpFMul %126 %129 
                                       f32_4 %131 = OpLoad %90 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpFAdd %130 %132 
                                       f32_4 %134 = OpLoad %90 
                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
                                                      OpStore %90 %135 
                                       f32_4 %136 = OpLoad %90 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_3 %138 = OpLoad %84 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 0 0 
                                       f32_3 %140 = OpFMul %137 %139 
                                       f32_4 %141 = OpLoad %20 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFAdd %140 %142 
                                       f32_4 %144 = OpLoad %20 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 6 3 
                                                      OpStore %20 %145 
                              Uniform f32_4* %146 = OpAccessChain %28 %30 %55 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 1 1 1 
                              Uniform f32_4* %149 = OpAccessChain %28 %31 %31 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpFMul %148 %151 
                                       f32_4 %153 = OpLoad %90 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 6 3 
                                                      OpStore %90 %154 
                              Uniform f32_4* %155 = OpAccessChain %28 %31 %30 
                                       f32_4 %156 = OpLoad %155 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                              Uniform f32_4* %158 = OpAccessChain %28 %30 %55 
                                       f32_4 %159 = OpLoad %158 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 0 0 
                                       f32_3 %161 = OpFMul %157 %160 
                                       f32_4 %162 = OpLoad %90 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                       f32_3 %164 = OpFAdd %161 %163 
                                       f32_4 %165 = OpLoad %90 
                                       f32_4 %166 = OpVectorShuffle %165 %164 4 5 6 3 
                                                      OpStore %90 %166 
                              Uniform f32_4* %167 = OpAccessChain %28 %31 %55 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                              Uniform f32_4* %170 = OpAccessChain %28 %30 %55 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 2 2 2 
                                       f32_3 %173 = OpFMul %169 %172 
                                       f32_4 %174 = OpLoad %90 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                       f32_3 %176 = OpFAdd %173 %175 
                                       f32_4 %177 = OpLoad %90 
                                       f32_4 %178 = OpVectorShuffle %177 %176 4 5 6 3 
                                                      OpStore %90 %178 
                              Uniform f32_4* %179 = OpAccessChain %28 %31 %68 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                              Uniform f32_4* %182 = OpAccessChain %28 %30 %55 
                                       f32_4 %183 = OpLoad %182 
                                       f32_3 %184 = OpVectorShuffle %183 %183 3 3 3 
                                       f32_3 %185 = OpFMul %181 %184 
                                       f32_4 %186 = OpLoad %90 
                                       f32_3 %187 = OpVectorShuffle %186 %186 0 1 2 
                                       f32_3 %188 = OpFAdd %185 %187 
                                       f32_4 %189 = OpLoad %90 
                                       f32_4 %190 = OpVectorShuffle %189 %188 4 5 6 3 
                                                      OpStore %90 %190 
                                       f32_4 %191 = OpLoad %90 
                                       f32_3 %192 = OpVectorShuffle %191 %191 0 1 2 
                                       f32_3 %193 = OpLoad %84 
                                       f32_3 %194 = OpVectorShuffle %193 %193 2 2 2 
                                       f32_3 %195 = OpFMul %192 %194 
                                       f32_4 %196 = OpLoad %20 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
                                       f32_3 %198 = OpFAdd %195 %197 
                                       f32_4 %199 = OpLoad %20 
                                       f32_4 %200 = OpVectorShuffle %199 %198 4 5 6 3 
                                                      OpStore %20 %200 
                              Uniform f32_4* %201 = OpAccessChain %28 %30 %68 
                                       f32_4 %202 = OpLoad %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 1 1 1 
                              Uniform f32_4* %204 = OpAccessChain %28 %31 %31 
                                       f32_4 %205 = OpLoad %204 
                                       f32_3 %206 = OpVectorShuffle %205 %205 0 1 2 
                                       f32_3 %207 = OpFMul %203 %206 
                                       f32_4 %208 = OpLoad %90 
                                       f32_4 %209 = OpVectorShuffle %208 %207 4 5 6 3 
                                                      OpStore %90 %209 
                              Uniform f32_4* %210 = OpAccessChain %28 %31 %30 
                                       f32_4 %211 = OpLoad %210 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 1 2 
                              Uniform f32_4* %213 = OpAccessChain %28 %30 %68 
                                       f32_4 %214 = OpLoad %213 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 0 0 
                                       f32_3 %216 = OpFMul %212 %215 
                                       f32_4 %217 = OpLoad %90 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                                       f32_3 %219 = OpFAdd %216 %218 
                                       f32_4 %220 = OpLoad %90 
                                       f32_4 %221 = OpVectorShuffle %220 %219 4 5 6 3 
                                                      OpStore %90 %221 
                              Uniform f32_4* %222 = OpAccessChain %28 %31 %55 
                                       f32_4 %223 = OpLoad %222 
                                       f32_3 %224 = OpVectorShuffle %223 %223 0 1 2 
                              Uniform f32_4* %225 = OpAccessChain %28 %30 %68 
                                       f32_4 %226 = OpLoad %225 
                                       f32_3 %227 = OpVectorShuffle %226 %226 2 2 2 
                                       f32_3 %228 = OpFMul %224 %227 
                                       f32_4 %229 = OpLoad %90 
                                       f32_3 %230 = OpVectorShuffle %229 %229 0 1 2 
                                       f32_3 %231 = OpFAdd %228 %230 
                                       f32_4 %232 = OpLoad %90 
                                       f32_4 %233 = OpVectorShuffle %232 %231 4 5 6 3 
                                                      OpStore %90 %233 
                              Uniform f32_4* %234 = OpAccessChain %28 %31 %68 
                                       f32_4 %235 = OpLoad %234 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 2 
                              Uniform f32_4* %237 = OpAccessChain %28 %30 %68 
                                       f32_4 %238 = OpLoad %237 
                                       f32_3 %239 = OpVectorShuffle %238 %238 3 3 3 
                                       f32_3 %240 = OpFMul %236 %239 
                                       f32_4 %241 = OpLoad %90 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                                       f32_3 %243 = OpFAdd %240 %242 
                                       f32_4 %244 = OpLoad %90 
                                       f32_4 %245 = OpVectorShuffle %244 %243 4 5 6 3 
                                                      OpStore %90 %245 
                                       f32_4 %246 = OpLoad %20 
                                       f32_3 %247 = OpVectorShuffle %246 %246 0 1 2 
                                       f32_4 %248 = OpLoad %90 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                                       f32_3 %250 = OpFAdd %247 %249 
                                       f32_4 %251 = OpLoad %20 
                                       f32_4 %252 = OpVectorShuffle %251 %250 4 5 6 3 
                                                      OpStore %20 %252 
                                       f32_4 %253 = OpLoad %20 
                                       f32_3 %254 = OpVectorShuffle %253 %253 0 1 2 
                                       f32_4 %255 = OpLoad %20 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                                         f32 %257 = OpDot %254 %256 
                                Private f32* %260 = OpAccessChain %20 %258 
                                                      OpStore %260 %257 
                                Private f32* %261 = OpAccessChain %20 %258 
                                         f32 %262 = OpLoad %261 
                                         f32 %263 = OpExtInst %1 31 %262 
                                Private f32* %264 = OpAccessChain %20 %258 
                                                      OpStore %264 %263 
                                Private f32* %267 = OpAccessChain %20 %258 
                                         f32 %268 = OpLoad %267 
                                Uniform f32* %271 = OpAccessChain %28 %68 %269 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpFMul %268 %272 
                                Uniform f32* %275 = OpAccessChain %28 %68 %274 
                                         f32 %276 = OpLoad %275 
                                         f32 %277 = OpFAdd %273 %276 
                                                      OpStore vs_TEXCOORD1 %277 
                                         f32 %278 = OpLoad vs_TEXCOORD1 
                                         f32 %279 = OpExtInst %1 43 %278 %14 %15 
                                                      OpStore vs_TEXCOORD1 %279 
                                       f32_3 %284 = OpLoad %283 
                                       f32_2 %285 = OpVectorShuffle %284 %284 0 1 
                              Uniform f32_4* %287 = OpAccessChain %28 %286 
                                       f32_4 %288 = OpLoad %287 
                                       f32_2 %289 = OpVectorShuffle %288 %288 0 1 
                                       f32_2 %290 = OpFMul %285 %289 
                              Uniform f32_4* %291 = OpAccessChain %28 %286 
                                       f32_4 %292 = OpLoad %291 
                                       f32_2 %293 = OpVectorShuffle %292 %292 2 3 
                                       f32_2 %294 = OpFAdd %290 %293 
                                                      OpStore vs_TEXCOORD0 %294 
                                       f32_3 %295 = OpLoad %84 
                                       f32_4 %296 = OpVectorShuffle %295 %295 1 1 1 1 
                              Uniform f32_4* %297 = OpAccessChain %28 %30 %31 
                                       f32_4 %298 = OpLoad %297 
                                       f32_4 %299 = OpFMul %296 %298 
                                                      OpStore %20 %299 
                              Uniform f32_4* %300 = OpAccessChain %28 %30 %30 
                                       f32_4 %301 = OpLoad %300 
                                       f32_3 %302 = OpLoad %84 
                                       f32_4 %303 = OpVectorShuffle %302 %302 0 0 0 0 
                                       f32_4 %304 = OpFMul %301 %303 
                                       f32_4 %305 = OpLoad %20 
                                       f32_4 %306 = OpFAdd %304 %305 
                                                      OpStore %20 %306 
                              Uniform f32_4* %307 = OpAccessChain %28 %30 %55 
                                       f32_4 %308 = OpLoad %307 
                                       f32_3 %309 = OpLoad %84 
                                       f32_4 %310 = OpVectorShuffle %309 %309 2 2 2 2 
                                       f32_4 %311 = OpFMul %308 %310 
                                       f32_4 %312 = OpLoad %20 
                                       f32_4 %313 = OpFAdd %311 %312 
                                                      OpStore %20 %313 
                                       f32_4 %314 = OpLoad %20 
                              Uniform f32_4* %315 = OpAccessChain %28 %30 %68 
                                       f32_4 %316 = OpLoad %315 
                                       f32_4 %317 = OpFAdd %314 %316 
                                                      OpStore %20 %317 
                                       f32_4 %318 = OpLoad %20 
                                       f32_4 %319 = OpVectorShuffle %318 %318 1 1 1 1 
                              Uniform f32_4* %320 = OpAccessChain %28 %55 %31 
                                       f32_4 %321 = OpLoad %320 
                                       f32_4 %322 = OpFMul %319 %321 
                                                      OpStore %90 %322 
                              Uniform f32_4* %323 = OpAccessChain %28 %55 %30 
                                       f32_4 %324 = OpLoad %323 
                                       f32_4 %325 = OpLoad %20 
                                       f32_4 %326 = OpVectorShuffle %325 %325 0 0 0 0 
                                       f32_4 %327 = OpFMul %324 %326 
                                       f32_4 %328 = OpLoad %90 
                                       f32_4 %329 = OpFAdd %327 %328 
                                                      OpStore %90 %329 
                              Uniform f32_4* %330 = OpAccessChain %28 %55 %55 
                                       f32_4 %331 = OpLoad %330 
                                       f32_4 %332 = OpLoad %20 
                                       f32_4 %333 = OpVectorShuffle %332 %332 2 2 2 2 
                                       f32_4 %334 = OpFMul %331 %333 
                                       f32_4 %335 = OpLoad %90 
                                       f32_4 %336 = OpFAdd %334 %335 
                                                      OpStore %90 %336 
                              Uniform f32_4* %342 = OpAccessChain %28 %55 %68 
                                       f32_4 %343 = OpLoad %342 
                                       f32_4 %344 = OpLoad %20 
                                       f32_4 %345 = OpVectorShuffle %344 %344 3 3 3 3 
                                       f32_4 %346 = OpFMul %343 %345 
                                       f32_4 %347 = OpLoad %90 
                                       f32_4 %348 = OpFAdd %346 %347 
                               Output f32_4* %349 = OpAccessChain %341 %30 
                                                      OpStore %349 %348 
                                 Output f32* %350 = OpAccessChain %341 %30 %337 
                                         f32 %351 = OpLoad %350 
                                         f32 %352 = OpFNegate %351 
                                 Output f32* %353 = OpAccessChain %341 %30 %337 
                                                      OpStore %353 %352 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 74
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %29 %57 %61 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %29 Location 29 
                                             OpMemberDecorate %33 0 Offset 33 
                                             OpDecorate %33 Block 
                                             OpDecorate %35 DescriptorSet 35 
                                             OpDecorate %35 Binding 35 
                                             OpDecorate %57 Location 57 
                                             OpDecorate vs_TEXCOORD1 Location 61 
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
                                     %28 = OpTypePointer Input %7 
                        Input f32_4* %29 = OpVariable Input 
                                     %33 = OpTypeStruct %7 
                                     %34 = OpTypePointer Uniform %33 
            Uniform struct {f32_4;}* %35 = OpVariable Uniform 
                                     %36 = OpTypeInt 32 1 
                                 i32 %37 = OpConstant 0 
                                     %38 = OpTypePointer Uniform %7 
                                     %46 = OpTypePointer Private %6 
                        Private f32* %47 = OpVariable Private 
                                     %48 = OpTypeInt 32 0 
                                 u32 %49 = OpConstant 3 
                                     %52 = OpTypePointer Input %6 
                                     %56 = OpTypePointer Output %7 
                       Output f32_4* %57 = OpVariable Output 
                                     %59 = OpTypePointer Output %6 
                 Input f32* vs_TEXCOORD1 = OpVariable Input 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                               f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                               f32_4 %30 = OpLoad %29 
                               f32_3 %31 = OpVectorShuffle %30 %30 0 1 2 
                               f32_3 %32 = OpFMul %27 %31 
                      Uniform f32_4* %39 = OpAccessChain %35 %37 
                               f32_4 %40 = OpLoad %39 
                               f32_3 %41 = OpVectorShuffle %40 %40 0 1 2 
                               f32_3 %42 = OpFNegate %41 
                               f32_3 %43 = OpFAdd %32 %42 
                               f32_4 %44 = OpLoad %9 
                               f32_4 %45 = OpVectorShuffle %44 %43 4 5 6 3 
                                             OpStore %9 %45 
                        Private f32* %50 = OpAccessChain %9 %49 
                                 f32 %51 = OpLoad %50 
                          Input f32* %53 = OpAccessChain %29 %49 
                                 f32 %54 = OpLoad %53 
                                 f32 %55 = OpFMul %51 %54 
                                             OpStore %47 %55 
                                 f32 %58 = OpLoad %47 
                         Output f32* %60 = OpAccessChain %57 %49 
                                             OpStore %60 %58 
                                 f32 %62 = OpLoad vs_TEXCOORD1 
                               f32_3 %63 = OpCompositeConstruct %62 %62 %62 
                               f32_4 %64 = OpLoad %9 
                               f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                               f32_3 %66 = OpFMul %63 %65 
                      Uniform f32_4* %67 = OpAccessChain %35 %37 
                               f32_4 %68 = OpLoad %67 
                               f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
                               f32_3 %70 = OpFAdd %66 %69 
                               f32_4 %71 = OpLoad %57 
                               f32_4 %72 = OpVectorShuffle %71 %70 4 5 6 3 
                                             OpStore %57 %72 
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
}
}