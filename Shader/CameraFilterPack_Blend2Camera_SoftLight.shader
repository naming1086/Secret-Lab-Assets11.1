//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Blend2Camera_SoftLight" {
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
  GpuProgramID 3282
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
vec4 u_xlat2;
vec3 u_xlat3;
bvec3 u_xlatb3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
vec3 u_xlat6;
void main()
{
    u_xlat0.x = (-_Value2) + 1.0;
    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = texture(_MainTex2, u_xlat6.xy);
    u_xlat2 = texture(_MainTex, u_xlat6.xy);
    u_xlat6.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat2.xyz;
    u_xlat0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(16.0, 16.0, 16.0) + vec3(-12.0, -12.0, -12.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xyz + vec3(3.0, 3.0, 3.0);
    u_xlat3.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = u_xlat1.xyz * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat4.xyz = sqrt(u_xlat1.xyz);
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz + u_xlat1.xyz;
    u_xlatb4.xyz = lessThan(u_xlat1.xyzx, vec4(0.25, 0.25, 0.25, 0.0)).xyz;
    {
        vec4 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb4.x) ? u_xlat2.x : u_xlat3.x;
        hlslcc_movcTemp.y = (u_xlatb4.y) ? u_xlat2.y : u_xlat3.y;
        hlslcc_movcTemp.z = (u_xlatb4.z) ? u_xlat2.z : u_xlat3.z;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlatb3.xyz = lessThan(u_xlat0.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat4.xyz = (-u_xlat1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat0.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat1.xyz = (-u_xlat5.xyz) * u_xlat4.xyz + u_xlat1.xyz;
    {
        vec4 hlslcc_movcTemp = u_xlat1;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? u_xlat1.x : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? u_xlat1.y : u_xlat2.y;
        hlslcc_movcTemp.z = (u_xlatb3.z) ? u_xlat1.z : u_xlat2.z;
        u_xlat1 = hlslcc_movcTemp;
    }
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
; Bound: 301
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %28 %278 
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
                                                  OpDecorate %278 Location 278 
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
                                     f32 %121 = OpConstant 3.674022E-40 
                                   f32_3 %122 = OpConstantComposite %121 %121 %121 
                                     f32 %127 = OpConstant 3.674022E-40 
                                   f32_3 %128 = OpConstantComposite %127 %127 %127 
                          Private f32_3* %130 = OpVariable Private 
                                     f32 %132 = OpConstant 3.674022E-40 
                                   f32_3 %133 = OpConstantComposite %132 %132 %132 
                                     f32 %135 = OpConstant 3.674022E-40 
                                   f32_3 %136 = OpConstantComposite %135 %135 %135 
                          Private f32_3* %138 = OpVariable Private 
                                         %158 = OpTypeVector %6 3 
                                         %159 = OpTypePointer Private %158 
                         Private bool_3* %160 = OpVariable Private 
                                     f32 %163 = OpConstant 3.674022E-40 
                                   f32_4 %164 = OpConstantComposite %163 %163 %163 %22 
                                         %165 = OpTypeVector %6 4 
                                         %168 = OpTypePointer Function %24 
                                     u32 %171 = OpConstant 0 
                         Private bool_3* %209 = OpVariable Private 
                                     f32 %212 = OpConstant 3.674022E-40 
                                   f32_4 %213 = OpConstantComposite %212 %212 %212 %22 
                                   f32_3 %218 = OpConstantComposite %47 %47 %47 
                          Private f32_3* %220 = OpVariable Private 
                                         %277 = OpTypePointer Output %11 
                           Output f32_4* %278 = OpVariable Output 
                                     i32 %279 = OpConstant 0 
                                     u32 %297 = OpConstant 3 
                                         %298 = OpTypePointer Output %9 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                            Function f32* %51 = OpVariable Function 
                         Function f32_3* %169 = OpVariable Function 
                           Function f32* %174 = OpVariable Function 
                           Function f32* %186 = OpVariable Function 
                           Function f32* %198 = OpVariable Function 
                         Function f32_3* %234 = OpVariable Function 
                           Function f32* %238 = OpVariable Function 
                           Function f32* %250 = OpVariable Function 
                           Function f32* %262 = OpVariable Function 
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
                                   f32_3 %123 = OpFAdd %120 %122 
                                                  OpStore %26 %123 
                                   f32_3 %124 = OpLoad %26 
                                   f32_3 %125 = OpLoad %95 
                                   f32_3 %126 = OpFMul %124 %125 
                                   f32_3 %129 = OpFAdd %126 %128 
                                                  OpStore %26 %129 
                                   f32_3 %131 = OpLoad %61 
                                   f32_3 %134 = OpFMul %131 %133 
                                   f32_3 %137 = OpFAdd %134 %136 
                                                  OpStore %130 %137 
                                   f32_3 %139 = OpLoad %95 
                                   f32_3 %140 = OpLoad %130 
                                   f32_3 %141 = OpFMul %139 %140 
                                                  OpStore %138 %141 
                                   f32_3 %142 = OpLoad %138 
                                   f32_3 %143 = OpLoad %26 
                                   f32_3 %144 = OpFMul %142 %143 
                                   f32_3 %145 = OpLoad %95 
                                   f32_3 %146 = OpFAdd %144 %145 
                                                  OpStore %26 %146 
                                   f32_3 %147 = OpLoad %95 
                                   f32_3 %148 = OpExtInst %1 31 %147 
                                                  OpStore %138 %148 
                                   f32_3 %149 = OpLoad %95 
                                   f32_3 %150 = OpFNegate %149 
                                   f32_3 %151 = OpLoad %138 
                                   f32_3 %152 = OpFAdd %150 %151 
                                                  OpStore %138 %152 
                                   f32_3 %153 = OpLoad %130 
                                   f32_3 %154 = OpLoad %138 
                                   f32_3 %155 = OpFMul %153 %154 
                                   f32_3 %156 = OpLoad %95 
                                   f32_3 %157 = OpFAdd %155 %156 
                                                  OpStore %130 %157 
                                   f32_3 %161 = OpLoad %95 
                                   f32_4 %162 = OpVectorShuffle %161 %161 0 1 2 0 
                                  bool_4 %166 = OpFOrdLessThan %162 %164 
                                  bool_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                                  OpStore %160 %167 
                                   f32_3 %170 = OpLoad %26 
                                                  OpStore %169 %170 
                           Private bool* %172 = OpAccessChain %160 %171 
                                    bool %173 = OpLoad %172 
                                                  OpSelectionMerge %176 None 
                                                  OpBranchConditional %173 %175 %179 
                                         %175 = OpLabel 
                            Private f32* %177 = OpAccessChain %26 %171 
                                     f32 %178 = OpLoad %177 
                                                  OpStore %174 %178 
                                                  OpBranch %176 
                                         %179 = OpLabel 
                            Private f32* %180 = OpAccessChain %130 %171 
                                     f32 %181 = OpLoad %180 
                                                  OpStore %174 %181 
                                                  OpBranch %176 
                                         %176 = OpLabel 
                                     f32 %182 = OpLoad %174 
                           Function f32* %183 = OpAccessChain %169 %171 
                                                  OpStore %183 %182 
                           Private bool* %184 = OpAccessChain %160 %18 
                                    bool %185 = OpLoad %184 
                                                  OpSelectionMerge %188 None 
                                                  OpBranchConditional %185 %187 %191 
                                         %187 = OpLabel 
                            Private f32* %189 = OpAccessChain %26 %18 
                                     f32 %190 = OpLoad %189 
                                                  OpStore %186 %190 
                                                  OpBranch %188 
                                         %191 = OpLabel 
                            Private f32* %192 = OpAccessChain %130 %18 
                                     f32 %193 = OpLoad %192 
                                                  OpStore %186 %193 
                                                  OpBranch %188 
                                         %188 = OpLabel 
                                     f32 %194 = OpLoad %186 
                           Function f32* %195 = OpAccessChain %169 %18 
                                                  OpStore %195 %194 
                           Private bool* %196 = OpAccessChain %160 %59 
                                    bool %197 = OpLoad %196 
                                                  OpSelectionMerge %200 None 
                                                  OpBranchConditional %197 %199 %203 
                                         %199 = OpLabel 
                            Private f32* %201 = OpAccessChain %26 %59 
                                     f32 %202 = OpLoad %201 
                                                  OpStore %198 %202 
                                                  OpBranch %200 
                                         %203 = OpLabel 
                            Private f32* %204 = OpAccessChain %130 %59 
                                     f32 %205 = OpLoad %204 
                                                  OpStore %198 %205 
                                                  OpBranch %200 
                                         %200 = OpLabel 
                                     f32 %206 = OpLoad %198 
                           Function f32* %207 = OpAccessChain %169 %59 
                                                  OpStore %207 %206 
                                   f32_3 %208 = OpLoad %169 
                                                  OpStore %26 %208 
                                   f32_3 %210 = OpLoad %61 
                                   f32_4 %211 = OpVectorShuffle %210 %210 0 1 2 0 
                                  bool_4 %214 = OpFOrdLessThan %211 %213 
                                  bool_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                                  OpStore %209 %215 
                                   f32_3 %216 = OpLoad %95 
                                   f32_3 %217 = OpFNegate %216 
                                   f32_3 %219 = OpFAdd %217 %218 
                                                  OpStore %138 %219 
                                   f32_3 %221 = OpLoad %61 
                                   f32_3 %222 = OpFNegate %221 
                                   f32_3 %223 = OpFMul %222 %133 
                                   f32_3 %224 = OpFAdd %223 %218 
                                                  OpStore %220 %224 
                                   f32_3 %225 = OpLoad %95 
                                   f32_3 %226 = OpLoad %220 
                                   f32_3 %227 = OpFMul %225 %226 
                                                  OpStore %220 %227 
                                   f32_3 %228 = OpLoad %220 
                                   f32_3 %229 = OpFNegate %228 
                                   f32_3 %230 = OpLoad %138 
                                   f32_3 %231 = OpFMul %229 %230 
                                   f32_3 %232 = OpLoad %95 
                                   f32_3 %233 = OpFAdd %231 %232 
                                                  OpStore %95 %233 
                                   f32_3 %235 = OpLoad %26 
                                                  OpStore %234 %235 
                           Private bool* %236 = OpAccessChain %209 %171 
                                    bool %237 = OpLoad %236 
                                                  OpSelectionMerge %240 None 
                                                  OpBranchConditional %237 %239 %243 
                                         %239 = OpLabel 
                            Private f32* %241 = OpAccessChain %95 %171 
                                     f32 %242 = OpLoad %241 
                                                  OpStore %238 %242 
                                                  OpBranch %240 
                                         %243 = OpLabel 
                            Private f32* %244 = OpAccessChain %26 %171 
                                     f32 %245 = OpLoad %244 
                                                  OpStore %238 %245 
                                                  OpBranch %240 
                                         %240 = OpLabel 
                                     f32 %246 = OpLoad %238 
                           Function f32* %247 = OpAccessChain %234 %171 
                                                  OpStore %247 %246 
                           Private bool* %248 = OpAccessChain %209 %18 
                                    bool %249 = OpLoad %248 
                                                  OpSelectionMerge %252 None 
                                                  OpBranchConditional %249 %251 %255 
                                         %251 = OpLabel 
                            Private f32* %253 = OpAccessChain %95 %18 
                                     f32 %254 = OpLoad %253 
                                                  OpStore %250 %254 
                                                  OpBranch %252 
                                         %255 = OpLabel 
                            Private f32* %256 = OpAccessChain %26 %18 
                                     f32 %257 = OpLoad %256 
                                                  OpStore %250 %257 
                                                  OpBranch %252 
                                         %252 = OpLabel 
                                     f32 %258 = OpLoad %250 
                           Function f32* %259 = OpAccessChain %234 %18 
                                                  OpStore %259 %258 
                           Private bool* %260 = OpAccessChain %209 %59 
                                    bool %261 = OpLoad %260 
                                                  OpSelectionMerge %264 None 
                                                  OpBranchConditional %261 %263 %267 
                                         %263 = OpLabel 
                            Private f32* %265 = OpAccessChain %95 %59 
                                     f32 %266 = OpLoad %265 
                                                  OpStore %262 %266 
                                                  OpBranch %264 
                                         %267 = OpLabel 
                            Private f32* %268 = OpAccessChain %26 %59 
                                     f32 %269 = OpLoad %268 
                                                  OpStore %262 %269 
                                                  OpBranch %264 
                                         %264 = OpLabel 
                                     f32 %270 = OpLoad %262 
                           Function f32* %271 = OpAccessChain %234 %59 
                                                  OpStore %271 %270 
                                   f32_3 %272 = OpLoad %234 
                                                  OpStore %26 %272 
                                   f32_3 %273 = OpLoad %61 
                                   f32_3 %274 = OpFNegate %273 
                                   f32_3 %275 = OpLoad %26 
                                   f32_3 %276 = OpFAdd %274 %275 
                                                  OpStore %26 %276 
                            Uniform f32* %280 = OpAccessChain %14 %279 
                                     f32 %281 = OpLoad %280 
                            Uniform f32* %282 = OpAccessChain %14 %279 
                                     f32 %283 = OpLoad %282 
                            Uniform f32* %284 = OpAccessChain %14 %279 
                                     f32 %285 = OpLoad %284 
                                   f32_3 %286 = OpCompositeConstruct %281 %283 %285 
                                     f32 %287 = OpCompositeExtract %286 0 
                                     f32 %288 = OpCompositeExtract %286 1 
                                     f32 %289 = OpCompositeExtract %286 2 
                                   f32_3 %290 = OpCompositeConstruct %287 %288 %289 
                                   f32_3 %291 = OpLoad %26 
                                   f32_3 %292 = OpFMul %290 %291 
                                   f32_3 %293 = OpLoad %61 
                                   f32_3 %294 = OpFAdd %292 %293 
                                   f32_4 %295 = OpLoad %278 
                                   f32_4 %296 = OpVectorShuffle %295 %294 4 5 6 3 
                                                  OpStore %278 %296 
                             Output f32* %299 = OpAccessChain %278 %297 
                                                  OpStore %299 %47 
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