//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Mobile/Particles/Multiply" {
Properties {
_MainTex ("Particle Texture", 2D) = "white" { }
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend Zero SrcColor, Zero SrcColor
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 9742
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
 vec4 phase0_Output0_1;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    phase0_Output0_1 = in_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
float u_xlat1;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat0.w * vs_COLOR0.w;
    u_xlat0 = u_xlat0 * vs_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
    SV_Target0 = vec4(u_xlat1) * u_xlat0 + vec4(1.0, 1.0, 1.0, 1.0);
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
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %23 %45 %96 %107 %110 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %9 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %23 Location 23 
                                                     OpDecorate %28 ArrayStride 28 
                                                     OpDecorate %29 ArrayStride 29 
                                                     OpMemberDecorate %30 0 Offset 30 
                                                     OpMemberDecorate %30 1 Offset 30 
                                                     OpMemberDecorate %30 2 Offset 30 
                                                     OpDecorate %30 Block 
                                                     OpDecorate %32 DescriptorSet 32 
                                                     OpDecorate %32 Binding 32 
                                                     OpDecorate %45 Location 45 
                                                     OpMemberDecorate %94 0 BuiltIn 94 
                                                     OpMemberDecorate %94 1 BuiltIn 94 
                                                     OpMemberDecorate %94 2 BuiltIn 94 
                                                     OpDecorate %94 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 107 
                                                     OpDecorate vs_TEXCOORD1 Location 110 
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
                                             %21 = OpTypeVector %6 3 
                                             %22 = OpTypePointer Input %21 
                                Input f32_3* %23 = OpVariable Input 
                                             %26 = OpTypeInt 32 0 
                                         u32 %27 = OpConstant 4 
                                             %28 = OpTypeArray %7 %27 
                                             %29 = OpTypeArray %7 %27 
                                             %30 = OpTypeStruct %28 %29 %7 
                                             %31 = OpTypePointer Uniform %30 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %32 = OpVariable Uniform 
                                             %33 = OpTypeInt 32 1 
                                         i32 %34 = OpConstant 2 
                                             %35 = OpTypePointer Uniform %7 
                              Private f32_4* %44 = OpVariable Private 
                                Input f32_3* %45 = OpVariable Input 
                                         i32 %48 = OpConstant 0 
                                         i32 %49 = OpConstant 1 
                                         i32 %68 = OpConstant 3 
                              Private f32_4* %72 = OpVariable Private 
                                         u32 %92 = OpConstant 1 
                                             %93 = OpTypeArray %6 %92 
                                             %94 = OpTypeStruct %7 %6 %93 
                                             %95 = OpTypePointer Output %94 
        Output struct {f32_4; f32; f32[1];}* %96 = OpVariable Output 
                                            %105 = OpTypeVector %6 2 
                                            %106 = OpTypePointer Output %105 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                            %113 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                                     OpStore %9 %12 
                                       f32_4 %13 = OpLoad %9 
                                       f32_4 %16 = OpCompositeConstruct %14 %14 %14 %14 
                                       f32_4 %17 = OpCompositeConstruct %15 %15 %15 %15 
                                       f32_4 %18 = OpExtInst %1 43 %13 %16 %17 
                                                     OpStore %9 %18 
                                       f32_3 %24 = OpLoad %23 
                                       f32_4 %25 = OpVectorShuffle %24 %24 0 1 0 1 
                              Uniform f32_4* %36 = OpAccessChain %32 %34 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpVectorShuffle %37 %37 0 1 0 1 
                                       f32_4 %39 = OpFMul %25 %38 
                              Uniform f32_4* %40 = OpAccessChain %32 %34 
                                       f32_4 %41 = OpLoad %40 
                                       f32_4 %42 = OpVectorShuffle %41 %41 2 3 2 3 
                                       f32_4 %43 = OpFAdd %39 %42 
                                                     OpStore %20 %43 
                                       f32_3 %46 = OpLoad %45 
                                       f32_4 %47 = OpVectorShuffle %46 %46 1 1 1 1 
                              Uniform f32_4* %50 = OpAccessChain %32 %48 %49 
                                       f32_4 %51 = OpLoad %50 
                                       f32_4 %52 = OpFMul %47 %51 
                                                     OpStore %44 %52 
                              Uniform f32_4* %53 = OpAccessChain %32 %48 %48 
                                       f32_4 %54 = OpLoad %53 
                                       f32_3 %55 = OpLoad %45 
                                       f32_4 %56 = OpVectorShuffle %55 %55 0 0 0 0 
                                       f32_4 %57 = OpFMul %54 %56 
                                       f32_4 %58 = OpLoad %44 
                                       f32_4 %59 = OpFAdd %57 %58 
                                                     OpStore %44 %59 
                              Uniform f32_4* %60 = OpAccessChain %32 %48 %34 
                                       f32_4 %61 = OpLoad %60 
                                       f32_3 %62 = OpLoad %45 
                                       f32_4 %63 = OpVectorShuffle %62 %62 2 2 2 2 
                                       f32_4 %64 = OpFMul %61 %63 
                                       f32_4 %65 = OpLoad %44 
                                       f32_4 %66 = OpFAdd %64 %65 
                                                     OpStore %44 %66 
                                       f32_4 %67 = OpLoad %44 
                              Uniform f32_4* %69 = OpAccessChain %32 %48 %68 
                                       f32_4 %70 = OpLoad %69 
                                       f32_4 %71 = OpFAdd %67 %70 
                                                     OpStore %44 %71 
                                       f32_4 %73 = OpLoad %44 
                                       f32_4 %74 = OpVectorShuffle %73 %73 1 1 1 1 
                              Uniform f32_4* %75 = OpAccessChain %32 %49 %49 
                                       f32_4 %76 = OpLoad %75 
                                       f32_4 %77 = OpFMul %74 %76 
                                                     OpStore %72 %77 
                              Uniform f32_4* %78 = OpAccessChain %32 %49 %48 
                                       f32_4 %79 = OpLoad %78 
                                       f32_4 %80 = OpLoad %44 
                                       f32_4 %81 = OpVectorShuffle %80 %80 0 0 0 0 
                                       f32_4 %82 = OpFMul %79 %81 
                                       f32_4 %83 = OpLoad %72 
                                       f32_4 %84 = OpFAdd %82 %83 
                                                     OpStore %72 %84 
                              Uniform f32_4* %85 = OpAccessChain %32 %49 %34 
                                       f32_4 %86 = OpLoad %85 
                                       f32_4 %87 = OpLoad %44 
                                       f32_4 %88 = OpVectorShuffle %87 %87 2 2 2 2 
                                       f32_4 %89 = OpFMul %86 %88 
                                       f32_4 %90 = OpLoad %72 
                                       f32_4 %91 = OpFAdd %89 %90 
                                                     OpStore %72 %91 
                              Uniform f32_4* %97 = OpAccessChain %32 %49 %68 
                                       f32_4 %98 = OpLoad %97 
                                       f32_4 %99 = OpLoad %44 
                                      f32_4 %100 = OpVectorShuffle %99 %99 3 3 3 3 
                                      f32_4 %101 = OpFMul %98 %100 
                                      f32_4 %102 = OpLoad %72 
                                      f32_4 %103 = OpFAdd %101 %102 
                              Output f32_4* %104 = OpAccessChain %96 %48 
                                                     OpStore %104 %103 
                                      f32_4 %108 = OpLoad %20 
                                      f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                                     OpStore vs_TEXCOORD0 %109 
                                      f32_4 %111 = OpLoad %20 
                                      f32_2 %112 = OpVectorShuffle %111 %111 2 3 
                                                     OpStore vs_TEXCOORD1 %112 
                                Output f32* %114 = OpAccessChain %96 %48 %92 
                                        f32 %115 = OpLoad %114 
                                        f32 %116 = OpFNegate %115 
                                Output f32* %117 = OpAccessChain %96 %48 %92 
                                                     OpStore %117 %116 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 53
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %32 %44 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %32 Location 32 
                                             OpDecorate %44 Location 44 
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
                                     %25 = OpTypePointer Private %6 
                        Private f32* %26 = OpVariable Private 
                                     %27 = OpTypeInt 32 0 
                                 u32 %28 = OpConstant 3 
                                     %31 = OpTypePointer Input %7 
                        Input f32_4* %32 = OpVariable Input 
                                     %33 = OpTypePointer Input %6 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_4 %41 = OpConstantComposite %40 %40 %40 %40 
                                     %43 = OpTypePointer Output %7 
                       Output f32_4* %44 = OpVariable Output 
                                 f32 %49 = OpConstant 3.674022E-40 
                               f32_4 %50 = OpConstantComposite %49 %49 %49 %49 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                        Private f32* %29 = OpAccessChain %9 %28 
                                 f32 %30 = OpLoad %29 
                          Input f32* %34 = OpAccessChain %32 %28 
                                 f32 %35 = OpLoad %34 
                                 f32 %36 = OpFMul %30 %35 
                                             OpStore %26 %36 
                               f32_4 %37 = OpLoad %9 
                               f32_4 %38 = OpLoad %32 
                               f32_4 %39 = OpFMul %37 %38 
                               f32_4 %42 = OpFAdd %39 %41 
                                             OpStore %9 %42 
                                 f32 %45 = OpLoad %26 
                               f32_4 %46 = OpCompositeConstruct %45 %45 %45 %45 
                               f32_4 %47 = OpLoad %9 
                               f32_4 %48 = OpFMul %46 %47 
                               f32_4 %51 = OpFAdd %48 %50 
                                             OpStore %44 %51 
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
 vec4 phase0_Output0_1;
out vec2 vs_TEXCOORD1;
out float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    phase0_Output0_1 = in_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
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
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
in  float vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat0.w * vs_COLOR0.w;
    u_xlat0 = u_xlat0 * vs_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat0 = vec4(u_xlat1) * u_xlat0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    SV_Target0.w = u_xlat0.w;
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat0.xyz + unity_FogColor.xyz;
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
; Bound: 361
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %9 %11 %23 %97 %279 %339 %350 %353 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %9 Location 9 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %23 Location 23 
                                                      OpDecorate %28 ArrayStride 28 
                                                      OpDecorate %29 ArrayStride 29 
                                                      OpDecorate %30 ArrayStride 30 
                                                      OpMemberDecorate %31 0 Offset 31 
                                                      OpMemberDecorate %31 1 Offset 31 
                                                      OpMemberDecorate %31 2 Offset 31 
                                                      OpMemberDecorate %31 3 Offset 31 
                                                      OpMemberDecorate %31 4 Offset 31 
                                                      OpDecorate %31 Block 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate vs_TEXCOORD2 Location 279 
                                                      OpMemberDecorate %337 0 BuiltIn 337 
                                                      OpMemberDecorate %337 1 BuiltIn 337 
                                                      OpMemberDecorate %337 2 BuiltIn 337 
                                                      OpDecorate %337 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 350 
                                                      OpDecorate vs_TEXCOORD1 Location 353 
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
                                              %21 = OpTypeVector %6 3 
                                              %22 = OpTypePointer Input %21 
                                 Input f32_3* %23 = OpVariable Input 
                                              %26 = OpTypeInt 32 0 
                                          u32 %27 = OpConstant 4 
                                              %28 = OpTypeArray %7 %27 
                                              %29 = OpTypeArray %7 %27 
                                              %30 = OpTypeArray %7 %27 
                                              %31 = OpTypeStruct %28 %29 %30 %7 %7 
                                              %32 = OpTypePointer Uniform %31 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4;}* %33 = OpVariable Uniform 
                                              %34 = OpTypeInt 32 1 
                                          i32 %35 = OpConstant 4 
                                              %36 = OpTypePointer Uniform %7 
                               Private f32_4* %45 = OpVariable Private 
                                          i32 %46 = OpConstant 0 
                                          i32 %47 = OpConstant 1 
                                          i32 %69 = OpConstant 2 
                                          i32 %82 = OpConstant 3 
                                 Input f32_3* %97 = OpVariable Input 
                              Private f32_4* %103 = OpVariable Private 
                                         u32 %271 = OpConstant 0 
                                             %272 = OpTypePointer Private %6 
                                             %278 = OpTypePointer Output %6 
                         Output f32* vs_TEXCOORD2 = OpVariable Output 
                                         u32 %282 = OpConstant 2 
                                             %283 = OpTypePointer Uniform %6 
                                         u32 %287 = OpConstant 3 
                                         u32 %335 = OpConstant 1 
                                             %336 = OpTypeArray %6 %335 
                                             %337 = OpTypeStruct %7 %6 %336 
                                             %338 = OpTypePointer Output %337 
        Output struct {f32_4; f32; f32[1];}* %339 = OpVariable Output 
                                             %348 = OpTypeVector %6 2 
                                             %349 = OpTypePointer Output %348 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                                      OpStore %9 %12 
                                        f32_4 %13 = OpLoad %9 
                                        f32_4 %16 = OpCompositeConstruct %14 %14 %14 %14 
                                        f32_4 %17 = OpCompositeConstruct %15 %15 %15 %15 
                                        f32_4 %18 = OpExtInst %1 43 %13 %16 %17 
                                                      OpStore %9 %18 
                                        f32_3 %24 = OpLoad %23 
                                        f32_4 %25 = OpVectorShuffle %24 %24 0 1 0 1 
                               Uniform f32_4* %37 = OpAccessChain %33 %35 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpVectorShuffle %38 %38 0 1 0 1 
                                        f32_4 %40 = OpFMul %25 %39 
                               Uniform f32_4* %41 = OpAccessChain %33 %35 
                                        f32_4 %42 = OpLoad %41 
                                        f32_4 %43 = OpVectorShuffle %42 %42 2 3 2 3 
                                        f32_4 %44 = OpFAdd %40 %43 
                                                      OpStore %20 %44 
                               Uniform f32_4* %48 = OpAccessChain %33 %46 %47 
                                        f32_4 %49 = OpLoad %48 
                                        f32_3 %50 = OpVectorShuffle %49 %49 1 1 1 
                               Uniform f32_4* %51 = OpAccessChain %33 %47 %47 
                                        f32_4 %52 = OpLoad %51 
                                        f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                                        f32_3 %54 = OpFMul %50 %53 
                                        f32_4 %55 = OpLoad %45 
                                        f32_4 %56 = OpVectorShuffle %55 %54 4 5 6 3 
                                                      OpStore %45 %56 
                               Uniform f32_4* %57 = OpAccessChain %33 %47 %46 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                               Uniform f32_4* %60 = OpAccessChain %33 %46 %47 
                                        f32_4 %61 = OpLoad %60 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 0 0 
                                        f32_3 %63 = OpFMul %59 %62 
                                        f32_4 %64 = OpLoad %45 
                                        f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                                        f32_3 %66 = OpFAdd %63 %65 
                                        f32_4 %67 = OpLoad %45 
                                        f32_4 %68 = OpVectorShuffle %67 %66 4 5 6 3 
                                                      OpStore %45 %68 
                               Uniform f32_4* %70 = OpAccessChain %33 %47 %69 
                                        f32_4 %71 = OpLoad %70 
                                        f32_3 %72 = OpVectorShuffle %71 %71 0 1 2 
                               Uniform f32_4* %73 = OpAccessChain %33 %46 %47 
                                        f32_4 %74 = OpLoad %73 
                                        f32_3 %75 = OpVectorShuffle %74 %74 2 2 2 
                                        f32_3 %76 = OpFMul %72 %75 
                                        f32_4 %77 = OpLoad %45 
                                        f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
                                        f32_3 %79 = OpFAdd %76 %78 
                                        f32_4 %80 = OpLoad %45 
                                        f32_4 %81 = OpVectorShuffle %80 %79 4 5 6 3 
                                                      OpStore %45 %81 
                               Uniform f32_4* %83 = OpAccessChain %33 %47 %82 
                                        f32_4 %84 = OpLoad %83 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                               Uniform f32_4* %86 = OpAccessChain %33 %46 %47 
                                        f32_4 %87 = OpLoad %86 
                                        f32_3 %88 = OpVectorShuffle %87 %87 3 3 3 
                                        f32_3 %89 = OpFMul %85 %88 
                                        f32_4 %90 = OpLoad %45 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                        f32_3 %92 = OpFAdd %89 %91 
                                        f32_4 %93 = OpLoad %45 
                                        f32_4 %94 = OpVectorShuffle %93 %92 4 5 6 3 
                                                      OpStore %45 %94 
                                        f32_4 %95 = OpLoad %45 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 1 1 1 
                                       f32_3 %100 = OpFMul %96 %99 
                                       f32_4 %101 = OpLoad %45 
                                       f32_4 %102 = OpVectorShuffle %101 %100 4 5 6 3 
                                                      OpStore %45 %102 
                              Uniform f32_4* %104 = OpAccessChain %33 %46 %46 
                                       f32_4 %105 = OpLoad %104 
                                       f32_3 %106 = OpVectorShuffle %105 %105 1 1 1 
                              Uniform f32_4* %107 = OpAccessChain %33 %47 %47 
                                       f32_4 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                       f32_3 %110 = OpFMul %106 %109 
                                       f32_4 %111 = OpLoad %103 
                                       f32_4 %112 = OpVectorShuffle %111 %110 4 5 6 3 
                                                      OpStore %103 %112 
                              Uniform f32_4* %113 = OpAccessChain %33 %47 %46 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                              Uniform f32_4* %116 = OpAccessChain %33 %46 %46 
                                       f32_4 %117 = OpLoad %116 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 0 0 
                                       f32_3 %119 = OpFMul %115 %118 
                                       f32_4 %120 = OpLoad %103 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_3 %122 = OpFAdd %119 %121 
                                       f32_4 %123 = OpLoad %103 
                                       f32_4 %124 = OpVectorShuffle %123 %122 4 5 6 3 
                                                      OpStore %103 %124 
                              Uniform f32_4* %125 = OpAccessChain %33 %47 %69 
                                       f32_4 %126 = OpLoad %125 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                              Uniform f32_4* %128 = OpAccessChain %33 %46 %46 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 2 2 2 
                                       f32_3 %131 = OpFMul %127 %130 
                                       f32_4 %132 = OpLoad %103 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpFAdd %131 %133 
                                       f32_4 %135 = OpLoad %103 
                                       f32_4 %136 = OpVectorShuffle %135 %134 4 5 6 3 
                                                      OpStore %103 %136 
                              Uniform f32_4* %137 = OpAccessChain %33 %47 %82 
                                       f32_4 %138 = OpLoad %137 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                              Uniform f32_4* %140 = OpAccessChain %33 %46 %46 
                                       f32_4 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 3 3 3 
                                       f32_3 %143 = OpFMul %139 %142 
                                       f32_4 %144 = OpLoad %103 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                                       f32_3 %146 = OpFAdd %143 %145 
                                       f32_4 %147 = OpLoad %103 
                                       f32_4 %148 = OpVectorShuffle %147 %146 4 5 6 3 
                                                      OpStore %103 %148 
                                       f32_4 %149 = OpLoad %103 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                       f32_3 %151 = OpLoad %97 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 0 0 
                                       f32_3 %153 = OpFMul %150 %152 
                                       f32_4 %154 = OpLoad %45 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                       f32_3 %156 = OpFAdd %153 %155 
                                       f32_4 %157 = OpLoad %45 
                                       f32_4 %158 = OpVectorShuffle %157 %156 4 5 6 3 
                                                      OpStore %45 %158 
                              Uniform f32_4* %159 = OpAccessChain %33 %46 %69 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 1 1 1 
                              Uniform f32_4* %162 = OpAccessChain %33 %47 %47 
                                       f32_4 %163 = OpLoad %162 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                       f32_3 %165 = OpFMul %161 %164 
                                       f32_4 %166 = OpLoad %103 
                                       f32_4 %167 = OpVectorShuffle %166 %165 4 5 6 3 
                                                      OpStore %103 %167 
                              Uniform f32_4* %168 = OpAccessChain %33 %47 %46 
                                       f32_4 %169 = OpLoad %168 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                              Uniform f32_4* %171 = OpAccessChain %33 %46 %69 
                                       f32_4 %172 = OpLoad %171 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 0 0 
                                       f32_3 %174 = OpFMul %170 %173 
                                       f32_4 %175 = OpLoad %103 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_3 %177 = OpFAdd %174 %176 
                                       f32_4 %178 = OpLoad %103 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 6 3 
                                                      OpStore %103 %179 
                              Uniform f32_4* %180 = OpAccessChain %33 %47 %69 
                                       f32_4 %181 = OpLoad %180 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                              Uniform f32_4* %183 = OpAccessChain %33 %46 %69 
                                       f32_4 %184 = OpLoad %183 
                                       f32_3 %185 = OpVectorShuffle %184 %184 2 2 2 
                                       f32_3 %186 = OpFMul %182 %185 
                                       f32_4 %187 = OpLoad %103 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                                       f32_3 %189 = OpFAdd %186 %188 
                                       f32_4 %190 = OpLoad %103 
                                       f32_4 %191 = OpVectorShuffle %190 %189 4 5 6 3 
                                                      OpStore %103 %191 
                              Uniform f32_4* %192 = OpAccessChain %33 %47 %82 
                                       f32_4 %193 = OpLoad %192 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 1 2 
                              Uniform f32_4* %195 = OpAccessChain %33 %46 %69 
                                       f32_4 %196 = OpLoad %195 
                                       f32_3 %197 = OpVectorShuffle %196 %196 3 3 3 
                                       f32_3 %198 = OpFMul %194 %197 
                                       f32_4 %199 = OpLoad %103 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
                                       f32_3 %201 = OpFAdd %198 %200 
                                       f32_4 %202 = OpLoad %103 
                                       f32_4 %203 = OpVectorShuffle %202 %201 4 5 6 3 
                                                      OpStore %103 %203 
                                       f32_4 %204 = OpLoad %103 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                       f32_3 %206 = OpLoad %97 
                                       f32_3 %207 = OpVectorShuffle %206 %206 2 2 2 
                                       f32_3 %208 = OpFMul %205 %207 
                                       f32_4 %209 = OpLoad %45 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
                                       f32_3 %211 = OpFAdd %208 %210 
                                       f32_4 %212 = OpLoad %45 
                                       f32_4 %213 = OpVectorShuffle %212 %211 4 5 6 3 
                                                      OpStore %45 %213 
                              Uniform f32_4* %214 = OpAccessChain %33 %46 %82 
                                       f32_4 %215 = OpLoad %214 
                                       f32_3 %216 = OpVectorShuffle %215 %215 1 1 1 
                              Uniform f32_4* %217 = OpAccessChain %33 %47 %47 
                                       f32_4 %218 = OpLoad %217 
                                       f32_3 %219 = OpVectorShuffle %218 %218 0 1 2 
                                       f32_3 %220 = OpFMul %216 %219 
                                       f32_4 %221 = OpLoad %103 
                                       f32_4 %222 = OpVectorShuffle %221 %220 4 5 6 3 
                                                      OpStore %103 %222 
                              Uniform f32_4* %223 = OpAccessChain %33 %47 %46 
                                       f32_4 %224 = OpLoad %223 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                              Uniform f32_4* %226 = OpAccessChain %33 %46 %82 
                                       f32_4 %227 = OpLoad %226 
                                       f32_3 %228 = OpVectorShuffle %227 %227 0 0 0 
                                       f32_3 %229 = OpFMul %225 %228 
                                       f32_4 %230 = OpLoad %103 
                                       f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                                       f32_3 %232 = OpFAdd %229 %231 
                                       f32_4 %233 = OpLoad %103 
                                       f32_4 %234 = OpVectorShuffle %233 %232 4 5 6 3 
                                                      OpStore %103 %234 
                              Uniform f32_4* %235 = OpAccessChain %33 %47 %69 
                                       f32_4 %236 = OpLoad %235 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
                              Uniform f32_4* %238 = OpAccessChain %33 %46 %82 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 2 2 2 
                                       f32_3 %241 = OpFMul %237 %240 
                                       f32_4 %242 = OpLoad %103 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                       f32_3 %244 = OpFAdd %241 %243 
                                       f32_4 %245 = OpLoad %103 
                                       f32_4 %246 = OpVectorShuffle %245 %244 4 5 6 3 
                                                      OpStore %103 %246 
                              Uniform f32_4* %247 = OpAccessChain %33 %47 %82 
                                       f32_4 %248 = OpLoad %247 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                              Uniform f32_4* %250 = OpAccessChain %33 %46 %82 
                                       f32_4 %251 = OpLoad %250 
                                       f32_3 %252 = OpVectorShuffle %251 %251 3 3 3 
                                       f32_3 %253 = OpFMul %249 %252 
                                       f32_4 %254 = OpLoad %103 
                                       f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                                       f32_3 %256 = OpFAdd %253 %255 
                                       f32_4 %257 = OpLoad %103 
                                       f32_4 %258 = OpVectorShuffle %257 %256 4 5 6 3 
                                                      OpStore %103 %258 
                                       f32_4 %259 = OpLoad %45 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                                       f32_4 %261 = OpLoad %103 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                                       f32_3 %263 = OpFAdd %260 %262 
                                       f32_4 %264 = OpLoad %45 
                                       f32_4 %265 = OpVectorShuffle %264 %263 4 5 6 3 
                                                      OpStore %45 %265 
                                       f32_4 %266 = OpLoad %45 
                                       f32_3 %267 = OpVectorShuffle %266 %266 0 1 2 
                                       f32_4 %268 = OpLoad %45 
                                       f32_3 %269 = OpVectorShuffle %268 %268 0 1 2 
                                         f32 %270 = OpDot %267 %269 
                                Private f32* %273 = OpAccessChain %45 %271 
                                                      OpStore %273 %270 
                                Private f32* %274 = OpAccessChain %45 %271 
                                         f32 %275 = OpLoad %274 
                                         f32 %276 = OpExtInst %1 31 %275 
                                Private f32* %277 = OpAccessChain %45 %271 
                                                      OpStore %277 %276 
                                Private f32* %280 = OpAccessChain %45 %271 
                                         f32 %281 = OpLoad %280 
                                Uniform f32* %284 = OpAccessChain %33 %82 %282 
                                         f32 %285 = OpLoad %284 
                                         f32 %286 = OpFMul %281 %285 
                                Uniform f32* %288 = OpAccessChain %33 %82 %287 
                                         f32 %289 = OpLoad %288 
                                         f32 %290 = OpFAdd %286 %289 
                                                      OpStore vs_TEXCOORD2 %290 
                                         f32 %291 = OpLoad vs_TEXCOORD2 
                                         f32 %292 = OpExtInst %1 43 %291 %14 %15 
                                                      OpStore vs_TEXCOORD2 %292 
                                       f32_3 %293 = OpLoad %97 
                                       f32_4 %294 = OpVectorShuffle %293 %293 1 1 1 1 
                              Uniform f32_4* %295 = OpAccessChain %33 %46 %47 
                                       f32_4 %296 = OpLoad %295 
                                       f32_4 %297 = OpFMul %294 %296 
                                                      OpStore %45 %297 
                              Uniform f32_4* %298 = OpAccessChain %33 %46 %46 
                                       f32_4 %299 = OpLoad %298 
                                       f32_3 %300 = OpLoad %97 
                                       f32_4 %301 = OpVectorShuffle %300 %300 0 0 0 0 
                                       f32_4 %302 = OpFMul %299 %301 
                                       f32_4 %303 = OpLoad %45 
                                       f32_4 %304 = OpFAdd %302 %303 
                                                      OpStore %45 %304 
                              Uniform f32_4* %305 = OpAccessChain %33 %46 %69 
                                       f32_4 %306 = OpLoad %305 
                                       f32_3 %307 = OpLoad %97 
                                       f32_4 %308 = OpVectorShuffle %307 %307 2 2 2 2 
                                       f32_4 %309 = OpFMul %306 %308 
                                       f32_4 %310 = OpLoad %45 
                                       f32_4 %311 = OpFAdd %309 %310 
                                                      OpStore %45 %311 
                                       f32_4 %312 = OpLoad %45 
                              Uniform f32_4* %313 = OpAccessChain %33 %46 %82 
                                       f32_4 %314 = OpLoad %313 
                                       f32_4 %315 = OpFAdd %312 %314 
                                                      OpStore %45 %315 
                                       f32_4 %316 = OpLoad %45 
                                       f32_4 %317 = OpVectorShuffle %316 %316 1 1 1 1 
                              Uniform f32_4* %318 = OpAccessChain %33 %69 %47 
                                       f32_4 %319 = OpLoad %318 
                                       f32_4 %320 = OpFMul %317 %319 
                                                      OpStore %103 %320 
                              Uniform f32_4* %321 = OpAccessChain %33 %69 %46 
                                       f32_4 %322 = OpLoad %321 
                                       f32_4 %323 = OpLoad %45 
                                       f32_4 %324 = OpVectorShuffle %323 %323 0 0 0 0 
                                       f32_4 %325 = OpFMul %322 %324 
                                       f32_4 %326 = OpLoad %103 
                                       f32_4 %327 = OpFAdd %325 %326 
                                                      OpStore %103 %327 
                              Uniform f32_4* %328 = OpAccessChain %33 %69 %69 
                                       f32_4 %329 = OpLoad %328 
                                       f32_4 %330 = OpLoad %45 
                                       f32_4 %331 = OpVectorShuffle %330 %330 2 2 2 2 
                                       f32_4 %332 = OpFMul %329 %331 
                                       f32_4 %333 = OpLoad %103 
                                       f32_4 %334 = OpFAdd %332 %333 
                                                      OpStore %103 %334 
                              Uniform f32_4* %340 = OpAccessChain %33 %69 %82 
                                       f32_4 %341 = OpLoad %340 
                                       f32_4 %342 = OpLoad %45 
                                       f32_4 %343 = OpVectorShuffle %342 %342 3 3 3 3 
                                       f32_4 %344 = OpFMul %341 %343 
                                       f32_4 %345 = OpLoad %103 
                                       f32_4 %346 = OpFAdd %344 %345 
                               Output f32_4* %347 = OpAccessChain %339 %46 
                                                      OpStore %347 %346 
                                       f32_4 %351 = OpLoad %20 
                                       f32_2 %352 = OpVectorShuffle %351 %351 0 1 
                                                      OpStore vs_TEXCOORD0 %352 
                                       f32_4 %354 = OpLoad %20 
                                       f32_2 %355 = OpVectorShuffle %354 %354 2 3 
                                                      OpStore vs_TEXCOORD1 %355 
                                 Output f32* %356 = OpAccessChain %339 %46 %335 
                                         f32 %357 = OpLoad %356 
                                         f32 %358 = OpFNegate %357 
                                 Output f32* %359 = OpAccessChain %339 %46 %335 
                                                      OpStore %359 %358 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 85
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %32 %67 %72 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %32 Location 32 
                                             OpMemberDecorate %53 0 Offset 53 
                                             OpDecorate %53 Block 
                                             OpDecorate %55 DescriptorSet 55 
                                             OpDecorate %55 Binding 55 
                                             OpDecorate %67 Location 67 
                                             OpDecorate vs_TEXCOORD2 Location 72 
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
                                     %25 = OpTypePointer Private %6 
                        Private f32* %26 = OpVariable Private 
                                     %27 = OpTypeInt 32 0 
                                 u32 %28 = OpConstant 3 
                                     %31 = OpTypePointer Input %7 
                        Input f32_4* %32 = OpVariable Input 
                                     %33 = OpTypePointer Input %6 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_4 %41 = OpConstantComposite %40 %40 %40 %40 
                                 f32 %47 = OpConstant 3.674022E-40 
                               f32_4 %48 = OpConstantComposite %47 %47 %47 %47 
                                     %50 = OpTypeVector %6 3 
                                     %53 = OpTypeStruct %7 
                                     %54 = OpTypePointer Uniform %53 
            Uniform struct {f32_4;}* %55 = OpVariable Uniform 
                                     %56 = OpTypeInt 32 1 
                                 i32 %57 = OpConstant 0 
                                     %58 = OpTypePointer Uniform %7 
                                     %66 = OpTypePointer Output %7 
                       Output f32_4* %67 = OpVariable Output 
                                     %70 = OpTypePointer Output %6 
                 Input f32* vs_TEXCOORD2 = OpVariable Input 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                        Private f32* %29 = OpAccessChain %9 %28 
                                 f32 %30 = OpLoad %29 
                          Input f32* %34 = OpAccessChain %32 %28 
                                 f32 %35 = OpLoad %34 
                                 f32 %36 = OpFMul %30 %35 
                                             OpStore %26 %36 
                               f32_4 %37 = OpLoad %9 
                               f32_4 %38 = OpLoad %32 
                               f32_4 %39 = OpFMul %37 %38 
                               f32_4 %42 = OpFAdd %39 %41 
                                             OpStore %9 %42 
                                 f32 %43 = OpLoad %26 
                               f32_4 %44 = OpCompositeConstruct %43 %43 %43 %43 
                               f32_4 %45 = OpLoad %9 
                               f32_4 %46 = OpFMul %44 %45 
                               f32_4 %49 = OpFAdd %46 %48 
                                             OpStore %9 %49 
                               f32_4 %51 = OpLoad %9 
                               f32_3 %52 = OpVectorShuffle %51 %51 0 1 2 
                      Uniform f32_4* %59 = OpAccessChain %55 %57 
                               f32_4 %60 = OpLoad %59 
                               f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                               f32_3 %62 = OpFNegate %61 
                               f32_3 %63 = OpFAdd %52 %62 
                               f32_4 %64 = OpLoad %9 
                               f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                             OpStore %9 %65 
                        Private f32* %68 = OpAccessChain %9 %28 
                                 f32 %69 = OpLoad %68 
                         Output f32* %71 = OpAccessChain %67 %28 
                                             OpStore %71 %69 
                                 f32 %73 = OpLoad vs_TEXCOORD2 
                               f32_3 %74 = OpCompositeConstruct %73 %73 %73 
                               f32_4 %75 = OpLoad %9 
                               f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                               f32_3 %77 = OpFMul %74 %76 
                      Uniform f32_4* %78 = OpAccessChain %55 %57 
                               f32_4 %79 = OpLoad %78 
                               f32_3 %80 = OpVectorShuffle %79 %79 0 1 2 
                               f32_3 %81 = OpFAdd %77 %80 
                               f32_4 %82 = OpLoad %67 
                               f32_4 %83 = OpVectorShuffle %82 %81 4 5 6 3 
                                             OpStore %67 %83 
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