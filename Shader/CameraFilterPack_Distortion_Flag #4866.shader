//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Distortion_Flag" {
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
  GpuProgramID 29582
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
uniform 	float _Distortion;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec2 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx * _MainTex_ST.yx + _MainTex_ST.wz;
    u_xlat6.xy = u_xlat0.xy + vec2(_TimeX);
    u_xlat1.xy = u_xlat6.yy * vec2(10.0, 30.0);
    u_xlat2 = u_xlat6.xxxx * vec4(4.0, 8.0, 40.0, 5.0);
    u_xlat2 = sin(u_xlat2);
    u_xlat6.xy = sin(u_xlat1.xy);
    u_xlat6.x = u_xlat6.x * 0.0100000007;
    u_xlat6.x = u_xlat2.w * 0.0500000007 + u_xlat6.x;
    u_xlat6.x = u_xlat6.y * 0.00400000019 + u_xlat6.x;
    u_xlat1.y = _Distortion * u_xlat6.x + u_xlat0.x;
    u_xlat0.xz = u_xlat2.xy * vec2(0.0265999995, 0.00300000003);
    u_xlat0.x = u_xlat0.z + u_xlat0.x;
    u_xlat0.x = u_xlat2.z * 0.00250000018 + u_xlat0.x;
    u_xlat1.x = _Distortion * u_xlat0.x + u_xlat0.y;
    u_xlat0.xy = u_xlat1.xy + vec2(0.109999999, 0.109999999);
    u_xlat0.xy = u_xlat0.xy * vec2(0.790000021, 0.790000021);
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
; Bound: 160
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %12 %145 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD0 Location 12 
                                              OpMemberDecorate %16 0 Offset 16 
                                              OpMemberDecorate %16 1 Offset 16 
                                              OpMemberDecorate %16 2 Offset 16 
                                              OpDecorate %16 Block 
                                              OpDecorate %18 DescriptorSet 18 
                                              OpDecorate %18 Binding 18 
                                              OpDecorate %145 Location 145 
                                              OpDecorate %148 DescriptorSet 148 
                                              OpDecorate %148 Binding 148 
                                              OpDecorate %152 DescriptorSet 152 
                                              OpDecorate %152 Binding 152 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 3 
                                       %8 = OpTypePointer Private %7 
                        Private f32_3* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 2 
                                      %11 = OpTypePointer Input %10 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                      %15 = OpTypeVector %6 4 
                                      %16 = OpTypeStruct %6 %6 %15 
                                      %17 = OpTypePointer Uniform %16 
   Uniform struct {f32; f32; f32_4;}* %18 = OpVariable Uniform 
                                      %19 = OpTypeInt 32 1 
                                  i32 %20 = OpConstant 2 
                                      %21 = OpTypePointer Uniform %15 
                                      %32 = OpTypePointer Private %10 
                       Private f32_2* %33 = OpVariable Private 
                                  i32 %36 = OpConstant 0 
                                      %37 = OpTypePointer Uniform %6 
                       Private f32_2* %42 = OpVariable Private 
                                  f32 %45 = OpConstant 3.674022E-40 
                                  f32 %46 = OpConstant 3.674022E-40 
                                f32_2 %47 = OpConstantComposite %45 %46 
                                      %49 = OpTypePointer Private %15 
                       Private f32_4* %50 = OpVariable Private 
                                  f32 %53 = OpConstant 3.674022E-40 
                                  f32 %54 = OpConstant 3.674022E-40 
                                  f32 %55 = OpConstant 3.674022E-40 
                                  f32 %56 = OpConstant 3.674022E-40 
                                f32_4 %57 = OpConstantComposite %53 %54 %55 %56 
                                      %63 = OpTypeInt 32 0 
                                  u32 %64 = OpConstant 0 
                                      %65 = OpTypePointer Private %6 
                                  f32 %68 = OpConstant 3.674022E-40 
                                  u32 %71 = OpConstant 3 
                                  f32 %74 = OpConstant 3.674022E-40 
                                  u32 %80 = OpConstant 1 
                                  f32 %83 = OpConstant 3.674022E-40 
                                  i32 %89 = OpConstant 1 
                                 f32 %101 = OpConstant 3.674022E-40 
                                 f32 %102 = OpConstant 3.674022E-40 
                               f32_2 %103 = OpConstantComposite %101 %102 
                                 u32 %107 = OpConstant 2 
                                 f32 %116 = OpConstant 3.674022E-40 
                                 f32 %132 = OpConstant 3.674022E-40 
                               f32_2 %133 = OpConstantComposite %132 %132 
                                 f32 %139 = OpConstant 3.674022E-40 
                               f32_2 %140 = OpConstantComposite %139 %139 
                                     %144 = OpTypePointer Output %15 
                       Output f32_4* %145 = OpVariable Output 
                                     %146 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %147 = OpTypePointer UniformConstant %146 
UniformConstant read_only Texture2D* %148 = OpVariable UniformConstant 
                                     %150 = OpTypeSampler 
                                     %151 = OpTypePointer UniformConstant %150 
            UniformConstant sampler* %152 = OpVariable UniformConstant 
                                     %154 = OpTypeSampledImage %146 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_2 %13 = OpLoad vs_TEXCOORD0 
                                f32_2 %14 = OpVectorShuffle %13 %13 1 0 
                       Uniform f32_4* %22 = OpAccessChain %18 %20 
                                f32_4 %23 = OpLoad %22 
                                f32_2 %24 = OpVectorShuffle %23 %23 1 0 
                                f32_2 %25 = OpFMul %14 %24 
                       Uniform f32_4* %26 = OpAccessChain %18 %20 
                                f32_4 %27 = OpLoad %26 
                                f32_2 %28 = OpVectorShuffle %27 %27 3 2 
                                f32_2 %29 = OpFAdd %25 %28 
                                f32_3 %30 = OpLoad %9 
                                f32_3 %31 = OpVectorShuffle %30 %29 3 4 2 
                                              OpStore %9 %31 
                                f32_3 %34 = OpLoad %9 
                                f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                         Uniform f32* %38 = OpAccessChain %18 %36 
                                  f32 %39 = OpLoad %38 
                                f32_2 %40 = OpCompositeConstruct %39 %39 
                                f32_2 %41 = OpFAdd %35 %40 
                                              OpStore %33 %41 
                                f32_2 %43 = OpLoad %33 
                                f32_2 %44 = OpVectorShuffle %43 %43 1 1 
                                f32_2 %48 = OpFMul %44 %47 
                                              OpStore %42 %48 
                                f32_2 %51 = OpLoad %33 
                                f32_4 %52 = OpVectorShuffle %51 %51 0 0 0 0 
                                f32_4 %58 = OpFMul %52 %57 
                                              OpStore %50 %58 
                                f32_4 %59 = OpLoad %50 
                                f32_4 %60 = OpExtInst %1 13 %59 
                                              OpStore %50 %60 
                                f32_2 %61 = OpLoad %42 
                                f32_2 %62 = OpExtInst %1 13 %61 
                                              OpStore %33 %62 
                         Private f32* %66 = OpAccessChain %33 %64 
                                  f32 %67 = OpLoad %66 
                                  f32 %69 = OpFMul %67 %68 
                         Private f32* %70 = OpAccessChain %33 %64 
                                              OpStore %70 %69 
                         Private f32* %72 = OpAccessChain %50 %71 
                                  f32 %73 = OpLoad %72 
                                  f32 %75 = OpFMul %73 %74 
                         Private f32* %76 = OpAccessChain %33 %64 
                                  f32 %77 = OpLoad %76 
                                  f32 %78 = OpFAdd %75 %77 
                         Private f32* %79 = OpAccessChain %33 %64 
                                              OpStore %79 %78 
                         Private f32* %81 = OpAccessChain %33 %80 
                                  f32 %82 = OpLoad %81 
                                  f32 %84 = OpFMul %82 %83 
                         Private f32* %85 = OpAccessChain %33 %64 
                                  f32 %86 = OpLoad %85 
                                  f32 %87 = OpFAdd %84 %86 
                         Private f32* %88 = OpAccessChain %33 %64 
                                              OpStore %88 %87 
                         Uniform f32* %90 = OpAccessChain %18 %89 
                                  f32 %91 = OpLoad %90 
                         Private f32* %92 = OpAccessChain %33 %64 
                                  f32 %93 = OpLoad %92 
                                  f32 %94 = OpFMul %91 %93 
                         Private f32* %95 = OpAccessChain %9 %64 
                                  f32 %96 = OpLoad %95 
                                  f32 %97 = OpFAdd %94 %96 
                         Private f32* %98 = OpAccessChain %42 %80 
                                              OpStore %98 %97 
                                f32_4 %99 = OpLoad %50 
                               f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                               f32_2 %104 = OpFMul %100 %103 
                               f32_3 %105 = OpLoad %9 
                               f32_3 %106 = OpVectorShuffle %105 %104 3 1 4 
                                              OpStore %9 %106 
                        Private f32* %108 = OpAccessChain %9 %107 
                                 f32 %109 = OpLoad %108 
                        Private f32* %110 = OpAccessChain %9 %64 
                                 f32 %111 = OpLoad %110 
                                 f32 %112 = OpFAdd %109 %111 
                        Private f32* %113 = OpAccessChain %9 %64 
                                              OpStore %113 %112 
                        Private f32* %114 = OpAccessChain %50 %107 
                                 f32 %115 = OpLoad %114 
                                 f32 %117 = OpFMul %115 %116 
                        Private f32* %118 = OpAccessChain %9 %64 
                                 f32 %119 = OpLoad %118 
                                 f32 %120 = OpFAdd %117 %119 
                        Private f32* %121 = OpAccessChain %9 %64 
                                              OpStore %121 %120 
                        Uniform f32* %122 = OpAccessChain %18 %89 
                                 f32 %123 = OpLoad %122 
                        Private f32* %124 = OpAccessChain %9 %64 
                                 f32 %125 = OpLoad %124 
                                 f32 %126 = OpFMul %123 %125 
                        Private f32* %127 = OpAccessChain %9 %80 
                                 f32 %128 = OpLoad %127 
                                 f32 %129 = OpFAdd %126 %128 
                        Private f32* %130 = OpAccessChain %42 %64 
                                              OpStore %130 %129 
                               f32_2 %131 = OpLoad %42 
                               f32_2 %134 = OpFAdd %131 %133 
                               f32_3 %135 = OpLoad %9 
                               f32_3 %136 = OpVectorShuffle %135 %134 3 4 2 
                                              OpStore %9 %136 
                               f32_3 %137 = OpLoad %9 
                               f32_2 %138 = OpVectorShuffle %137 %137 0 1 
                               f32_2 %141 = OpFMul %138 %140 
                               f32_3 %142 = OpLoad %9 
                               f32_3 %143 = OpVectorShuffle %142 %141 3 4 2 
                                              OpStore %9 %143 
                 read_only Texture2D %149 = OpLoad %148 
                             sampler %153 = OpLoad %152 
          read_only Texture2DSampled %155 = OpSampledImage %149 %153 
                               f32_3 %156 = OpLoad %9 
                               f32_2 %157 = OpVectorShuffle %156 %156 0 1 
                               f32_4 %158 = OpImageSampleImplicitLod %155 %157 
                                              OpStore %145 %158 
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