//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Edge_Golden" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 36431
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
uniform 	vec4 _ScreenResolution;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / _ScreenResolution.xyxy;
    u_xlat2 = u_xlat1.zwzw * vec4(-1.5, -1.5, 1.5, -1.5) + u_xlat0.zwzw;
    u_xlat0 = u_xlat1 * vec4(-1.5, 1.5, 1.5, 1.5) + u_xlat0;
    u_xlat1 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat1.w = dot(u_xlat2.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
    u_xlat1.x = dot(u_xlat1.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
    u_xlat2 = texture(_MainTex, u_xlat0.zw);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
    u_xlat0.y = dot(u_xlat2.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
    u_xlat0.xy = (-u_xlat0.xy) + u_xlat1.wx;
    u_xlat0.x = max(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    SV_Target0.xyz = u_xlat0.xxx * vec3(4.5, 1.80000007, -1.50000012) + vec3(0.100000001, 0.180000007, 0.300000012);
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
; Bound: 162
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %144 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpMemberDecorate %15 0 Offset 15 
                                             OpMemberDecorate %15 1 Offset 15 
                                             OpDecorate %15 Block 
                                             OpDecorate %17 DescriptorSet 17 
                                             OpDecorate %17 Binding 17 
                                             OpDecorate %54 DescriptorSet 54 
                                             OpDecorate %54 Binding 54 
                                             OpDecorate %58 DescriptorSet 58 
                                             OpDecorate %58 Binding 58 
                                             OpDecorate %144 Location 144 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %15 = OpTypeStruct %7 %7 
                                     %16 = OpTypePointer Uniform %15 
     Uniform struct {f32_4; f32_4;}* %17 = OpVariable Uniform 
                                     %18 = OpTypeInt 32 1 
                                 i32 %19 = OpConstant 1 
                                     %20 = OpTypePointer Uniform %7 
                      Private f32_4* %29 = OpVariable Private 
                                 f32 %30 = OpConstant 3.674022E-40 
                               f32_4 %31 = OpConstantComposite %30 %30 %30 %30 
                                 i32 %32 = OpConstant 0 
                      Private f32_4* %37 = OpVariable Private 
                                 f32 %40 = OpConstant 3.674022E-40 
                                 f32 %41 = OpConstant 3.674022E-40 
                               f32_4 %42 = OpConstantComposite %40 %40 %41 %40 
                               f32_4 %48 = OpConstantComposite %40 %41 %41 %41 
                                     %52 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %53 = OpTypePointer UniformConstant %52 
UniformConstant read_only Texture2D* %54 = OpVariable UniformConstant 
                                     %56 = OpTypeSampler 
                                     %57 = OpTypePointer UniformConstant %56 
            UniformConstant sampler* %58 = OpVariable UniformConstant 
                                     %60 = OpTypeSampledImage %52 
                                     %65 = OpTypeVector %6 3 
                                 f32 %80 = OpConstant 3.674022E-40 
                               f32_3 %81 = OpConstantComposite %80 %80 %80 
                                     %83 = OpTypeInt 32 0 
                                 u32 %84 = OpConstant 3 
                                     %85 = OpTypePointer Private %6 
                                 u32 %90 = OpConstant 0 
                                u32 %117 = OpConstant 1 
                                    %143 = OpTypePointer Output %7 
                      Output f32_4* %144 = OpVariable Output 
                                f32 %147 = OpConstant 3.674022E-40 
                                f32 %148 = OpConstant 3.674022E-40 
                                f32 %149 = OpConstant 3.674022E-40 
                              f32_3 %150 = OpConstantComposite %147 %148 %149 
                                f32 %152 = OpConstant 3.674022E-40 
                                f32 %153 = OpConstant 3.674022E-40 
                                f32 %154 = OpConstant 3.674022E-40 
                              f32_3 %155 = OpConstantComposite %152 %153 %154 
                                    %159 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_2 %13 = OpLoad vs_TEXCOORD0 
                               f32_4 %14 = OpVectorShuffle %13 %13 0 1 0 1 
                      Uniform f32_4* %21 = OpAccessChain %17 %19 
                               f32_4 %22 = OpLoad %21 
                               f32_4 %23 = OpVectorShuffle %22 %22 0 1 0 1 
                               f32_4 %24 = OpFMul %14 %23 
                      Uniform f32_4* %25 = OpAccessChain %17 %19 
                               f32_4 %26 = OpLoad %25 
                               f32_4 %27 = OpVectorShuffle %26 %26 2 3 2 3 
                               f32_4 %28 = OpFAdd %24 %27 
                                             OpStore %9 %28 
                      Uniform f32_4* %33 = OpAccessChain %17 %32 
                               f32_4 %34 = OpLoad %33 
                               f32_4 %35 = OpVectorShuffle %34 %34 0 1 0 1 
                               f32_4 %36 = OpFDiv %31 %35 
                                             OpStore %29 %36 
                               f32_4 %38 = OpLoad %29 
                               f32_4 %39 = OpVectorShuffle %38 %38 2 3 2 3 
                               f32_4 %43 = OpFMul %39 %42 
                               f32_4 %44 = OpLoad %9 
                               f32_4 %45 = OpVectorShuffle %44 %44 2 3 2 3 
                               f32_4 %46 = OpFAdd %43 %45 
                                             OpStore %37 %46 
                               f32_4 %47 = OpLoad %29 
                               f32_4 %49 = OpFMul %47 %48 
                               f32_4 %50 = OpLoad %9 
                               f32_4 %51 = OpFAdd %49 %50 
                                             OpStore %9 %51 
                 read_only Texture2D %55 = OpLoad %54 
                             sampler %59 = OpLoad %58 
          read_only Texture2DSampled %61 = OpSampledImage %55 %59 
                               f32_4 %62 = OpLoad %37 
                               f32_2 %63 = OpVectorShuffle %62 %62 0 1 
                               f32_4 %64 = OpImageSampleImplicitLod %61 %63 
                               f32_3 %66 = OpVectorShuffle %64 %64 0 1 2 
                               f32_4 %67 = OpLoad %29 
                               f32_4 %68 = OpVectorShuffle %67 %66 4 5 6 3 
                                             OpStore %29 %68 
                 read_only Texture2D %69 = OpLoad %54 
                             sampler %70 = OpLoad %58 
          read_only Texture2DSampled %71 = OpSampledImage %69 %70 
                               f32_4 %72 = OpLoad %37 
                               f32_2 %73 = OpVectorShuffle %72 %72 2 3 
                               f32_4 %74 = OpImageSampleImplicitLod %71 %73 
                               f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                               f32_4 %76 = OpLoad %37 
                               f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                             OpStore %37 %77 
                               f32_4 %78 = OpLoad %37 
                               f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                                 f32 %82 = OpDot %79 %81 
                        Private f32* %86 = OpAccessChain %29 %84 
                                             OpStore %86 %82 
                               f32_4 %87 = OpLoad %29 
                               f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                 f32 %89 = OpDot %88 %81 
                        Private f32* %91 = OpAccessChain %29 %90 
                                             OpStore %91 %89 
                 read_only Texture2D %92 = OpLoad %54 
                             sampler %93 = OpLoad %58 
          read_only Texture2DSampled %94 = OpSampledImage %92 %93 
                               f32_4 %95 = OpLoad %9 
                               f32_2 %96 = OpVectorShuffle %95 %95 2 3 
                               f32_4 %97 = OpImageSampleImplicitLod %94 %96 
                               f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                               f32_4 %99 = OpLoad %37 
                              f32_4 %100 = OpVectorShuffle %99 %98 4 5 6 3 
                                             OpStore %37 %100 
                read_only Texture2D %101 = OpLoad %54 
                            sampler %102 = OpLoad %58 
         read_only Texture2DSampled %103 = OpSampledImage %101 %102 
                              f32_4 %104 = OpLoad %9 
                              f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                              f32_4 %106 = OpImageSampleImplicitLod %103 %105 
                              f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                              f32_4 %108 = OpLoad %9 
                              f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                             OpStore %9 %109 
                              f32_4 %110 = OpLoad %9 
                              f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                f32 %112 = OpDot %111 %81 
                       Private f32* %113 = OpAccessChain %9 %90 
                                             OpStore %113 %112 
                              f32_4 %114 = OpLoad %37 
                              f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                f32 %116 = OpDot %115 %81 
                       Private f32* %118 = OpAccessChain %9 %117 
                                             OpStore %118 %116 
                              f32_4 %119 = OpLoad %9 
                              f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                              f32_2 %121 = OpFNegate %120 
                              f32_4 %122 = OpLoad %29 
                              f32_2 %123 = OpVectorShuffle %122 %122 3 0 
                              f32_2 %124 = OpFAdd %121 %123 
                              f32_4 %125 = OpLoad %9 
                              f32_4 %126 = OpVectorShuffle %125 %124 4 5 2 3 
                                             OpStore %9 %126 
                       Private f32* %127 = OpAccessChain %9 %90 
                                f32 %128 = OpLoad %127 
                                f32 %129 = OpExtInst %1 4 %128 
                       Private f32* %130 = OpAccessChain %9 %117 
                                f32 %131 = OpLoad %130 
                                f32 %132 = OpExtInst %1 4 %131 
                                f32 %133 = OpExtInst %1 40 %129 %132 
                       Private f32* %134 = OpAccessChain %9 %90 
                                             OpStore %134 %133 
                       Private f32* %135 = OpAccessChain %9 %90 
                                f32 %136 = OpLoad %135 
                                f32 %137 = OpExtInst %1 32 %136 
                       Private f32* %138 = OpAccessChain %9 %90 
                                             OpStore %138 %137 
                       Private f32* %139 = OpAccessChain %9 %90 
                                f32 %140 = OpLoad %139 
                                f32 %141 = OpFDiv %30 %140 
                       Private f32* %142 = OpAccessChain %9 %90 
                                             OpStore %142 %141 
                              f32_4 %145 = OpLoad %9 
                              f32_3 %146 = OpVectorShuffle %145 %145 0 0 0 
                              f32_3 %151 = OpFMul %146 %150 
                              f32_3 %156 = OpFAdd %151 %155 
                              f32_4 %157 = OpLoad %144 
                              f32_4 %158 = OpVectorShuffle %157 %156 4 5 6 3 
                                             OpStore %144 %158 
                        Output f32* %160 = OpAccessChain %144 %84 
                                             OpStore %160 %30 
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