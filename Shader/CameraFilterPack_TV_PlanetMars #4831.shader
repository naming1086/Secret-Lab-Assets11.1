//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/TV_PlanetMars" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(1, 10)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 33294
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
uniform 	float _Distortion;
uniform 	float Fade;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat4;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat9 = dot(u_xlat0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat1.x = (-u_xlat9) * 0.115896732 + 1.0;
    u_xlat4 = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat4 * 2.58329701 + u_xlat1.x;
    u_xlat2.xyz = vec3(u_xlat9) * vec3(0.616473019, 3.36968088, 0.169122502) + vec3(0.860117733, 1.0, 0.317398727);
    u_xlat9 = u_xlat9 * _Distortion;
    u_xlat7.xy = vec2(u_xlat9) * vec2(2.4000001, 1.5999999);
    u_xlat7.xy = u_xlat7.xy * u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * u_xlat7.xy;
    u_xlat2.xyz = vec3(u_xlat4) * vec3(2.05825949, 11.3303223, 0.672770679) + u_xlat2.xyz;
    u_xlat9 = u_xlat2.z / u_xlat1.x;
    u_xlat1.x = u_xlat2.x / u_xlat2.y;
    u_xlat4 = u_xlat1.x + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 3.0;
    u_xlat4 = (-u_xlat9) * 8.0 + u_xlat4;
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat4 = u_xlat4 + 4.0;
    u_xlat1.x = u_xlat1.x / u_xlat4;
    u_xlat9 = u_xlat9 / u_xlat4;
    u_xlat4 = (-u_xlat1.x) + 1.0;
    u_xlat4 = (-u_xlat9) + u_xlat4;
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat4 = u_xlat4 * u_xlat9;
    u_xlat9 = u_xlat1.x * u_xlat9;
    u_xlat9 = u_xlat7.x * u_xlat9;
    u_xlat2.x = u_xlat9 / _Distortion;
    u_xlat9 = u_xlat7.y * u_xlat4;
    u_xlat2.y = u_xlat7.y / _Distortion;
    u_xlat2.z = u_xlat9 * _Distortion;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    SV_Target0.xyz = vec3(vec3(Fade, Fade, Fade)) * u_xlat1.xyz + u_xlat0.xyz;
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
; Bound: 227
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %204 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpMemberDecorate %15 0 Offset 15 
                                             OpMemberDecorate %15 1 Offset 15 
                                             OpMemberDecorate %15 2 Offset 15 
                                             OpDecorate %15 Block 
                                             OpDecorate %17 DescriptorSet 17 
                                             OpDecorate %17 Binding 17 
                                             OpDecorate %33 DescriptorSet 33 
                                             OpDecorate %33 Binding 33 
                                             OpDecorate %37 DescriptorSet 37 
                                             OpDecorate %37 Binding 37 
                                             OpDecorate %204 Location 204 
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
                                     %15 = OpTypeStruct %6 %6 %14 
                                     %16 = OpTypePointer Uniform %15 
  Uniform struct {f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                     %18 = OpTypeInt 32 1 
                                 i32 %19 = OpConstant 2 
                                     %20 = OpTypePointer Uniform %14 
                                     %31 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %32 = OpTypePointer UniformConstant %31 
UniformConstant read_only Texture2D* %33 = OpVariable UniformConstant 
                                     %35 = OpTypeSampler 
                                     %36 = OpTypePointer UniformConstant %35 
            UniformConstant sampler* %37 = OpVariable UniformConstant 
                                     %39 = OpTypeSampledImage %31 
                                     %45 = OpTypePointer Private %6 
                        Private f32* %46 = OpVariable Private 
                                 f32 %48 = OpConstant 3.674022E-40 
                                 f32 %49 = OpConstant 3.674022E-40 
                                 f32 %50 = OpConstant 3.674022E-40 
                               f32_3 %51 = OpConstantComposite %48 %49 %50 
                      Private f32_3* %53 = OpVariable Private 
                                 f32 %56 = OpConstant 3.674022E-40 
                                 f32 %58 = OpConstant 3.674022E-40 
                                     %60 = OpTypeInt 32 0 
                                 u32 %61 = OpConstant 0 
                        Private f32* %63 = OpVariable Private 
                                 f32 %68 = OpConstant 3.674022E-40 
                      Private f32_3* %74 = OpVariable Private 
                                 f32 %77 = OpConstant 3.674022E-40 
                                 f32 %78 = OpConstant 3.674022E-40 
                                 f32 %79 = OpConstant 3.674022E-40 
                               f32_3 %80 = OpConstantComposite %77 %78 %79 
                                 f32 %82 = OpConstant 3.674022E-40 
                                 f32 %83 = OpConstant 3.674022E-40 
                               f32_3 %84 = OpConstantComposite %82 %58 %83 
                                 i32 %87 = OpConstant 0 
                                     %88 = OpTypePointer Uniform %6 
                                     %92 = OpTypePointer Private %10 
                      Private f32_2* %93 = OpVariable Private 
                                 f32 %96 = OpConstant 3.674022E-40 
                                 f32 %97 = OpConstant 3.674022E-40 
                               f32_2 %98 = OpConstantComposite %96 %97 
                                f32 %108 = OpConstant 3.674022E-40 
                                f32 %109 = OpConstant 3.674022E-40 
                                f32 %110 = OpConstant 3.674022E-40 
                              f32_3 %111 = OpConstantComposite %108 %109 %110 
                                u32 %115 = OpConstant 2 
                                u32 %123 = OpConstant 1 
                                f32 %135 = OpConstant 3.674022E-40 
                                f32 %140 = OpConstant 3.674022E-40 
                                f32 %148 = OpConstant 3.674022E-40 
                                    %203 = OpTypePointer Output %14 
                      Output f32_4* %204 = OpVariable Output 
                                i32 %205 = OpConstant 1 
                                u32 %223 = OpConstant 3 
                                    %224 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
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
                 read_only Texture2D %34 = OpLoad %33 
                             sampler %38 = OpLoad %37 
          read_only Texture2DSampled %40 = OpSampledImage %34 %38 
                               f32_3 %41 = OpLoad %9 
                               f32_2 %42 = OpVectorShuffle %41 %41 0 1 
                               f32_4 %43 = OpImageSampleImplicitLod %40 %42 
                               f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                                             OpStore %9 %44 
                               f32_3 %47 = OpLoad %9 
                                 f32 %52 = OpDot %47 %51 
                                             OpStore %46 %52 
                                 f32 %54 = OpLoad %46 
                                 f32 %55 = OpFNegate %54 
                                 f32 %57 = OpFMul %55 %56 
                                 f32 %59 = OpFAdd %57 %58 
                        Private f32* %62 = OpAccessChain %53 %61 
                                             OpStore %62 %59 
                                 f32 %64 = OpLoad %46 
                                 f32 %65 = OpLoad %46 
                                 f32 %66 = OpFMul %64 %65 
                                             OpStore %63 %66 
                                 f32 %67 = OpLoad %63 
                                 f32 %69 = OpFMul %67 %68 
                        Private f32* %70 = OpAccessChain %53 %61 
                                 f32 %71 = OpLoad %70 
                                 f32 %72 = OpFAdd %69 %71 
                        Private f32* %73 = OpAccessChain %53 %61 
                                             OpStore %73 %72 
                                 f32 %75 = OpLoad %46 
                               f32_3 %76 = OpCompositeConstruct %75 %75 %75 
                               f32_3 %81 = OpFMul %76 %80 
                               f32_3 %85 = OpFAdd %81 %84 
                                             OpStore %74 %85 
                                 f32 %86 = OpLoad %46 
                        Uniform f32* %89 = OpAccessChain %17 %87 
                                 f32 %90 = OpLoad %89 
                                 f32 %91 = OpFMul %86 %90 
                                             OpStore %46 %91 
                                 f32 %94 = OpLoad %46 
                               f32_2 %95 = OpCompositeConstruct %94 %94 
                               f32_2 %99 = OpFMul %95 %98 
                                             OpStore %93 %99 
                              f32_2 %100 = OpLoad %93 
                              f32_2 %101 = OpLoad %93 
                              f32_2 %102 = OpFMul %100 %101 
                                             OpStore %93 %102 
                              f32_2 %103 = OpLoad %93 
                              f32_2 %104 = OpLoad %93 
                              f32_2 %105 = OpFMul %103 %104 
                                             OpStore %93 %105 
                                f32 %106 = OpLoad %63 
                              f32_3 %107 = OpCompositeConstruct %106 %106 %106 
                              f32_3 %112 = OpFMul %107 %111 
                              f32_3 %113 = OpLoad %74 
                              f32_3 %114 = OpFAdd %112 %113 
                                             OpStore %74 %114 
                       Private f32* %116 = OpAccessChain %74 %115 
                                f32 %117 = OpLoad %116 
                       Private f32* %118 = OpAccessChain %53 %61 
                                f32 %119 = OpLoad %118 
                                f32 %120 = OpFDiv %117 %119 
                                             OpStore %46 %120 
                       Private f32* %121 = OpAccessChain %74 %61 
                                f32 %122 = OpLoad %121 
                       Private f32* %124 = OpAccessChain %74 %123 
                                f32 %125 = OpLoad %124 
                                f32 %126 = OpFDiv %122 %125 
                       Private f32* %127 = OpAccessChain %53 %61 
                                             OpStore %127 %126 
                       Private f32* %128 = OpAccessChain %53 %61 
                                f32 %129 = OpLoad %128 
                       Private f32* %130 = OpAccessChain %53 %61 
                                f32 %131 = OpLoad %130 
                                f32 %132 = OpFAdd %129 %131 
                                             OpStore %63 %132 
                       Private f32* %133 = OpAccessChain %53 %61 
                                f32 %134 = OpLoad %133 
                                f32 %136 = OpFMul %134 %135 
                       Private f32* %137 = OpAccessChain %53 %61 
                                             OpStore %137 %136 
                                f32 %138 = OpLoad %46 
                                f32 %139 = OpFNegate %138 
                                f32 %141 = OpFMul %139 %140 
                                f32 %142 = OpLoad %63 
                                f32 %143 = OpFAdd %141 %142 
                                             OpStore %63 %143 
                                f32 %144 = OpLoad %46 
                                f32 %145 = OpLoad %46 
                                f32 %146 = OpFAdd %144 %145 
                                             OpStore %46 %146 
                                f32 %147 = OpLoad %63 
                                f32 %149 = OpFAdd %147 %148 
                                             OpStore %63 %149 
                       Private f32* %150 = OpAccessChain %53 %61 
                                f32 %151 = OpLoad %150 
                                f32 %152 = OpLoad %63 
                                f32 %153 = OpFDiv %151 %152 
                       Private f32* %154 = OpAccessChain %53 %61 
                                             OpStore %154 %153 
                                f32 %155 = OpLoad %46 
                                f32 %156 = OpLoad %63 
                                f32 %157 = OpFDiv %155 %156 
                                             OpStore %46 %157 
                       Private f32* %158 = OpAccessChain %53 %61 
                                f32 %159 = OpLoad %158 
                                f32 %160 = OpFNegate %159 
                                f32 %161 = OpFAdd %160 %58 
                                             OpStore %63 %161 
                                f32 %162 = OpLoad %46 
                                f32 %163 = OpFNegate %162 
                                f32 %164 = OpLoad %63 
                                f32 %165 = OpFAdd %163 %164 
                                             OpStore %63 %165 
                                f32 %166 = OpLoad %46 
                                f32 %167 = OpFDiv %58 %166 
                                             OpStore %46 %167 
                                f32 %168 = OpLoad %63 
                                f32 %169 = OpLoad %46 
                                f32 %170 = OpFMul %168 %169 
                                             OpStore %63 %170 
                       Private f32* %171 = OpAccessChain %53 %61 
                                f32 %172 = OpLoad %171 
                                f32 %173 = OpLoad %46 
                                f32 %174 = OpFMul %172 %173 
                                             OpStore %46 %174 
                       Private f32* %175 = OpAccessChain %93 %61 
                                f32 %176 = OpLoad %175 
                                f32 %177 = OpLoad %46 
                                f32 %178 = OpFMul %176 %177 
                                             OpStore %46 %178 
                                f32 %179 = OpLoad %46 
                       Uniform f32* %180 = OpAccessChain %17 %87 
                                f32 %181 = OpLoad %180 
                                f32 %182 = OpFDiv %179 %181 
                       Private f32* %183 = OpAccessChain %74 %61 
                                             OpStore %183 %182 
                       Private f32* %184 = OpAccessChain %93 %123 
                                f32 %185 = OpLoad %184 
                                f32 %186 = OpLoad %63 
                                f32 %187 = OpFMul %185 %186 
                                             OpStore %46 %187 
                       Private f32* %188 = OpAccessChain %93 %123 
                                f32 %189 = OpLoad %188 
                       Uniform f32* %190 = OpAccessChain %17 %87 
                                f32 %191 = OpLoad %190 
                                f32 %192 = OpFDiv %189 %191 
                       Private f32* %193 = OpAccessChain %74 %123 
                                             OpStore %193 %192 
                                f32 %194 = OpLoad %46 
                       Uniform f32* %195 = OpAccessChain %17 %87 
                                f32 %196 = OpLoad %195 
                                f32 %197 = OpFMul %194 %196 
                       Private f32* %198 = OpAccessChain %74 %115 
                                             OpStore %198 %197 
                              f32_3 %199 = OpLoad %9 
                              f32_3 %200 = OpFNegate %199 
                              f32_3 %201 = OpLoad %74 
                              f32_3 %202 = OpFAdd %200 %201 
                                             OpStore %53 %202 
                       Uniform f32* %206 = OpAccessChain %17 %205 
                                f32 %207 = OpLoad %206 
                       Uniform f32* %208 = OpAccessChain %17 %205 
                                f32 %209 = OpLoad %208 
                       Uniform f32* %210 = OpAccessChain %17 %205 
                                f32 %211 = OpLoad %210 
                              f32_3 %212 = OpCompositeConstruct %207 %209 %211 
                                f32 %213 = OpCompositeExtract %212 0 
                                f32 %214 = OpCompositeExtract %212 1 
                                f32 %215 = OpCompositeExtract %212 2 
                              f32_3 %216 = OpCompositeConstruct %213 %214 %215 
                              f32_3 %217 = OpLoad %53 
                              f32_3 %218 = OpFMul %216 %217 
                              f32_3 %219 = OpLoad %9 
                              f32_3 %220 = OpFAdd %218 %219 
                              f32_4 %221 = OpLoad %204 
                              f32_4 %222 = OpVectorShuffle %221 %220 4 5 6 3 
                                             OpStore %204 %222 
                        Output f32* %225 = OpAccessChain %204 %223 
                                             OpStore %225 %58 
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