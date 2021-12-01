//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Lut_TestMode" {
Properties {
_MainTex ("Base (RGB)", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 56486
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
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	float _Blend;
uniform 	float _Intensity;
uniform 	float _Extra;
uniform 	float _Extra2;
uniform 	float _Extra3;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler3D _LutTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb1 = _Extra3<vs_TEXCOORD0.x;
    u_xlat2 = u_xlat0 * vec4(vec4(_Intensity, _Intensity, _Intensity, _Intensity));
    u_xlat0 = (bool(u_xlatb1)) ? u_xlat2 : u_xlat0;
    if(u_xlatb1){
        u_xlat1.xyz = u_xlat0.xyz + vec3(vec3(_Extra, _Extra, _Extra));
        u_xlat1 = texture(_LutTex, u_xlat1.xyz);
        u_xlat1.xyz = u_xlat1.xyz + vec3(vec3(_Extra2, _Extra2, _Extra2));
        u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
        u_xlat0.xyz = vec3(_Blend) * u_xlat1.xyz + u_xlat0.xyz;
    }
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 Location 86 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %14 = OpTypeInt 32 0 
                                  u32 %15 = OpConstant 4 
                                      %16 = OpTypeArray %7 %15 
                                      %17 = OpTypeArray %7 %15 
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_2 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 132
; Schema: 0
                                                   OpCapability Shader 
                                            %1 = OpExtInstImport "GLSL.std.450" 
                                                   OpMemoryModel Logical GLSL450 
                                                   OpEntryPoint Fragment %4 "main" %22 %129 
                                                   OpExecutionMode %4 OriginUpperLeft 
                                                   OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                   OpDecorate %12 DescriptorSet 12 
                                                   OpDecorate %12 Binding 12 
                                                   OpDecorate %16 DescriptorSet 16 
                                                   OpDecorate %16 Binding 16 
                                                   OpDecorate vs_TEXCOORD0 Location 22 
                                                   OpMemberDecorate %28 0 Offset 28 
                                                   OpMemberDecorate %28 1 Offset 28 
                                                   OpMemberDecorate %28 2 Offset 28 
                                                   OpMemberDecorate %28 3 Offset 28 
                                                   OpMemberDecorate %28 4 Offset 28 
                                                   OpDecorate %28 Block 
                                                   OpDecorate %30 DescriptorSet 30 
                                                   OpDecorate %30 Binding 30 
                                                   OpDecorate %89 DescriptorSet 89 
                                                   OpDecorate %89 Binding 89 
                                                   OpDecorate %91 DescriptorSet 91 
                                                   OpDecorate %91 Binding 91 
                                                   OpDecorate %129 Location 129 
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
                                           %25 = OpTypeBool 
                                           %26 = OpTypePointer Private %25 
                             Private bool* %27 = OpVariable Private 
                                           %28 = OpTypeStruct %6 %6 %6 %6 %6 
                                           %29 = OpTypePointer Uniform %28 
Uniform struct {f32; f32; f32; f32; f32;}* %30 = OpVariable Uniform 
                                           %31 = OpTypeInt 32 1 
                                       i32 %32 = OpConstant 4 
                                           %33 = OpTypePointer Uniform %6 
                                           %36 = OpTypeInt 32 0 
                                       u32 %37 = OpConstant 0 
                                           %38 = OpTypePointer Input %6 
                            Private f32_4* %42 = OpVariable Private 
                                       i32 %44 = OpConstant 1 
                                           %63 = OpTypeVector %25 4 
                                           %69 = OpTypeVector %6 3 
                                           %70 = OpTypePointer Private %69 
                            Private f32_3* %71 = OpVariable Private 
                                       i32 %74 = OpConstant 2 
                                           %87 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                           %88 = OpTypePointer UniformConstant %87 
      UniformConstant read_only Texture3D* %89 = OpVariable UniformConstant 
                  UniformConstant sampler* %91 = OpVariable UniformConstant 
                                           %93 = OpTypeSampledImage %87 
                                       i32 %99 = OpConstant 3 
                                      i32 %117 = OpConstant 0 
                                          %128 = OpTypePointer Output %7 
                            Output f32_4* %129 = OpVariable Output 
                                       void %4 = OpFunction None %3 
                                            %5 = OpLabel 
                       read_only Texture2D %13 = OpLoad %12 
                                   sampler %17 = OpLoad %16 
                read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                     f32_2 %23 = OpLoad vs_TEXCOORD0 
                                     f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                                   OpStore %9 %24 
                              Uniform f32* %34 = OpAccessChain %30 %32 
                                       f32 %35 = OpLoad %34 
                                Input f32* %39 = OpAccessChain vs_TEXCOORD0 %37 
                                       f32 %40 = OpLoad %39 
                                      bool %41 = OpFOrdLessThan %35 %40 
                                                   OpStore %27 %41 
                                     f32_4 %43 = OpLoad %9 
                              Uniform f32* %45 = OpAccessChain %30 %44 
                                       f32 %46 = OpLoad %45 
                              Uniform f32* %47 = OpAccessChain %30 %44 
                                       f32 %48 = OpLoad %47 
                              Uniform f32* %49 = OpAccessChain %30 %44 
                                       f32 %50 = OpLoad %49 
                              Uniform f32* %51 = OpAccessChain %30 %44 
                                       f32 %52 = OpLoad %51 
                                     f32_4 %53 = OpCompositeConstruct %46 %48 %50 %52 
                                       f32 %54 = OpCompositeExtract %53 0 
                                       f32 %55 = OpCompositeExtract %53 1 
                                       f32 %56 = OpCompositeExtract %53 2 
                                       f32 %57 = OpCompositeExtract %53 3 
                                     f32_4 %58 = OpCompositeConstruct %54 %55 %56 %57 
                                     f32_4 %59 = OpFMul %43 %58 
                                                   OpStore %42 %59 
                                      bool %60 = OpLoad %27 
                                     f32_4 %61 = OpLoad %42 
                                     f32_4 %62 = OpLoad %9 
                                    bool_4 %64 = OpCompositeConstruct %60 %60 %60 %60 
                                     f32_4 %65 = OpSelect %64 %61 %62 
                                                   OpStore %9 %65 
                                      bool %66 = OpLoad %27 
                                                   OpSelectionMerge %68 None 
                                                   OpBranchConditional %66 %67 %68 
                                           %67 = OpLabel 
                                     f32_4 %72 = OpLoad %9 
                                     f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                              Uniform f32* %75 = OpAccessChain %30 %74 
                                       f32 %76 = OpLoad %75 
                              Uniform f32* %77 = OpAccessChain %30 %74 
                                       f32 %78 = OpLoad %77 
                              Uniform f32* %79 = OpAccessChain %30 %74 
                                       f32 %80 = OpLoad %79 
                                     f32_3 %81 = OpCompositeConstruct %76 %78 %80 
                                       f32 %82 = OpCompositeExtract %81 0 
                                       f32 %83 = OpCompositeExtract %81 1 
                                       f32 %84 = OpCompositeExtract %81 2 
                                     f32_3 %85 = OpCompositeConstruct %82 %83 %84 
                                     f32_3 %86 = OpFAdd %73 %85 
                                                   OpStore %71 %86 
                       read_only Texture3D %90 = OpLoad %89 
                                   sampler %92 = OpLoad %91 
                read_only Texture3DSampled %94 = OpSampledImage %90 %92 
                                     f32_3 %95 = OpLoad %71 
                                     f32_4 %96 = OpImageSampleImplicitLod %94 %95 
                                     f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                                   OpStore %71 %97 
                                     f32_3 %98 = OpLoad %71 
                             Uniform f32* %100 = OpAccessChain %30 %99 
                                      f32 %101 = OpLoad %100 
                             Uniform f32* %102 = OpAccessChain %30 %99 
                                      f32 %103 = OpLoad %102 
                             Uniform f32* %104 = OpAccessChain %30 %99 
                                      f32 %105 = OpLoad %104 
                                    f32_3 %106 = OpCompositeConstruct %101 %103 %105 
                                      f32 %107 = OpCompositeExtract %106 0 
                                      f32 %108 = OpCompositeExtract %106 1 
                                      f32 %109 = OpCompositeExtract %106 2 
                                    f32_3 %110 = OpCompositeConstruct %107 %108 %109 
                                    f32_3 %111 = OpFAdd %98 %110 
                                                   OpStore %71 %111 
                                    f32_4 %112 = OpLoad %9 
                                    f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                    f32_3 %114 = OpFNegate %113 
                                    f32_3 %115 = OpLoad %71 
                                    f32_3 %116 = OpFAdd %114 %115 
                                                   OpStore %71 %116 
                             Uniform f32* %118 = OpAccessChain %30 %117 
                                      f32 %119 = OpLoad %118 
                                    f32_3 %120 = OpCompositeConstruct %119 %119 %119 
                                    f32_3 %121 = OpLoad %71 
                                    f32_3 %122 = OpFMul %120 %121 
                                    f32_4 %123 = OpLoad %9 
                                    f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                    f32_3 %125 = OpFAdd %122 %124 
                                    f32_4 %126 = OpLoad %9 
                                    f32_4 %127 = OpVectorShuffle %126 %125 4 5 6 3 
                                                   OpStore %9 %127 
                                                   OpBranch %68 
                                           %68 = OpLabel 
                                    f32_4 %130 = OpLoad %9 
                                                   OpStore %129 %130 
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
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 78038
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
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	float _Blend;
uniform 	float _Intensity;
uniform 	float _Extra;
uniform 	float _Extra2;
uniform 	float _Extra3;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler3D _LutTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb1 = _Extra3<vs_TEXCOORD0.x;
    u_xlat2 = u_xlat0 * vec4(vec4(_Intensity, _Intensity, _Intensity, _Intensity));
    u_xlat0 = (bool(u_xlatb1)) ? u_xlat2 : u_xlat0;
    u_xlat0.xyz = sqrt(u_xlat0.xyz);
    if(u_xlatb1){
        u_xlat1.xyz = u_xlat0.xyz + vec3(vec3(_Extra, _Extra, _Extra));
        u_xlat1 = texture(_LutTex, u_xlat1.xyz);
        u_xlat1.xyz = u_xlat1.xyz + vec3(vec3(_Extra2, _Extra2, _Extra2));
        u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
        u_xlat0.xyz = vec3(_Blend) * u_xlat1.xyz + u_xlat0.xyz;
    }
    SV_Target0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 Location 86 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %14 = OpTypeInt 32 0 
                                  u32 %15 = OpConstant 4 
                                      %16 = OpTypeArray %7 %15 
                                      %17 = OpTypeArray %7 %15 
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_2 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 149
; Schema: 0
                                                   OpCapability Shader 
                                            %1 = OpExtInstImport "GLSL.std.450" 
                                                   OpMemoryModel Logical GLSL450 
                                                   OpEntryPoint Fragment %4 "main" %22 %134 
                                                   OpExecutionMode %4 OriginUpperLeft 
                                                   OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                   OpDecorate %12 DescriptorSet 12 
                                                   OpDecorate %12 Binding 12 
                                                   OpDecorate %16 DescriptorSet 16 
                                                   OpDecorate %16 Binding 16 
                                                   OpDecorate vs_TEXCOORD0 Location 22 
                                                   OpMemberDecorate %28 0 Offset 28 
                                                   OpMemberDecorate %28 1 Offset 28 
                                                   OpMemberDecorate %28 2 Offset 28 
                                                   OpMemberDecorate %28 3 Offset 28 
                                                   OpMemberDecorate %28 4 Offset 28 
                                                   OpDecorate %28 Block 
                                                   OpDecorate %30 DescriptorSet 30 
                                                   OpDecorate %30 Binding 30 
                                                   OpDecorate %94 DescriptorSet 94 
                                                   OpDecorate %94 Binding 94 
                                                   OpDecorate %96 DescriptorSet 96 
                                                   OpDecorate %96 Binding 96 
                                                   OpDecorate %134 Location 134 
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
                                           %25 = OpTypeBool 
                                           %26 = OpTypePointer Private %25 
                             Private bool* %27 = OpVariable Private 
                                           %28 = OpTypeStruct %6 %6 %6 %6 %6 
                                           %29 = OpTypePointer Uniform %28 
Uniform struct {f32; f32; f32; f32; f32;}* %30 = OpVariable Uniform 
                                           %31 = OpTypeInt 32 1 
                                       i32 %32 = OpConstant 4 
                                           %33 = OpTypePointer Uniform %6 
                                           %36 = OpTypeInt 32 0 
                                       u32 %37 = OpConstant 0 
                                           %38 = OpTypePointer Input %6 
                            Private f32_4* %42 = OpVariable Private 
                                       i32 %44 = OpConstant 1 
                                           %63 = OpTypeVector %25 4 
                                           %66 = OpTypeVector %6 3 
                                           %75 = OpTypePointer Private %66 
                            Private f32_3* %76 = OpVariable Private 
                                       i32 %79 = OpConstant 2 
                                           %92 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                           %93 = OpTypePointer UniformConstant %92 
      UniformConstant read_only Texture3D* %94 = OpVariable UniformConstant 
                  UniformConstant sampler* %96 = OpVariable UniformConstant 
                                           %98 = OpTypeSampledImage %92 
                                      i32 %104 = OpConstant 3 
                                      i32 %122 = OpConstant 0 
                                          %133 = OpTypePointer Output %7 
                            Output f32_4* %134 = OpVariable Output 
                                      u32 %142 = OpConstant 3 
                                          %143 = OpTypePointer Private %6 
                                          %146 = OpTypePointer Output %6 
                                       void %4 = OpFunction None %3 
                                            %5 = OpLabel 
                       read_only Texture2D %13 = OpLoad %12 
                                   sampler %17 = OpLoad %16 
                read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                     f32_2 %23 = OpLoad vs_TEXCOORD0 
                                     f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                                   OpStore %9 %24 
                              Uniform f32* %34 = OpAccessChain %30 %32 
                                       f32 %35 = OpLoad %34 
                                Input f32* %39 = OpAccessChain vs_TEXCOORD0 %37 
                                       f32 %40 = OpLoad %39 
                                      bool %41 = OpFOrdLessThan %35 %40 
                                                   OpStore %27 %41 
                                     f32_4 %43 = OpLoad %9 
                              Uniform f32* %45 = OpAccessChain %30 %44 
                                       f32 %46 = OpLoad %45 
                              Uniform f32* %47 = OpAccessChain %30 %44 
                                       f32 %48 = OpLoad %47 
                              Uniform f32* %49 = OpAccessChain %30 %44 
                                       f32 %50 = OpLoad %49 
                              Uniform f32* %51 = OpAccessChain %30 %44 
                                       f32 %52 = OpLoad %51 
                                     f32_4 %53 = OpCompositeConstruct %46 %48 %50 %52 
                                       f32 %54 = OpCompositeExtract %53 0 
                                       f32 %55 = OpCompositeExtract %53 1 
                                       f32 %56 = OpCompositeExtract %53 2 
                                       f32 %57 = OpCompositeExtract %53 3 
                                     f32_4 %58 = OpCompositeConstruct %54 %55 %56 %57 
                                     f32_4 %59 = OpFMul %43 %58 
                                                   OpStore %42 %59 
                                      bool %60 = OpLoad %27 
                                     f32_4 %61 = OpLoad %42 
                                     f32_4 %62 = OpLoad %9 
                                    bool_4 %64 = OpCompositeConstruct %60 %60 %60 %60 
                                     f32_4 %65 = OpSelect %64 %61 %62 
                                                   OpStore %9 %65 
                                     f32_4 %67 = OpLoad %9 
                                     f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                                     f32_3 %69 = OpExtInst %1 31 %68 
                                     f32_4 %70 = OpLoad %9 
                                     f32_4 %71 = OpVectorShuffle %70 %69 4 5 6 3 
                                                   OpStore %9 %71 
                                      bool %72 = OpLoad %27 
                                                   OpSelectionMerge %74 None 
                                                   OpBranchConditional %72 %73 %74 
                                           %73 = OpLabel 
                                     f32_4 %77 = OpLoad %9 
                                     f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
                              Uniform f32* %80 = OpAccessChain %30 %79 
                                       f32 %81 = OpLoad %80 
                              Uniform f32* %82 = OpAccessChain %30 %79 
                                       f32 %83 = OpLoad %82 
                              Uniform f32* %84 = OpAccessChain %30 %79 
                                       f32 %85 = OpLoad %84 
                                     f32_3 %86 = OpCompositeConstruct %81 %83 %85 
                                       f32 %87 = OpCompositeExtract %86 0 
                                       f32 %88 = OpCompositeExtract %86 1 
                                       f32 %89 = OpCompositeExtract %86 2 
                                     f32_3 %90 = OpCompositeConstruct %87 %88 %89 
                                     f32_3 %91 = OpFAdd %78 %90 
                                                   OpStore %76 %91 
                       read_only Texture3D %95 = OpLoad %94 
                                   sampler %97 = OpLoad %96 
                read_only Texture3DSampled %99 = OpSampledImage %95 %97 
                                    f32_3 %100 = OpLoad %76 
                                    f32_4 %101 = OpImageSampleImplicitLod %99 %100 
                                    f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
                                                   OpStore %76 %102 
                                    f32_3 %103 = OpLoad %76 
                             Uniform f32* %105 = OpAccessChain %30 %104 
                                      f32 %106 = OpLoad %105 
                             Uniform f32* %107 = OpAccessChain %30 %104 
                                      f32 %108 = OpLoad %107 
                             Uniform f32* %109 = OpAccessChain %30 %104 
                                      f32 %110 = OpLoad %109 
                                    f32_3 %111 = OpCompositeConstruct %106 %108 %110 
                                      f32 %112 = OpCompositeExtract %111 0 
                                      f32 %113 = OpCompositeExtract %111 1 
                                      f32 %114 = OpCompositeExtract %111 2 
                                    f32_3 %115 = OpCompositeConstruct %112 %113 %114 
                                    f32_3 %116 = OpFAdd %103 %115 
                                                   OpStore %76 %116 
                                    f32_4 %117 = OpLoad %9 
                                    f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                                    f32_3 %119 = OpFNegate %118 
                                    f32_3 %120 = OpLoad %76 
                                    f32_3 %121 = OpFAdd %119 %120 
                                                   OpStore %76 %121 
                             Uniform f32* %123 = OpAccessChain %30 %122 
                                      f32 %124 = OpLoad %123 
                                    f32_3 %125 = OpCompositeConstruct %124 %124 %124 
                                    f32_3 %126 = OpLoad %76 
                                    f32_3 %127 = OpFMul %125 %126 
                                    f32_4 %128 = OpLoad %9 
                                    f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                    f32_3 %130 = OpFAdd %127 %129 
                                    f32_4 %131 = OpLoad %9 
                                    f32_4 %132 = OpVectorShuffle %131 %130 4 5 6 3 
                                                   OpStore %9 %132 
                                                   OpBranch %74 
                                           %74 = OpLabel 
                                    f32_4 %135 = OpLoad %9 
                                    f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                    f32_4 %137 = OpLoad %9 
                                    f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                    f32_3 %139 = OpFMul %136 %138 
                                    f32_4 %140 = OpLoad %134 
                                    f32_4 %141 = OpVectorShuffle %140 %139 4 5 6 3 
                                                   OpStore %134 %141 
                             Private f32* %144 = OpAccessChain %9 %142 
                                      f32 %145 = OpLoad %144 
                              Output f32* %147 = OpAccessChain %134 %142 
                                                   OpStore %147 %145 
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