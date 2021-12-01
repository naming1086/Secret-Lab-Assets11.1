//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Blend2Camera_PinLight" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_MainTex2 ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 51263
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
uniform 	float _Value;
uniform 	float _Value2;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _MainTex2;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
bvec3 u_xlatb1;
vec4 u_xlat2;
bvec3 u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
void main()
{
    u_xlat0.x = (-_Value2) + 1.0;
    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = texture(_MainTex2, u_xlat4.xy);
    u_xlat2 = texture(_MainTex, u_xlat4.xy);
    u_xlat4.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5);
    u_xlatb2.xyz = lessThan(u_xlat0.xyzx, u_xlat2.xyzx).xyz;
    u_xlat3.xyz = u_xlat0.xyz + u_xlat0.xyz;
    u_xlat2.x = (u_xlatb2.x) ? u_xlat3.x : u_xlat1.x;
    u_xlat2.y = (u_xlatb2.y) ? u_xlat3.y : u_xlat1.y;
    u_xlat2.z = (u_xlatb2.z) ? u_xlat3.z : u_xlat1.z;
    u_xlat3.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlatb1.xyz = lessThan(u_xlat1.xyzx, u_xlat3.xyzx).xyz;
    u_xlat1.x = (u_xlatb1.x) ? u_xlat3.x : u_xlat2.x;
    u_xlat1.y = (u_xlatb1.y) ? u_xlat3.y : u_xlat2.y;
    u_xlat1.z = (u_xlatb1.z) ? u_xlat3.z : u_xlat2.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    SV_Target0.xyz = vec3(vec3(_Value, _Value, _Value)) * u_xlat1.xyz + u_xlat0.xyz;
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
; Bound: 254
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %28 %231 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpMemberDecorate %12 0 Offset 12 
                                                  OpMemberDecorate %12 1 Offset 12 
                                                  OpMemberDecorate %12 2 Offset 12 
                                                  OpMemberDecorate %12 3 Offset 12 
                                                  OpDecorate %12 Block 
                                                  OpDecorate %14 DescriptorSet 14 
                                                  OpDecorate %14 Binding 14 
                                                  OpDecorate vs_TEXCOORD0 Location 28 
                                                  OpDecorate %64 DescriptorSet 64 
                                                  OpDecorate %64 Binding 64 
                                                  OpDecorate %68 DescriptorSet 68 
                                                  OpDecorate %68 Binding 68 
                                                  OpDecorate %76 DescriptorSet 76 
                                                  OpDecorate %76 Binding 76 
                                                  OpDecorate %78 DescriptorSet 78 
                                                  OpDecorate %78 Binding 78 
                                                  OpDecorate %231 Location 231 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeBool 
                                           %7 = OpTypePointer Private %6 
                             Private bool* %8 = OpVariable Private 
                                           %9 = OpTypeFloat 32 
                                          %10 = OpTypeVector %9 2 
                                          %11 = OpTypeVector %9 4 
                                          %12 = OpTypeStruct %9 %9 %10 %11 
                                          %13 = OpTypePointer Uniform %12 
Uniform struct {f32; f32; f32_2; f32_4;}* %14 = OpVariable Uniform 
                                          %15 = OpTypeInt 32 1 
                                      i32 %16 = OpConstant 2 
                                          %17 = OpTypeInt 32 0 
                                      u32 %18 = OpConstant 1 
                                          %19 = OpTypePointer Uniform %9 
                                      f32 %22 = OpConstant 3.674022E-40 
                                          %24 = OpTypeVector %9 3 
                                          %25 = OpTypePointer Private %24 
                           Private f32_3* %26 = OpVariable Private 
                                          %27 = OpTypePointer Input %10 
                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                      i32 %30 = OpConstant 3 
                                          %31 = OpTypePointer Uniform %11 
                                          %42 = OpTypePointer Private %9 
                             Private f32* %43 = OpVariable Private 
                                      f32 %47 = OpConstant 3.674022E-40 
                                          %50 = OpTypePointer Function %9 
                                      u32 %59 = OpConstant 2 
                           Private f32_3* %61 = OpVariable Private 
                                          %62 = OpTypeImage %9 Dim2D 0 0 0 1 Unknown 
                                          %63 = OpTypePointer UniformConstant %62 
     UniformConstant read_only Texture2D* %64 = OpVariable UniformConstant 
                                          %66 = OpTypeSampler 
                                          %67 = OpTypePointer UniformConstant %66 
                 UniformConstant sampler* %68 = OpVariable UniformConstant 
                                          %70 = OpTypeSampledImage %62 
     UniformConstant read_only Texture2D* %76 = OpVariable UniformConstant 
                 UniformConstant sampler* %78 = OpVariable UniformConstant 
                             Private f32* %89 = OpVariable Private 
                                      i32 %90 = OpConstant 1 
                           Private f32_3* %95 = OpVariable Private 
                                     f32 %118 = OpConstant 3.674022E-40 
                                   f32_3 %119 = OpConstantComposite %118 %118 %118 
                                         %121 = OpTypeVector %6 3 
                                         %122 = OpTypePointer Private %121 
                         Private bool_3* %123 = OpVariable Private 
                                         %128 = OpTypeVector %6 4 
                          Private f32_3* %131 = OpVariable Private 
                                     u32 %135 = OpConstant 0 
                                     f32 %173 = OpConstant 3.674022E-40 
                                   f32_3 %174 = OpConstantComposite %173 %173 %173 
                                     f32 %176 = OpConstant 3.674022E-40 
                                   f32_3 %177 = OpConstantComposite %176 %176 %176 
                         Private bool_3* %179 = OpVariable Private 
                                         %186 = OpTypePointer Function %24 
                                         %230 = OpTypePointer Output %11 
                           Output f32_4* %231 = OpVariable Output 
                                     i32 %232 = OpConstant 0 
                                     u32 %250 = OpConstant 3 
                                         %251 = OpTypePointer Output %9 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                            Function f32* %51 = OpVariable Function 
                           Function f32* %138 = OpVariable Function 
                           Function f32* %150 = OpVariable Function 
                           Function f32* %162 = OpVariable Function 
                         Function f32_3* %187 = OpVariable Function 
                           Function f32* %191 = OpVariable Function 
                           Function f32* %203 = OpVariable Function 
                           Function f32* %215 = OpVariable Function 
                             Uniform f32* %20 = OpAccessChain %14 %16 %18 
                                      f32 %21 = OpLoad %20 
                                     bool %23 = OpFOrdLessThan %21 %22 
                                                  OpStore %8 %23 
                                    f32_2 %29 = OpLoad vs_TEXCOORD0 
                           Uniform f32_4* %32 = OpAccessChain %14 %30 
                                    f32_4 %33 = OpLoad %32 
                                    f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                    f32_2 %35 = OpFMul %29 %34 
                           Uniform f32_4* %36 = OpAccessChain %14 %30 
                                    f32_4 %37 = OpLoad %36 
                                    f32_2 %38 = OpVectorShuffle %37 %37 2 3 
                                    f32_2 %39 = OpFAdd %35 %38 
                                    f32_3 %40 = OpLoad %26 
                                    f32_3 %41 = OpVectorShuffle %40 %39 3 4 2 
                                                  OpStore %26 %41 
                             Private f32* %44 = OpAccessChain %26 %18 
                                      f32 %45 = OpLoad %44 
                                      f32 %46 = OpFNegate %45 
                                      f32 %48 = OpFAdd %46 %47 
                                                  OpStore %43 %48 
                                     bool %49 = OpLoad %8 
                                                  OpSelectionMerge %53 None 
                                                  OpBranchConditional %49 %52 %55 
                                          %52 = OpLabel 
                                      f32 %54 = OpLoad %43 
                                                  OpStore %51 %54 
                                                  OpBranch %53 
                                          %55 = OpLabel 
                             Private f32* %56 = OpAccessChain %26 %18 
                                      f32 %57 = OpLoad %56 
                                                  OpStore %51 %57 
                                                  OpBranch %53 
                                          %53 = OpLabel 
                                      f32 %58 = OpLoad %51 
                             Private f32* %60 = OpAccessChain %26 %59 
                                                  OpStore %60 %58 
                      read_only Texture2D %65 = OpLoad %64 
                                  sampler %69 = OpLoad %68 
               read_only Texture2DSampled %71 = OpSampledImage %65 %69 
                                    f32_3 %72 = OpLoad %26 
                                    f32_2 %73 = OpVectorShuffle %72 %72 0 2 
                                    f32_4 %74 = OpImageSampleImplicitLod %71 %73 
                                    f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                                  OpStore %61 %75 
                      read_only Texture2D %77 = OpLoad %76 
                                  sampler %79 = OpLoad %78 
               read_only Texture2DSampled %80 = OpSampledImage %77 %79 
                                    f32_3 %81 = OpLoad %26 
                                    f32_2 %82 = OpVectorShuffle %81 %81 0 1 
                                    f32_4 %83 = OpImageSampleImplicitLod %80 %82 
                                    f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                                  OpStore %26 %84 
                                    f32_3 %85 = OpLoad %61 
                                    f32_3 %86 = OpLoad %26 
                                    f32_3 %87 = OpFNegate %86 
                                    f32_3 %88 = OpFAdd %85 %87 
                                                  OpStore %61 %88 
                             Uniform f32* %91 = OpAccessChain %14 %90 
                                      f32 %92 = OpLoad %91 
                                      f32 %93 = OpFNegate %92 
                                      f32 %94 = OpFAdd %93 %47 
                                                  OpStore %89 %94 
                                      f32 %96 = OpLoad %89 
                                    f32_3 %97 = OpCompositeConstruct %96 %96 %96 
                                    f32_3 %98 = OpLoad %61 
                                    f32_3 %99 = OpFMul %97 %98 
                                   f32_3 %100 = OpLoad %26 
                                   f32_3 %101 = OpFAdd %99 %100 
                                                  OpStore %95 %101 
                            Uniform f32* %102 = OpAccessChain %14 %90 
                                     f32 %103 = OpLoad %102 
                            Uniform f32* %104 = OpAccessChain %14 %90 
                                     f32 %105 = OpLoad %104 
                            Uniform f32* %106 = OpAccessChain %14 %90 
                                     f32 %107 = OpLoad %106 
                                   f32_3 %108 = OpCompositeConstruct %103 %105 %107 
                                     f32 %109 = OpCompositeExtract %108 0 
                                     f32 %110 = OpCompositeExtract %108 1 
                                     f32 %111 = OpCompositeExtract %108 2 
                                   f32_3 %112 = OpCompositeConstruct %109 %110 %111 
                                   f32_3 %113 = OpLoad %61 
                                   f32_3 %114 = OpFMul %112 %113 
                                   f32_3 %115 = OpLoad %26 
                                   f32_3 %116 = OpFAdd %114 %115 
                                                  OpStore %61 %116 
                                   f32_3 %117 = OpLoad %95 
                                   f32_3 %120 = OpFMul %117 %119 
                                                  OpStore %26 %120 
                                   f32_3 %124 = OpLoad %61 
                                   f32_4 %125 = OpVectorShuffle %124 %124 0 1 2 0 
                                   f32_3 %126 = OpLoad %26 
                                   f32_4 %127 = OpVectorShuffle %126 %126 0 1 2 0 
                                  bool_4 %129 = OpFOrdLessThan %125 %127 
                                  bool_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                                  OpStore %123 %130 
                                   f32_3 %132 = OpLoad %61 
                                   f32_3 %133 = OpLoad %61 
                                   f32_3 %134 = OpFAdd %132 %133 
                                                  OpStore %131 %134 
                           Private bool* %136 = OpAccessChain %123 %135 
                                    bool %137 = OpLoad %136 
                                                  OpSelectionMerge %140 None 
                                                  OpBranchConditional %137 %139 %143 
                                         %139 = OpLabel 
                            Private f32* %141 = OpAccessChain %131 %135 
                                     f32 %142 = OpLoad %141 
                                                  OpStore %138 %142 
                                                  OpBranch %140 
                                         %143 = OpLabel 
                            Private f32* %144 = OpAccessChain %95 %135 
                                     f32 %145 = OpLoad %144 
                                                  OpStore %138 %145 
                                                  OpBranch %140 
                                         %140 = OpLabel 
                                     f32 %146 = OpLoad %138 
                            Private f32* %147 = OpAccessChain %26 %135 
                                                  OpStore %147 %146 
                           Private bool* %148 = OpAccessChain %123 %18 
                                    bool %149 = OpLoad %148 
                                                  OpSelectionMerge %152 None 
                                                  OpBranchConditional %149 %151 %155 
                                         %151 = OpLabel 
                            Private f32* %153 = OpAccessChain %131 %18 
                                     f32 %154 = OpLoad %153 
                                                  OpStore %150 %154 
                                                  OpBranch %152 
                                         %155 = OpLabel 
                            Private f32* %156 = OpAccessChain %95 %18 
                                     f32 %157 = OpLoad %156 
                                                  OpStore %150 %157 
                                                  OpBranch %152 
                                         %152 = OpLabel 
                                     f32 %158 = OpLoad %150 
                            Private f32* %159 = OpAccessChain %26 %18 
                                                  OpStore %159 %158 
                           Private bool* %160 = OpAccessChain %123 %59 
                                    bool %161 = OpLoad %160 
                                                  OpSelectionMerge %164 None 
                                                  OpBranchConditional %161 %163 %167 
                                         %163 = OpLabel 
                            Private f32* %165 = OpAccessChain %131 %59 
                                     f32 %166 = OpLoad %165 
                                                  OpStore %162 %166 
                                                  OpBranch %164 
                                         %167 = OpLabel 
                            Private f32* %168 = OpAccessChain %95 %59 
                                     f32 %169 = OpLoad %168 
                                                  OpStore %162 %169 
                                                  OpBranch %164 
                                         %164 = OpLabel 
                                     f32 %170 = OpLoad %162 
                            Private f32* %171 = OpAccessChain %26 %59 
                                                  OpStore %171 %170 
                                   f32_3 %172 = OpLoad %61 
                                   f32_3 %175 = OpFMul %172 %174 
                                   f32_3 %178 = OpFAdd %175 %177 
                                                  OpStore %131 %178 
                                   f32_3 %180 = OpLoad %95 
                                   f32_4 %181 = OpVectorShuffle %180 %180 0 1 2 0 
                                   f32_3 %182 = OpLoad %131 
                                   f32_4 %183 = OpVectorShuffle %182 %182 0 1 2 0 
                                  bool_4 %184 = OpFOrdLessThan %181 %183 
                                  bool_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                                  OpStore %179 %185 
                                   f32_3 %188 = OpLoad %26 
                                                  OpStore %187 %188 
                           Private bool* %189 = OpAccessChain %179 %135 
                                    bool %190 = OpLoad %189 
                                                  OpSelectionMerge %193 None 
                                                  OpBranchConditional %190 %192 %196 
                                         %192 = OpLabel 
                            Private f32* %194 = OpAccessChain %131 %135 
                                     f32 %195 = OpLoad %194 
                                                  OpStore %191 %195 
                                                  OpBranch %193 
                                         %196 = OpLabel 
                            Private f32* %197 = OpAccessChain %26 %135 
                                     f32 %198 = OpLoad %197 
                                                  OpStore %191 %198 
                                                  OpBranch %193 
                                         %193 = OpLabel 
                                     f32 %199 = OpLoad %191 
                           Function f32* %200 = OpAccessChain %187 %135 
                                                  OpStore %200 %199 
                           Private bool* %201 = OpAccessChain %179 %18 
                                    bool %202 = OpLoad %201 
                                                  OpSelectionMerge %205 None 
                                                  OpBranchConditional %202 %204 %208 
                                         %204 = OpLabel 
                            Private f32* %206 = OpAccessChain %131 %18 
                                     f32 %207 = OpLoad %206 
                                                  OpStore %203 %207 
                                                  OpBranch %205 
                                         %208 = OpLabel 
                            Private f32* %209 = OpAccessChain %26 %18 
                                     f32 %210 = OpLoad %209 
                                                  OpStore %203 %210 
                                                  OpBranch %205 
                                         %205 = OpLabel 
                                     f32 %211 = OpLoad %203 
                           Function f32* %212 = OpAccessChain %187 %18 
                                                  OpStore %212 %211 
                           Private bool* %213 = OpAccessChain %179 %59 
                                    bool %214 = OpLoad %213 
                                                  OpSelectionMerge %217 None 
                                                  OpBranchConditional %214 %216 %220 
                                         %216 = OpLabel 
                            Private f32* %218 = OpAccessChain %131 %59 
                                     f32 %219 = OpLoad %218 
                                                  OpStore %215 %219 
                                                  OpBranch %217 
                                         %220 = OpLabel 
                            Private f32* %221 = OpAccessChain %26 %59 
                                     f32 %222 = OpLoad %221 
                                                  OpStore %215 %222 
                                                  OpBranch %217 
                                         %217 = OpLabel 
                                     f32 %223 = OpLoad %215 
                           Function f32* %224 = OpAccessChain %187 %59 
                                                  OpStore %224 %223 
                                   f32_3 %225 = OpLoad %187 
                                                  OpStore %26 %225 
                                   f32_3 %226 = OpLoad %61 
                                   f32_3 %227 = OpFNegate %226 
                                   f32_3 %228 = OpLoad %26 
                                   f32_3 %229 = OpFAdd %227 %228 
                                                  OpStore %26 %229 
                            Uniform f32* %233 = OpAccessChain %14 %232 
                                     f32 %234 = OpLoad %233 
                            Uniform f32* %235 = OpAccessChain %14 %232 
                                     f32 %236 = OpLoad %235 
                            Uniform f32* %237 = OpAccessChain %14 %232 
                                     f32 %238 = OpLoad %237 
                                   f32_3 %239 = OpCompositeConstruct %234 %236 %238 
                                     f32 %240 = OpCompositeExtract %239 0 
                                     f32 %241 = OpCompositeExtract %239 1 
                                     f32 %242 = OpCompositeExtract %239 2 
                                   f32_3 %243 = OpCompositeConstruct %240 %241 %242 
                                   f32_3 %244 = OpLoad %26 
                                   f32_3 %245 = OpFMul %243 %244 
                                   f32_3 %246 = OpLoad %61 
                                   f32_3 %247 = OpFAdd %245 %246 
                                   f32_4 %248 = OpLoad %231 
                                   f32_4 %249 = OpVectorShuffle %248 %247 4 5 6 3 
                                                  OpStore %231 %249 
                             Output f32* %252 = OpAccessChain %231 %250 
                                                  OpStore %252 %47 
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