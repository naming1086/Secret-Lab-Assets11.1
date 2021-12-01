//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Colors_Adjust_PreFilters" {
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
  GpuProgramID 1829
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
uniform 	float _Red_R;
uniform 	float _Red_G;
uniform 	float _Red_B;
uniform 	float _Green_R;
uniform 	float _Green_G;
uniform 	float _Green_B;
uniform 	float _Blue_R;
uniform 	float _Blue_G;
uniform 	float _Blue_B;
uniform 	float _Red_C;
uniform 	float _Green_C;
uniform 	float _Blue_C;
uniform 	float _FadeFX;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Blue_R;
    u_xlat0.yz = vec2(_Blue_G, _Blue_B);
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.z = u_xlat0.x + _Blue_C;
    u_xlat6 = dot(u_xlat1.xyz, vec3(_Red_R, _Red_G, _Red_B));
    u_xlat0.x = u_xlat6 + _Red_C;
    u_xlat6 = dot(u_xlat1.xyz, vec3(_Green_R, _Green_G, _Green_B));
    u_xlat0.y = u_xlat6 + _Green_C;
    u_xlat0.xyz = (-u_xlat1.xyz) + u_xlat0.xyz;
    SV_Target0.xyz = vec3(vec3(_FadeFX, _FadeFX, _FadeFX)) * u_xlat0.xyz + u_xlat1.xyz;
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
; Bound: 142
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %35 %118 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpMemberDecorate %11 0 Offset 11 
                                                      OpMemberDecorate %11 1 Offset 11 
                                                      OpMemberDecorate %11 2 Offset 11 
                                                      OpMemberDecorate %11 3 Offset 11 
                                                      OpMemberDecorate %11 4 Offset 11 
                                                      OpMemberDecorate %11 5 Offset 11 
                                                      OpMemberDecorate %11 6 Offset 11 
                                                      OpMemberDecorate %11 7 Offset 11 
                                                      OpMemberDecorate %11 8 Offset 11 
                                                      OpMemberDecorate %11 9 Offset 11 
                                                      OpMemberDecorate %11 10 Offset 11 
                                                      OpMemberDecorate %11 11 Offset 11 
                                                      OpMemberDecorate %11 12 Offset 11 
                                                      OpMemberDecorate %11 13 Offset 11 
                                                      OpDecorate %11 Block 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate vs_TEXCOORD0 Location 35 
                                                      OpDecorate %51 DescriptorSet 51 
                                                      OpDecorate %51 Binding 51 
                                                      OpDecorate %55 DescriptorSet 55 
                                                      OpDecorate %55 Binding 55 
                                                      OpDecorate %118 Location 118 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 4 
                                              %11 = OpTypeStruct %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %10 
                                              %12 = OpTypePointer Uniform %11 
Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %13 = OpVariable Uniform 
                                              %14 = OpTypeInt 32 1 
                                          i32 %15 = OpConstant 6 
                                              %16 = OpTypePointer Uniform %6 
                                              %19 = OpTypeInt 32 0 
                                          u32 %20 = OpConstant 0 
                                              %21 = OpTypePointer Private %6 
                                          i32 %23 = OpConstant 7 
                                          i32 %26 = OpConstant 8 
                                              %29 = OpTypeVector %6 2 
                               Private f32_3* %33 = OpVariable Private 
                                              %34 = OpTypePointer Input %29 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          i32 %37 = OpConstant 13 
                                              %38 = OpTypePointer Uniform %10 
                                              %49 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %50 = OpTypePointer UniformConstant %49 
         UniformConstant read_only Texture2D* %51 = OpVariable UniformConstant 
                                              %53 = OpTypeSampler 
                                              %54 = OpTypePointer UniformConstant %53 
                     UniformConstant sampler* %55 = OpVariable UniformConstant 
                                              %57 = OpTypeSampledImage %49 
                                          i32 %69 = OpConstant 11 
                                          u32 %73 = OpConstant 2 
                                 Private f32* %75 = OpVariable Private 
                                          i32 %77 = OpConstant 0 
                                          i32 %80 = OpConstant 1 
                                          i32 %83 = OpConstant 2 
                                          i32 %89 = OpConstant 9 
                                          i32 %95 = OpConstant 3 
                                          i32 %98 = OpConstant 4 
                                         i32 %101 = OpConstant 5 
                                         i32 %107 = OpConstant 10 
                                         u32 %111 = OpConstant 1 
                                             %117 = OpTypePointer Output %10 
                               Output f32_4* %118 = OpVariable Output 
                                         i32 %119 = OpConstant 12 
                                         f32 %137 = OpConstant 3.674022E-40 
                                         u32 %138 = OpConstant 3 
                                             %139 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %17 = OpAccessChain %13 %15 
                                          f32 %18 = OpLoad %17 
                                 Private f32* %22 = OpAccessChain %9 %20 
                                                      OpStore %22 %18 
                                 Uniform f32* %24 = OpAccessChain %13 %23 
                                          f32 %25 = OpLoad %24 
                                 Uniform f32* %27 = OpAccessChain %13 %26 
                                          f32 %28 = OpLoad %27 
                                        f32_2 %30 = OpCompositeConstruct %25 %28 
                                        f32_3 %31 = OpLoad %9 
                                        f32_3 %32 = OpVectorShuffle %31 %30 0 3 4 
                                                      OpStore %9 %32 
                                        f32_2 %36 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %39 = OpAccessChain %13 %37 
                                        f32_4 %40 = OpLoad %39 
                                        f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                        f32_2 %42 = OpFMul %36 %41 
                               Uniform f32_4* %43 = OpAccessChain %13 %37 
                                        f32_4 %44 = OpLoad %43 
                                        f32_2 %45 = OpVectorShuffle %44 %44 2 3 
                                        f32_2 %46 = OpFAdd %42 %45 
                                        f32_3 %47 = OpLoad %33 
                                        f32_3 %48 = OpVectorShuffle %47 %46 3 4 2 
                                                      OpStore %33 %48 
                          read_only Texture2D %52 = OpLoad %51 
                                      sampler %56 = OpLoad %55 
                   read_only Texture2DSampled %58 = OpSampledImage %52 %56 
                                        f32_3 %59 = OpLoad %33 
                                        f32_2 %60 = OpVectorShuffle %59 %59 0 1 
                                        f32_4 %61 = OpImageSampleImplicitLod %58 %60 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                                      OpStore %33 %62 
                                        f32_3 %63 = OpLoad %33 
                                        f32_3 %64 = OpLoad %9 
                                          f32 %65 = OpDot %63 %64 
                                 Private f32* %66 = OpAccessChain %9 %20 
                                                      OpStore %66 %65 
                                 Private f32* %67 = OpAccessChain %9 %20 
                                          f32 %68 = OpLoad %67 
                                 Uniform f32* %70 = OpAccessChain %13 %69 
                                          f32 %71 = OpLoad %70 
                                          f32 %72 = OpFAdd %68 %71 
                                 Private f32* %74 = OpAccessChain %9 %73 
                                                      OpStore %74 %72 
                                        f32_3 %76 = OpLoad %33 
                                 Uniform f32* %78 = OpAccessChain %13 %77 
                                          f32 %79 = OpLoad %78 
                                 Uniform f32* %81 = OpAccessChain %13 %80 
                                          f32 %82 = OpLoad %81 
                                 Uniform f32* %84 = OpAccessChain %13 %83 
                                          f32 %85 = OpLoad %84 
                                        f32_3 %86 = OpCompositeConstruct %79 %82 %85 
                                          f32 %87 = OpDot %76 %86 
                                                      OpStore %75 %87 
                                          f32 %88 = OpLoad %75 
                                 Uniform f32* %90 = OpAccessChain %13 %89 
                                          f32 %91 = OpLoad %90 
                                          f32 %92 = OpFAdd %88 %91 
                                 Private f32* %93 = OpAccessChain %9 %20 
                                                      OpStore %93 %92 
                                        f32_3 %94 = OpLoad %33 
                                 Uniform f32* %96 = OpAccessChain %13 %95 
                                          f32 %97 = OpLoad %96 
                                 Uniform f32* %99 = OpAccessChain %13 %98 
                                         f32 %100 = OpLoad %99 
                                Uniform f32* %102 = OpAccessChain %13 %101 
                                         f32 %103 = OpLoad %102 
                                       f32_3 %104 = OpCompositeConstruct %97 %100 %103 
                                         f32 %105 = OpDot %94 %104 
                                                      OpStore %75 %105 
                                         f32 %106 = OpLoad %75 
                                Uniform f32* %108 = OpAccessChain %13 %107 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpFAdd %106 %109 
                                Private f32* %112 = OpAccessChain %9 %111 
                                                      OpStore %112 %110 
                                       f32_3 %113 = OpLoad %33 
                                       f32_3 %114 = OpFNegate %113 
                                       f32_3 %115 = OpLoad %9 
                                       f32_3 %116 = OpFAdd %114 %115 
                                                      OpStore %9 %116 
                                Uniform f32* %120 = OpAccessChain %13 %119 
                                         f32 %121 = OpLoad %120 
                                Uniform f32* %122 = OpAccessChain %13 %119 
                                         f32 %123 = OpLoad %122 
                                Uniform f32* %124 = OpAccessChain %13 %119 
                                         f32 %125 = OpLoad %124 
                                       f32_3 %126 = OpCompositeConstruct %121 %123 %125 
                                         f32 %127 = OpCompositeExtract %126 0 
                                         f32 %128 = OpCompositeExtract %126 1 
                                         f32 %129 = OpCompositeExtract %126 2 
                                       f32_3 %130 = OpCompositeConstruct %127 %128 %129 
                                       f32_3 %131 = OpLoad %9 
                                       f32_3 %132 = OpFMul %130 %131 
                                       f32_3 %133 = OpLoad %33 
                                       f32_3 %134 = OpFAdd %132 %133 
                                       f32_4 %135 = OpLoad %118 
                                       f32_4 %136 = OpVectorShuffle %135 %134 4 5 6 3 
                                                      OpStore %118 %136 
                                 Output f32* %140 = OpAccessChain %118 %138 
                                                      OpStore %140 %137 
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