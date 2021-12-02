//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/FX_EarthQuake" {
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
  GpuProgramID 4365
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
vec4 u_xlat0;
vec2 u_xlat1;
float u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = _Value * _TimeX;
    u_xlat0.x = trunc(u_xlat0.x);
    u_xlat2 = u_xlat0.x + 23.0;
    u_xlat0.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat2 = dot(vec2(u_xlat2), vec2(12.9898005, 78.2330017));
    u_xlat2 = sin(u_xlat2);
    u_xlat0.y = u_xlat2 * 43758.5469;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = _Value3 * u_xlat0.y + u_xlat4.y;
    u_xlat0.x = _Value2 * u_xlat0.x + u_xlat4.x;
    u_xlat1.x = (-_Value2) * 0.5 + u_xlat0.x;
    u_xlat1.y = (-_Value3) * 0.5 + u_xlat2;
    u_xlat0 = texture(_MainTex, u_xlat1.xy);
    SV_Target0.xyz = u_xlat0.xyz;
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
; Bound: 141
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %70 %132 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpMemberDecorate %11 0 Offset 11 
                                                     OpMemberDecorate %11 1 Offset 11 
                                                     OpMemberDecorate %11 2 Offset 11 
                                                     OpMemberDecorate %11 3 Offset 11 
                                                     OpMemberDecorate %11 4 Offset 11 
                                                     OpDecorate %11 Block 
                                                     OpDecorate %13 DescriptorSet 13 
                                                     OpDecorate %13 Binding 13 
                                                     OpDecorate vs_TEXCOORD0 Location 70 
                                                     OpDecorate %120 DescriptorSet 120 
                                                     OpDecorate %120 Binding 120 
                                                     OpDecorate %124 DescriptorSet 124 
                                                     OpDecorate %124 Binding 124 
                                                     OpDecorate %132 Location 132 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 3 
                                              %8 = OpTypePointer Private %7 
                               Private f32_3* %9 = OpVariable Private 
                                             %10 = OpTypeVector %6 4 
                                             %11 = OpTypeStruct %6 %6 %6 %6 %10 
                                             %12 = OpTypePointer Uniform %11 
Uniform struct {f32; f32; f32; f32; f32_4;}* %13 = OpVariable Uniform 
                                             %14 = OpTypeInt 32 1 
                                         i32 %15 = OpConstant 1 
                                             %16 = OpTypePointer Uniform %6 
                                         i32 %19 = OpConstant 0 
                                             %23 = OpTypeInt 32 0 
                                         u32 %24 = OpConstant 0 
                                             %25 = OpTypePointer Private %6 
                                Private f32* %31 = OpVariable Private 
                                         f32 %34 = OpConstant 3.674022E-40 
                                             %36 = OpTypeVector %6 2 
                                         f32 %39 = OpConstant 3.674022E-40 
                                         f32 %40 = OpConstant 3.674022E-40 
                                       f32_2 %41 = OpConstantComposite %39 %40 
                                         f32 %50 = OpConstant 3.674022E-40 
                                         u32 %60 = OpConstant 1 
                                             %67 = OpTypePointer Private %36 
                              Private f32_2* %68 = OpVariable Private 
                                             %69 = OpTypePointer Input %36 
                       Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                         i32 %72 = OpConstant 4 
                                             %73 = OpTypePointer Uniform %10 
                                         i32 %82 = OpConstant 3 
                                         i32 %91 = OpConstant 2 
                             Private f32_2* %101 = OpVariable Private 
                                        f32 %105 = OpConstant 3.674022E-40 
                                            %118 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %119 = OpTypePointer UniformConstant %118 
       UniformConstant read_only Texture2D* %120 = OpVariable UniformConstant 
                                            %122 = OpTypeSampler 
                                            %123 = OpTypePointer UniformConstant %122 
                   UniformConstant sampler* %124 = OpVariable UniformConstant 
                                            %126 = OpTypeSampledImage %118 
                                            %131 = OpTypePointer Output %10 
                              Output f32_4* %132 = OpVariable Output 
                                        f32 %136 = OpConstant 3.674022E-40 
                                        u32 %137 = OpConstant 3 
                                            %138 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                Uniform f32* %17 = OpAccessChain %13 %15 
                                         f32 %18 = OpLoad %17 
                                Uniform f32* %20 = OpAccessChain %13 %19 
                                         f32 %21 = OpLoad %20 
                                         f32 %22 = OpFMul %18 %21 
                                Private f32* %26 = OpAccessChain %9 %24 
                                                     OpStore %26 %22 
                                Private f32* %27 = OpAccessChain %9 %24 
                                         f32 %28 = OpLoad %27 
                                         f32 %29 = OpExtInst %1 3 %28 
                                Private f32* %30 = OpAccessChain %9 %24 
                                                     OpStore %30 %29 
                                Private f32* %32 = OpAccessChain %9 %24 
                                         f32 %33 = OpLoad %32 
                                         f32 %35 = OpFAdd %33 %34 
                                                     OpStore %31 %35 
                                       f32_3 %37 = OpLoad %9 
                                       f32_2 %38 = OpVectorShuffle %37 %37 0 0 
                                         f32 %42 = OpDot %38 %41 
                                Private f32* %43 = OpAccessChain %9 %24 
                                                     OpStore %43 %42 
                                Private f32* %44 = OpAccessChain %9 %24 
                                         f32 %45 = OpLoad %44 
                                         f32 %46 = OpExtInst %1 13 %45 
                                Private f32* %47 = OpAccessChain %9 %24 
                                                     OpStore %47 %46 
                                Private f32* %48 = OpAccessChain %9 %24 
                                         f32 %49 = OpLoad %48 
                                         f32 %51 = OpFMul %49 %50 
                                Private f32* %52 = OpAccessChain %9 %24 
                                                     OpStore %52 %51 
                                         f32 %53 = OpLoad %31 
                                       f32_2 %54 = OpCompositeConstruct %53 %53 
                                         f32 %55 = OpDot %54 %41 
                                                     OpStore %31 %55 
                                         f32 %56 = OpLoad %31 
                                         f32 %57 = OpExtInst %1 13 %56 
                                                     OpStore %31 %57 
                                         f32 %58 = OpLoad %31 
                                         f32 %59 = OpFMul %58 %50 
                                Private f32* %61 = OpAccessChain %9 %60 
                                                     OpStore %61 %59 
                                       f32_3 %62 = OpLoad %9 
                                       f32_2 %63 = OpVectorShuffle %62 %62 0 1 
                                       f32_2 %64 = OpExtInst %1 10 %63 
                                       f32_3 %65 = OpLoad %9 
                                       f32_3 %66 = OpVectorShuffle %65 %64 3 4 2 
                                                     OpStore %9 %66 
                                       f32_2 %71 = OpLoad vs_TEXCOORD0 
                              Uniform f32_4* %74 = OpAccessChain %13 %72 
                                       f32_4 %75 = OpLoad %74 
                                       f32_2 %76 = OpVectorShuffle %75 %75 0 1 
                                       f32_2 %77 = OpFMul %71 %76 
                              Uniform f32_4* %78 = OpAccessChain %13 %72 
                                       f32_4 %79 = OpLoad %78 
                                       f32_2 %80 = OpVectorShuffle %79 %79 2 3 
                                       f32_2 %81 = OpFAdd %77 %80 
                                                     OpStore %68 %81 
                                Uniform f32* %83 = OpAccessChain %13 %82 
                                         f32 %84 = OpLoad %83 
                                Private f32* %85 = OpAccessChain %9 %60 
                                         f32 %86 = OpLoad %85 
                                         f32 %87 = OpFMul %84 %86 
                                Private f32* %88 = OpAccessChain %68 %60 
                                         f32 %89 = OpLoad %88 
                                         f32 %90 = OpFAdd %87 %89 
                                                     OpStore %31 %90 
                                Uniform f32* %92 = OpAccessChain %13 %91 
                                         f32 %93 = OpLoad %92 
                                Private f32* %94 = OpAccessChain %9 %24 
                                         f32 %95 = OpLoad %94 
                                         f32 %96 = OpFMul %93 %95 
                                Private f32* %97 = OpAccessChain %68 %24 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFAdd %96 %98 
                               Private f32* %100 = OpAccessChain %9 %24 
                                                     OpStore %100 %99 
                               Uniform f32* %102 = OpAccessChain %13 %91 
                                        f32 %103 = OpLoad %102 
                                        f32 %104 = OpFNegate %103 
                                        f32 %106 = OpFMul %104 %105 
                               Private f32* %107 = OpAccessChain %9 %24 
                                        f32 %108 = OpLoad %107 
                                        f32 %109 = OpFAdd %106 %108 
                               Private f32* %110 = OpAccessChain %101 %24 
                                                     OpStore %110 %109 
                               Uniform f32* %111 = OpAccessChain %13 %82 
                                        f32 %112 = OpLoad %111 
                                        f32 %113 = OpFNegate %112 
                                        f32 %114 = OpFMul %113 %105 
                                        f32 %115 = OpLoad %31 
                                        f32 %116 = OpFAdd %114 %115 
                               Private f32* %117 = OpAccessChain %101 %60 
                                                     OpStore %117 %116 
                        read_only Texture2D %121 = OpLoad %120 
                                    sampler %125 = OpLoad %124 
                 read_only Texture2DSampled %127 = OpSampledImage %121 %125 
                                      f32_2 %128 = OpLoad %101 
                                      f32_4 %129 = OpImageSampleImplicitLod %127 %128 
                                      f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                                     OpStore %9 %130 
                                      f32_3 %133 = OpLoad %9 
                                      f32_4 %134 = OpLoad %132 
                                      f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
                                                     OpStore %132 %135 
                                Output f32* %139 = OpAccessChain %132 %137 
                                                     OpStore %139 %136 
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